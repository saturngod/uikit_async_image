//
//  AsyncImageView.swift
//  ImageLoader
//
//  Created by Htain Lin Shwe on 22/12/2023.
//

import UIKit

class AsyncImageView: UIImageView {
    
    let imageLoader = ImageLoader()
    let progressView = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoaderView()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupLoaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLoaderView()
    }
    
    
    private func setupLoaderView() {
        addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }

    func loadImage(placeHolder: UIImage? = nil, url: String) {
        
        progressView.startAnimating()
        
        
        //load the image
        imageLoader.image(url: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.progressView.stopAnimating()
                if let urlImage = image {
                    self?.image = urlImage
                }
                else if let placeHolderImage = placeHolder {
                    self?.image = placeHolderImage
                }
            }
        }
    }
}
