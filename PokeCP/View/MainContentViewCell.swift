//
//  MainContentViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/19.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class MainContentViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.fadeIn()
        })
        // Configure the view for the selected state
    }

}
