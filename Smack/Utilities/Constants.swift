//
//  Constants.swift
//  Smack
//
//  Created by Connie Liu on 7/10/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://chattedup.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"

// colors
let smackPurplePlaceholder = #colorLiteral(red: 0.262745098, green: 0.3411764706, blue: 0.7137254902, alpha: 0.5)

// notifications
let NOTIF_USER_DATA_CHANGED = Notification.Name("notifUserDataChanged")

// segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND_TO_CHANNEL = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type":  "application/json; charset=utf-8"
]

