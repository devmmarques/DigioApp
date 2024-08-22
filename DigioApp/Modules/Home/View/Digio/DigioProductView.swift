//
//  DigioProductView.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import UIKit

class DigioProductView: UIView {
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        title.textColor = .digioBlue
        return title
    }()
    
    private lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .redraw
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(bannerURL: String?) {
        guard let url = bannerURL else { return }
        bannerImage.load(url: url)
    }
    
    private func configureUI() {
        let fullText = "digio Cash"
        let coloredText = fullText.withColor(.darkGray, for: "Cash")
        titleLabel.attributedText = coloredText
        
        backgroundColor = .clear
    }
}

extension DigioProductView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(internalView)
        internalView.addSubview(titleLabel)
        internalView.addSubview(bannerImage)
    }
    
    func setupConstraints() {
        internalView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor, constant: 16.0)
            .trailingAnchor(equalTo: trailingAnchor, constant: -16.0)
            .bottomAnchor(equalTo: bottomAnchor)
            
        
        titleLabel
            .topAnchor(equalTo: internalView.topAnchor)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
        
        bannerImage
            .topAnchor(equalTo: titleLabel.bottomAnchor, constant: 8.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
            .bottomAnchor(equalTo: internalView.bottomAnchor)
            .heightAnchor(equalTo: 100)
    }
}
