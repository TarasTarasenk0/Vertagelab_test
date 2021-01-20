//
//  NetworkService.swift
//  Vertagelab_test
//
//  Created by md760 on 19.01.2021.
//

import UIKit

enum BaseApi {
    static let baseUrl = "https://3lolo.github.io"
}

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case notFound
    case unknown
}

enum HTTPMethod: String {
    case get
}

struct NetworkService {
    
    typealias NetworkCallback = (Result<Data, NetworkError>) -> Void
    private static let baseUrl = BaseApi.baseUrl
    
    public static func get(endpoint: String, callback: @escaping NetworkCallback) {
        request(endpoint: endpoint, method: .get, callback: callback)
    }
    
    private static func request(endpoint: String, method: HTTPMethod, callback: @escaping NetworkCallback) {
        
        guard let url = URL(string: "\(baseUrl)\(endpoint)") else {
            callback(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                callback(.failure(.invalidResponse))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  let data = data else {
                callback(.failure(.invalidResponse))
                return
            }
            switch response.statusCode {
            case 200...299:
                callback(.success(data))
            case 404:
                callback(.failure(.notFound))
            default:
                callback(.failure(.unknown))
            }
        }
        task.resume()
    }
}
