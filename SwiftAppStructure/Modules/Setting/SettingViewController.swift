//
//  SettingViewController.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 8/2/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLogoutTapped(_ sender: Any) {
        let loginView = Commons.initViewController(
            StoryboardName.main.rawValue,
            StoryboardID.login.rawValue
        )
        if let window: UIWindow = view.window {
            window.rootViewController = loginView
        }
        SettingPresenter.logout()
    }

}
