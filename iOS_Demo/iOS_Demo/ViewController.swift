//
//  ViewController.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/10/20.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let list = ["@IBDesignable & @IBInspectable", "Bottom Sheet", "1 px", "UILabel Text" , "Java Script Core"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        setTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController {
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return list.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = list[indexPath.row]
            return cell!
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                performSegue(withIdentifier: "IBDesignable_and_IBInspectable", sender: nil)
            }
            if indexPath.row == 1 {
                let bottomSHeetViewController = BottomSheetViewController()
                self.show(bottomSHeetViewController, sender: self)
            }
            if indexPath.row == 2 {
                let onePixelViewController = OnePixelViewController()
                self.show(onePixelViewController, sender: self)
            }
            if indexPath.row == 3 {
                let uiLabelTextViewController = UILabelTextViewController()
                self.show(uiLabelTextViewController, sender: self)
            }
            if indexPath.row == 4 {
                let nmzJavaScriptCoreViewController = NMZJavaScriptCoreViewController()
                self.show(nmzJavaScriptCoreViewController, sender: self)
            }
        }
    }
}


