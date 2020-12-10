
//
//  MostPopularEndpoint.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

struct MostPopularEndpoint: NYTimesEndpoint {
    
    
    typealias ResponseModel = GetMostPopularResponse
    
    var path: String = "mostpopular/v2/viewed/7.json"
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
    var params: [String : Any] = [:]
    var files: [File] = []
    var extraHeaders: [String : String] = [:]
    var authorization: EndpointAuthorization = .None
    
    
    init() {
        params = ["api-key": "lFE23ciGtw1yd87rYpmug2GZHAnb95Ld"]
    }
    
}


struct GetMostPopularResponse: Codable {
    let status: String?
    let numResults: Int?
    let results: [ArticleModel]?

    enum CodingKeys: String, CodingKey {
        case status
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct ArticleModel: Codable {
    let url: String
    let source,abstract: String
    let publishedDate, subsection: String
    let byline: String
    let title: String
    let media: [Media]
    

    enum CodingKeys: String, CodingKey {
        case url
        case source,abstract
        case publishedDate = "published_date"
        case subsection
        case byline, title
        case media
      
    }
}

// MARK: - Media
struct Media: Codable {
    let caption: String
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case caption
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
}

