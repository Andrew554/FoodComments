//
//  AboutTableViewController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/8.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    // 数据定义
    var sectionTitle = ["评分和反馈", "关注我们"]
    var sectionContent = [["在App Store上给我们评分", "反馈意见"], ["网站", "微信", "花川学院"]]
    var links = ["http://www.huachuanxueyuan.com/user/1", "http://www.huachuanxueyuan.com/files/system/block_picture_1453917794.jpg", "http://hcxy.me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitle.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("aboutCell", forIndexPath: indexPath)

        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (CGFloat)(60)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        switch(indexPath.section) {
        case 0:
            // 通过打开Safari访问网页
            if indexPath.row == 0 {
                let apple = "http://www.apple.com/cn/"
                if let url = NSURL(string: apple) {
                    UIApplication.sharedApplication().openURL(url)  // 打开Safari浏览器
                }
            }else {
                // 通过内嵌一个WebView访问网页
                // 通过设置转场的Identifier，然后手工转场
                performSegueWithIdentifier("toWebView", sender: self)
            }
        case 1:
            //  使用SFSafariViewController访问网页，SFSafariViewController具有跟Safari一样的特性比如自动填充
            if let url = NSURL(string: links[indexPath.row]) {
                let sfVC = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                presentViewController(sfVC, animated: true, completion: nil)
            }
        default:
            break
        }
        print("\(links[indexPath.row])")
         tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
