//
//  DetailPresenter.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit

protocol DetailPresenter: AnyObject {
    var view: DetailView? { get set }
    var interactor: DetailInteractorInput? { get set }
    var router: DetailRouter? { get set }
    
    func viewDidLoad()
}

class DetailPresenterImpl: DetailPresenter, DetailInteractorOutput {
    weak var view: DetailView?
    var interactor: DetailInteractorInput?
    var router: DetailRouter?
    
    private var article: NewsArticle
    
    init(view: DetailView, interactor: DetailInteractorInput, router: DetailRouter, article: NewsArticle) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.article = article
    }
    
    func viewDidLoad() {
        view?.displayArticle(article)
        
        if let imageUrlString = article.media.first?.mediaMetadata.first(where: { $0.format == "mediumThreeByTwo440" })?.url,
           let imageUrl = URL(string: imageUrlString) {
            interactor?.fetchImage(from: imageUrl)
        }
    }
    
    func didFetchImage(_ image: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.displayImage(image)
        }
    }
}

