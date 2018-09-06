//
//  Menu.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Menu {
    let dataImporter = DataImporter() // Mostly unused
    
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
        if (Library.getCheckedOutGamesCount() != 0) {
            Library.printOutGames()
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
        } else {
            print("You don't have any checked out games currently!")
        }
    } // end of checkInGame
    
    
    func checkOutGame() {
        var userChoice: Int
        if (Library.getCurrentLibraryCount() != 0) {
            repeat {
                print("Please enter the number of the game you would like to check out.")
                userChoice = InputManager.playerInput(numberOfChoices: Library.currentGameLibrary.count)
                if userChoice > Library.currentGameLibrary.count {
                    print("Not a valid selection.")
                    continue
                }
            }  while userChoice > Library.currentGameLibrary.count || userChoice <= 0
            
            let selectedGame = Library.currentGameLibrary[userChoice - 1]
            let checkedOut = selectedGame.checkOut() // This function returns a bool if the game was checked out or not. Used for age verification.
            if (checkedOut) {
            Library.removeFromCurrentLibrary(at: userChoice - 1)
            }else {
                return
            }
        }else {
            print("We're out of games currently!")
        }
    } // end of CheckOutGame
    
    func removeGame() {
        var userChoice: Int
        if Library.getCurrentLibraryCount() != 0 {
        repeat {
            print("Please enter the number of the game you would like to remove.")
            userChoice = InputManager.playerInput(numberOfChoices: Library.currentGameLibrary.count)
            if userChoice > Library.currentGameLibrary.count {
                print("Not a valid selection.")
                return
            }
        }  while userChoice > Library.currentGameLibrary.count || userChoice <= 0
        Library.removeFromCurrentLibrary(at: userChoice)
        } else {
            print("No games to remove!")
        }
    } // end of Remove game
    
    func addGame() {
        if (user.isAdmin) {
        let gameName: String? = nil
        print("What is the game's name?")
        repeat {
            let userInput = readLine()
            if userInput == "" {
                print("Invalid Input!")
                return
            } else {
                guard let gameName = String?(userInput!) else { return }
                print("""
                        What is the game's rating?
                        1. Rating "E" - Every age.
                        2. Rating "T" - Only 13 and up.
                        3. Rating "M" - Only 18 and up.
                     """)
                var gameCreated = false
                repeat {
                let userAgeRating = InputManager.playerInput(numberOfChoices: 3)
                switch userAgeRating {
                case 1:
                Library.addToCurrentLibrary(game: gameName, rating: "E")
                print("Adding \(gameName), with a rating of E")
                    gameCreated = true
                case 2:
                Library.addToCurrentLibrary(game: gameName, rating: "T")
                print("Adding \(gameName), with a rating of T")
                gameCreated = true
                case 3:
                Library.addToCurrentLibrary(game: gameName, rating: "M")
                print("Adding \(gameName), with a rating of M")
                    gameCreated = true
                default:
                    print("You must use a number!")
                    continue
                }
                } while !gameCreated
                
                
            }
        } while gameName != nil
        print("Game added!")
        }else {
            print("You're not a system admin. If you remember the password, you can turn on admin mode at any time.")
            return
        }
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
