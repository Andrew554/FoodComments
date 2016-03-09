//
//  DetailCell.swift
//  FootPin
//
//  Created by SinObjectC on 16/3/4.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
