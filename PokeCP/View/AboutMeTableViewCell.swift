//
//  AboutMeTableViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/9/4.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class AboutMeTableViewCell: UITableViewCell {
    @IBOutlet var introLabel: UILabel!
    @IBOutlet var headImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBAction func twitterAction(_ sender: AnyObject) {
        openURL("https://twitter.com/jiaoliguo")
    }
    
    @IBAction func blogAction(_ sender: AnyObject) {
        openURL("https://liguo.jiao.co.nz/")
    }
    
    @IBAction func linkedinAction(_ sender: AnyObject) {
        openURL("https://nz.linkedin.com/in/liguojiaouc")
    }
    fileprivate func openURL(_ addressLink: String) {
        if let url = URL(string: addressLink) {
            UIApplication.shared.openURL(url)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded()
        nameLabel.text = "Liguo Jiao"
        nameLabel.textColor = PCPColorGold
        headImage.layer.borderWidth = 10
        headImage.layer.borderColor = UIColor.black.cgColor
        headImage.layer.cornerRadius = self.headImage.frame.size.height/2
        headImage.clipsToBounds = true
        self.selectionStyle = .none
        let firstLine = NSLocalizedString("SELF_INTRO_POSITION1", comment: "Software Engineer")
        let secondLine = NSLocalizedString("SELF_INTRO_POSITION2", comment: "iOS Developer")
        let thirdLine = NSLocalizedString("SELF_INTRO_LOCATION", comment: "Christchurch, New Zealand")
        
        let intro: String = "\(firstLine) \n \(secondLine) \n\n \(thirdLine)"
        let content: NSMutableAttributedString = NSMutableAttributedString(string: intro, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 18.0)!])
        
        content.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location: 0, length: firstLine.characters.count))
        content.addAttribute(NSForegroundColorAttributeName, value: PCPColorContent, range: NSRange(location: firstLine.characters.count + 3, length: secondLine.characters.count))
        content.addAttribute(NSForegroundColorAttributeName, value: PCPColorAmber, range: NSRange(location: firstLine.characters.count + secondLine.characters.count + 7, length: thirdLine.characters.count))
        introLabel.attributedText = content

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
