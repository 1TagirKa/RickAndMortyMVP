//
//  NetworkLayer.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import Foundation

struct NetworkManager: INetworkManager {
    
    //MARK: - singletone Shared
    static let shared = NetworkManager()
    
    //MARK: - typealias
    typealias allCharacterHandler = (Result<Int, Error>) -> Void
    
    //MARK: - fetchAllCharacters
    func fetchAllCharactersNumber(completionHandler: @escaping (Result<Int, Error>) -> Void) {
        let allCharactersConfig = RequestFactory.CharacterRequest.characterInformationConfig()
        
        RequestSender.shared.send(requestConfig: allCharactersConfig) { result in
            switch result {
            case .success(let response):
                completionHandler(.success(response.info.count))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func fetchCharactersOnPage(_ pageNumber: Int, completionHandler: @escaping (Result<[MovieCharacter]?, Error>) -> Void) {
        let characterOnPageConfig = RequestFactory.CharacterRequest.charactersOnPage(pageNumber)
        
        RequestSender.shared.send(requestConfig: characterOnPageConfig) { result in
            switch result {
            case .success(let response):
                completionHandler(.success(response.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
