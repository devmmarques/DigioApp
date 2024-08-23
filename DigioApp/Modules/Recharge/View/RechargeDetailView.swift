//
//  RechargeDetailView.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//


import UIKit

protocol RechargeDetailViewProtocol: UIView {
    var delegate: RechargeDetailViewControllerProtocol? { get set}
    func configure(model: RechargeDetailModel)
}

class RechargeDetailView: UIView, RechargeDetailViewProtocol {
    
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
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .digioBlue
        label.textAlignment = .left
        label.font = UIFont.FontBold(size: 28.0)
        return label
    }()
    
    private lazy var internalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 24.0
        return stackView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.FontBold(size: 18.0)
        return label
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var buttonContinue: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didContinue), for: .touchUpInside)
        button.applyPrimaryButton()
        button.setTitle("CONTINUE", for: .normal)
        return button
    }()
    
    weak var delegate: RechargeDetailViewControllerProtocol?
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: RechargeDetailModel) {
        self.titleLabel.text = model.title
        self.logoImage.loading(url: model.imageURL)
        self.descriptionLabel.text = model.description
    }
}
extension RechargeDetailView {
    
    @objc func didTapClosed() {
        delegate?.didTapClosed()
    }
    
    @objc func didContinue() {
        delegate?.didTapContinue()
    }
}


extension RechargeDetailView: CodeViewProtocol {
    func buildViewHierarchy() {
        
        scrollView.addSubview(internalView)
        footerView.addSubview(buttonContinue)
        addSubview(scrollView)
        addSubview(footerView)
        
        internalView.addSubview(logoImage)
        internalView.addSubview(internalStackView)
        
        internalStackView.addArrangedSubview(titleLabel)
        internalStackView.addArrangedSubview(descriptionLabel)
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
        
        logoImage
            .topAnchor(equalTo: internalView.topAnchor)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
        
        internalStackView
            .topAnchor(equalTo: logoImage.bottomAnchor, constant: 16.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 16.0)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16.0)
            .bottomAnchor(equalTo: internalView.bottomAnchor, constant: -52.0)
            
        buttonContinue
            .topAnchor(equalTo: footerView.topAnchor, constant: 12.0)
            .leadingAnchor(equalTo: footerView.leadingAnchor, constant: 12.0)
            .trailingAnchor(equalTo: footerView.trailingAnchor, constant: -12.0)
            .bottomAnchor(equalTo: footerView.bottomAnchor, constant: -12.0)
            .heightAnchor(equalTo: 52.0)
        
        footerView
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        logoImage.heightAnchor(equalTo: 180.0)
            
    }
    
    func setupAdditionalConfiguration() {
        internalView.backgroundColor = .white
        backgroundColor = .clear
    }
}
