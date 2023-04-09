//
//  GALogger.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 13.08.2022.
//

import Foundation
import FirebaseAnalytics

class GALogger {
    class func logEvent(name: String, key: String, value: String) {
        Analytics.logEvent(name, parameters: [key: value])
    }
}
