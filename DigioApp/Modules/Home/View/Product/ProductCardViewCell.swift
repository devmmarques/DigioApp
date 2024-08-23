//
//  HomeCardCarrousselViewCell.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import Foundation
import UIKit

final class ProductCardViewCell: UICollectionViewCell {
    
    private lazy var productCard: ProductCardView = {
        let view = ProductCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Properties
    private var model: ProductModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ProductModel) {
        self.model = model
        productCard.configure(urlImage: model.imageURL)
    }
}
extension ProductCardViewCell: CodeViewProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(productCard)
    }
    
    func setupConstraints() {
        productCard
            .topAnchor(equalTo: contentView.topAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .clear
        productCard.dropShadow(color: .lightGray, opacity: 0.8, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
    }
}
