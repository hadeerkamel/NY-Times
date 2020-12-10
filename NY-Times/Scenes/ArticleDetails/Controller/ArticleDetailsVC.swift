//
//  ArticleDetailsVC.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

class ArticleDetailsVC: UIViewController {
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = "view_articleDetails"
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
        
    }
    //MARK: - SetupViews -
    private func setupViews(){
        self.view.addSubview( mainView)
        mainView.anchor(top: self.navigationController?.navigationBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }

    private let mainView: ArticleDetailsView = {
        let view = ArticleDetailsView(frame: .zero)
        return view
    }()
}
