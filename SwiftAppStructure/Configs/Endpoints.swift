//
//  Endpoints.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/19/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import Foundation

struct Endpoints {

    let abc: String

    init(a: String) {
        self.abc = a
    }

    static let baseUrl = "https://ecommerce-admin-app.herokuapp.com"

    static func build(path: String) -> String {
        return "\(baseUrl)/\(path)"
    }

    static var login: String {
        return build(path: "users")
    }
}
