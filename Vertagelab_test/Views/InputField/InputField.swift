//
//  InputField.swift
//  Light Market
//
//  Created by Tarasenko Jurik on 24.07.2020.
//  Copyright © 2020 Tarasenko Yurii. All rights reserved.
//

import UIKit

final class InputField: UIView {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        xibSetup()
        textField.delegate = self
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.bounds.size.width / 20
        self.clipsToBounds = true
    }
}

extension InputField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.isHidden = true
    }
}
