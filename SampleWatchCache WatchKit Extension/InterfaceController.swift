//
//  InterfaceController.swift
//  SampleWatchCache WatchKit Extension
//
//  Created by swift-studying on 2015/03/28.
//  Copyright (c) 2015年 swift-studying. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var imageList:[String] = {
       
        return [
            "http://swift-studying.com/blog/swift/wp-content/uploads/2015/03/swift156_010.png",
            "http://swift-studying.com/blog/swift/wp-content/uploads/2015/03/swift155_002.png",
            "http://swift-studying.com/blog/swift/wp-content/uploads/2015/03/swift155_004.png"
        ]
        
    }()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        let random = Int(arc4random_uniform(3))
        return imageList[random]
    }
}
