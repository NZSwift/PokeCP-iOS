//
//  CPViewController.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/21.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class CPViewController: UITableViewController, UISearchDisplayDelegate, UISearchBarDelegate {
    var pokemonList = [Pokemon]()
    var filtedPokemonList = [Pokemon]()

    
    
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
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var pokemon : Pokemon
        if tableView == self.searchDisplayController?.searchResultsTableView {
            pokemon = self.filtedPokemonList[indexPath.row]
        } else {
            pokemon = self.pokemonList[indexPath.row]
        }
        
    }
    
    // MARK: Segueway
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
