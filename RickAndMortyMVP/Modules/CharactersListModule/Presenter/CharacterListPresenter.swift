//
//  CharacterListPresenter.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import Foundation
import UIKit

protocol ICharacterListView {
    func setCharacters()
    func failureFetching(error: Error)
}

protocol ICharacterListPresenter {
    init(view: ICharacterListView)
    func setCharactersOnPage(_ pageNumber: Int)
}

class CharacterListPresenter: ICharacterListPresenter {
    
    var view: ICharacterListView
    var characters: [MovieCharacter]?
    
    required init(view: ICharacterListView) {
        self.view = view
        
    }
    
    func setCharactersOnPage(_ pageNumber: Int) {
        NetworkManager.shared.fetchCharactersOnPage(pageNumber) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.characters = characters
                    self.view.setCharacters()
                case .failure(let error):
                    self.view.failureFetching(error: error)
                }
            }
        }
    }
}
