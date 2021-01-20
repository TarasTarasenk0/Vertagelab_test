//
//  NSObject+Identifier.swift
//  Vertagelab_test
//
//  Created by md760 on 20.01.2021.
//

import Foundation

extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
