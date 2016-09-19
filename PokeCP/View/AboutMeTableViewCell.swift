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
    
    @IBAction func twitterAction(sender: AnyObject) {
        let url = NSURL(string: "https://twitter.com/jiaoliguo")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func blogAction(sender: AnyObject) {
        let url = NSURL(string: "https://liguo.jiao.co.nz/")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func linkedinAction(sender: AnyObject) {
        let url = NSURL(string: "https://nz.linkedin.com/in/liguojiaouc")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headImage.layer.borderWidth = 10
        headImage.layer.borderColor = UIColor.blackColor().CGColor
        headImage.layer.cornerRadius = self.headImage.frame.size.height/2
        headImage.clipsToBounds = true
        let intro: String = "Software Engineer \n iOS Developer \n\n Christchurch, New Zealand"
        let content: NSMutableAttributedString = NSMutableAttributedString(string: intro, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 18.0)!])
        content.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location:0,length:18))
        content.addAttribute(NSForegroundColorAttributeName, value: PCPColorContent, range: NSRange(location:20,length:13))
        content.addAttribute(NSForegroundColorAttributeName, value: PCPColorAmber, range: NSRange(location:37,length:25 ))
        introLabel.attributedText = content

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
