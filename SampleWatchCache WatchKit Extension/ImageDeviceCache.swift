//
//  ImageDeviceCache.swift
//
//  Created by swift-studying on 2015/03/28.
//  Copyright (c) 2015年 swift-studying. All rights reserved.
//

import WatchKit

/** 画像のキャッシュを管理するクラス */
public class ImageDeviceCache{
    
    /**
    * 画像をキャッシュに追加
    * @param image キャッシュに追加する画像
    * @param name キャッシュに追加する画像につけるキー値
    * @return なし
    */
    public func addImageToCache(image:UIImage, name:String){
        
        // キャッシュに登録する
        while WKInterfaceDevice.currentDevice().addCachedImage(image, name: name) == false{
            if removeImageFromCache() == false{
                WKInterfaceDevice.currentDevice().removeAllCachedImages()
                WKInterfaceDevice.currentDevice().addCachedImage(image, name: name)
                break
            }
        }
    }
    
    /**
    * 指定したnameのキーをもつキャッシュが存在するかチェックする
    * @param name 存在するかチェックするキー値
    * @return 指定したnameのキー値をもつキャッシュが存在すればtrue。存在しなければfalse
    */
    public func containsImageInCache(name:String) -> Bool{
        return contains(allImageCaches.keys, name)
    }
    
    /* Private Function */
    private func removeImageFromCache() -> Bool{
        let cacheAllKeys = allImageCaches.keys
        
        if let firstCacheName = cacheAllKeys.first{
            WKInterfaceDevice.currentDevice().removeCachedImageWithName(firstCacheName)
            return true
        }
        return false
    }
    
    private var allImageCaches: [String : NSNumber] = {
        return WKInterfaceDevice.currentDevice().cachedImages as [String : NSNumber]
    }()
    
}
