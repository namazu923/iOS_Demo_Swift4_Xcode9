//
//  SheetCell.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/10/28.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit

class SheetCell: UICollectionViewCell {
    static let identifier = "SheetCell"
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        self.contentView.addSubview(imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
