//
//  OnePixelViewController.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/11/6.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit

class OnePixelViewController: UIViewController {

    let ONE_PIXEL_HEIGHT = 1 / UIScreen.main.scale
    let ONE_PIXEL_HEIGHT_OFFSET = (1 / UIScreen.main.scale) / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let view_1 = UIView(frame: CGRect(x: 0, y: 50 + ONE_PIXEL_HEIGHT * 0, width: UIScreen.main.bounds.width, height: ONE_PIXEL_HEIGHT))
        view_1.backgroundColor = UIColor.blue
        
        let view_2 = UIView(frame: CGRect(x: 0, y: 60 + ONE_PIXEL_HEIGHT * 1 + ONE_PIXEL_HEIGHT_OFFSET, width: UIScreen.main.bounds.width, height: ONE_PIXEL_HEIGHT))
        view_2.backgroundColor = UIColor.blue
        
        let view_3 = UIView(frame: CGRect(x: 0, y: 70 + ONE_PIXEL_HEIGHT * 2, width: UIScreen.main.bounds.width, height: ONE_PIXEL_HEIGHT))
        view_3.backgroundColor = UIColor.blue
        
        let view_4 = UIView(frame: CGRect(x: 0, y: 80 + ONE_PIXEL_HEIGHT * 3, width: UIScreen.main.bounds.width, height: ONE_PIXEL_HEIGHT))
        view_4.backgroundColor = UIColor.blue
        
        let view_5 = UIView(frame: CGRect(x: 0, y: 90 + ONE_PIXEL_HEIGHT * 4 + ONE_PIXEL_HEIGHT_OFFSET, width: UIScreen.main.bounds.width, height: ONE_PIXEL_HEIGHT))
        view_5.backgroundColor = UIColor.blue
        
        view.addSubviews(views: [view_1, view_2, view_3, view_4, view_5])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
