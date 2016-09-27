//
//  CPDetailsViewController.swift
//  PokeCP
//
//  Created by Liguo Jiao on 2/09/16.
//  Copyright © 2016 Liguo Jiao. All rights reserved.
//

import UIKit

class CPDetailsViewController: UITableViewController {
    var pokemon: Pokemon?
    var cpInput: Int?
    var displayCellContent: NSArray = []
    var pokemonGenerationList = [Pokemon]()
    
    override func viewDidLoad() {
        print(pokemon?.name)
        print(cpInput)
        self.view.backgroundColor = PCPColorBackground
        self.tableView.separatorColor = UIColor.clear
        displayCellContent = []
        getAllGenerationInList(pokemon)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = PCPColorBackground
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return pokemonGenerationList.count
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).section == 0 {
            switch (indexPath as NSIndexPath).row {
            case 0:
                return 330
            case 1:
                return 110
            case 2:
                return 110
            default:
                return 0
            }
        } else {
            return 123
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell()
        if (indexPath as NSIndexPath).section == 0 {
            switch (indexPath as NSIndexPath).row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonHeadImage", for: indexPath) as? CPDImageViewCell else {
                    return emptyCell
                }
                if let imageName = pokemon?.imageName {
                    cell.pokemonHeadImage.image = UIImage(named: "\(imageName)")
                }
                cell.nameLabel.text = pokemon?.name
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonEvoInfo", for: indexPath) as? CPDInfoViewCell else {
                    return emptyCell
                }
                cell.candyLabel.text = NSLocalizedString("CANDY", comment: "Candy") + ": \n\(pokemon?.candy ?? 0)"
                cell.cpLabel.text = NSLocalizedString("MIN_CP", comment: "Min CP") + ": \n\(CPCalculation(cpInput ?? 0, index: pokemon?.low ?? 1.0))\n" + NSLocalizedString("MAX_CP", comment: "Max CP") + ": \n\(CPCalculation(cpInput ?? 0, index: pokemon?.high ?? 1.0))"
                cell.typeLabel.text = NSLocalizedString("TYPE", comment: "Type") + ": \n\(pokemon?.type ?? "")"
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonEvoInfo", for: indexPath) as? CPDInfoViewCell else {
                    return emptyCell
                }
                cell.candyLabel.backgroundColor = PCPColorNavigationCyan
                cell.typeLabel.backgroundColor = PCPColorNavigationCyan
                cell.cpLabel.backgroundColor = PCPColorNavigationCyan
                cell.typeLabel.text = NSLocalizedString("MAX_POWER", comment: "Max Power") +  ": \n\(pokemon?.maxIndex ?? 0)"
                return cell
            default:
                return emptyCell
            }
        } else { // Next Generation
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NextGeneration", for: indexPath) as? CPDNextGenerationViewCell else {
                return emptyCell
            }
            cell.selectionStyle = .none
            cell.pokemonImage.image = UIImage(named: "\(pokemonGenerationList[(indexPath as NSIndexPath).row].imageName)")
            cell.name.text = "\(pokemonGenerationList[(indexPath as NSIndexPath).row].name)"
            cell.generationNumber.text = "\(((indexPath as NSIndexPath).row+2).ordinal())"
            return cell
        }
    }
    
    fileprivate func CPCalculation(_ input: Int, index: Float) -> Int{
        let result = Int(round(Float(input) * (1 + index)))
        return result
    }
    
    fileprivate func getAllGeneration(_ sourcePokemon:Pokemon) {
        if sourcePokemon.nextGeneration == nil {
            return
        } else {
            pokemonGenerationList.append(sourcePokemon.nextGeneration!)
            getAllGeneration(sourcePokemon.nextGeneration!)
        }
    }
    
    fileprivate func getAllGenerationInList(_ currentPokemon: Pokemon?) {
        guard let pkm = currentPokemon else {
            return
        }
        if pkm.name == "Eevee" {
            /* Eevee is bit special it doesnt has 3rd level evolution
                so it could deal in tableview for special case */
            return
        } else {
            getAllGeneration(pkm)
        }
        

        
    }
}
