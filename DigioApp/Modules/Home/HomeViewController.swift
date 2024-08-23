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

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModelProtocol
    private let homeView: HomeViewProtocol
    private var coordinator: HomeCoordinatorProtocol?
    
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
}

extension HomeViewController: HomeViewDelegate {
    func didTapOpenDetailProduct(model: ProductModel) {
        coordinator?.openDetailView(model: .init(title: model.name, imageURL: model.imageURL, description: model.description))
    }
}
