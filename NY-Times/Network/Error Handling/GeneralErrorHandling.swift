//
//  GeneralErrorHandling.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import Foundation
class GeneralErrorHandling: NetworkErrorHandling {
  
  func validate(response: NetworkClientResponse) -> NetworkError? {
    if let error = validateStatusCode(response: response) {
      if let model = mapToErrorModel(data: response.data) {
        return MessageNetworkError(message: model.message, code: model.code, debug: error)
      } else {
        return GenericNetworkError(debugError: error)
      }
    }
    return nil
  }
  
  private func validateStatusCode(response: NetworkClientResponse) -> Error? {
    switch response.statusCode {
    case 400: return BadAccessError()
    //case 404: return NotFoundError()
    default: return nil
    }
  }
  
  private func mapToErrorModel(data: Data?) -> NetworkErrorModel? {
    guard let data = data else {
      return nil
    }
    do {
      return try JSONDecoder().decode(NetworkErrorModel.self, from: data)
    } catch {
      return nil
    }
  }
}

struct GenericNetworkError: NetworkError {
  var message: String = "" // GENERICMESSAGE
  var code: String = ""
  var debug: Error?
  
  init(debugError: Error?) {
    self.debug = debugError
  }
}

struct MessageNetworkError: NetworkError {
  var message: String
  var code: String
  var debug: Error?
  
  init(message: String, code: String, debug: Error) {
    self.message = message
    self.code = code
  }
}

struct BadAccessError: Error { }
struct NotFoundError: Error { }

struct NetworkErrorModel: Codable {
  let code: String
  let message: String
}
