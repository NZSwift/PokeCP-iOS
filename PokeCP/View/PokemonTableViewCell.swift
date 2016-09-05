//
//  PokemonTableViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/21.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView?.backgroundColor = UIColor(red: 174.0/255.0, green: 144.0/255.0, blue: 120.0/255.0, alpha: 1.0)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
