//
//  CPDImageViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 2/09/16.
//  Copyright © 2016 Liguo Jiao. All rights reserved.
//

import UIKit

class CPDImageViewCell: UITableViewCell {
    
    @IBOutlet var pokemonHeadImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pokemonHeadImage.layer.borderWidth = 1
        pokemonHeadImage.layer.masksToBounds = false
        pokemonHeadImage.layer.borderColor = PCPColorContent.CGColor
        pokemonHeadImage.layer.cornerRadius = pokemonHeadImage.frame.height / 2
        pokemonHeadImage.clipsToBounds = true
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
