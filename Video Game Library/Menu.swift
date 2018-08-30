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
        while !hasQuit {
            checkInput()
        } // The only way we can get to this statement is if the user has decided to quit. Effectively ending the program
        print("Goodbye!")
        
    } // End of start
    
    func checkInput () {
        let userChoice = InputManager.playerInput(numberOfChoices: 8)
        
        switch userChoice {
        case 1:
            addGame()
            return
        case 2:
            removeGame()
            return
        case 3:
            Library.printCurrentLibrary()
            return
        case 4:
            checkOutGame()
            return
        case 5:
            // check in game
            return
        case 6:
            Library.printOutGames()
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
    } // End of CheckInput
    
    func checkOutGame() {
        var userChoice: Int
        repeat {
        print("Please enter the number of the game you would like to check out.")
        userChoice = InputManager.playerInput(numberOfChoices: Library.currentGameLibrary.count)
        if userChoice > Library.currentGameLibrary.count {
            print("Not a valid selection.")
            return
        }
        }  while userChoice > Library.currentGameLibrary.count
        
        let selectedGame = Library.currentGameLibrary[userChoice - 1]
        selectedGame.checkOut()
        
    } // end of CheckOutGame
    
    func removeGame() {
     var userChoice: Int
        repeat {
            print("Please enter the number of the game you would like to remove.")
            userChoice = InputManager.playerInput(numberOfChoices: Library.currentGameLibrary.count)
            if userChoice > Library.currentGameLibrary.count {
                print("Not a valid selection.")
                return
            }
        }  while userChoice > Library.currentGameLibrary.count
        Library.removeFromCurrentLibrary(at: userChoice)
    }
    
    
    
    
    func addGame() {
        let gameName: String? = nil
        print("What is the game's name?")
        repeat {
            let userInput = readLine()
            if userInput == "" {
                print("Invalid Input!")
                return
            } else {
                guard let gameName = String?(userInput!) else { return }
                Library.addToCurrentLibrary(game: gameName)
            }
        } while gameName != nil
        print("Game added!")
    } // end of AddGame
    
    
    
    
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
