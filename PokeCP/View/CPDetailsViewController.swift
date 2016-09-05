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
        self.tableView.separatorColor = UIColor.clearColor()
        displayCellContent = []
        getAllGenerationInList(pokemon)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = PCPColorBackground
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return pokemonGenerationList.count
        }
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch indexPath.row {
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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell()
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCellWithIdentifier("PokemonHeadImage", forIndexPath: indexPath) as? CPDImageViewCell else {
                    return emptyCell
                }
                if let imageName = pokemon?.name {
                    cell.pokemonHeadImage.image = UIImage(named: "\(imageName)")
                }
                cell.nameLabel.text = pokemon?.name
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCellWithIdentifier("PokemonEvoInfo", forIndexPath: indexPath) as? CPDInfoViewCell else {
                    return emptyCell
                }
                cell.candyLabel.text = "Candy: \n\(pokemon?.candy ?? 0)"
                cell.cpLabel.text = "Min CP: \n\(CPCalculation(cpInput ?? 0, index: pokemon?.low ?? 1.0))\nMax CP: \n\(CPCalculation(cpInput ?? 0, index: pokemon?.high ?? 1.0))"
                cell.typeLabel.text = "Type: \n\(pokemon?.type ?? "")"
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCellWithIdentifier("PokemonEvoInfo", forIndexPath: indexPath) as? CPDInfoViewCell else {
                    return emptyCell
                }
                cell.candyLabel.backgroundColor = PCPColorNavigationCyan
                cell.typeLabel.backgroundColor = PCPColorNavigationCyan
                cell.cpLabel.backgroundColor = PCPColorNavigationCyan
                cell.typeLabel.text = "Max Power: \n\(pokemon?.maxIndex ?? 0)"
                return cell
            default:
                return emptyCell
            }
        } else { // Next Generation
            guard let cell = tableView.dequeueReusableCellWithIdentifier("NextGeneration", forIndexPath: indexPath) as? CPDNextGenerationViewCell else {
                return emptyCell
            }

            cell.pokemonImage.image = UIImage(named: "\(pokemonGenerationList[indexPath.row].name)")
            //cell.imageView?.contentMode = .ScaleAspectFit
        
            cell.name.text = "\(pokemonGenerationList[indexPath.row].name)"
            cell.generationNumber.text = "\((indexPath.row+2).ordinal())"
            return cell
        }
    }
    
    private func CPCalculation(input: Int, index: Float) -> Int{
        let result = Int(round(Float(input) * (1 + index)))
        return result
    }
    
    private func getAllGeneration(sourcePokemon:Pokemon) {
        if sourcePokemon.nextGeneration == nil {
            return
        } else {
            pokemonGenerationList.append(sourcePokemon.nextGeneration!)
            getAllGeneration(sourcePokemon.nextGeneration!)
        }
    }
    
    private func getAllGenerationInList(currentPokemon: Pokemon?) {
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
