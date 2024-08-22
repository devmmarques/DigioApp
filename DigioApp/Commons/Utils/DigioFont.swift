//
//  DigioFont.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

extension UIFont {
    
    static let FontBold = "Montserrat-Bold"
    static let FontExtraBold = "Montserrat-ExtraBold"
    static let FontMedium = "Montserrat-Medium"
    static let FontRegular = "Montserrat-Regular"
    static let FontExtraSemiBold = "Montserrat-SemiBold"
    
    static func font(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
        
    static func FontBold(size: CGFloat) -> UIFont {
        return font(name: FontBold, size: size)
    }
        
    static func FontExtraBold(size: CGFloat) -> UIFont {
        return font(name: FontExtraBold, size: size)
    }
    
    static func FontMedium(size: CGFloat) -> UIFont {
        return font(name: FontMedium, size: size)
    }
    
    static func FontRegular(size: CGFloat) -> UIFont {
        return font(name: FontRegular, size: size)
    }
    
    static func FontExtraSemiBold(size: CGFloat) -> UIFont {
        return font(name: FontExtraSemiBold, size: size)
    }
}
