//
//  DetailViewController.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit

protocol DetailView: AnyObject {
    func displayArticle(_ article: NewsArticle)
    func displayImage(_ image: UIImage?)
}

class DetailViewController: UIViewController, DetailView {
    
    
    var presenter: DetailPresenter?
    
    static func createDetailViewController(presenter: DetailPresenter) -> UIViewController {
        let vc = DetailViewController()
        vc.presenter = presenter
        return vc
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let abstractLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(abstractLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            abstractLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            abstractLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            abstractLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
    
    func displayArticle(_ article: NewsArticle) {
        titleLabel.text = article.title
        abstractLabel.text = article.abstract
    }
    
    func displayImage(_ image: UIImage?) {
        imageView.image = image
    }
}
