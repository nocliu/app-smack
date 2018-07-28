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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColorName = "[0.5, 0.5, 0.5, 1]"
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        activityIndicator.isHidden = true
        
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            avatarName = UserDataService.instance.avatarName
            userImg.image = UIImage(named: avatarName)
            if avatarName.contains("light") && backgroundColor == nil {
                userImg.backgroundColor = UIColor.gray
            }
        }
    }
    
    @IBAction func chooseAvatarButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func backgroundColorButtonPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColorName = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.backgroundColor
        }
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let name = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let password = passwordTxt.text , passwordTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColorName, completion: { (success) in
                            if success {
                                self.activityIndicator.isHidden = true
                                self.activityIndicator.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
}
