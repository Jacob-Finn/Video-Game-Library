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
            else {
                print("Not a valid selection!")
            }
        } while !selectionMade || !Menu().hasQuit
        return -3
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    static func getInput<T>() -> T {
//        var input: T? = nil
//
//        repeat {
//
//            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            if line != "" {
//
//                if line is Int {
//                    guard let number = Int(line) else {
//                        print("Can't convert")
//                        continue
//
//                    } // do somethin here
//                    input = number as? T
//                }
//
//                if input is String {
//                    input = line as? T
//                }
//
//
//
//            } else {
//                // give error
//                print("Not valid")
//            }
//
//        } while input == nil
//
//        return input!
//    }
//
}
//
