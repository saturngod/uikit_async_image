//
//  AnotherImageLoader.swift
//  ImageLoader
//
//  Created by Htain Lin Shwe on 22/12/2023.
//

import UIKit

class AnotherImageLoader {
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        task = URLSessionDownloadTask()
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping (UIImage,String) -> ()) {
        
        
        if let image = self.cache.object(forKey: imagePath as NSString) {
            
            DispatchQueue.main.async {
                
                completionHandler(image,"From Downloaded")
            }
        } else {
            let placeholder = UIImage(systemName: "pencil.and.outline")
            
            DispatchQueue.main.async {
                completionHandler(placeholder!, "From Place Holder")
            }
            let url: URL! = URL(string: imagePath)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img, "From Server Image")
                    }
                }
            })
            task.resume()
        }
    }
}
