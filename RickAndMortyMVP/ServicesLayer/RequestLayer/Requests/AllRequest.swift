//
//  WalletListRequest.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 24.05.2022.
//

import Foundation
import Alamofire

//MARK: - AllCharactersRequest 
struct AllCharactersRequest: IRequest {
    var path: String = "/character"
    var method: HTTPMethod = .get
    var parameters: [String : Any]? = nil
    var  headers: HTTPHeaders? = nil
}

