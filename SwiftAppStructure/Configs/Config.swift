//
//  Config.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/14/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import Foundation

enum AppEnv: String {
    case dev, stag, prod
}

enum StoryboardName: String {
    case main = "Main"
}

enum StoryboardID: String {
    case home = "HomeViewController"
    case mainTab = "MainTabBarViewController"
}
