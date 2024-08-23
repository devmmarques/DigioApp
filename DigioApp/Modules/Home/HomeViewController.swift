//
//  HomeViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func update(model: ListHomeModel)
    func showError()
}

class HomeViewController: BaseViewController {
    
    private var viewModel: HomeViewModelProtocol
    private let homeView: HomeViewProtocol
    var coordinator: HomeCoordinatorProtocol?
    
    init(viewModel: HomeViewModelProtocol,
         homeView: HomeViewProtocol,
         coordinator: HomeCoordinatorProtocol) {
        self.viewModel = viewModel
        self.homeView = homeView
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        self.homeView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        viewModel.fetchHome()
    }
    
    override func loadView() {
        view = homeView
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    func update(model: ListHomeModel) {
        homeView.productsModel = model.products
        homeView.cashModelModel = model.cash
        homeView.spotLightModel = model.spotlight
    }
    
    func showError() {
        coordinator?.showAlert(alert: .init(status: .error,
                                            title: "Erro ao carregar",
                                            description: "Não foi possível carregar os dados \n Deseja tentar novamente ?",
                                            titlePrimaryButton: "Sim",
                                            titleSecondaryButton: "Não",
                                            actionPrimaryButton: { [weak self] in
            self?.viewModel.fetchHome()
        },
                                            actionSecondaryButton: { [weak self] in
            self?.dismiss(animated: true)
        }))
    }
}

extension HomeViewController: HomeViewDelegate {
    func didOpenDetail(model: HomeDetailModel) {
        coordinator?.openDetailView(model: model)
    }
    
    func didOpenRechard(model: RechargeDetailModel) {
        coordinator?.openRechargeDetail(model: model)
    }
}
