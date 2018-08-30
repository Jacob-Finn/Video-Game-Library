//
//  Library.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Library {
   static var checkedOutGames = [Game]()
   static var returnGamesByDate = [String: String]()
   static var currentGameLibrary = [Game]()
    
    
    // Using method overrides to allow me to manually add a game as well as add a game by string input
    static func addToCurrentLibrary (game: String)
    {
        currentGameLibrary.append(Game(name: game))
    }
    
    static func addToCurrentLibrary (game: Game)
    {
        currentGameLibrary.append(game)
    }
    static func printCurrentLibrary() {
        for (Index, game) in currentGameLibrary.enumerated() {
            print("\(Index + 1) \(game.name)")
        }
    }
    
    
    
    
    
    
    static func removeFromCurrentLibrary(at index: Int) {
        print("Removing \(currentGameLibrary[index - 1].name)")
        currentGameLibrary.remove(at: index - 1)
    }
    
    static func checkOutGame(game: Game) {
        checkedOutGames.append(game)
        returnGamesByDate[game.name] = game.returnDateString
    }
    static func printOutGames()
    {
        print("The games you currently have out:")
        for (Index, game) in checkedOutGames.enumerated() {
            print("\(Index + 1). \(game.name) needs to be returned by \(returnGamesByDate[game.name]!)")
        }
    }
    
}
