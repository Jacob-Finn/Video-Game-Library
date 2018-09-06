//
//  InputManager.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
/*
 InputManager is very useful for whenever I have to ask the user for input involving an Int, it is also useful for just general commands. It allows me to ask the user to make a selection as well as be able to type in certain commands at any time. Such as, it allows the user to type help to see menu.help() at anytime. Or the user can enable the admin mode just by typing "SuperSecretPassword".
 */

import Foundation
private var userInput: String?
private var selectionMade = false
class InputManager  {
    
    static func playerInput (numberOfChoices: Int) -> Int {
        repeat {
            userInput = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            if userInput?.lowercased() == "quit" {
               menu.quit()
               break
            }
            if userInput == "SuperSecretPassword" { // Notice the capitals! This is a super secret password after all.
                user.isAdmin = true
                print("System admin enabled!")
                break
            }
            if userInput?.lowercased() == "help" {
                menu.help()
            } else if let userInput = Int(userInput!) {
                if (userInput <= 0) {
                    print("Did you really think that would work?") // Entering a negative number gives you a specific response. Kind of sarcastic.
                    continue
                }
                if (userInput > numberOfChoices) {
                    print("Not a valid option! There are only \(numberOfChoices) choices!")
                    continue
                }
                selectionMade = true
                return userInput
            }else {
                print("Not a valid selection!")
            }
        } while !selectionMade
        return -3 // Error return
    }
}
