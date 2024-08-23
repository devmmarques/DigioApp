//
//  DigioAlertViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//

import UIKit

class DigioAlertViewController: BaseViewController {
    
    let alert: AlertViewModel
    
    private var digioAlertView: DigioAlertView = {
        let view = DigioAlertView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(alert: AlertViewModel) {
        self.alert = alert
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        digioAlertView.configure(alert: self.alert)
    }
}

extension DigioAlertViewController: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(digioAlertView)
    }
    
    func setupConstraints() {
        digioAlertView
            .centerXAnchor(equalTo: view.centerXAnchor)
            .centerYAnchor(equalTo: view.centerYAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor, constant: 24.0)
            .trailingAnchor(equalTo: view.trailingAnchor, constant: -24.0)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
}
