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
    
    @IBOutlet var nameLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pokemonHeadImage.layer.borderWidth = 3
        pokemonHeadImage.layer.masksToBounds = false
        pokemonHeadImage.layer.borderColor = PCPColorContent.cgColor
        pokemonHeadImage.layer.cornerRadius = pokemonHeadImage.frame.height / 2
        pokemonHeadImage.clipsToBounds = true
        
        nameLabel.textColor = UIColor.white
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
