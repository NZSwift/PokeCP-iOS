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
    var pokemon : Pokemon?
    var inputCP: Int = 0
    var viewType: Int = 0 //0: CP Calculator, 1: Username Check, 2, About me
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        let filtered = components.joinWithSeparator("")
        return string == filtered
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonList = pokemons
        self.view.backgroundColor = PCPColorBackground
        self.tableView.separatorColor = UIColor.whiteColor()
        self.tableView.backgroundView = nil
        if viewType == 0 {
            searchBar(true)
        } else if viewType == 2 {
            searchBar(false)
        }
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = PCPColorNavigationCyan
        tableView.reloadData()
        self.title = "CP Calculator"
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(CPViewController.back))
    }
    
    private func searchBar(display: Bool) {
        self.searchDisplayController?.searchBar.hidden = !display
        self.searchDisplayController?.searchBar.barTintColor = PCPColorNavigationCyan
        self.searchDisplayController?.searchBar.backgroundColor = UIColor.clearColor()
        self.searchDisplayController?.searchBar.tintColor = UIColor.whiteColor()
        self.searchDisplayController?.searchBar.searchBarStyle = UISearchBarStyle.Minimal
        self.searchDisplayController?.searchResultsTableView.backgroundColor = PCPColorBackground
        if let searchField = self.searchDisplayController?.searchBar.valueForKey("_searchField") as? UITextField  {
            if searchField.respondsToSelector(Selector("setAttributedPlaceholder:")) {
                let placeholder = "Search"
                let attributedString = NSMutableAttributedString(string: placeholder)
                let range = NSRange(location: 0, length: placeholder.characters.count)
                let color = UIColor(white: 1.0, alpha: 0.7)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "AvenirNext-Medium", size: 15)!, range: range)
                searchField.attributedPlaceholder = attributedString
                
                searchField.clearButtonMode = UITextFieldViewMode.WhileEditing
                searchField.textColor = .whiteColor()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.tintColor = PCPColorNavigationCyan
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
        switch viewType {
        case 0:
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
        case 1:
            return UITableViewCell()
        case 2:
            guard let cell = self.tableView.dequeueReusableCellWithIdentifier("aboutMe") as? AboutMeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = PCPColorBackground
        cell.textLabel?.textColor = PCPColorContentGray       
        cell.imageView?.layer.cornerRadius = 30/2
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.masksToBounds = false
        cell.imageView?.layer.borderColor = PCPColorContent.CGColor
        cell.imageView?.clipsToBounds = true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if tableView == self.searchDisplayController?.searchResultsTableView {
            pokemon = self.filtedPokemonList[indexPath.row]
        } else {
            pokemon = self.pokemonList[indexPath.row]
        }
        
        let alert = UIAlertController(title: "Combat Power", message: "What's your CP?", preferredStyle: .Alert)
        let imageView = UIImageView(frame: CGRectMake(200, 10, 60, 50))
        imageView.image = UIImage(named: "HeaderLogo")
        alert.view.addSubview(imageView)
        
        let pokemonImageView = UIImageView(frame: CGRectMake(0, 10, 60, 50))
        imageView.image = UIImage(named: "\(pokemon!.name)")
        alert.view.addSubview(pokemonImageView)

        modifyAlertView(alert, backgroundColor: PCPColorBackground, textColor: UIColor.whiteColor(), buttonColor: PCPColorNavigationCyan)
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.placeholder = "Enter your pokemon CP"
            textField.delegate = self
        })
        alert.addAction(UIAlertAction(title: "Cancle", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Next", style: .Default, handler: { (UIAlertAction) in
            guard let inputField = alert.textFields![0] as? UITextField else {
                return
            }
            self.inputCP = Int(inputField.text ?? "0") ?? 0
            self.performSegueWithIdentifier("pokeDetails", sender: self)

        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func modifyAlertView(alert: UIAlertController, backgroundColor: UIColor, textColor: UIColor, buttonColor: UIColor?) {
        let subview = alert.view.subviews.first! as UIView
        let view = subview.subviews.first! as UIView

        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 10.0
        
        // set color to UILabel font
        setSubviewLabelsToTextColor(textColor, view: view)
        
        // set font to alert via KVC, otherwise it'll get overwritten
        let titleAttributed = NSMutableAttributedString(
            string: alert.title!,
            attributes: [NSFontAttributeName:UIFont.boldSystemFontOfSize(17)])
        alert.setValue(titleAttributed, forKey: "attributedTitle")
        
        let messageAttributed = NSMutableAttributedString(
            string: alert.message!,
            attributes: [NSFontAttributeName:UIFont.systemFontOfSize(13)])
        alert.setValue(messageAttributed, forKey: "attributedMessage")

        // set the buttons to non-blue, if we have buttons
        if let buttonColor = buttonColor {
            alert.view.tintColor = buttonColor
        }
    }
    
    func setSubviewLabelsToTextColor(textColor: UIColor, view:UIView) {
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.textColor = textColor
            } else {
                setSubviewLabelsToTextColor(textColor, view: subview)
            }
        }
    }
    
    // MARK: Segueway
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pokeDetails" {
            guard let destinationVController = segue.destinationViewController as? CPDetailsViewController else {
                return
            }
            destinationVController.pokemon = pokemon
            destinationVController.cpInput = inputCP
        }
    }
}
