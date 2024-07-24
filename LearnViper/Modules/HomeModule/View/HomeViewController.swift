//
//  HomeViewController.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import UIKit

protocol HomeView: AnyObject {
    func showArticles(_ articles: [NewsArticle])
    func showError(_ message: String)
}

class HomeViewController: UIViewController, HomeView {
    
    private var articles: [NewsArticle] = []
    
    lazy var articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        return tableView
    }()
    
    var presenter: HomePresenterInput?
    
    static func createHomeController(presenter: HomePresenterInput) -> UIViewController {
        let vc = HomeViewController()
        vc.presenter = presenter
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.fetchArticles()
    }
    
    func setupUI() {
        view.addSubview(articlesTableView)
        
        articlesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            articlesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            articlesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            articlesTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            articlesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func showArticles(_ articles: [NewsArticle]) {
        self.articles = articles
        DispatchQueue.main.async {
            self.articlesTableView.reloadData()
        }
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell
        cell?.textLabel?.text = articles[indexPath.row].title
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        presenter?.navigateToDetail(with: article)
    }
}
