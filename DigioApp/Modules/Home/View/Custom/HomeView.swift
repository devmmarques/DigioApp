//
//  HomeView.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

protocol HomeViewProtocol: UIView {
    var products: [ProductModel] { get set }
    var cashModel: CashModel? { get set }
}

final class HomeView: UIView, HomeViewProtocol {
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var homeProduts: ProductCardCarrousselView = {
        let view = ProductCardCarrousselView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var banner: DigioProductView = {
        let view = DigioProductView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var products: [ProductModel] = [] {
        didSet {
            homeProduts.configure(model: products)
        }
    }
    
    var cashModel: CashModel? = nil {
        didSet {
            banner.configure(bannerURL: cashModel?.bannerUrl)
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: CodeViewProtocol {
    func buildViewHierarchy() {
//        internalView.addSubview(internalStackView)
        scrollView.addSubview(internalView)
        internalView.addSubview(banner)
        internalView.addSubview(homeProduts)
        
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
        
        banner
            .topAnchor(equalTo: internalView.topAnchor)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
        
        homeProduts
            .topAnchor(equalTo: banner.bottomAnchor, constant: 16.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)

//        internalStackView
//            .topAnchor(equalTo: internalView.topAnchor)
//            .leadingAnchor(equalTo: internalView.leadingAnchor)
//            .trailingAnchor(equalTo: internalView.trailingAnchor)
//            .bottomAnchor(equalTo: internalView.bottomAnchor)
    }
}
