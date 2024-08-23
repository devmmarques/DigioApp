//
//  DigioFont.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

extension UIFont {
    
    static let FontBoldName = "Montserrat-Bold"
    static let FontExtraBoldName = "Montserrat-ExtraBold"
    static let FontMediumName = "Montserrat-Medium"
    static let FontRegularName = "Montserrat-Regular"
    static let FontExtraSemiBoldName = "Montserrat-SemiBold"
    
    static func font(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
        
    static func FontBold(size: CGFloat) -> UIFont {
        return font(name: self.FontBoldName, size: size)
    }
        
    static func FontExtraBold(size: CGFloat) -> UIFont {
        return font(name: self.FontExtraBoldName, size: size)
    }
    
    static func FontMedium(size: CGFloat) -> UIFont {
        return font(name: self.FontMediumName, size: size)
    }
    
    static func FontRegular(size: CGFloat) -> UIFont {
        return font(name: self.FontRegularName, size: size)
    }
    
    static func FontExtraSemiBold(size: CGFloat) -> UIFont {
        return font(name: self.FontExtraSemiBoldName, size: size)
    }
}
