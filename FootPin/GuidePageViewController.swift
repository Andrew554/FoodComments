//
//  GuidePageViewController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/7.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class GuidePageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var headings = ["私人定制", "餐馆定位", "美食发现"]
    var images = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-3"]
    var footers = ["好店随时加，打造自己的美食导向", "马上找到饕鬄大餐的位置", "发现其他吃货的珍藏"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置数据源为本身
        dataSource = self

        if let startVc = viewControllerAtIndex(0) {
            setViewControllers([startVc], direction: .Reverse, animated: true, completion: nil)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentController).index
        index--
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentController).index
        index++
        
        return viewControllerAtIndex(index)
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return headings.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0
//    }

    func viewControllerAtIndex(index: Int) -> UIViewController? {
        if case 0 ..< headings.count = index {
            // 创建一个新视图控制器并传递数据
            if let contentVc = storyboard?.instantiateViewControllerWithIdentifier("GuideContentController") as? GuideContentController {
                contentVc.imageName = images[index]
                contentVc.heading = headings[index]
                contentVc.footing = footers[index]
                contentVc.index = index
                
                if index == headings.count-1 {
                    let button = UIButton(frame: CGRect(x: 500, y: 500, width: 50, height: 30))
                    button.setTitle("开始体验", forState: .Normal)
                    button.addTarget(self, action: "start:", forControlEvents: .TouchUpInside)
                    self.view.addSubview(button)
                    print("ddd")
                }
                // 返回视图控制器
                return contentVc
            }
        }
        return nil
    }
    
    func start(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
