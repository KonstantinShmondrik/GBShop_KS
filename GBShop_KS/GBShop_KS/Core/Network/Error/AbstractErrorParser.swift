//
//  AbstractErrorParser.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 20.06.2022.
//

import Foundation

protocol AbstractErrorParser {
    
    func parse(_ result: Error) -> Error
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
