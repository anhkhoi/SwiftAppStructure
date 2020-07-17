//
//  LoginViewController.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/14/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func onLoginTapped(_ sender: Any) {
        log.info("onLoginTapped")
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

}
