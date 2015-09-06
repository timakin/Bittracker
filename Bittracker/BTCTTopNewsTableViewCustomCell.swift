//
//  BTCTTopNewsTableViewCustomCell.swift
//  Bittracker
//
//  Created by Seiji Takahashi on 2015/07/12.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import UIKit
import Foundation

class BTCTTopNewsTableViewCustomCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var origin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
