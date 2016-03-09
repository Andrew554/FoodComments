//
//  ReviewViewController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/6.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var rateView: UIStackView!
    
    //  评分
    var rate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perpareUI()
        // Do any additional setup after loading the view.
    }
    
    func perpareUI() {
        // 添加模糊效果
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        blur.frame = UIScreen.mainScreen().bounds
        imageView.addSubview(blur)
        
        // 设置评分初始的状态
        let scale = CGAffineTransformMakeScale(0, 0)
        let translate = CGAffineTransformMakeTranslation(0, 600)
        rateView.transform = CGAffineTransformConcat(scale, translate)
    }

    @IBAction func rateToTap(sender: UIButton) {
        NSLog("\(sender.tag)")
        switch sender.tag {
        case 101:
            rate = "dislike"
        case 102:
            rate = "good"
        case 103:
            rate = "great"
        default:
            break
        }
        
        // 返场
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }
    
    @IBAction func closeWindow(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        // 评分动画
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
                self.rateView.transform = CGAffineTransformIdentity
            }, completion: nil)
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
