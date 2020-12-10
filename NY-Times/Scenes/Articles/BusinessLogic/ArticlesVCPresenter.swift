//
//  ArticlesVCPresenter.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

protocol ArticlesVCPresenter {
    func presentMostPopularArticles()
    func getArticleByIndex(index: Int) -> ArticleViewModel
    func getNumberOfArticles() -> Int
}
class ArticlesVCPresenterImpl: ArticlesVCPresenter{
    var view: AtriclesVCViewDelegate
    private var articles: [ArticleViewModel] = []
    
    init(view: AtriclesVCViewDelegate) {
        self.view = view
    }
    
    //MARK: - Protocol -
    
    func presentMostPopularArticles(){
        view.startLoadingAnimation()
        MostPopularEndpoint().execute { (response, error) in
            if let response_ = response , error == nil {
                self.articles = (response_.results ?? []).map{return ArticleViewModel(model: $0)}
                self.view.gotMostPopularArticles()
            }
        }
    }
    
    func getArticleByIndex(index: Int) -> ArticleViewModel{
        return articles[index]
    }
    
    func getNumberOfArticles() -> Int{
        return articles.count
    }
}
