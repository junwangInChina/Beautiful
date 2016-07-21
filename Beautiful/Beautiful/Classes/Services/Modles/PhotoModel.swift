//
//  PhotoModel.swift
//  Beautiful
//
//  Created by wangjun on 16/7/21.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import Foundation

class PhotoModel: NSObject {

    class ImageModel: NSObject {
        var imageSize: NSInteger = 0
        var imageURL: String = ""
        var imageHttpsURL: String = ""
        var imageFormat: String = ""
        
        override static func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
            return ["imageSize":"size",
                    "imageURL":"url",
                    "imageHttpsURL":"https_url",
                    "imageFormat":"format"]
        }
                
    }
    
    var photoID: String = ""                // ID
    var photoName: String = ""              // 名称
    var photoDesc: String = ""              // 描述
    var photoCamera: String = ""            // xxx
    var photoLens: String = ""              // xxx
    var photoCreatTime: String = ""         // 创建时间
    var photoRating: CGFloat = 0.0          // 评分
    var photoHighestRating: CGFloat = 0.0   // 最高评分
    var photoHighestRatingDate: String = "" // 最高评分时间
    
    var photoViewdCount: NSInteger = 0      // 查看次数
    var photoVotesCount: NSInteger = 0      // 被投票的次数
    var photoFavoritesCount: NSInteger = 0  // 被喜欢的次数
    var photoCommentsCount: NSInteger = 0   // 被评论的次数
    var photoSalesCount: NSInteger = 0      // 被销售的次数
    var photoCollectionCount: NSInteger = 0 // 被采集的次数
    
    var photoImageURL: String = ""          // 图片URL
    var photoURL: String = ""               // URL
    var photoImageFormat: String = ""       // 图片类型
    var photoImages: NSArray = []           // 图片数组
    
    var photoLocation: String = ""          // 地理位置
    var photoLatitude: CGFloat = 0.0        // 纬度
    var photoLngitude: CGFloat = 0.0        // 经度
    
    var photo_userID: String = ""               // 上传用户ID
    var photo_userInfo: UserModel = UserModel() // 上传的用户信息
    
    override static func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["photoID":"id",
                "photoName":"name",
                "photoDesc":"description",
                "photoCamera":"camera",
                "photoLens":"lens",
                "photoCreatTime":"created_at",
                "photoRating":"rating",
                "photoHighestRating":"highest_rating",
                "photoHighestRatingDate":"highest_rating_date",
        
                "photoViewdCount":"times_viewed",
                "photoVotesCount":"votes_count",
                "photoFavoritesCount":"favorites_count",
                "photoCommentsCount":"comments_count",
                "photoSalesCount":"sales_count",
                "photoCollectionCount":"collections_count",
        
                "photoImageURL":"image_url",
                "photoURL":"url",
                "photoImageFormat":"image_format",
                "photoImages":"images",
        
                "photoLocation":"location",
                "photoLatitude":"latitude",
                "photoLngitude":"longitude",
        
                "photo_userID":"user_id",
                "photo_userInfo":"user"]
    }
    
    override static func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return["images":ImageModel()]
    }
}
