//
//  ArticleViewModel.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//


class ArticleViewModel{
    var title: String
    var images: [String] = []
    var byLine: String
    var publishedDate: String
    var abstract: String
    var source: String
    
    init(model: ArticleModel) {
        self.title = model.title
        self.byLine = model.byline
        self.publishedDate = model.publishedDate
        self.source = model.source
        self.abstract = model.abstract
        if let media = model.media.first{
            self.images = media.mediaMetadata.map{return $0.url}
        }
        
    }
}
