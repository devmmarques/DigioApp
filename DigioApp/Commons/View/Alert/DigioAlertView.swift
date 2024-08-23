//
//  DigioAlertView.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//

import UIKit

class DigioAlertView: UIView {
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var topStatusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var iconStatus: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.FontMedium(size: 18.0)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.FontRegular(size: 14.0)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackButtons: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 16.0
        return stack
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPrimaryButton), for: .touchUpInside)
        button.applyPrimaryButton()
        return button
    }()
    
    private lazy var secondaryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSecundaryButton), for: .touchUpInside)
        button.applySecondButton()
        return button
    }()
    
    private var actionPrimaryButton: (() -> Void)?
    private var actionSecondaryButton: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(alert: AlertViewModel) {
        self.titleLabel.text = alert.title
        self.descriptionLabel.text = alert.description
        self.primaryButton.setTitle(alert.titlePrimaryButton, for: .normal)
        self.secondaryButton.setTitle(alert.titleSecondaryButton, for: .normal)
        
        self.actionPrimaryButton = alert.actionPrimaryButton
        self.actionSecondaryButton = alert.actionSecondaryButton
        
        switch alert.status {
        case .success:
            self.topStatusView.backgroundColor = UIColor.digioPrimaryColor
            self.iconStatus.image = UIImage(named: "icon-success")
        case .warning:
            self.topStatusView.backgroundColor = UIColor.digioWarning
            self.iconStatus.image = UIImage(named: "icon-warning")
        case .error:
            self.topStatusView.backgroundColor = UIColor.digioError
            self.iconStatus.image = UIImage(named: "icon-error")
        }
        
        if actionSecondaryButton == nil {
            self.secondaryButton.removeFromSuperview()
            self.stackButtons.layoutSubviews()
            
//            self.primaryButton.widthAnchor(equalTo: 300.0)
        }
    }
}

extension DigioAlertView {
    @objc func didTapPrimaryButton() {
        actionPrimaryButton?()
    }
    
    @objc func didTapSecundaryButton() {
        actionSecondaryButton?()
    }
}

extension DigioAlertView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(internalView)
        
        internalView.addSubview(topStatusView)
        internalView.addSubview(iconStatus)
        internalView.addSubview(titleLabel)
        internalView.addSubview(descriptionLabel)
        internalView.addSubview(stackButtons)
        
        stackButtons.addArrangedSubview(secondaryButton)
        stackButtons.addArrangedSubview(primaryButton)
    }
    
    func setupConstraints() {
        internalView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: bottomAnchor)
        
        topStatusView
            .topAnchor(equalTo: internalView.topAnchor)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
            .heightAnchor(equalTo: 12.0)
        
        iconStatus
            .topAnchor(equalTo: topStatusView.bottomAnchor, constant: 24.0)
            .centerXAnchor(equalTo: centerXAnchor)
            .widthAnchor(equalTo: 24.0)
            .heightAnchor(equalTo: 24.0)
        
        titleLabel
            .topAnchor(equalTo: iconStatus.bottomAnchor, constant: 16.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 16.0)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16.0)
        
        descriptionLabel
            .topAnchor(equalTo: titleLabel.bottomAnchor, constant: 16.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 16.0)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16.0)
        
        stackButtons
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 24.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor, constant: 16.0)
            .trailingAnchor(equalTo: internalView.trailingAnchor, constant: -16.0)
            .bottomAnchor(equalTo: internalView.bottomAnchor, constant: -16.0)
        
        self.primaryButton.heightAnchor(equalTo: 52.0)
        self.secondaryButton.heightAnchor(equalTo: 52.0)
    }
    
    func setupAdditionalConfiguration() {
        internalView.layer.cornerRadius = 16.0
        internalView.layer.masksToBounds = true
        internalView.layoutIfNeeded()
        
        iconStatus.layer.masksToBounds = true
    }
}
