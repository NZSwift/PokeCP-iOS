//
//  MainContentViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/19.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class MainContentViewCell: UITableViewCell {
    
    @IBOutlet var contentButton: UIButton!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        self.contentButton.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.contentButton.fadeIn()
        })
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
