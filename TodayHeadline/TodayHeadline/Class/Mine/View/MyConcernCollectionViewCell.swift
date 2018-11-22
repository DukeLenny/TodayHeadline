//
//  MyConcernCollectionViewCell.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/22.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit
import Kingfisher

class MyConcernCollectionViewCell: UICollectionViewCell, RegisterReusableViewOrNib {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var vipImageView: UIImageView!
    @IBOutlet private weak var tipView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tipView.layer.borderWidth = 1.0
        tipView.layer.borderColor = UIColor.white.cgColor
    }
    
    var concern: MineConcernModel? {
        didSet {
            guard let concern = concern else { return }
            nameLabel.text = concern.name
            avatarImageView.kf.setImage(with: URL(string: concern.icon ?? ""), placeholder: nil)
            vipImageView.image = UIImage(named: concern.userAuthInfo?.auth_type == 1 ? "all_v_avatar_star_16x16_" : "all_v_avatar_18x18_")
            vipImageView.isHidden = !concern.is_verify
            tipView.isHidden = !concern.tips
        }
    }

}
