//
//  Library.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Library {
    
    private static var checkedOutGames = [Game]()
    private  static var returnGamesByDate = [String: String]()
    static var gameLibrary = [Game]()
    
    
    // Setters and getters
    
    static func getCurrentLibraryCount() -> Int {
        return gameLibrary.count // returns the current size of the game library array
    }
    static func getCheckedOutGamesCount() -> Int {
        return checkedOutGames.count // returns the current size of the checked out games array
    }
    static func getGameFromCurrentLibrary(at index: Int) -> Game {
        return gameLibrary[index] // returns a game at a specific index from the currentGameLibrary Array
    }
    static func getGameFromOutGames(at index: Int) -> Game {
        return checkedOutGames[index] // returns a game at a specficic index from the checkedOutGames Array
    }
    static func getCurrentLibrary() -> [Game] {
        return gameLibrary // returns the current game library array. Since it is a private varaible.
    }
    static func getCheckedOutGames() -> [Game] {
        return checkedOutGames // returns the checked out games array since it is a private variable. We need to use this to access it.
    }
    
    
    
    
    // Using method overrides to allow me to manually add a game. As well as allowing me to add a game by string input
    static func addToGameLibrary (game: String, rating: String) {
        gameLibrary.append(Game(name: game, rating: rating)) // adds a game to the game library using a condition of game and rating.
    }
    
    static func addToGameLibrary (game: Game) {
        gameLibrary.append(game) // adds a game to the game library using a created game.
    }
    
    
    static func sortGameLibrary() {
        gameLibrary.sort(by: { $0.name < $1.name}) // Whenever we are going to display the game liberary we call this function to sort it and make it look better
    }
    
    /*
     Whenever we are going to return a game we will append the game back to the end of the game library array and then we'll set the 
     checkedInDate equal to the current date and format it using a date formatter.
     For convinence I set this date to a string as it is easier to display and write to a file. that would've worked with the DataImporter class
     Unfortunately, I never finished the DataImporter class. The game still functions like normal but doesn't have a save feature.
    */
    static func returnGame(game: Game) {
        gameLibrary.append(game)
        game.checkedInDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let checkedInString = dateFormatter.string(from: game.checkedInDate!)
        game.checkedInString = checkedInString
        print("\(game.name) returned.")
    }
    
    
    static func removeFromOutGames (at index: Int) {
        checkedOutGames.remove(at: index - 1)
    }
    
    
    static func removeFromGameLibrary(at index: Int) {
        print("Removing \(gameLibrary[index].name)")
        gameLibrary.remove(at: index)
    }
    
    static func checkOutGame(game: Game) {
        checkedOutGames.append(game)
        returnGamesByDate[game.name] = game.returnDateString
    }
    
    static func printOutGames() {
        print("The games you currently have out:")
        for (Index, game) in checkedOutGames.enumerated() {
            print("\(Index + 1). \(game.name) with a rating of \(game.rating) needs to be returned by \(returnGamesByDate[game.name]!)")
        }
    }
    
    static func printGameLibrary() {
        sortGameLibrary()
        for (Index, game) in gameLibrary.enumerated() {
            if game.checkedInString != nil { // If the game has been checked in before then we will print it with the date
                print("\(Index + 1). \(game.name)\nRating: \(game.rating)\nReturned: \(game.checkedInString!)")
            }else { // if the game hasn't been checked in before then we will print it like normal.
                print("\(Index + 1). \(game.name)\nRating: \(game.rating)")
            }
        }
    }
}
