//
//  HomeViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func update(model: ListHomeModel)
}

class HomeViewController: BaseViewController {
    
    private var viewModel: HomeViewModelProtocol
    private let homeView: HomeViewProtocol
    
    init(viewModel: HomeViewModelProtocol,
         homeView: HomeViewProtocol) {
        self.viewModel = viewModel
        self.homeView = homeView
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
        
    }
}

extension HomeViewController: HomeViewDelegate {
    func didOpenProductDetail(model: ProductModel) {
        viewModel.didOpenProductDetail(model: model)
    }
    
    func didOpenRechargeDetail(model: SpotlightModel) {
        viewModel.didOpenRechargeDetail(model: model)
    }
    
    func didOpenCashDetail(model: CashModel) {
        viewModel.didOpenCashDetail(model: model)
    }
}
