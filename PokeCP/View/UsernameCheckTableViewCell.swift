//
//  UsernameCheckTableViewCell.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/9/20.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration

class UsernameCheckTableViewCell: UITableViewCell {
    
    @IBOutlet var usernameInput: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    let check_api = "https://club.pokemon.com/api/signup/verify-username"
    
    @IBAction func touchCheck(_ sender: AnyObject) {
        guard let userName = usernameInput.text else {
            return
        }
        checkUsername(username: userName) { (success: Bool, error: NSError?) in
            if success {
                self.resultLabel.text = "Username is available."
            } else {
                self.resultLabel.text = "Username has been taken."
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded()
        resultLabel.text = ""
        resultLabel.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

    func checkUsername(username:String, completionHandler: @escaping (Bool,NSError?) -> ()) {
        Alamofire.request(check_api, method: .post,parameters:["name":username]).responseJSON { response in
            switch response.result {
            case .success(let Value):
                if let JSON = Value as? [String: AnyObject] {
                    guard let inuseValue = JSON["inuse"] as? Bool else {
                        return
                    }
                    guard let validValue = JSON["valid"] as? Bool else {
                        return
                    }
                    completionHandler(!(inuseValue && validValue), nil)
                }
            case .failure(let error):
                completionHandler(false, error as NSError?)
            }
        }
    }

}
