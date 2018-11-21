//
//  UICollectionView+Extension.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/21.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) where T: RegisterReusableViewOrNib {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifier)
        } else {
            register(cellClass, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    
    func registerView<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewOfKind elementKind: String) where T: RegisterReusableViewOrNib {
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.identifier)
        } else {
            register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.identifier)
        }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: RegisterReusableViewOrNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, for indexPath: IndexPath) -> T where T: RegisterReusableViewOrNib {
        return dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
