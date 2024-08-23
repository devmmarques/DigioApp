//
//  HomeDetailViewController.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol HomeDetailViewControllerProtocol: AnyObject {
    func didTapClosed()
}

final class HomeDetailViewController: UIViewController {
    
    weak var coordinator: HomeDetailCoordinator?
    private let homeDetailView: HomeDetailViewProtocol
    private var viewModel: HomeDetailViewModelProtocol
    
    init(coordinator: HomeDetailCoordinator,
         viewModel: HomeDetailViewModelProtocol,
         homeView: HomeDetailViewProtocol) {
        self.coordinator = coordinator
        self.homeDetailView = homeView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureDelegate()
        homeDetailView.configure(model: viewModel.getDetail())
    }
    override func loadView() {
        view = homeDetailView
    }
    
    private func configureDelegate() {
        self.viewModel.delegate = self
        self.homeDetailView.delegate = self
    }
}

extension HomeDetailViewController: HomeDetailViewControllerProtocol {
    func didTapClosed() {
        coordinator?.closedView()
    }
}

