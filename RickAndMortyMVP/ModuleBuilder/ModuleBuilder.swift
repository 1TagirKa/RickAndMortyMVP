//
//  ModuleBuilder.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 04.06.2022.
//

import Foundation
import UIKit

class ModuleBuilder: ModuleBuilderProtocol {
    
    //MARK: - CreateMainModule
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    //MARK: - CreateAppInfoModule
    static func createAppInfoModule() -> UIViewController {
        let view = AppInfoViewController()
        let presenter = AppInfoPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    //MARK: - CreateCharacterListModule
    static func createCharacterListModule() -> UIViewController {
        let view = CharacterTableViewController()
        let presenter = CharacterListPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
