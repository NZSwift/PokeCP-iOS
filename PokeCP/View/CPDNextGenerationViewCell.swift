//
//  CPDNextGenerationViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/9/5.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class CPDNextGenerationViewCell: UITableViewCell {

    @IBOutlet var pokemonImage: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var generationNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.name?.textColor = UIColor.whiteColor()
        self.generationNumber?.textColor = UIColor.whiteColor()
        generationNumber.backgroundColor = UIColor(red: 87.0/255.0, green: 100.0/255.0, blue: 125.0/255.0, alpha: 1.0)
        generationNumber.layer.cornerRadius = 10
        generationNumber.layer.masksToBounds = true
        self.pokemonImage.backgroundColor = UIColor(red: 174.0/255.0, green: 144.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        self.pokemonImage.layer.cornerRadius = 20
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
