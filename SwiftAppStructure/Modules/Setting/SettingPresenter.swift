//
//  SettingPresenter.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 8/2/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import Foundation

class SettingPresenter {

    static public func logout() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }

}
