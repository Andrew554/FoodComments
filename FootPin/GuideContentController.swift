//
//  GuideContentController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/7.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class GuideContentController: UIViewController {

    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelFooter: UILabel!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    var index = 0
    var heading = ""
    var footing = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageCtrl.currentPage = index
       labelHeading.text = heading
        labelFooter.text = footing
        imageView.image = UIImage(named: imageName)
        
        if(index == 2) {
            doneBtn.hidden = false
            doneBtn.setTitle("马上体验", forState: .Normal)
        }else {
            doneBtn.hidden = true
        }
    }
    
    // 点击开始体验
    @IBAction func tapDoneBtn(sender: UIButton) {
        // 保存新特性访问记录
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "GuideShowed")

        dismissViewControllerAnimated(true, completion: nil)
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
