//
//  Game.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
// A normal object class.

import Foundation
class Game {
    // variables
    let name: String
    var checkedInDate: Date?
    var checkedInString: String?
    let dateFormatter: DateFormatter
    var returnDate: Date?
    var returnDateString: String
    var hasBeenReturned: Bool
    let rating: String
    let ageRequired: Int
    
    init(name: String, rating: String ) {
        self.name = name
        self.rating = rating
        self.returnDate = nil
        self.checkedInDate = nil
        self.checkedInString = nil
        self.dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        self.returnDateString = ""
        self.hasBeenReturned = false
        switch rating {
        case "T":
            self.ageRequired = 13
        case "M":
            self.ageRequired = 18
        case "E":
            self.ageRequired = 0
        default:
            self.ageRequired = -1
            print("Error setting rating.")
        }
    }
    func checkOut() -> Bool { // this returns a bool if the game was checked out or not.
        if (user.age >= self.ageRequired) {
            returnDate = Date()
            guard var checkedOutDate = returnDate else { return false }
            let twoWeeksLater = Double(60 * 60 * 24 * 7 * 2)
            checkedOutDate.addTimeInterval(twoWeeksLater)
            print("Your game is due back \(dateFormatter.string(from: checkedOutDate)) ")
            returnDateString = dateFormatter.string(from: checkedOutDate)
            returnDate = checkedOutDate
            Library.checkOutGame(game: self)
            return true
        }else {
            print("You're not old enough for this game!")
            return false
        }
    }
    
}
