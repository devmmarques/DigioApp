//
//  UIButton+Extensions.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit


extension UIButton {
    
    func applyPrimaryButton() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20.0
        self.dropShadow(color: .gray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        self.setTitleColor(.gray, for: .normal)
        self.backgroundColor = .white
        self.titleLabel?.font = UIFont.FontExtraBold(size: 16)
    }
    
    func applySecondButton() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.FontExtraBold(size: 16)
    }
    
    func applyButtonGreen() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20.0
        self.layer.borderColor = UIColor(hex: "#0bbc96").cgColor
        self.layer.borderWidth = 2.0
        self.backgroundColor = UIColor(hex: "#0bbc96")
//        self.dropShadow(color: ColorName.grayLight.color, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.FontExtraBold(size: 16)
    }
}
