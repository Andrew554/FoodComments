//
//  DetailController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/4.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class DetailRestaurantController: UITableViewController {

    var restaurant: Restaurant!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var rateView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
    }
    
    /*
     * 准备UI
     */
    func prepareUI() {
        title = restaurant.name
        
        self.imageView.image = UIImage(named: restaurant.image)
        // 更改表格的背景色(稍偏灰)
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        
        // 移除空行的分割线
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // 更改分割线颜色
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
        // 单元格预计行高 达到自动适应
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // 根据评分更改评分按钮背景方法
    func setRateBg(rate: String) {
        self.rateView.setImage(UIImage(named: rate), forState: .Normal)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "餐馆名"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "类型"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "地点"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "是否来过"
            cell.valueLabel.text = restaurant.isVisited ? "来过" : "未来过"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destVC = segue.destinationViewController as! MapViewController
            destVC.restaurant = self.restaurant
        }
    }
    
    // 返场调用
    @IBAction func close(segue: UIStoryboardSegue) {
        if let reviewVC = segue.sourceViewController as? ReviewViewController {
            print("返场vc")
            if let rating: String = reviewVC.rate {
                restaurant.rate = rating
                // 根据评分更改评分按钮背景
                setRateBg(restaurant.rate)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}