//
//  ArticlesVC.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

class ArticlesVC: UIViewController {

    //MARK: - Properties -
    var presenter: ArticlesVCPresenter?
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = ArticlesVCPresenterImpl(view: self)
        presenter?.presentMostPopularArticles()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
        
    }
    //MARK: - SetupViews -
    private func setupViews(){
        view.backgroundColor = #colorLiteral(red: 0.9279547334, green: 0.9279547334, blue: 0.9279547334, alpha: 1)
        
        setupNavigationBar()
        
        view.addSubview(mainView)
        mainView.anchor(top: navigationController?.navigationBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    private func setupNavigationBar(){
        
        navigationItem.leftBarButtonItem = menuBarButton
        navigationItem.rightBarButtonItems = [optionsButton, searchBarButton]
        
        title = "NY Times Most Popular"
    }
    //MARK: - UI Components -
    let mainView: ArticlesView = {
        let view = ArticlesView(frame: .zero)
        return view
    }()
    
    private let menuBarButton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_menu_white_18pt"), style: .plain, target: self, action: nil)
        return button
    }()
    private let searchBarButton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_search_white_24pt"), style: .plain, target: self, action: nil)
        return button
    }()
    private let optionsButton : UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_more_vert_white_36pt"), style: .plain, target: self, action: nil)
        return button
    }()

}
