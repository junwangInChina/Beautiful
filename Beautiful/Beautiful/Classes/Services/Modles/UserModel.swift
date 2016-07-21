//
//  UserModel.swift
//  Beautiful
//
//  Created by wangjun on 16/7/21.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import Foundation

class UserModel: NSObject {

    var userID: String = ""                 // 用户ID
    var userName: String = ""               // 昵称
    var userFirstName: String = ""          // 名
    var userLastName: String = ""           // 姓
    var userFullName: String = ""           // 全名

    var userCity: String = ""               // 所在城市
    var userCountry: String = ""            // 所在国家
    var userType: NSInteger = 0             // 用户类型
    
    //var userStoreNo: bool = false           // 是否开店
    var userFollowersCount: NSInteger = 0   // 关注的人数
    
    
    override static func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["userID":"id",
                "userName":"username",
                "userFirstName":"firstname",
                "userLastName":"lastname",
                "userFullName":"fullname",
        
                "userCity":"city",
                "userCountry":"country",
                "userType":"usertype",
        
                /*"userStoreNo":"store_on",*/
                "userFollowersCount":"followers_count"]
    }
}
