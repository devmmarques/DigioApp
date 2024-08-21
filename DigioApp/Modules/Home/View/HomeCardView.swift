//
//  HomeCardView.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

final class HomeCardView: UIView {
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Produtos"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCardView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(internalView)
        internalView.addSubview(title)
    }
    
    func setupConstraints() {
        
        internalView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: bottomAnchor)
        
        title
            .heightAnchor(equalTo: 24.0)
            .centerXAnchor(equalTo: internalView.centerXAnchor, constant: 24.0)
            .centerYAnchor(equalTo: internalView.centerYAnchor, constant: 24.0)
    }
    
    
}
