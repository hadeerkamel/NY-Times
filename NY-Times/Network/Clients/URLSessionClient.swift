
//  URLSessionClient.swift
//  Aqar
//
//  Created by Hadeer Kamel on 6/7/20.
//  Copyright © 2020 Aqar. All rights reserved.
//

import Foundation
class URLSessionClient: NSObject, NetworkClient, URLSessionTaskDelegate {

  private var progress: ((Float) -> Void)?

  func executeRequest(_ request: URLRequest, completion: @escaping (NetworkClientResponse?, Error?) -> Void, progressCompletion: ((Float) -> Void)?) {
   print(request)
    self.progress = progressCompletion
    URLSession(configuration: .default, delegate: self, delegateQueue: nil).dataTask(with: request){ (data, response, error) -> Void in
        
      guard let data = data, let response = response as? HTTPURLResponse else {
        completion(nil, error)
        return
      }
        
      print(String(data: data, encoding: String.Encoding.utf8) ?? "")
        
      completion(NetworkClientResponse(data: data,
                                       statusCode: response.statusCode,
                                       headers: response.allHeaderFields as? [String: String] ?? [:]), nil)
    }.resume()
  }
  
  func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
    progress?(Float(totalBytesSent/totalBytesExpectedToSend))
  }
}
