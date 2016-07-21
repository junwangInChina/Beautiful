//
//  RootTabBatController.swift
//  Beautiful
//
//  Created by wangjun on 16/7/20.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import UIKit

class RootTabBatController: UITabBarController {

    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad();
        self.addChileControllers()
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    // MARK:- Private Method
    func addChileControllers() -> Void {
        let photoController = PhotoBrowserController()
        let photoNav = UINavigationController.init(rootViewController: photoController)
        let photoItem : UITabBarItem = UITabBarItem.init(title: "照片墙", image: UIImage.init(named: "tabbar_photo_normal"), selectedImage: UIImage.init(named: "tabbar_photo_seleted"))
        photoNav.tabBarItem = photoItem
        
        let downloadController = DownloadController()
        let downloadNav = UINavigationController.init(rootViewController: downloadController)
        let downloadItem : UITabBarItem = UITabBarItem.init(title: "下载器", image: UIImage.init(named: "tabbar_download_normal"), selectedImage: UIImage.init(named: "tabbar_download_seleted"))
        downloadNav.tabBarItem = downloadItem;
        
        // 设置Navigation属性
        UINavigationBar.appearance().barStyle = .BlackTranslucent
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()

        // 设置Tabbar属性
        UIToolbar.appearance().barStyle = .BlackTranslucent
        UITabBar.appearance().barStyle = .Black
        UITabBar.appearance().translucent = true
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UIButton.appearance().tintColor = UIColor.whiteColor()
        
        
        self.viewControllers = [photoNav,downloadNav]
    }
}
