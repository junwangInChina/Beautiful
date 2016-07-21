//
//  PhotoBrowserController.swift
//  Beautiful
//
//  Created by wangjun on 16/7/20.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import UIKit
import Alamofire

class PhotoBrowserController: BaseViewController {

    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "照片墙"
        
        self.queryPhotos(1)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    // MARK:- Request & Response
    func queryPhotos(index :NSInteger) -> Void {
        
        BaseServiceManager.shareInstance().queryPhoto(1)
        
    }
}
