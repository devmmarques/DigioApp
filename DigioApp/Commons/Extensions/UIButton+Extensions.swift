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
        self.layer.borderColor = UIColor.digioPrimaryColor.cgColor
        self.layer.borderWidth = 2.0
        self.backgroundColor = UIColor.digioPrimaryColor
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.FontExtraBold(size: 16)
    }
   
    func applySecondButton() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20.0
        self.layer.borderColor = UIColor.digioPrimaryColor.cgColor
        self.layer.borderWidth = 2.0
        self.setTitleColor(UIColor.digioPrimaryColor, for: .normal)
        self.titleLabel?.font = UIFont.FontExtraBold(size: 16)
    }
    
}
