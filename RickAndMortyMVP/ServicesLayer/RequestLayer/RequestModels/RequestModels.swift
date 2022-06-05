//
//  WalletListModel.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 23.05.2022.
//

import Foundation

//MARK: - AllCharactersModel
struct AllCharactersModel: Codable {
    var info: CharacterInfoModel
    var result: String?
}

//MARK: - CharacterInfoModel
struct CharacterInfoModel: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}



