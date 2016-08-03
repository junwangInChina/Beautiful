//
//  PhotoCell.swift
//  Beautiful
//
//  Created by wangjun on 16/8/2.
//  Copyright © 2016年 wangjun. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    // MARK:- Lazy loading
    lazy var imageView :UIImageView = {
        let tempImageView = UIImageView.init()
        tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
        tempImageView.clipsToBounds = true
        
        return tempImageView
    }()
    
    lazy var titleLabel :UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.textColor = UIColor.whiteColor()
        tempLabel.font = UIFont.init(name: "Arial", size: 14)
        tempLabel.textAlignment = NSTextAlignment.Center
        tempLabel.numberOfLines = 0
        tempLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        return tempLabel
    }()
    
    lazy var favButton: UIButton = {
        let tempButton = UIButton.init()
        tempButton.setImage(UIImage.init(named: "photo_favorites"), forState: UIControlState.Normal)
        tempButton.setTitleColor(UIColor.lightTextColor(), forState: UIControlState.Normal)
        tempButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        tempButton.titleLabel?.font = UIFont.init(name: "Arial", size: 12)
        tempButton.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        tempButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10)
        tempButton.addTarget(self, action: #selector(favAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return tempButton
    }()
    
    // MARK:- Life Cycle
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = true
        
        self.addSubview(self.imageView)
        self.imageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self);
        }
        
        self.addSubview(favButton)
        favButton.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Public Method
    func configPhoto(model: PhotoModel) -> Void {
        
        self.imageView.sd_setImageWithURL(NSURL(string:model.photoImageURL), placeholderImage: UIImage.init(named: "photo_default"))
        self.titleLabel.text = model.photoName
        self.favButton.setTitle(String.init(format: "%d", model.photoFavoritesCount), forState: UIControlState.Normal)
    }
    
    // MARK:- Private Action Event
    func favAction(sender:AnyObject) -> Void {
        
    }
    
}
