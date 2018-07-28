//
//  LoginVC.swift
//  Smack
//
//  Created by Connie Liu on 7/10/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
