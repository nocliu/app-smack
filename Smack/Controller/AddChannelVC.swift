//
//  AddChannelVC.swift
//  Smack
//
//  Created by Connie Liu on 8/5/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
        descriptionTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.384916704, green: 0.6769536554, blue: 0.869761807, alpha: 1)])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelButtonPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else { return }
        guard let channelDescription = descriptionTxt.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
