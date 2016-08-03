//
//  PhotoBrowserController.swift
//  Beautiful
//
//  Created by wangjun on 16/7/20.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

class PhotoBrowserController: BaseViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    // MARK:- Lazy loading
    lazy var photoCollectionView :UICollectionView = {
        
        var tempLayout = UICollectionViewFlowLayout.init()
        tempLayout.itemSize = CGSizeMake((UIScreen.mainScreen().bounds.width-4)/3,
                                         (UIScreen.mainScreen().bounds.width-4)/3) // 每个item(Cell)的Size
        tempLayout.minimumLineSpacing = 1;        // 每个item的上下间隔
        tempLayout.minimumInteritemSpacing = 1;   // 每个item的左右间隔
        
        
        let tempCollectionView = UICollectionView.init(frame: self.view.bounds,
                                                       collectionViewLayout: tempLayout)
        tempCollectionView.delegate = self;
        tempCollectionView.dataSource = self;
        tempCollectionView.registerClass(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCollectionCellIdentifier")
        
        return tempCollectionView
    }()
    
    var photoArray: NSMutableArray = []
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "照片墙"
        
        self.view.addSubview(photoCollectionView)
        self.photoCollectionView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsZero)
        }
        
        self.queryPhotosRequest(1)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    // MARK:- UICollectionViewDelegate & UICollectionViewDataSource
    /**
     返回一共有多少个Section
     
     - parameter collectionView: UICollectionView
     
     - returns: 返回一共有多少个Section
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     返回每一个Section有多少个Cell
     
     - parameter collectionView: UICollectionView
     - parameter section:        section
     
     - returns: 返回每一个Section有多少个Cell
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoArray.count
    }
    
    /**
     返回当前CollectionView相对应父View的Insets
     
     - parameter collectionView:       UICollectionView
     - parameter collectionViewLayout: UICollectionViewLayout
     - parameter section:              section
     
     - returns: 返回当前CollectionView相对于父View的UIEdgeInsets
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(1, 1, 1, 1);
    }
    
    /**
     返回每个Cell
     
     - parameter collectionView: UICollectionView
     - parameter indexPath:      NSIndexPath
     
     - returns: 返回每个Cell
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCollectionCellIdentifier", forIndexPath: indexPath) as! PhotoCell
        if self.photoArray.count > indexPath.row {
            cell.configPhoto(self.photoArray[indexPath.row] as! PhotoModel)
        }
        return cell;
    }
    
    /**
     Collection Cell的点击事件
     
     - parameter collectionView: UICollectionView
     - parameter indexPath:      NSIndexPath
     */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK:- Request & Response
    
    func queryPhotosRequest(pageIndex: NSInteger) -> Void {
        
        BaseServiceManager.shareInstance().quertPhotoWalls(pageIndex) { (list) in
            self.photoArray.addObjectsFromArray(list as [AnyObject])
            self.photoCollectionView.reloadData()
        }
    }
}
