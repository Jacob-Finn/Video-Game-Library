//
//  main.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation

let menu = Menu()
let user = User(age: 0) //default user is created with an age of 0, the user will be prompted before starting the program to set an age
user.setUpUserAccount()
let game = Game(name: "Return of the debug", rating: "T")
let game2 = Game(name: "Nacho revenge", rating: "E")
let game3 = Game(name: "The debug strikes back", rating: "M")
let game4 = Game(name: "DoomHammer", rating: "T")
let game5 = Game(name: "Triple A trash", rating: "M")
Library.addToCurrentLibrary(game: game)
Library.addToCurrentLibrary(game: game2)
Library.addToCurrentLibrary(game: game3)
Library.addToCurrentLibrary(game: game4)
Library.addToCurrentLibrary(game: game5)
menu.start()
