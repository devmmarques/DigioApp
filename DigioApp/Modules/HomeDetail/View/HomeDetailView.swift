//
//  HomeDetailView.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol HomeDetailViewProtocol: UIView {
    var delegate: HomeDetailViewControllerProtocol? { get set}
    func configure(model: HomeDetailModel)
}

class HomeDetailView: UIView, HomeDetailViewProtocol {
    
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
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 12.0
        return stackView
    }()
    
    private lazy var buttonClosed: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapClosed), for: .touchUpInside)
        button.setImage(UIImage(named: "icon-btn-closed"), for: .normal)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .digioBlue
        label.textAlignment = .left
        label.font = UIFont.FontBold(size: 28.0)
        return label
    }()
    
    private lazy var logoimage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
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
    
    private lazy var buttonContinue: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didContinue), for: .touchUpInside)
        button.applyButtonGreen()
        button.setTitle("CONTINUE", for: .normal)
        return button
    }()
    
    
    weak var delegate: HomeDetailViewControllerProtocol?
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: HomeDetailModel) {
        self.titleLabel.text = model.title
        self.logoimage.loading(url: model.imageURL)
        self.descriptionLabel.text = model.description
    }
}
extension HomeDetailView {
    
    @objc func didTapClosed() {
        delegate?.didTapClosed()
    }
    
    @objc func didContinue() {
        
    }
}


extension HomeDetailView: CodeViewProtocol {
    func buildViewHierarchy() {
        internalView.addSubview(buttonClosed)
        internalView.addSubview(internalStackView)
        internalView.addSubview(buttonContinue)
        scrollView.addSubview(internalView)
        addSubview(scrollView)
        
        internalStackView.addArrangedSubview(logoimage)
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
        
        buttonClosed
            .topAnchor(equalTo: internalView.topAnchor, constant: 16)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16)
            .heightAnchor(equalTo: 24)
            .widthAnchor(equalTo: 24)
        
        internalStackView
            .topAnchor(equalTo: buttonClosed.bottomAnchor, constant: 16)
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16)
            .bottomAnchor(equalTo: buttonContinue.topAnchor, constant: -16)
            
        
        buttonContinue
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 16)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16)
            .bottomAnchor(equalTo: internalView.bottomAnchor, constant: -16)
            .heightAnchor(equalTo: 56)
        
        logoimage.heightAnchor(equalTo: 56).widthAnchor(equalTo: 56)
    }
    
    func setupAdditionalConfiguration() {
        internalView.backgroundColor = .white
        backgroundColor = .clear
    }
}
