//
//  UITextField+Extensions.swift
//  Vertagelab_test
//
//  Created by md760 on 18.01.2021.
//

import UIKit

extension UITextField {
    func placeholder(_ text: String, color: UIColor = .gray) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func applyEmailStyle() {
        autocorrectionType = .no
        autocapitalizationType = .none
        keyboardType = .emailAddress
        textContentType = .emailAddress
    }
    
    func applyPasswordStyle() {
        autocorrectionType = .no
        autocapitalizationType = .none
        keyboardType = .default
        isSecureTextEntry = true
        textContentType = .password
        rightViewMode = .always
        clearButtonMode = .never
    }
}
