//
//  RestaurantTableViewCell.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/2.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var resImage: UIImageView!
    
    @IBOutlet weak var resName: UILabel!
    
    @IBOutlet weak var resType: UILabel!
    
    @IBOutlet weak var resAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
