//
//  BaseServiceManager.swift
//  Beautiful
//
//  Created by wangjun on 16/7/21.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import UIKit
import Alamofire

class BaseServiceManager: NSObject {
    
    static var once: dispatch_once_t = 0
    static var manager: BaseServiceManager?
    class func shareInstance() -> BaseServiceManager
    {
        dispatch_once(&once) { () -> Void in
            manager = BaseServiceManager()
        }
        return manager!
    }
    
    func queryPhoto(index:NSInteger) -> Void {
        Alamofire.request(.GET, "https://api.500px.com/v1/photos", parameters: ["consumer_key":"HVhSQ8stAClpTASwePsvjFurYn1P3wo7XMPLyWPt"], encoding: .URL, headers: nil).responseJSON { response in
            guard let json = response.result.value else {return}
            
            print("JSON: \(json)")
            
            
            let photoList = PhotoModel.mj_objectArrayWithKeyValuesArray(json["photos"])
            print("photoList : \(photoList)")
        }
    }
}
