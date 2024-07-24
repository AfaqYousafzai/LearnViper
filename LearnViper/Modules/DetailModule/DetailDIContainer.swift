//
//  DetailDIContainer.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit

protocol DetailDIContainer {
    func createDetailModule(with article: NewsArticle) -> UIViewController
}

class DetailDIContainerImpl: DetailDIContainer {
    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    func createDetailModule(with article: NewsArticle) -> UIViewController {
        let detailViewController = DetailViewController()
        let detailInteractor = DetailInteractorImpl()
        let detailRouter = DetailRouterImpl()
        let detailPresenter = DetailPresenterImpl(view: detailViewController, interactor: detailInteractor, router: detailRouter, article: article)
        
        detailViewController.presenter = detailPresenter
        detailInteractor.presenter = detailPresenter
        
        return detailViewController
    }
}
