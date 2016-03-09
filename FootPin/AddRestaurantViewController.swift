//
//  AddRestaurantTableViewController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/6.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var restaurant: Restaurant!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var restaurantName: UITextField!
    
    @IBOutlet weak var restaurantType: UITextField!
    
    @IBOutlet weak var restaurantLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perpareUI()
        restaurant = Restaurant()
    }
    
    // 准备UI
    func perpareUI() {
        
    }

    @IBAction func saveInfo(sender: AnyObject) {
        
        print("saveInfo")
        dismissViewControllerAnimated(true, completion: nil)
 
    }
       
    // 点击是否来过按钮
    @IBAction func isVisitedTap(sender: UIButton) {
        switch sender.tag {
        case 201:
            restaurant.isVisited = true
        case 201:
            restaurant.isVisited = false
        default:
            break
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    */
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
         print("viewDidAppear")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false   // 不允许编辑
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
     }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // 从媒体信息这个字典数据中查询原始图像字典
        image.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        image.contentMode = .ScaleAspectFill //  图片填充模式：平铺，超出部分裁边
        image.clipsToBounds = true  // 支持剪切
        
        // 添加约束： 由于选择系统相片太大而且设置的约束只是设置了水平垂直居中
        
        let leftCons = NSLayoutConstraint(item: image, attribute: .Leading, relatedBy: .Equal, toItem: image.superview, attribute: .Leading, multiplier: 1, constant: 0)
        
        let rightCons = NSLayoutConstraint(item: image, attribute: .Trailing, relatedBy: .Equal, toItem: image.superview, attribute: .Trailing, multiplier: 1, constant: 0)
        
        let topCons = NSLayoutConstraint(item: image, attribute: .Top, relatedBy: .Equal, toItem: image.superview, attribute: .Top, multiplier: 1, constant: 0)
        
        let bottomCons = NSLayoutConstraint(item: image, attribute: .Bottom, relatedBy: .Equal, toItem: image.superview, attribute: .Bottom, multiplier: 1, constant: 0)
        
        leftCons.active = true
        rightCons.active = true
        topCons.active = true
        bottomCons.active = true

        //  让相册选择视图退场
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        return cell
    }
    */

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
