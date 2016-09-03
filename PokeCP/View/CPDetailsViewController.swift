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
    let displayCellContent: NSArray = []
    override func viewDidLoad() {
        print(pokemon?.name)
        print(cpInput)
        self.view.backgroundColor = PCPColorBackground
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = PCPColorBackground
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            
            return 2
        }
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 330
        } else {
            return 110
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("PokemonHeadImage", forIndexPath: indexPath) as? CPDImageViewCell
            if let imageName = pokemon?.name {
                cell?.pokemonHeadImage.image = UIImage(named: "\(imageName)")
            }
            cell?.nameLabel.text = pokemon?.name
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        } else {
            guard let cell = tableView.dequeueReusableCellWithIdentifier("PokemonEvoInfo", forIndexPath: indexPath) as? CPDInfoViewCell else {
                return UITableViewCell()
            }
            return cell
           // displayCellContent
        }
    }
}
