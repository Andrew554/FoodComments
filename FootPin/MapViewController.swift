//
//  MapViewController.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/6.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // 申明餐馆变量
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMap()
    }
    
    // 地图设置
    func prepareMap() {
        mapView.delegate = self
        
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.showsScale = true
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) -> Void in
            if error != nil {
                print("error: \(error)")
                return
            }
            
            var annotations = [MKPointAnnotation]()
            
            if let _placeMarks = placemarks {
                // 第一个数据最精确
                for placeMark in _placeMarks {
                
                // 标注信息
                let annotation = MKPointAnnotation()
                
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                // 如果查询到地址的相应坐标
                if let location = placeMark.location {
                    // 设置标注信息的位置
                    annotation.coordinate = location.coordinate
                }
                    annotations.append(annotation)
            }
                
                // 设置显示的地图标注集合
                self.mapView.showAnnotations(annotations, animated: true)
                // 设置选中的地图标注
                self.mapView.selectAnnotation(annotations[0], animated: true)
            }
        }
    }

    // 定制标注视图
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "Mr_图钉"
        
        // 用户视图也是一个标注视图，排除对其的定制
        if annotation is MKUserLocation {
            return nil
        }
        
        // 考虑到性能，重用一个已存在的标注视图
        var annotaionView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        if annotaionView == nil {
            annotaionView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotaionView?.canShowCallout = true    //  启用气球提示
        }
        
        // 添加一个餐馆缩略图到标注视图的左侧
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotaionView?.leftCalloutAccessoryView = leftIconView
//        annotaionView?.image = UIImage(named: "foodpin-intro-2")
        
        return annotaionView
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
