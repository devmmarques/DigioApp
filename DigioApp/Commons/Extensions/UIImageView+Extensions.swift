//
//  UIImageView+Extensions.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import UIKit

extension UIImageView {
    
    func loading(url: String) {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.center = self.center
        indicatorView.startAnimating()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(indicatorView)
        
        indicatorView.centerXAnchor(equalTo: self.centerXAnchor).centerYAnchor(equalTo: self.centerYAnchor)
        
        guard let baseUrl = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: baseUrl) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self?.image = image
                        indicatorView.stopAnimating()
                        indicatorView.removeFromSuperview()
                    } else {
                        indicatorView.stopAnimating()
                        indicatorView.removeFromSuperview()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    indicatorView.stopAnimating()
                    indicatorView.removeFromSuperview()
                }
            }
        }
    }
}
