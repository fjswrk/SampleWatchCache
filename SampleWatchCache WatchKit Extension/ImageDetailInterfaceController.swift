//
//  ImageDetailInterfaceController.swift
//  SampleWatchCache
//
//  Created by swift-studying on 2015/03/28.
//  Copyright (c) 2015年 swift-studying. All rights reserved.
//

import WatchKit
import Foundation


class ImageDetailInterfaceController: WKInterfaceController {
    @IBOutlet weak var imageView: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        if let aContext = context as? String{
            
            let imageCacheManager = ImageDeviceCache()
            
            // キャッシュがあればキャッシュの画像を表示
            if imageCacheManager.containsImageInCache(aContext){
                self.imageView.setImageNamed(aContext)
            }else{
            
                if let aURL = NSURL(string: aContext){
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)){
                        
                        let imageData = NSData(contentsOfURL: aURL)
                        
                        dispatch_async(dispatch_get_main_queue()){
                            if imageData?.length > 0{
                                let image = UIImage(data: imageData!)!
                                self.imageView.setImage(image)
                                
                                imageCacheManager.addImageToCache(image, name: aContext)
                            }
                        }
                    }
                }
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
