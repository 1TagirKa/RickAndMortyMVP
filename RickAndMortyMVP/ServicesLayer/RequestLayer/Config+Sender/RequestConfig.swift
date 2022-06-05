//
//  RequestConfig.swift
//  RequestFactoryTestProject
//
//  Created by Tagir Kabirov on 23.05.2022.
//

import Foundation

struct RequestConfig<Parser> where Parser: IParser {
    let request: IRequest
    let parser: Parser
}
