//
//  UITableView+Extension.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/21.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) where T: RegisterReusableViewOrNib {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(cellClass, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ aClass: T.Type) where T: RegisterReusableViewOrNib {
        if let nib = T.nib {
            register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
        } else {
            register(aClass, forHeaderFooterViewReuseIdentifier: T.identifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath?) -> T where T: RegisterReusableViewOrNib {
        if let indexPath = indexPath {
            return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
        } else {
            return dequeueReusableCell(withIdentifier: T.identifier) as! T
        }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: RegisterReusableViewOrNib {
        return dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T
    }
}
