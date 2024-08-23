//
//  UIColor+Extensions.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

extension UIColor {
    static let digioBlue = UIColor(red: 6/255, green: 0/255, blue: 71/255, alpha: 1.0)
    static let digioError = UIColor(hex: "#DC5D59")
    static let digioWarning = UIColor(hex: "#F5C35F")
    static let digioPrimaryColor = UIColor(hex: "#55AB8A")
    
    
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        let alpha: CGFloat = hexSanitized.count == 8 ? CGFloat((rgb & 0xFF000000) >> 24) / 255.0 : 1.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // Função opcional para facilitar a criação de cores
    static func colorFromHex(_ hex: String) -> UIColor {
        return UIColor(hex: hex)
    }
}
