//
//  RechargeDetailViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol RechargeDetailViewControllerProtocol: AnyObject {
    func didTapClosed()
    func didTapContinue()
}

final class RechargeDetailViewController: BaseViewController {
    
    private var coordinator: RechargeDetailCoordinator?
    private let rechargeDetailView: RechargeDetailViewProtocol
    private var viewModel: RechargeDetailViewModelProtocol
    
    init(coordinator: RechargeDetailCoordinator,
         viewModel: RechargeDetailViewModelProtocol, 
         rechargeView: RechargeDetailViewProtocol) {
        self.coordinator = coordinator
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
    func didTapClosed() {
        coordinator?.closedView()
    }
    
    func didTapContinue() {
        let product = viewModel.getDetail()
        coordinator?.showAlert(alert: .init(status: .success,
                                            title: "Recarga \(product.title) realizada com sucesso",
                                            description: "Parábens ! Você acaba de adicionar um saldo \(product.title) \n\n Aproveite ao máximo e continue usufluindo dos nossos serviços.",
                                            titlePrimaryButton: "OK",
                                            titleSecondaryButton: nil,
                                            actionPrimaryButton: { [weak self] in
            self?.coordinator?.closedView()
        },
                                            actionSecondaryButton: nil))
    }
}

