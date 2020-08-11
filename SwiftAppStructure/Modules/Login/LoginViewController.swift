//
//  LoginViewController.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/14/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UITableViewController {

    var presenter: LoginPresenter!

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = LoginPresenter(self.view)

        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func onLoginTapped(_ sender: Any) {
        let payload = LoginRequest(
            email: emailField.text!,
            password: passwordField.text!
        )

        log.info("onLoginTapped: \(payload)")

        presenter.showIndicator()

        AF.request(
            Endpoints.login,
            method: .get
            //parameters: payload
        ).responseJSON { (response) in
            self.presenter.hideIndicator()
            switch response.result {
            case let .success(data):
                var isSuccess = false
                if let users = data as? [AnyObject] {
                    for user in users {
                        if let email = user.value(forKey: "email"),
                            email as! String == payload.email {
                            isSuccess = true
                            UserDefaults.standard.set(email, forKey: StorageKey.loginEmail.rawValue)
                            UserDefaults.standard.synchronize()
                            break
                        }
                    }
                }

                if isSuccess {
                    self.presenter.requestSuccess()
                    self.openHomeView()
                } else {
                    self.presenter.requestFailure()
                }
            case let .failure(error):
                log.error(error)
            }
        }
    }

    private func openHomeView() {
        let homeView = Commons.initViewController(
            StoryboardName.mainTab.rawValue,
            StoryboardID.mainTab.rawValue
        )
        self.present(homeView, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

}
