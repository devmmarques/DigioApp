//
//  RechargeDetailViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol RechargeDetailViewControllerProtocol: AnyObject {
    func didTapContinue()
}

final class RechargeDetailViewController: BaseViewController {
    
    private let rechargeDetailView: RechargeDetailViewProtocol
    private var viewModel: RechargeDetailViewModelProtocol
    
    init(viewModel: RechargeDetailViewModelProtocol, rechargeView: RechargeDetailViewProtocol) {
        self.rechargeDetailView = rechargeView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rechargeDetailView.configure(model: viewModel.getDetail())
    }
    override func loadView() {
        view = rechargeDetailView
    }
    
    private func configureDelegate() {
        self.viewModel.delegate = self
        self.rechargeDetailView.delegate = self
    }
    
}

extension RechargeDetailViewController: RechargeDetailViewControllerProtocol {
    func didTapContinue() {
        viewModel.didTapContinue()
    }
}

