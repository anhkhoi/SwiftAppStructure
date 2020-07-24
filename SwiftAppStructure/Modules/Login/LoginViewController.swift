//
//  LoginViewController.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/14/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
import Toast

class LoginViewController: UITableViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func onLoginTapped(_ sender: Any) {
        let payload = LoginRequest(
            email: emailField.text!,
            password: passwordField.text!
        )

        log.info("onLoginTapped: \(payload)")

        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Logging..."

        AF.request(
            Endpoints.login,
            method: .get
            //parameters: payload
        ).responseJSON { (response) in
            hud.hide(animated: true)
            switch response.result {
            case let .success(data):
                var isSuccess = false
                if let users = data as? [AnyObject] {
                    for user in users {
                        if let email = user.value(forKey: "email"),
                            email as! String == payload.email {
                            isSuccess = true
                            break
                        }
                    }
                }

                var msgStyle = ToastStyle()
                msgStyle.messageColor = .white
                msgStyle.backgroundColor = .green
                msgStyle.horizontalPadding = 10
                msgStyle.verticalPadding = 10

                if isSuccess {
                    self.view.makeToast("Login succeeded.", duration: 3.0, position: .bottom, style: msgStyle)
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let homeView = sb.instantiateViewController(withIdentifier: "HomeViewController") as UIViewController
                    self.present(homeView, animated: true, completion: nil)
                } else {
                    msgStyle.backgroundColor = .red
                    self.view.makeToast("Login failure. Please try again.", duration: 3.0, position: .bottom, style: msgStyle)
                }
            case let .failure(error):
                log.error(error)
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

}
