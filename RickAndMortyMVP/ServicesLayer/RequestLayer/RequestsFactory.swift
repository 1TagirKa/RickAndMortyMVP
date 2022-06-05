//
//  RequestsFactory.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 24.05.2022.
//

import Foundation

class RequestFactory {

    //MARK: - CharacterRequest
    struct CharacterRequest {
        static func characterInformationConfig() -> RequestConfig<ResponseParser<AllCharactersModel>> {
            return RequestConfig<ResponseParser<AllCharactersModel>>(request: AllCharactersRequest(), parser: ResponseParser())
        }
    }
}
