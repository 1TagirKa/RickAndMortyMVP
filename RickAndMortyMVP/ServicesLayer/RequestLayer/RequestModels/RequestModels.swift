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

// MARK: - Character
struct CharacterOnPageModel: Codable {
    let info: Info
    let results: [MovieCharacter]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next, prev: String
}

// MARK: - Result
struct MovieCharacter: Codable {
    let id: Int
    let name: String
    let status: Status
    let species, type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

