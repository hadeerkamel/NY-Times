//
//  AtriclesVCViewDelegate.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

protocol AtriclesVCViewDelegate {
    func gotMostPopularArticles()
    
    func startLoadingAnimation()
    func stopLoadingAnimation()
}

extension ArticlesVC: AtriclesVCViewDelegate{
    
    func gotMostPopularArticles(){
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }
    
    func startLoadingAnimation(){
        DispatchQueue.main.async {
            self.activityIdicatorView = self.showActivityIndicatore(presentingView: self.mainView.tableView)
        }
    }
    func stopLoadingAnimation(){
        DispatchQueue.main.async {
            self.activityIdicatorView?.stopAnimating()
        }
    }
}
