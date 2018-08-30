//
//  main.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation

let menu = Menu()
//menu.start()

let game = Game(name: "Return of the debug")
let game2 = Game(name: "Nacho revenge")
game.checkOut()
game2.checkOut()
Library.printOutGames()

