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
        image.contentMode = .scaleAspectFit
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
        self.imageProduct.loading(url: urlImage)
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
            .topAnchor(equalTo: internalView.topAnchor, constant: 24)
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 24)
            .trailingAnchor(equalTo: internalView.trailingAnchor,constant: -24)
            .bottomAnchor(equalTo: internalView.bottomAnchor, constant: -24)
    }
    
    func setupAdditionalConfiguration() {
        internalView.layer.cornerRadius = 16.0
        internalView.layer.masksToBounds = true
        self.layoutSubviews()
    }
}
