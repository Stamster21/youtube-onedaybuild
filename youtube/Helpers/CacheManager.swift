//
//  CacheManager.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-16.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, data: Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache (_ url:String) -> Data? {
        //get the data for the specified url
        return cache[url]
    }
}
