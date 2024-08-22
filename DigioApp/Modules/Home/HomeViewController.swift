//
//  HomeViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func update(produts: [ProductModel])
}

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModelProtocol
    private let homeView: HomeViewProtocol
    
    init(viewModel: HomeViewModelProtocol, homeView: HomeViewProtocol) {
        self.viewModel = viewModel
        self.homeView = homeView
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
        viewModel.fetchHome()
    }
    
    override func loadView() {
        view = homeView
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    func update(produts: [ProductModel]) {
        homeView.products = produts
    }
}
