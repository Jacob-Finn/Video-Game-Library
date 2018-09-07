//
//  User.swift
//  Video Game Library
//
//  Created by Jacob Finn on 9/6/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
/*
 The user class was made in order to solve the two challenges that we were presented in class, the User class saves two variables. Age, and isAdmin. At any time the user types "SuperSecretPassword" the user.isAdmin gets set to true and allows for the user to add games in. Which usually a normal user wouldn't be allowed to do, and the age int is used in order to check if the user is old enough to check out a game.
 */

import Foundation
class User {
    var age: Int
    var isAdmin: Bool
    
    init(age: Int) {
        self.age = age
        self.isAdmin = false;
    }
    
    func setUpUserAccount() {
        var ageSet = false
        print("Please enter your age to determine what games you can buy!")
        repeat {
            let userInput = readLine()
            guard let userAge = Int(userInput!) else {
                print("Please enter a number!")
                continue
            }
            if userAge <= 0 {
                print("Invalid number! Please insert a valid number")
                continue
            } else {
                self.age = userAge
                print("Age set to \(self.age)")
                sleep(2)
                print("\n\n\n\n\n")// Informing user age set and then we clean up the console a little bit.
                ageSet = true
            }
        } while !ageSet
    }
    
}
