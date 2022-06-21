//
//  ErrorParser.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 20.06.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
    
    
}
