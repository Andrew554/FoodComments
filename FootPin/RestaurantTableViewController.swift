//
//  RestaurantTableViewController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/2.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    //  本地数据
    var restaurants = [
        Restaurant(name: "轻松小铺", type: "奶茶系列", location: "重庆市巴南区红光大道69号重庆理工大学天桥下", image: "teakha.jpg", isVisited: true, rate: "great") ,
        Restaurant(name: "咖啡胡同", type: "咖啡 & 茶店", location: "重庆市万州区高粱镇高龙初级中学旁44号", image: "cafedeadend.jpg", isVisited: true, rate: "great") ,
        Restaurant(name: "霍米", type: "咖啡", location: "香港上环文咸东街太平山22-24A，B店", image: "homei.jpg", isVisited: false, rate: "good") ,
        Restaurant(name: "茶.家", type: "茶屋", location: "香港葵涌和宜合道熟食市场地下", image: "teakha.jpg", isVisited: false) ,
        Restaurant(name: "洛伊斯咖啡", type: "奥地利式 & 休闲饮料", location: "香港新界葵涌屏富径", image: "cafeloisl.jpg", isVisited: true, rate: "dislike") ,
        Restaurant(name: "贝蒂生蚝", type: "法式", location: "香港九龙尖沙咀河内道18号(近港铁尖东站N3,N4出口) ", image: "petiteoyster.jpg", isVisited: false) ,
        Restaurant(name: "福奇餐馆", type: "面包房", location: "香港岛中环都爹利街13号乐成行地库中层", image: "forkeerestaurant.jpg", isVisited: true) ,
        Restaurant(name: "阿波画室", type: "面包房", location: "香港岛铜锣湾轩尼诗道555号崇光百货地库2楼30号铺", image: "posatelier.jpg", isVisited: false) ,
        Restaurant(name: "伯克街面包坊", type: "巧克力", location: "4 Hickson Rd、The Rocks NSW 2000", image: "bourkestreetbakery.jpg", isVisited: false) ,
        Restaurant(name: "黑氏巧克力", type: "咖啡", location: "31 Wheat Rd、Sydney NSW 2001", image: "haighschocolate.jpg", isVisited: true) ,
        Restaurant(name: "惠灵顿雪梨", type: "美式 & 海鲜", location: "1/11-31 York Street Sydney NSW Australia、Sydney NSW 2000", image: "palominoespresso.jpg", isVisited: false) ,
        Restaurant(name: "北州", type: "美式", location: "Macy's、151 W 34th St Fifth Floor、New York, NY 10001", image: "upstate.jpg", isVisited: false) ,
        Restaurant(name: "布鲁克林塔菲", type: "美式", location: "250 8th Ave、New York, NY 10107", image: "traif.jpg", isVisited: false) ,
        Restaurant(name: "格雷厄姆大街肉", type: "早餐 & 早午餐", location: "55-1 Riverwalk Pl、West New York, NJ 07093", image: "grahamavenuemeats.jpg", isVisited: false) ,
        Restaurant(name: "华夫饼 & 沃夫", type: "法式 & 茶", location: "1585 Broadway、New York, NY 10036-8200", image: "wafflewolf.jpg", isVisited: false) ,
        Restaurant(name: "五叶", type: "咖啡 & 茶", location: "1460 Broadway、New York, NY 10036", image: "fiveleaves.jpg", isVisited: false) ,
        Restaurant(name: "眼光咖啡", type: "拉丁美式", location: "250 8th Ave、New York, NY 10107", image: "cafelore.jpg", isVisited: false) ,
        Restaurant(name: "忏悔", type: "西班牙式", location: "822 Lexington Ave、New York, NY 10065", image: "confessional.jpg", isVisited: false) ,
        Restaurant(name: "巴拉菲娜", type: "西班牙式", location: "Unit 2, Eldon Chambers、30-32 Fleet St、London EC4Y 1AA", image: "barrafina.jpg", isVisited: false) ,
        Restaurant(name: "多尼西亚", type: "西班牙式", location: "Waterloo Station、London SE1 7LY", image: "donostia.jpg", isVisited: false) ,
        Restaurant(name: "皇家橡树", type: "英式", location: "Unit 4a、44-58 Brompton Rd、London SW3 1BW", image: "royaloak.jpg", isVisited: false) ,
        Restaurant(name: "泰咖啡", type: "泰式", location: "7-9 Golders Green Rd、London NW11 8DY", image: "thaicafe.jpg", isVisited: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 更改返回按钮标题
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        // 设置单元格自动适应高度
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        // 设置导航栏滑动时自动隐藏
//        self.navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantTableViewCell

        cell.resImage.image = UIImage(named: restaurants[indexPath.row].image)
        cell.resImage.layer.cornerRadius = cell.resImage.frame.size.width/2
        cell.resName.text = restaurants[indexPath.row].name
        cell.resType.text = restaurants[indexPath.row].type
        cell.resAddress.text = restaurants[indexPath.row].location

        cell.accessoryType =  restaurants[indexPath.row].isVisited ? .Checkmark : .None
        
        return cell
    }

    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }
//   
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 取消单元格选中效果
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        /* let alertController = UIAlertController(title: "点击了我", message:
            "消息", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let alertSheet = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let 拨打行为的处理 = {(action: UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "拨打的号码暂时无人接听", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let dialAction = UIAlertAction(title: "拨打110", style: UIAlertActionStyle.Default, handler: 拨打行为的处理)
        
        var str = "点赞"
        var 来过 = UIAlertAction(title: str, style: UIAlertActionStyle.Default) { (_) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            self.去过的餐馆[indexPath.row] = true
        }
        
        if(去过的餐馆[indexPath.row] == true) {
            str = "取消点赞"
            来过 = UIAlertAction(title: str, style: UIAlertActionStyle.Default) { (_) -> Void in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = UITableViewCellAccessoryType.None
                self.去过的餐馆[indexPath.row] = false
            }

        }else {
            str = "点赞"
            来过 = UIAlertAction(title: str, style: UIAlertActionStyle.Default) { (_) -> Void in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
                self.去过的餐馆[indexPath.row] = true
            }
        }
        
        alertController.addAction(alertSheet)
        alertController.addAction(dialAction)
        alertController.addAction(来过)
        
        self.presentViewController(alertController, animated: true, completion: nil)*/
    }

    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let 分享 = UITableViewRowAction(style: .Normal, title: "分享") { (action, indexPath) -> Void in
            
            let alert = UIAlertController(title: "分享", message: "分享到", preferredStyle: .ActionSheet)
            
            let qqAction = UIAlertAction(title: "qq", style: .Default, handler: nil)
            let weiboAction = UIAlertAction(title: "微博", style: .Default, handler: nil)
            let wxAction = UIAlertAction(title: "微信", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            
            alert.addAction(qqAction)
            alert.addAction(weiboAction)
            alert.addAction(wxAction)
            alert.addAction(cancelAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        分享.backgroundColor = UIColor.grayColor()
        
        let 删除 = UITableViewRowAction(style: .Normal, title: "删除") { (action, indexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        删除.backgroundColor = UIColor.redColor()

        return [删除,分享]
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            NSLog("Delete")
            // Delete the row from the data source
     
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showDetail") {
            let detailVc = segue.destinationViewController as! DetailRestaurantController
            detailVc.restaurant = restaurants[(tableView.indexPathForSelectedRow!.row)]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
    override func viewDidAppear(animated: Bool) {
            super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.boolForKey("GuideShowed") {
            return
        }
        
        if let pageVc = storyboard?.instantiateViewControllerWithIdentifier("GuideController") as? GuidePageViewController {
            presentViewController(pageVc, animated: true, completion: nil)
        }
    }
    
    @IBAction func unWindToHome(segue: UIStoryboardSegue) {
        print("unWindToHome")
        
        if let addVC = segue.sourceViewController as? AddRestaurantViewController {
            print("addFinish")
            let res = addVC.restaurant
            print(res)
            restaurants.append(res)
            tableView.reloadData()
        }
    }
}
