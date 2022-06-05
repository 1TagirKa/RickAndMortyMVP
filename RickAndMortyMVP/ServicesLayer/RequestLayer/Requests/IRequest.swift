//
//  IRequest.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 23.05.2022.
//

import Foundation
import Alamofire

protocol IRequest {
    var path: String { get set }
    var method: HTTPMethod { get set }
    var parameters: [String: Any]? { get set }
    var headers: HTTPHeaders?  { get set }
}
extension IRequest {
    private static var apiHost: String { return "https://rickandmortyapi.com/api" }
    var urlRequest: String { Self.apiHost + self.path }
}
