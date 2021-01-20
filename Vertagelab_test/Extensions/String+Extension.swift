//
//  String+Extension.swift
//  Vertagelab_test
//
//  Created by md760 on 20.01.2021.
//

import Foundation

extension String {
    var isEmptySpace: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
