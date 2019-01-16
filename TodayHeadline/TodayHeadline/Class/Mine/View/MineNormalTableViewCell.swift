//
//  MineNormalTableViewCell.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/14.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit
import SwiftTheme

class MineNormalTableViewCell: UITableViewCell, RegisterReusableViewOrNib {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        arrowImageView.theme_image = "images.setting_rightarrow"
        
        contentView.theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.black"
        subtitleLabel.theme_textColor = "colors.subtitleLabelTextColor"
    }
    
    var model: MineCellModel? {
        didSet {
            titleLabel.text = model?.text
            subtitleLabel.text = model?.grey_text
        }
    }
}
