//
//  HomeInteractor.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import Foundation

import Foundation

protocol HomeInteractor {
    var networkManager: NetworkManager { get }
    func fetchArticles(completion: @escaping (Result<NYTimesResponse, Error>) -> Void)
}

class HomeInteractorImpl: HomeInteractor {
    var networkManager: NetworkManager
    
    private let apiKey = "5bLb5KhctUToKuDzH2ciIc1oJNXqOIsP"
    let urlString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key="
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchArticles(completion: @escaping (Result<NYTimesResponse, Error>) -> Void) {
        networkManager.getData(from: urlString + apiKey, completion: completion)
    }
}
