//
//  ResponseParser.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 23.05.2022.
//

import Foundation
import UIKit

class ResponseParser<ResponseModelType: Decodable>: IParser {
    typealias Model = ResponseModelType
    
    func parse(data: Data) -> ResponseModelType? {
        guard let response = try? JSONDecoder().decode( ResponseModelType.self, from: data) else { return nil }
        return response
    }
}
