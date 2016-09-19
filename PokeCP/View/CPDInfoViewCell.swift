//
//  CPDInfoViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 2/09/16.
//  Copyright © 2016 Liguo Jiao. All rights reserved.
//

import UIKit

class CPDInfoViewCell: UITableViewCell {

    @IBOutlet var candyLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var cpLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        candyLabel.text = ""
        typeLabel.text = ""
        cpLabel.text = ""
        candyLabel.textColor = UIColor.white
        typeLabel.textColor = UIColor.white
        cpLabel.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
