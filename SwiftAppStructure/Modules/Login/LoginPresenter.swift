//
//  LoginPresenter.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/14/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit
import Toast
import MBProgressHUD

enum LoginMessage: String {
    case success = "Login succeeded."
    case failure = "Login failure. Please try again."
}

class LoginPresenter {

    var view: UIView
    var msgStyle: ToastStyle!
    var hud: MBProgressHUD!

    init(_ view: UIView) {
        self.view = view
        msgStyle = self.setToastStyle()
    }

    private func setToastStyle() -> ToastStyle {
        var style = ToastStyle()
        style.messageColor = .white
        style.horizontalPadding = 10
        style.verticalPadding = 10
        return style
    }

    static func isLogging() -> Bool {
        return true
    }

    func showIndicator() {
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Logging..."
    }

    func hideIndicator() {
        hud.hide(animated: true)
    }

    func requestSuccess() {
        msgStyle.backgroundColor = .green
        self.view.makeToast(
            LoginMessage.success.rawValue,
            duration: 3.0,
            position: .bottom,
            style: msgStyle
        )
    }

    func requestFailure() {
        msgStyle.backgroundColor = .red
        self.view.makeToast(
            LoginMessage.failure.rawValue,
            duration: 3.0,
            position: .bottom,
            style: msgStyle
        )
    }
}
