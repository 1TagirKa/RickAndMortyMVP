//
//  AppInfoPresenter.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import Foundation

protocol IAppInfoView {
    func successFetchingCharacterCount()
    func failureFetchingData(error: Error)
}

protocol IAppInfoPresenter {
    init(view: IAppInfoView)
    
    func setCharacterCount()
}

class AppInfoPresenter: IAppInfoPresenter {
    let view: IAppInfoView
    var characterCount: Int?
    
    required init(view: IAppInfoView) {
        self.view = view
    }
    
    func setCharacterCount() {
        NetworkManager.shared.fetchAllCharactersNumber { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case . success(let characterCount):
                    self.characterCount = characterCount
                    self.view.successFetchingCharacterCount()
                case .failure(let error):
                    self.view.failureFetchingData(error: error)
                }
            }
        }
    }
}
