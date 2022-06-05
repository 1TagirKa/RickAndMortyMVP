//
//  MainPresenter.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 04.06.2022.
//

import Foundation

protocol MainViewProtocol {
    func transactionButtonPressed(_ sender: Any)
}

protocol MainPresenterProtocol{
    init(view: MainViewProtocol)
}

class MainPresenter: MainPresenterProtocol {
    
    let view: MainViewProtocol
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
}
