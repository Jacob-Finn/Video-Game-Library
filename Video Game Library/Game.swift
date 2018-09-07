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
    var returnDate: Date?
    var returnDateString: String // Due to not making return date string an optional, I have to set it to blank when I create it if nothing is there.
    let rating: String
    let ageRequired: Int
    
    init(name: String, rating: String ) { // this is our normal init.
        self.name = name
        self.rating = rating
        self.returnDate = nil
        self.checkedInDate = nil
        self.checkedInString = nil
        self.returnDateString = ""
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
    // this is our init we use when we're loading from a save file. There is more information here as we need more information to load from
    init(name: String, savedGameReturnString: String?, ageRequired: Int, gameCheckedInString: String?) {
        self.name = name
        self.ageRequired = ageRequired
        switch ageRequired {
        case 13:
            self.rating = "T"
        case 18:
            self.rating = "M"
        default:
            self.rating = "E"
        }
        if savedGameReturnString != nil {
            self.returnDateString = savedGameReturnString!
            self.returnDate = getDate(date: savedGameReturnString!)
            
        }else {
            self.returnDateString = ""
        }
        if gameCheckedInString != nil {
            self.checkedInString = gameCheckedInString
            self.checkedInDate = getDate(date: gameCheckedInString!)
        }else {
            self.checkedInString = nil
        }
    }
    
    func getDate (date: String?) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        guard let date = date else { return nil }
       let returnDate = dateFormatter.date(from: date)
        return returnDate
    }
    
    
    
    
    func checkOut() -> Bool { // this returns a bool if the game was checked out or not.
        let dateFormatter = DateFormatter()
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
