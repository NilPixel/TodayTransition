//
//  TodayListCell.swift
//  TodayTransitionDemo
//
//  Created by zheng on 2018/7/31.
//  Copyright © 2018年 zheng. All rights reserved.
//

import UIKit

class TodayListCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
