//
//  HomeCardView.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import UIKit

final class ProductCardCarrousselView: UIView {
    
    private lazy var internalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .FontExtraSemiBold(size: 20)//UIFont.FontExtraBold(size: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .digioBlue
        label.text = "Produtos"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.registerCollectionCell(ProductCardViewCell.self)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    // MARK: Prorperties
    private var model: [ProductModel]?{
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                
            }
        }
    }
    
    var didTapAction: ((ProductModel) -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: [ProductModel]) {
        self.model = model
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
}


extension ProductCardCarrousselView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let products = model else { return 0 }
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellCollection(forIndexPath: indexPath) as ProductCardViewCell
        if let product = self.model {
            cell.configure(model: product[indexPath.row])
        }
        return cell
    }
}

extension ProductCardCarrousselView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let productModel = model {
            let model = productModel[indexPath.row]
            didTapAction?(model)
        }
    }
}

extension ProductCardCarrousselView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWith = collectionView.bounds.width
        let cellWith = (collectionViewWith / 3.3)
        return CGSize(width: cellWith, height: cellWith)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16.0, left: 36.0, bottom: 16.0, right: 12.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}

extension ProductCardCarrousselView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(internalView)
        internalView.addSubview(title)
        internalView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        internalView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: bottomAnchor)
        
        title
            .topAnchor(equalTo: internalView.topAnchor, constant: 16.0)
            .leadingAnchor(equalTo: leadingAnchor, constant: 16.0)
        
        collectionView
            .topAnchor(equalTo: title.bottomAnchor, constant: 16.0)
            .leadingAnchor(equalTo: internalView.leadingAnchor)
            .trailingAnchor(equalTo: internalView.trailingAnchor)
            .bottomAnchor(equalTo: internalView.bottomAnchor, constant: -24.0)
            .heightAnchor(equalTo: 120.0)
            
    }
}
