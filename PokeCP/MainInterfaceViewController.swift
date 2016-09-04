//
//  MainInterfaceViewController.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/19.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

class MainInterfaceViewController: UITableViewController {
    let buttons = ["CP Calculator", "Username Check", "About me"]
    var destinationVCIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.view.backgroundColor = PCPColorBackground
        self.tableView.separatorColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 6
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if DeviceType.IS_IPAD {
                return 520
            } else {
                if DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_4_OR_LESS {
                    return 280
                } else {
                    return 320
                }
            }
        } else {
            if indexPath.row % 2 == 1 {
                // content cell
                if Device.isIphone  {
                    return 70
                } else {
                    return 80
                }
            } else {
                // space between the cell
                if Device.isIphone {
                    return 30
                } else {
                    return 60
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCellWithIdentifier("logoCell", forIndexPath: indexPath) as? logoViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            if indexPath.row % 2 == 1 {
                guard let cell = tableView.dequeueReusableCellWithIdentifier("contentCell", forIndexPath: indexPath) as? MainContentViewCell else {
                    return UITableViewCell()
                }
                cell.textLabel?.text = buttons[indexPath.row/2]
                return cell
            } else {
                let cell = UITableViewCell()
                cell.selectionStyle = .None
                return cell
            }
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            destinationVCIndex = indexPath.row
            self.performSegueWithIdentifier("showCPCalculator", sender: self)
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = PCPColorBackground
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationNavVC = segue.destinationViewController as? UINavigationController,
            let vc = destinationNavVC.topViewController as? CPViewController {
            
            if destinationVCIndex == 1 {
                vc.viewType = 0
            } else if destinationVCIndex == 3 {
                vc.viewType = 1
            } else if destinationVCIndex == 5 {
                vc.viewType = 2
            }
        }
    }
 

}
