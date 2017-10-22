//
//  MyView.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/10/20.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit


@IBDesignable class MyView: UIView {
    
    var label: UILabel!
    
    @IBInspectable var showLabel: Bool = true {
        didSet {
            if showLabel == true {
                label.isHidden = false
            } else {
                label.isHidden = true
            }
        }
    }
    
    @IBInspectable var textColor: UIColor = UIColor.black {
        didSet {
            label.textColor = textColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel.init(frame: CGRect(x: 10, y: 10, width: 150, height: 20))
        label.text = "This is MyView"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        label = UILabel.init(frame: CGRect(x: 10, y: 10, width: 150, height: 20))
        label.text = "This is MyView"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        
        self.addSubview(label)
    }
}
