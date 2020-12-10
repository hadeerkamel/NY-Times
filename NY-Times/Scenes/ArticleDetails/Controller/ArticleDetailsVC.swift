//
//  ArticleDetailsVC.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

class ArticleDetailsVC: UIViewController {
    //MARK: - Properties -
    var data: ArticleViewModel?{
        didSet{
            mainView.data = data
        }
    }
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
        view.backgroundColor = #colorLiteral(red: 0.9279547334, green: 0.9279547334, blue: 0.9279547334, alpha: 1)
        
        self.view.addSubview( mainView)
        mainView.anchor(top: self.navigationController?.navigationBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }

    private let mainView: ArticleDetailsView = {
        let view = ArticleDetailsView(frame: .zero)
        return view
    }()
}
