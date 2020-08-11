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
    case mainTab = "MainTab"
}

enum StoryboardID: String {
    case login = "LoginViewController"
    case home = "HomeViewController"
    case mainTab = "MainTabBarViewController"
}

enum StorageKey: String {
    case loginEmail = "loginEmail"
}
