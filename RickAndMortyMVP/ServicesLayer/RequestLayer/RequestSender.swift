//
//  RequestSender.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 23.05.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case badURL
}

enum ParsingError: Error{
    case error
}

protocol IRequestSender {
    func send<Parser>(requestConfig config: RequestConfig<Parser>, completionHandler: @escaping (Result<Parser.Model, Error>) -> Void)
}

class RequestSender: IRequestSender {
    
    static var shared = RequestSender()
    
    func send<Parser>(requestConfig config: RequestConfig<Parser>,
                      completionHandler: @escaping (Result<Parser.Model, Error>) -> Void) where Parser : IParser {
        let request = config.request
        
        AF.request(request.urlRequest, method: config.request.method, parameters: request.parameters, encoding: JSONEncoding.default, headers: request.headers).response { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    if let parsingModel: Parser.Model = config.parser.parse(data: data) {
                        completionHandler(.success(parsingModel))
                    }
                    else { completionHandler(.failure(ParsingError.error)) }
                }
                else { completionHandler(.failure(NetworkError.badURL)) }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
