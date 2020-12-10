
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
        params = ["apikey": "lFE23ciGtw1yd87rYpmug2GZHAnb95Ld"]
    }
    
}

struct GetMostPopularResponse: Codable {
   
}

