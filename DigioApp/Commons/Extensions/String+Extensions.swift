//
//  String+Extensions.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit


extension String {
    
    func withColor(_ color: UIColor, for substring: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        // Buscar o range do substring
        let range = (self as NSString).range(of: substring)
        
        // Verificar se o substring existe na string principal
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
        }
        
        return attributedString
    }
}
