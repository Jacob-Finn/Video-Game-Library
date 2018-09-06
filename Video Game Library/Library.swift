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
    static var currentGameLibrary = [Game]()
    
    
    // Setters and getters
    
    static func getCurrentLibraryCount() -> Int {
        return currentGameLibrary.count
    }
    static func getCheckedOutGamesCount() -> Int {
        return checkedOutGames.count
    }
    static func getGameFromCurrentLibrary(at index: Int) -> Game {
        return currentGameLibrary[index]
    }
    static func getGameFromOutGames(at index: Int) -> Game {
        return checkedOutGames[index]
    }
    static func getCurrentLibrary() -> [Game] {
        return currentGameLibrary
    }
    static func getCheckedOutGames() -> [Game] {
        return checkedOutGames
    }
    
    
    
    
    // Using method overrides to allow me to manually add a game as well as add a game by string input
    static func addToCurrentLibrary (game: String, rating: String) {
        currentGameLibrary.append(Game(name: game, rating: rating))
    }
    
    static func addToCurrentLibrary (game: Game) {
        currentGameLibrary.append(game)
    }
    
    static func sortCurrentLibrary() {
        currentGameLibrary.sort(by: { $0.name < $1.name})
    }
    
    static func returnGame(game: Game) {
        currentGameLibrary.append(game)
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
    
    
    static func removeFromCurrentLibrary(at index: Int) {
        print("Removing \(currentGameLibrary[index - 1].name)")
        currentGameLibrary.remove(at: index - 1)
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
    
    static func printCurrentLibrary() {
        sortCurrentLibrary()
        for (Index, game) in currentGameLibrary.enumerated() {
            if game.checkedInString != nil {
                print("\(Index + 1). \(game.name)| Rating: \(game.rating)\n   Returned: \(game.checkedInString!)")
            }else {
                print("\(Index + 1). \(game.name)| Rating: \(game.rating)")
            }
        }
    }
}
