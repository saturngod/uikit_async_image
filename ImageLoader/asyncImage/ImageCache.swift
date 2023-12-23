//
//  ImageCache.swift
//  ImageLoader
//
//  Created by Htain Lin Shwe on 22/12/2023.
//

import Foundation

class ImageCache {
    
    static let cache = NSCache<NSString,NSData>()
    func getData(key: String) -> Data? {
        
        if let cacheFile = ImageCache.cache.object(forKey: key as NSString) {
            let mydata = Data(referencing: cacheFile)
            return mydata
        }
        
        return nil
        
    }
    
    func setData(key: String, value: Data) {

        ImageCache.cache.setObject(NSData(data: value), forKey: key as NSString)
    }
    
    
   
}
