//
//  HomeInteractor.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit

protocol DetailInteractorInput {
    var presenter: DetailInteractorOutput? { get set }
    func fetchImage(from url: URL)
}

protocol DetailInteractorOutput: AnyObject {
    func didFetchImage(_ image: UIImage?)
}

class DetailInteractorImpl: DetailInteractorInput {
    weak var presenter: DetailInteractorOutput?
    var imageCache = NSCache<NSURL, UIImage>()
    
    func fetchImage(from url: URL) {
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            presenter?.didFetchImage(cachedImage)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                self?.presenter?.didFetchImage(nil)
                return
            }
            self?.imageCache.setObject(image, forKey: url as NSURL)
            self?.presenter?.didFetchImage(image)
        }
        task.resume()
    }
}

