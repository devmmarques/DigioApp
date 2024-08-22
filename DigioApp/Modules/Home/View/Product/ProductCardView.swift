//
//  ProductCardView.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import Foundation
import UIKit

final class ProductCardView: UIView {
    
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imageProduct: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(urlImage: String) {
        self.imageProduct.load(url: urlImage)
    }
}

extension ProductCardView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(internalView)
        internalView.addSubview(imageProduct)
    }
    
    func setupConstraints() {
        internalView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: bottomAnchor)
        
        imageProduct
//            .centerYAnchor(equalTo: internalView.centerYAnchor)
//            .centerXAnchor(equalTo: internalView.centerXAnchor)
            .topAnchor(equalTo: internalView.topAnchor)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
            .bottomAnchor(equalTo: internalView.bottomAnchor)
    }
    
    func setupAdditionalConfiguration() {
        internalView.layer.cornerRadius = 8.0
        internalView.layer.masksToBounds = true
    }
    
}
