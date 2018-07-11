//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Connie Liu on 7/10/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
}
