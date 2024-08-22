//
//  SpotlightCardViewCell.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

class SpotlightCardViewCell: UICollectionViewCell {
    
    private lazy var spotlightView: SpotlightCardView = {
        let view = SpotlightCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Properties
    private var model: SpotlightModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: SpotlightModel) {
        self.model = model
        spotlightView.configure(urlImage: model.bannerUrl)
    }
}

extension SpotlightCardViewCell: CodeViewProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(spotlightView)
    }
    
    func setupConstraints() {
        spotlightView
            .topAnchor(equalTo: contentView.topAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor)
            .trailingAnchor(equalTo: contentView.trailingAnchor)
            .bottomAnchor(equalTo: contentView.bottomAnchor)
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .clear
        spotlightView.dropShadow(color: .lightGray, 
                                 opacity: 0.8,
                                 offSet: CGSize(width: -1, height: 0),
                                 radius: 3,
                                 scale: true)
    }
}
