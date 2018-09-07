//
//  main.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//
// TODO: - Add a game rating system. -- DONE
// TODO: - Add an admin system -- DONE

import Foundation
let dataImporter = DataImporter()
let menu = Menu()
dataImporter.readInformation()
let user = User(age: 0) //default user is created with an age of 0, the user will be prompted before starting the program to set an age
user.setUpUserAccount()

if Library.getCurrentLibraryCount() == 0
{
let game = Game(name: "Return of the debug", rating: "T")
let game2 = Game(name: "Nacho revenge", rating: "E")
let game3 = Game(name: "The debug strikes back", rating: "M")
let game4 = Game(name: "DoomHammer", rating: "T")
let game5 = Game(name: "Triple A trash", rating: "M")
Library.addToGameLibrary(game: game)
Library.addToGameLibrary(game: game2)
Library.addToGameLibrary(game: game3)
Library.addToGameLibrary(game: game4)
Library.addToGameLibrary(game: game5)
}else {
    menu.start()
}
menu.start()
