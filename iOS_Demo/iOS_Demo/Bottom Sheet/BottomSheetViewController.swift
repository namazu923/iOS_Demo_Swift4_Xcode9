//
//  BottomSheetViewController.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/10/27.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit
import SnapKit

class BottomSheetViewController: UIViewController {

    // MARK: -
    var backGroundImageView: UIImageView!
    
    var sheetView: UIView!
    var sheetCollectionView: UICollectionView!
    var sheetCoverView: UIImageView!
    
    var sheetCellHeight: CGFloat = 0
    var sheetCellWidth: CGFloat = 0
    
    var showSheetItem: UIBarButtonItem!
    var hideSheetItem: UIBarButtonItem!
    
    let imageList = ["pic_1.jpg", "pic_2.jpg", "pic_3.jpg", "pic_4.jpg", "pic_5.jpg"]
    let selectedImageIndex = 0
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setNavigationBar()
        
        setBackGroundImageView()
        setSheetView()
    }
    
    
    func setNavigationBar() {
        showSheetItem = UIBarButtonItem(title: "Show Sheet", style: .plain, target: self, action: #selector(showSheet))        
        navigationItem.setRightBarButton(showSheetItem, animated: true)
    }
    
    func setBackGroundImageView() {
        backGroundImageView = UIImageView(image: UIImage(named: imageList[selectedImageIndex]))
        view.addSubview(backGroundImageView)

        backGroundImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func setSheetView() {
        sheetCellWidth = CGFloat(Int(view.bounds.width / 3))
        sheetCellHeight = sheetCellWidth
        
        sheetView = UIView()
        view.addSubview(sheetView)

        sheetView.snp.makeConstraints{ (make) in
            make.edges.equalTo(view)
        }
        sheetView.layoutIfNeeded()
        
        setSheetCollectionView()
        
        
        sheetCoverView = UIImageView(image: UIImage(named: imageList[selectedImageIndex]))
        sheetView.addSubview(sheetCoverView)
        
        sheetCoverView.snp.makeConstraints{ (make) in
            make.top.leading.trailing.equalTo(sheetView)
            make.bottom.equalTo(sheetCollectionView.snp.top)
        }
        sheetCoverView.updateConstraintsIfNeeded()
                
        sheetView.isHidden = true
    }

    func setSheetCollectionView() {
        sheetCollectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: sheetView.bounds.width, height: sheetCellHeight), collectionViewLayout: UICollectionViewFlowLayout())
        
        sheetCollectionView.dataSource = self
        sheetCollectionView.delegate = self
        
        sheetCollectionView.register(SheetCell.self, forCellWithReuseIdentifier: SheetCell.identifier)

        sheetView.addSubview(sheetCollectionView)
        
        sheetCollectionView.snp.makeConstraints{ (make) in
            make.leading.trailing.equalTo(sheetView)
            make.top.equalTo(sheetView.snp.bottom)
            make.height.equalTo(sheetCellHeight)
        }
        sheetCollectionView.updateConstraintsIfNeeded()
        
        sheetCollectionView.backgroundColor = UIColor.white
    }

    override func viewDidLayoutSubviews() {
        backGroundImageView.snp.updateConstraints{ (make) in
            make.top.equalTo(topLayoutGuide.length)
            make.bottom.equalTo(-bottomLayoutGuide.length)
        }
        
        sheetView.snp.updateConstraints{ (make) in
            make.top.equalTo(topLayoutGuide.length)
            make.bottom.equalTo(-bottomLayoutGuide.length)
        }
        
        let layout = sheetCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let layoutWidth = sheetCellWidth
        let layoutHeight = sheetCellHeight
        
        layout.itemSize = CGSize(width: layoutWidth , height: layoutHeight)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
    }
    
}


// MARK: - Action
extension BottomSheetViewController {
    @objc func showSheet() {
        sheetView.isHidden = false
        
        self.navigationItem.rightBarButtonItem?.title = "Hide Sheet"
        self.navigationItem.rightBarButtonItem?.action = #selector(hideSheet)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.sheetCollectionView.snp.updateConstraints { (make) in
                make.top.equalTo(self.sheetView.snp.bottom).offset(-self.sheetCellHeight)
            }
            
            self.sheetView.layoutIfNeeded()
        }, completion: { (complete) in
            if complete == true {
                
            }
        })
        
    }
    
    @objc func hideSheet() {

        self.navigationItem.rightBarButtonItem?.title = "Show Sheet"
        self.navigationItem.rightBarButtonItem?.action = #selector(showSheet)

        UIView.animate(withDuration: 0.3, animations: {
            self.sheetCollectionView.snp.updateConstraints { (make) in
                make.top.equalTo(self.sheetView.snp.bottom)
            }
            
            self.sheetView.layoutIfNeeded()
        }, completion: { (complete) in
            if complete == true {
                self.backGroundImageView.image = self.sheetCoverView.image
                self.sheetView.isHidden = true
            }
        })
    }
    
}

// MARK: - UICollectionViewDataSource
extension BottomSheetViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SheetCell.identifier, for: indexPath) as! SheetCell
        cell.imageView.image = UIImage(named: imageList[indexPath.row])

        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension BottomSheetViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sheetCoverView.image = UIImage(named: imageList[indexPath.row])
    }
}
