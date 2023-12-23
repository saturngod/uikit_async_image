//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by Htain Lin Shwe on 22/12/2023.
//

import UIKit

typealias responseImageCompletion = (_ image:UIImage?) -> Void

class ImageLoader {
    
    let cache = ImageCache()
    
    func image(url: String, completion: @escaping responseImageCompletion) {
        
        if let cacheData = cache.getData(key: url),
            let cacheImage = UIImage(data: cacheData) {
            print("Load From Cache")
            completion(cacheImage)
        }
        else {
            downloadImage(url: url, completion: completion)
        }
    }
    
    private func downloadImage(url: String, completion: @escaping responseImageCompletion) {
        
        guard let loadUrl = URL(string: url) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: loadUrl) { [unowned self] data,response,error in
            
            if let imageData = data, let image = UIImage(data: imageData) {
                cache.setData(key: url, value: imageData)
                completion(image)
            }
            else {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
