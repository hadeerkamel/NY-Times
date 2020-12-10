//
//  ArticlesView.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit
class ArticlesView: UIView{
    
    //MARK: - Life cycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    //MARK: - SetupViews -
    private func setupViews(){
        
        self.addSubview(tableView)
        tableView.fillSuperview()
    }
    //MARK: - UI Components -
    
    
    //TableView
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.accessibilityIdentifier = "table-artcliesTableView"
        return tableView
    }()
}
