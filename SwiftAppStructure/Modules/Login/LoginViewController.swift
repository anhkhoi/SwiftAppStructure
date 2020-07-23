//
//  LoginViewController.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/14/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: UITableViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func onLoginTapped(_ sender: Any) {
        let payload = [
            "email": emailField.text,
            "password": passwordField.text
        ]
        
        log.info("onLoginTapped: \(payload)")
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Logging..."
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            hud.hide(animated: true)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

}
