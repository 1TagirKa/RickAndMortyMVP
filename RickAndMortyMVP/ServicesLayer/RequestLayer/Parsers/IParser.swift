//
//  IParser.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 23.05.2022.
//

import Foundation

protocol IParser {
    associatedtype Model
    func parse(data: Data) -> Model?
}
