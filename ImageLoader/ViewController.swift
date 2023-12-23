//
//  ViewController.swift
//  ImageLoader
//
//  Created by Htain Lin Shwe on 22/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: AsyncImageView?
    
    private var imageLoader = AnotherImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        
    }
    
    func loadImage() {
        let url = "https://images.unsplash.com/photo-1542397284385-6010376c5337?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        
        imageView?.loadImage(placeHolder: UIImage(systemName: "pencil.and.outline"),url: url)

    }

    @IBAction func loadImageAgain() {
        loadImage()
    }

}

