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

let menu = Menu()
let user = User(age: 0) //default user is created with an age of 0, the user will be prompted before starting the program to set an age
user.setUpUserAccount()
let game = Game(name: "Return of the debug", rating: "T")
let game2 = Game(name: "Nacho revenge", rating: "E")
let game3 = Game(name: "The debug strikes back", rating: "M")
let game4 = Game(name: "DoomHammer", rating: "T")
let game5 = Game(name: "Triple A trash", rating: "M")
// creating some basic games and then adding them to the Library, this could be done inside of
// the array creation method inside of the Library class, but this was easier to see at the time and create so I have left it in.
Library.addToGameLibrary(game: game)
Library.addToGameLibrary(game: game2)
Library.addToGameLibrary(game: game3)
Library.addToGameLibrary(game: game4)
Library.addToGameLibrary(game: game5)
menu.start()
