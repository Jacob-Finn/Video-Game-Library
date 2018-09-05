//
//  Menu.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Menu {
    let dataImporter = DataImporter()
    
    
     func start() {
        dataImporter.readInformation()
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
        while 1 == 1 {
            checkInput()
        }
        
        
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
            checkInGame()
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
          break
        }
    } // End of CheckInput
    
    func checkInGame() {
        var userChoice: Int
        repeat {
            print("Please enter the number of the game you would like to return.")
            userChoice = InputManager.playerInput(numberOfChoices: Library.getCheckedOutGamesCount())
            if userChoice > Library.getCheckedOutGamesCount() {
                print("Not a valid selection.")
                return
            }
        }  while userChoice > Library.getCheckedOutGamesCount() || userChoice <= 0
        let selectedGame = Library.getGameFromOutGames(at: userChoice - 1)
        Library.returnGame(game: selectedGame)
        Library.removeFromOutGames(at: userChoice)
    } // end of checkInGame
    
    func checkOutGame() {
        var userChoice: Int
        repeat {
            print("Please enter the number of the game you would like to check out.")
            userChoice = InputManager.playerInput(numberOfChoices: Library.currentGameLibrary.count)
            if userChoice > Library.currentGameLibrary.count {
                print("Not a valid selection.")
                continue
            }
        }  while userChoice > Library.currentGameLibrary.count || userChoice <= 0
        
        let selectedGame = Library.currentGameLibrary[userChoice - 1]
        selectedGame.checkOut()
        Library.removeFromCurrentLibrary(at: userChoice - 1)
        
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
        }  while userChoice > Library.currentGameLibrary.count || userChoice <= 0
        Library.removeFromCurrentLibrary(at: userChoice - 1)
    } // end of Remove game
    
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
        print("Goodbye!")
        dataImporter.resetSave()
      //  DataImporter.saveInformation() Will be used for saving later. Right now doesn't work
        exit(25)
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
