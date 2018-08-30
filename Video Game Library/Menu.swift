//
//  Menu.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Menu {
    var hasQuit = false
    
    func start() {
        while !hasQuit {
            print("""
        Welcome to the video game library!
        Menu commands:
        1. Add Game
        2. Remove Game
        3. List Available Games
        4. Check Out Game
        5. Check In Game
        6. List Checked Out Games
        7. help
        8. Quit
        """)
            checkInput()
        } // The only way we can get to this statement is if the user has decided to quit. Effectively ending the program
        print("Goodbye!")
        
    } // End of start
    
    func checkInput () {
        let userChoice = InputManager.playerInput(numberOfChoices: 8)
        
        switch userChoice {
        case 1:
            // Add game
            return
        case 2:
            // Remove game
            return
        case 3:
            // list games
            return
        case 4:
            // check out game
            return
        case 5:
            // check in game
            return
        case 6:
            // list checked out
            return
        case 7:
            help()
            return
        case 8:
            quit()
            return
        default:
            print("Error")
        }
    }
    
    
    
    
    
    
    
    
    func quit() {
    hasQuit = true
    } // end of quit
    func help() {
        print("""
        Menu commands:
        1. Add Game
        2. Remove Game
        3. List Available Games
        4. Check Out Game
        5. Check In Game
        6. List Checked Out Games
        7. help
        8. Quit
        """)
    }// end of help
    
    
    
    
    
    
    

}
