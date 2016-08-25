//
//  CPViewController.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/21.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class CPViewController: UITableViewController, UISearchDisplayDelegate, UISearchBarDelegate, UITextFieldDelegate {
    var pokemonList = [Pokemon]()
    var filtedPokemonList = [Pokemon]()

    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                                                 replacementString string: String) -> Bool {
        
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersInString:"0123456789.").invertedSet
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        
        // Rejoin these components
        let filtered = components.joinWithSeparator("")  // use join("", components) if you are using Swift 1.2
        
        // If the original string is equal to the filtered string, i.e. if no
        // inverse characters were present to be eliminated, the input is valid
        // and the statement returns true; else it returns false
        return string == filtered
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonList = pokemons
        tableView.reloadData()
        self.title = "CP Calculator"
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(CPViewController.back))
    }
    
    func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Search
    private func searchContent(searchInput: String, scope: String = "Title") {
        self.filtedPokemonList = self.pokemonList.filter({ (pokemon: Pokemon) -> Bool in
            let categoryMatch = (scope == "Title")
            let stringMatch = pokemon.name.rangeOfString(searchInput)
            return categoryMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        guard let searchBarInputText = self.searchDisplayController?.searchBar.text else {
            return false
        }
        self.searchContent(searchBarInputText, scope: "Title")
        return true
    }
    
    // MARK: Tableview
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController?.searchResultsTableView {
            return filtedPokemonList.count
        } else {
            return pokemonList.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCellWithIdentifier("pokemonNameCell") as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        var pokemon : Pokemon
        
        if tableView == self.searchDisplayController?.searchResultsTableView {
            pokemon = self.filtedPokemonList[indexPath.row]
        } else {
            pokemon = self.pokemonList[indexPath.row]
        }
        cell.textLabel?.text = pokemon.name
        cell.imageView?.image = UIImage(named: "\(pokemon.name)")
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let pokemon : Pokemon
        if tableView == self.searchDisplayController?.searchResultsTableView {
            pokemon = self.filtedPokemonList[indexPath.row]
        } else {
            pokemon = self.pokemonList[indexPath.row]
        }
        let alert = UIAlertController(title: "Combat Power", message: "What's your CP?", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.placeholder = "Enter your pokemon CP"
            textField.delegate = self
        })
        alert.addAction(UIAlertAction(title: "Cancle", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Next", style: .Default, handler: { (UIAlertAction) in
            guard let inputField = alert.textFields![0] as? UITextField else {
                return
            }
            let haha = Int(inputField.text ?? "0")
            let result = (pokemon.nextGeneration?.low)! * Float(haha!)
            print(Int(result))
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: Segueway
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
