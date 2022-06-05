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
        
        static func charactersOnPage(_ pageNumber: Int) -> RequestConfig<ResponseParser<CharacterOnPageModel>> {
            return RequestConfig<ResponseParser<CharacterOnPageModel>>(request: CharactersOnPageRequest(), parser: ResponseParser())
        }
    }
}
