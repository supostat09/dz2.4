//
//  AuthManager.swift
//  dz2.4
//
//  Created by Абдулла-Бек on 15/4/23.
//

import Foundation

struct User {
    let username: String
    let password: String
}

class AuthManager {
    static let shared = AuthManager()
    
    private let users: [User] = [
        User(username: "User1", password: "123321"),
        User(username: "User2", password: "321123")
    ]
    
    func login(username: String, password: String) -> Bool {
        for user in users {
            if user.username == username && user.password == password {
                return true
            }
        }
        return false
    }
}
