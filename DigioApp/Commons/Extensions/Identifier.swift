//
//  Identifier.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import UIKit

extension UIViewController {
    var identifier: String {
        return String(describing: self)
    }
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
