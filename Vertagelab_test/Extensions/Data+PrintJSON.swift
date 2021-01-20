//
//  Data+PrintJSON.swift
//  Vertagelab_test
//
//  Created by md760 on 20.01.2021.
//

import Foundation

extension Data {
    func printJSON() {
        if let jsonString = String(data: self, encoding: .utf8) {
            print(jsonString)
        }
    }
}
