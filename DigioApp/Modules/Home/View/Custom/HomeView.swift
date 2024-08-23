//
//  HomeView.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

protocol HomeViewProtocol: UIView {
    var delegate: HomeViewDelegate? { get set }
    var productsModel: [ProductModel] { get set }
    var cashModelModel: CashModel? { get set }
    var spotLightModel: [SpotlightModel] { get set }
}

protocol HomeViewDelegate: AnyObject {
    func didTapOpenDetailProduct(model: ProductModel)
}

final class HomeView: UIView, HomeViewProtocol {
    
    // MARK: UI components
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
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    
    private lazy var internalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    private lazy var homeProduts: ProductCardCarrousselView = {
        let view = ProductCardCarrousselView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.didTapAction = { [weak self] model in
            guard let self = self else { return }
            self.delegate?.didTapOpenDetailProduct(model: model)
        }
        return view
    }()
    
    private lazy var banner: DigioProductView = {
        let view = DigioProductView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var spotLight: SpotlightCardCarrousselView = {
        let view = SpotlightCardCarrousselView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: HomeViewDelegate?
    // MARK: Properties
    var productsModel: [ProductModel] = [] {
        didSet {
            homeProduts.configure(model: productsModel)
        }
    }
    
    var cashModelModel: CashModel? = nil {
        didSet {
            banner.configure(bannerURL: cashModelModel?.bannerUrl)
        }
    }
    
    var spotLightModel: [SpotlightModel] = [] {
        didSet {
            spotLight.configure(model: spotLightModel)
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
        internalView.addSubview(internalStackView)
        scrollView.addSubview(internalView)
        
        internalStackView.addArrangedSubview(spotLight)
        internalStackView.addArrangedSubview(banner)
        internalStackView.addArrangedSubview(homeProduts)
        
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
