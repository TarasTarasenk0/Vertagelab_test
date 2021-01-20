//
//  ViewController.swift
//  Vertagelab_test
//
//  Created by md760 on 18.01.2021.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: InputField!
    @IBOutlet private weak var passwordTextField: InputField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        emailTextField.textField.applyEmailStyle()
        emailTextField.textField.placeholder("Enter email")
        passwordTextField.textField.applyPasswordStyle()
        passwordTextField.textField.placeholder("Enter password")
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.cornerRadius = loginButton.bounds.size.width / 12
        loginButton.clipsToBounds = true
    }
    
    @IBAction private func login(_ sender: UIButton) {
        emailTextField.errorLabel.isHidden = emailTextField.textField.text?.isEmptySpace == false
        passwordTextField.errorLabel.isHidden = passwordTextField.textField.text?.isEmptySpace == false
        guard let email = emailTextField.textField.text, !email.isEmptySpace,
            let password = passwordTextField.textField.text, !password.isEmptySpace else {
                return
        }
        let mapScreen = MapScreen()
        mapScreen.userEmail = email 
        navigationController?.pushViewController(mapScreen, animated: true)
    }
}
