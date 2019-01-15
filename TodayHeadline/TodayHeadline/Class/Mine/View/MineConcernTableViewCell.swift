//
//  MineConcernTableViewCell.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/21.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftTheme

class MineConcernTableViewCell: UITableViewCell, RegisterReusableViewOrNib {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerCell(MyConcernCollectionViewCell.self)
        
        arrowImageView.theme_image = "images.setting_rightarrow"
    }
    
    var model: MineCellModel? {
        didSet {
            titleLabel.text = model?.text
//            subtitleLabel.text = model?.grey_text
        }
    }
    
    var concerns: [MineConcernModel]? {
        didSet {
            guard let concerns = concerns else { return }
            let firstConcern = concerns.first
            subtitleLabel.text = firstConcern?.name
            iconImageView.kf.setImage(with: URL(string: firstConcern?.icon ?? ""), placeholder: nil)
            collectionView.reloadData()
            
            subtitleLabel.isHidden = concerns.count != 1
            iconImageView.isHidden = concerns.count != 1
            collectionView.isHidden = concerns.count < 2
        }
    }
    
}

extension MineConcernTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return concerns?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath) as MyConcernCollectionViewCell
        let concern = concerns![indexPath.item]
        cell.concern = concern
        return cell
    }
}
