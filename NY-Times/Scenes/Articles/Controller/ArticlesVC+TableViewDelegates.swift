//
//  ArticlesVC+TableViewDelegates.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

extension ArticlesVC: UITableViewDelegate,UITableViewDataSource{
    func setupTableView(){
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.Identifier)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfArticles() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.Identifier, for: indexPath) as! ArticleTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.data = presenter?.getArticleByIndex(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
