//
//  CodeViewProtocol.swift
//  DigioApp
//
//  Created by Marco Marques on 19/08/24.
//

protocol CodeViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupViews()
}

extension CodeViewProtocol {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() { }
}
