//
//  UserDataService.swift
//  Smack
//
//  Created by Connie Liu on 7/24/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let defaultColor = UIColor.lightGray
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        guard let unwrappedR = r else { return defaultColor }
        guard let unwrappedG = g else { return defaultColor }
        guard let unwrappedB = b else { return defaultColor }
        guard let unwrappedA = a else { return defaultColor }
        
        let floatR = CGFloat(unwrappedR.doubleValue)
        let floatG = CGFloat(unwrappedG.doubleValue)
        let floatB = CGFloat(unwrappedB.doubleValue)
        let floatA = CGFloat(unwrappedA.doubleValue)
        
        return UIColor(red: floatR, green: floatG, blue: floatB, alpha: floatA)
    }
    
}
