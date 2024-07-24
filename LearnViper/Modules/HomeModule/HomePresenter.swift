//
//  HomePresenter.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import Foundation

protocol HomePresenterInput {
    var view: HomeView? { get set }
    func fetchArticles()
    func navigateToDetail(with article: NewsArticle)
}

protocol HomePresenterOutput {
    var interactor: HomeInteractor { get }
    var router: HomeRouter { get }
}


class HomePresenterImpl: HomePresenterInput, HomePresenterOutput {
    weak var view: HomeView?
     var interactor: HomeInteractor
     var router: HomeRouter
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchArticles() {
        interactor.fetchArticles { [weak self] result in
            switch result {
            case .success(let response):
                self?.view?.showArticles(response.results)
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
    
    func navigateToDetail(with article: NewsArticle) {
        router.navigateToDetail(with: article)
    }
}
