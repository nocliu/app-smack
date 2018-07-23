//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Connie Liu on 7/10/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let password = passwordTxt.text , passwordTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("registered user")
            }
        }
    }
    
    @IBAction func chooseAvatarButtonPressed(_ sender: Any) {
    }
    
    @IBAction func backgroundColorButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
}
