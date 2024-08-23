//
//  RechargeDetailViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol RechargeDetailViewControllerProtocol: AnyObject {
    func didTapClosed()
}

final class RechargeDetailViewController: UIViewController {
    
    weak var coordinator: RechargeDetailCoordinator?
    private let RechargeDetailView: RechargeDetailViewProtocol
    private var viewModel: RechargeDetailViewModelProtocol
    
    init(viewModel: RechargeDetailViewModelProtocol, rechargeView: RechargeDetailViewProtocol) {
        self.RechargeDetailView = rechargeView
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
        RechargeDetailView.configure(model: viewModel.getDetail())
    }
    override func loadView() {
        view = RechargeDetailView
    }
    
    private func configureDelegate() {
        self.viewModel.delegate = self
        self.RechargeDetailView.delegate = self
    }
}

extension RechargeDetailViewController: RechargeDetailViewControllerProtocol {
    func didTapClosed() {
        coordinator?.closedView()
    }
}

