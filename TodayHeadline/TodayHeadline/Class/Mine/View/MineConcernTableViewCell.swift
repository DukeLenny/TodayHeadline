//
//  MineConcernTableViewCell.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/21.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

class MineConcernTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    var model: MineCellModel? {
        didSet {
            titleLabel.text = model?.text
            subtitleLabel.text = model?.grey_text
        }
    }
    
}
