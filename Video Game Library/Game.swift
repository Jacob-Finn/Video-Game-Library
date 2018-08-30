//
//  Game.swift
//  Video Game Library
//
//  Created by Jacob Finn on 8/30/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Game {
    let name: String
    var returnDate: Date?
    var checkedInDate: Date?
    let dateFormatter: DateFormatter
    var returnDateString: String
    
    init(name: String ) {
        self.name = name
        self.returnDate = nil
        self.checkedInDate = nil
        self.dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        self.returnDateString = ""
    }
    func checkOut() {
        returnDate = Date()
        guard var checkedOutDate = returnDate else { return }
        let twoWeeksLater = Double(60 * 60 * 24 * 7 * 2)
        checkedOutDate.addTimeInterval(twoWeeksLater)
//        print("Your book is due back \(dateFormatter.string(from: checkedOutDate)) ") debug print.
        returnDateString = dateFormatter.string(from: checkedOutDate)
        returnDate = checkedOutDate
        Library.checkOutGame(game: self)
    }
    func getDueDate() -> String {
        return dateFormatter.string(from: returnDate!)
    }
    
}
