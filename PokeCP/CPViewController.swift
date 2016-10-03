//
//  CPViewController.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/21.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class CPViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate, UITextFieldDelegate {
    var pokemonList = [Pokemon]()
    var filtedPokemonList = [Pokemon]()
    var pokemon : Pokemon?
    var inputCP: Int = 0
    var viewType: Int = 0 //0: CP Calculator, 1: Username Check, 2, About me
    let searchController = UISearchController(searchResultsController: nil)
    var found: Bool = false
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = CharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        return string == filtered
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonList = pokemons
        self.view.backgroundColor = PCPColorBackground
        self.tableView.separatorColor = UIColor.clear
        self.tableView.backgroundView = nil
        if viewType == 0 {
            searchBar(true)
        } else {
            searchBar(false)
        }
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("BACK", comment: "Back"), style: .plain, target: self, action: #selector(CPViewController.back))
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = PCPColorNavigationCyan
        tableView.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewType == 0 {
            self.title = NSLocalizedString("CPCalculator", comment: "CP Calculator")
        } else if viewType == 1 {
            self.title = NSLocalizedString("UsernameCheck", comment: "Username Check")
        } else {
            self.title = NSLocalizedString("AboutMe", comment: "About me")
        }
    }
    
    fileprivate func searchBar(_ display: Bool) {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true

        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.layer.borderWidth = 1
        searchController.searchBar.layer.borderColor = PCPColorNavigationCyan.cgColor
        searchController.searchBar.barTintColor = PCPColorNavigationCyan
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.backgroundColor = PCPColorNavigationCyan
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.setImage(UIImage(named: "starLogo2WithoutLayer"), for: UISearchBarIcon.search, state: UIControlState.normal)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.isHidden = !display
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.tintColor = PCPColorNavigationCyan
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Search
    fileprivate func searchContent(_ searchInput: String, scope: String = "Title") {
        self.filtedPokemonList = self.pokemonList.filter({ (pokemon: Pokemon) -> Bool in
            let categoryMatch = (scope == "Title")
            let stringMatch = pokemon.name.lowercased().range(of: searchInput.lowercased())
            found = categoryMatch && (stringMatch != nil)
            return found
        })
        print(filtedPokemonList)
        tableView.reloadData()
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarInputText = searchController.searchBar.text else {
            return
        }
        self.searchContent(searchBarInputText, scope: "Title")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
    // MARK: Tableview
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewType == 2 {
            return 487
        } else if viewType == 1 {
            return 390
        } else {
            return 45
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewType == 0 {
            if searchController.isActive && searchController.searchBar.text != "" {
                return filtedPokemonList.count
            } else {
                return pokemonList.count
            }
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewType {
        case 0:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "pokemonNameCell") as? PokemonTableViewCell else {
                return UITableViewCell()
            }
            var pokemon : Pokemon
            
            if searchController.isActive && searchController.searchBar.text != "" {
                pokemon = self.filtedPokemonList[(indexPath as NSIndexPath).row]
            } else {
                pokemon = self.pokemonList[(indexPath as NSIndexPath).row]
            }
            cell.textLabel?.text = pokemon.name
            cell.imageView?.image = UIImage(named: "\(pokemon.imageName)")
            
            return cell
        case 1:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "userNameCheck", for: indexPath) as? UsernameCheckTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "aboutMe") as? AboutMeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = PCPColorBackground
        cell.textLabel?.textColor = PCPColorContentGray       
        cell.imageView?.layer.cornerRadius = 30/2
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.masksToBounds = false
        cell.imageView?.layer.borderColor = PCPColorContent.cgColor
        cell.imageView?.clipsToBounds = true
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.alpha = 0
            UIView.animate(withDuration: 0.8, animations: { () -> Void in
                cell.alpha = 1
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if viewType == 0 {
            if self.filtedPokemonList.isEmpty == false {
                pokemon = self.filtedPokemonList[(indexPath as NSIndexPath).row]
            } else {
                pokemon = self.pokemonList[(indexPath as NSIndexPath).row]
            }
            
            let alert = UIAlertController(title: NSLocalizedString("CP", comment: "Combat Power"), message: NSLocalizedString("Message_Whats_your_pokemon_CP", comment: "What's your Pokemon CP?"), preferredStyle: .alert)
            let imageView = UIImageView(frame: CGRect(x: 200, y: 10, width: 60, height: 50))
            imageView.image = UIImage(named: "HeaderLogo")
            alert.view.addSubview(imageView)
            
            let secondLayerAlert = UIAlertController(title: "Oops", message: NSLocalizedString("Message_Please_Enter_Your_Pokemon_CP", comment: "Please enter your pokemon CP."), preferredStyle: .alert)
            secondLayerAlert.addAction(UIAlertAction(title: NSLocalizedString("BACK", comment: "back"), style: .cancel, handler: nil))
            
            let pokemonImageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 60, height: 50))            
            imageView.image = UIImage(named: "\(pokemon!.imageName)")
            alert.view.addSubview(pokemonImageView)

            
            alert.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = NSLocalizedString("Message_Enter_Your_Pokemon_CP", comment: "Enter your pokemon CP")
                textField.keyboardType = UIKeyboardType.numberPad
                textField.delegate = self
            })
            alert.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: "Cancel"), style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: NSLocalizedString("NEXT", comment: "Next"), style: .default, handler: { (UIAlertAction) in
                guard let inputField = alert.textFields![0] as? UITextField else {
                    return
                }
                
                guard inputField.text?.isEmpty != true else {
                    self.present(secondLayerAlert, animated: true, completion: nil)
                    return
                }
                self.inputCP = Int(inputField.text ?? "0") ?? 0
                self.performSegue(withIdentifier: "pokeDetails", sender: self)

            }))
            modifyAlertView(alert, backgroundColor: PCPColorBackground, textColor: UIColor.white, buttonColor: PCPColorNavigationCyan)
            self.present(alert, animated: true, completion: nil)
        } else if viewType == 2 {
            tableView.allowsSelection = false
        }
    }
    
    func modifyAlertView(_ alert: UIAlertController, backgroundColor: UIColor, textColor: UIColor, buttonColor: UIColor?) {
        let subview = alert.view.subviews.first! as UIView
        let subview2 = subview.subviews.first! as UIView
        let view = subview2.subviews.first! as UIView

        subview.backgroundColor = backgroundColor
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 10.0
        
        // set color to UILabel font
        setSubviewLabelsToTextColor(textColor, view: view)
        
        // set font to alert via KVC, otherwise it'll get overwritten
        let titleAttributed = NSMutableAttributedString(
            string: alert.title!,
            attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 17)])
        alert.setValue(titleAttributed, forKey: "attributedTitle")
        
        let messageAttributed = NSMutableAttributedString(
            string: alert.message!,
            attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 13)])
        alert.setValue(messageAttributed, forKey: "attributedMessage")

        // set the buttons to non-blue, if we have buttons
        if let buttonColor = buttonColor {
            alert.view.tintColor = buttonColor
        }
    }
    
    func setSubviewLabelsToTextColor(_ textColor: UIColor, view:UIView) {
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.textColor = textColor
            } else {
                setSubviewLabelsToTextColor(textColor, view: subview)
            }
        }
    }
    
    // MARK: Segueway
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokeDetails" {
            guard let destinationVController = segue.destination as? CPDetailsViewController else {
                return
            }
            destinationVController.pokemon = pokemon
            destinationVController.cpInput = inputCP
        }
    }
}
