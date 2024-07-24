//
//  NetworkManager.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import Foundation

enum CustomError: String, Error {
    case InvalidURL = "Invalid URL"
    case InvalidStatus = "Invalid Status"
    case MissingData = "Invalid Data"
    case NonDecodeableData = "Invalid Decoding"
}

protocol NetworkManager {
    var session: URLSession { get }
    func getData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManagerImpl: NetworkManager {
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }

    func getData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(CustomError.InvalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(CustomError.InvalidStatus))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.MissingData))
                return
            }
            
            if let decodedData = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(decodedData))
            } else {
                completion(.failure(CustomError.NonDecodeableData))
            }
           
        }
        
        dataTask.resume()
    }
}
