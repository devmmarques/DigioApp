//
//  HomeView.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

protocol HomeViewProtocol: UIView {
    func updateView()
}

final class HomeView: UIView, HomeViewProtocol {
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isUserInteractionEnabled = true
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private lazy var internalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        return stackView
    }()
    
    private lazy var homeProdutos: HomeCardView = {
        let view = HomeCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        
    }
}

extension HomeView: CodeViewProtocol {
    func buildViewHierarchy() {
        internalView.addSubview(internalStackView)
        scrollView.addSubview(internalView)
        internalStackView.addArrangedSubview(homeProdutos)
        
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        scrollView
            .topAnchor(equalTo: self.safeAreaLayoutGuide.topAnchor)
            .leadingAnchor(equalTo: self.leadingAnchor)
            .trailingAnchor(equalTo: self.trailingAnchor)
            .bottomAnchor(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            .widthAnchor(equalTo: internalView.widthAnchor)
        
        internalView
            .topAnchor(equalTo: scrollView.topAnchor)
            .leadingAnchor(equalTo: scrollView.leadingAnchor)
            .trailingAnchor(equalTo: scrollView.trailingAnchor)
            .bottomAnchor(equalTo: scrollView.bottomAnchor)
        
        internalStackView
            .topAnchor(equalTo: internalView.topAnchor)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
            .bottomAnchor(equalTo: internalView.bottomAnchor)
    }
    
    
}
