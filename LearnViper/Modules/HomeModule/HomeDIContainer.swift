//
//  HomeDIContainer.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit


protocol HomeDIContainer {
    func createHomeModule() -> UIViewController
}

class HomeDIContainerImpl: HomeDIContainer {
    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }
    
    func createHomeModule() -> UIViewController {
        let interactor = HomeInteractorImpl(networkManager: NetworkManagerImpl(session: .shared))
        let router = HomeRouterImpl(appDIContainer: appDIContainer)
        let presenter = HomePresenterImpl(interactor: interactor, router: router)
        let view = HomeViewController.createHomeController(presenter: presenter)
        presenter.view = view as? HomeView
        router.homeViewController = view
        return view
    }
}
