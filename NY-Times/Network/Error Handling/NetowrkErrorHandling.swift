//
//  NetowrkErrorHandling.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//



import Foundation
protocol NetworkErrorHandling {
  func validate(response: NetworkClientResponse) -> NetworkError?
}

protocol NetworkError {
  var message: String {get}
  var code: String {get}
  var debug: Error? {get}
}

