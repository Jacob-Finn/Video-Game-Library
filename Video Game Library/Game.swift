//
//  Game.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

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
    
    init(name: String ) {
        self.name = name
        self.returnDate = nil
        self.checkedInDate = nil
        self.checkedInString = nil
        self.dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        self.returnDateString = ""
        self.hasBeenReturned = false
    }
    func checkOut() {
        returnDate = Date()
        guard var checkedOutDate = returnDate else { return }
        let twoWeeksLater = Double(60 * 60 * 24 * 7 * 2)
        checkedOutDate.addTimeInterval(twoWeeksLater)
        print("Your game is due back \(dateFormatter.string(from: checkedOutDate)) ")
        returnDateString = dateFormatter.string(from: checkedOutDate)
        returnDate = checkedOutDate
        Library.checkOutGame(game: self)
    }
    
}
