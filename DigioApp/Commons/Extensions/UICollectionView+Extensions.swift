//
//  UICollectionView+Extensions.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import UIKit

extension UICollectionView {
  
  func registerCollectionCell<T: UICollectionViewCell>(_: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.identifier)
  }
  
  func dequeueReusableCellCollection<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier : \(T.identifier)")
    }
    return cell
  }
}
