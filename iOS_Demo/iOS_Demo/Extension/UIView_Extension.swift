//
//  UIView_Extension.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/11/6.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
