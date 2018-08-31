//
//  main.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation

let menu = Menu()
let game = Game(name: "Return of the debug")
let game2 = Game(name: "Nacho revenge")
let game3 = Game(name: "The debug strikes back")
let game4 = Game(name: "DoomHammer")
let game5 = Game(name: "Triple A trash")
Library.addToCurrentLibrary(game: game)
Library.addToCurrentLibrary(game: game2)
Library.addToCurrentLibrary(game: game3)
Library.addToCurrentLibrary(game: game4)
Library.addToCurrentLibrary(game: game5)
menu.start()
