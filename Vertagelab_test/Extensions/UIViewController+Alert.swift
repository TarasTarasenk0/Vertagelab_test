//
//  UIViewController+Alert.swift
//  Vertagelab_test
//
//  Created by md760 on 19.01.2021.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String = "Sorry, something went wrong", message: String? = nil, buttonTitle: String = "OK", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
