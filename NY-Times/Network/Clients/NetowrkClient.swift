//
//  NetworkClient.swift
//  Aqar
//
//  Created by Hadeer Kamel on 6/7/20.
//  Copyright © 2020 Aqar. All rights reserved.
//

import Foundation
protocol NetworkClient {
  func executeRequest(_ request: URLRequest, completion: @escaping (NetworkClientResponse?, Error?) -> Void, progressCompletion: ((Float) -> Void)?)
}

struct NetworkClientResponse {
  let data: Data
  let statusCode: Int
  let headers: [String: String]
}
