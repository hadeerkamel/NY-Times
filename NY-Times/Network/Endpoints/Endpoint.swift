
//
//  Endpoint.swift
//  Aqar
//
//  Created by Hadeer Kamel on 6/7/20.
//  Copyright © 2020 Aqar. All rights reserved.
//

import Foundation
protocol Endpoint {
  associatedtype ResponseModel: Codable
  func asUrlRequest() throws -> URLRequest
  func validateResponse(response: NetworkClientResponse) -> NetworkError?
}

extension Endpoint{
  
    func execute(client: NetworkClient = URLSessionClient(), _ completion: @escaping (ResponseModel?, NetworkError?) -> Void, progressCompletion: ((Float) -> Void)? = nil)  {
    do {
      client.executeRequest(try asUrlRequest(), completion: { (response, error) in
        guard let response = response else {
            completion(nil, GenericNetworkError(debugError: error))
            return
          }
          
          if let error = self.validateResponse(response: response) {
            completion(nil, error)
            return
          }
        
       
          do {
           
            completion(try JSONDecoder().decode(ResponseModel.self, from: response.data), nil)
          } catch let error {
            print(error)
            completion(nil, GenericNetworkError(debugError: error))
            return
          }
        
      }, progressCompletion: progressCompletion)
    } catch let error {
        completion(nil, GenericNetworkError(debugError: error))
        return
      }
  }
}

enum EndpointMethod: String {
  case get
  case post
}
struct File {
    var fieldName: String
    var fileName: String
    var memeType: String
    var fileData: Data
    
}
enum EndpointEncoding {
  case query
  case body
    
    func encode(_ params: [String: Any],_ files: [File] = [], into request: URLRequest) -> URLRequest {
    if params.isEmpty{
        return request
    }
    
    switch self {
    case .query:
        var components = URLComponents(string: request.url!.absoluteString)!
        
        components.queryItems = params.map({URLQueryItem(name: $0.key, value: $0.value as? String ?? "")})
        
        var newRequest = request
        newRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        newRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        newRequest.url = components.url!
        return newRequest
    case .body:
        let boundary = "Boundary-\(UUID().uuidString)"
        
        let body = NSMutableData()
        var newRequest = request
        newRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        newRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        newRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        for (key,value) in params {
            if key.contains("[]"){
                for element in (value as! [Any]){
                    body.appendString(convertFormField(named: key, value: element, using: boundary))
                }
            }else{
                body.appendString(convertFormField(named: key, value: value, using: boundary))
            }
        }
     //   let jsonData = try? JSONSerialization.data(withJSONObject: params)
       // body.append((jsonData)!)
        
        for file in files {
            body.append(convertFileData(fieldName: file.fieldName, fileName: file.fileName, mimeType: file.memeType, fileData: file.fileData, using: boundary))
        }
        body.appendString("--\(boundary)--")
                
        newRequest.httpBody = body as Data
        
        return newRequest
    }
  }
    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
      let data = NSMutableData()

      data.appendString("--\(boundary)\r\n")
      data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName).jpg\"\r\n")
      data.appendString("Content-Type: \(mimeType)\r\n\r\n")
      data.append(fileData)
      data.appendString("\r\n")

      return data as Data
    }
    func convertFormField(named name: String, value: Any, using boundary: String) -> String {
      var fieldString = "--\(boundary)\r\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
      fieldString += "\r\n"
      fieldString += "\(value)\r\n"

      return fieldString
    }
    
}
extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}
enum EndpointAuthorization {
  case BearerAuth
  case None
    
  func authenticate(request: URLRequest) -> URLRequest {
    
    var newRequest = request
    
    switch self{
    case .BearerAuth:
      //  guard let token = UserStoredData.shared.Token else{break}
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDM0Y2Q4MTMyYjc1MTFiYTU4YzVmNmFiNTU2ZGMyMzJjZmRhZDk1OTI2MmI1ZGNjYWQyNDRlNzEwNmI0ZWFhNTllODdhNWY2NjQwZGY5NjQiLCJpYXQiOjE1OTUwNjE3MjMsIm5iZiI6MTU5NTA2MTcyMywiZXhwIjoxNjI2NTk3NzIzLCJzdWIiOiIyMSIsInNjb3BlcyI6W119.KU-Z79ZM28gO-cI6CkPxEugNchkHkuDxMYnwD59HXw0_BRq9pPUonQ4cQaQGqaxAvy3FHmU2wL4StgqdI5zYroKtr9qkVbEXg3njWJBbq7nyYcdScay69b16o5ep9oKUtp5O658WgQ94xC4ArPOMFsC_04t-6ww5-2viX3DM8SurngSONQsbknty-UrT7Z0D8yYOpI47N7KEjXymAhEGnkESvFKmQLXFOn_b3dFKln6oU6u5SJcO6DGiYL28x_qeBhEXxzgu5PoWd1GcURAIpJtSKjmaJ6IAS5yfrfkfLl989KDWU4-A42xnH7gUZ9BxWZFDcqwEWjB3Pwry8c6j5f1pf96epjT_L-F7hFCR-EpnAwpGR_93lVSyvB67X9uS9GC2iCjW2ihLXH9FvFv962xKhuPfJeOFpChXmfzW41wE6QunNkIFxAlp1E2ecDI20dkFzgbHi5OLde0fKukJhV-Uwd7hUfYaOJ9cX1ImmErvW1wUvtam4InzLE1dqzDyqJhdmrYJZQYb54LZWtt227k0cJuROUasDpei5J2rvowdU2RuX27zvuSfs6gX2zrF2hBh1fYiNERRnnEIut-kGtu8qprut6XXcSp5z4Hjsuyto_GPOVNFocJF_Z12enYF4i9mPkQspoqAsb2lb-QbpKdc__vUazPopSowHjSlQTc"
        newRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    case .None:
        break
    }
   
    
    return newRequest
  }
}

struct UrlRequestInvalidUrlError: Error {}

