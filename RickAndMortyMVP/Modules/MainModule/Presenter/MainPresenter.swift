//
//  MainPresenter.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 04.06.2022.
//

import Foundation

protocol IMainView {
    func transactionButtonPressed(_ sender: Any)
}

protocol MainPresenterProtocol{
    init(view: IMainView)
}

class MainPresenter: MainPresenterProtocol {
    
    let view: IMainView
    
    required init(view: IMainView) {
        self.view = view
    }
}
