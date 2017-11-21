//
//  FrameAndBoundsViewController.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/11/21.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit

class FrameAndBoundsViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var frameXOriginSlider: UISlider!
    @IBOutlet weak var boundsXOriginSlider: UISlider!
    @IBOutlet weak var frameYOriginSlider: UISlider!
    @IBOutlet weak var boundsYOriginSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setSlider() {
        frameXOriginSlider.maximumValue = Float(outerView.bounds.width)
        frameXOriginSlider.addTarget(self, action: #selector(frameXOriginSliderDidChanged), for: .valueChanged)
        
        boundsXOriginSlider.maximumValue = Float(outerView.bounds.width) - Float(innerView.bounds.width)
        boundsXOriginSlider.addTarget(self, action: #selector(boundsXOriginSliderDidChanged), for: .valueChanged)

        frameYOriginSlider.maximumValue = Float(outerView.bounds.height)
        frameYOriginSlider.addTarget(self, action: #selector(frameYOriginSliderDidChanged), for: .valueChanged)

        boundsYOriginSlider.maximumValue = Float(outerView.bounds.height) - Float(innerView.bounds.width)
        boundsYOriginSlider.addTarget(self, action: #selector(boundsYOriginSliderDidChanged), for: .valueChanged)

    }
    
}

// MARK: - Actions
extension FrameAndBoundsViewController {
    @objc func frameXOriginSliderDidChanged() {
        // TODO: change to constraints value
        outerView.frame.origin.x = CGFloat(frameXOriginSlider.value) + 20
    }
    
    @objc func boundsXOriginSliderDidChanged() {
        outerView.bounds.origin.x = CGFloat(boundsXOriginSlider.value)
    }
    
    @objc func frameYOriginSliderDidChanged() {
        // TODO: change to constraints value
        outerView.frame.origin.y = CGFloat(frameYOriginSlider.value) + topLayoutGuide.length + 10
    }
    
    @objc func boundsYOriginSliderDidChanged() {
        outerView.bounds.origin.y = CGFloat(boundsYOriginSlider.value)
    }
}
