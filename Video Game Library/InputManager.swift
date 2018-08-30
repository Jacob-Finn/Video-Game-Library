//
//  InputManager.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
private var userInput: String?
private var selectionMade = false
class InputManager  {
    
    static func playerInput (numberOfChoices: Int) -> Int {
        repeat {
            userInput = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            if userInput == "" {
                print("Not a valid selection")
            }
            if let userInput = Int(userInput!) {
                if (userInput <= 0) {
                    print("Did you really think that would work?")
                    continue
                }
                if (userInput > numberOfChoices) {
                    print("Not a valid option! There are only \(numberOfChoices) choices!")
                    continue
                }
                selectionMade = true
                return userInput
            }
        } while !selectionMade
        return -3
    }
}

