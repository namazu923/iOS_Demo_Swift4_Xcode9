//
//  UILabelTextViewController.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/11/13.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit

class UILabelTextViewController: UIViewController {

    let label_1 = UILabel()
    let label_2 = UILabel()
    let label_3 = UILabel()
    let label_4 = UILabel()
    let label_5 = UILabel()

    let text_1 = "UILabelTextViewController_label_1_text"
    let text_2 = "UILabelTextViewController_label_2_text"
    let text_3 = "UILabelTextViewController_label_3_text"
    let text_4 = "UILabelTextViewController_label_4_text"
    let text_5 = "label_5_text"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        let fontSize        : CGFloat = 20
        let minimumFontSize : CGFloat = 17
        
        label_1.text = text_1
        label_1.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        
        label_2.text = text_2
        label_2.font = UIFont.systemFont(ofSize: fontSize, weight: .black)
        
        label_3.text = text_3
        label_3.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        label_3.adjustsFontSizeToFitWidth = true
        
        label_4.text = text_4
        label_4.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        label_4.adjustsFontSizeToFitWidth = true
        label_4.minimumScaleFactor = minimumFontSize / fontSize
        
        
        view.addSubviews(views: [label_1, label_2, label_3, label_4])
        
        setConstraints()
    }

    func setConstraints() {
        label_1.snp.makeConstraints{(make) in
            make.top.equalTo(view.snp.top).offset(100)
            make.height.equalTo(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(220)
        }
        
        label_2.snp.makeConstraints{(make) in
            make.height.width.centerX.equalTo(label_1)
            make.top.equalTo(label_1).offset(50)
        }
        
        label_3.snp.makeConstraints{(make) in
            make.height.width.centerX.equalTo(label_1)
            make.top.equalTo(label_2).offset(50)
        }
        
        label_4.snp.makeConstraints{(make) in
            make.height.width.centerX.equalTo(label_1)
            make.top.equalTo(label_3).offset(50)
        }
        
//        label_5.snp.makeConstraints{(make) in
//            make.height.width.centerX.equalTo(label_1)
//            make.top.equalTo(label_4).offset(50)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
