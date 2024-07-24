//
//  HomeRouter.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit

protocol HomeRouter {
    func navigateToDetail(with article: NewsArticle)
}

class HomeRouterImpl: HomeRouter {
    weak var homeViewController: UIViewController?
    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    func navigateToDetail(with article: NewsArticle) {
        let detailDIContainer = appDIContainer.makeDetailDIContainer()
        let detailViewController = detailDIContainer.createDetailModule(with: article)
        homeViewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
