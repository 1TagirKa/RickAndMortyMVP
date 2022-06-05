//
//  IConfigurableView.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import Foundation

protocol IConfigurableView {

    associatedtype ConfigurationModel

    func configure(with model: ConfigurationModel)
}
