//
//  DataImporter.swift
//  Video Game Library
//
//  Created by Jacob Finn on 9/4/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//
import Foundation
/*
Data importer was going to be used as a save function that would create a text file inside of the project folder that would allow for me to save the game library and games that were currently checked out. It was capable of doing this by writing to the file the details of the game and then when the game was restarted before anything was displayed or done, the data importer would read through this file to see if there was any saved data that needed to be imported. Unfortunately, this was never completed, but it is at a state that it could be done fairly easily, and the dataImporter does actively create and save a game file. If you want to test it out just uncomment any lines dealing with it in the menu class.
*/
class DataImporter {
    var savedGamesArray = [String]()
    
    func resetSave() {
        let blankState = ""
        let fileName = "GameList"
        let filePath = "Desktop/Class Work/Assessments/Video Game Library"
        let home = FileManager.default.homeDirectoryForCurrentUser
        let writingPath = home.appendingPathComponent(filePath)
        let writtenFile = writingPath.appendingPathComponent("\(fileName).txt")
        do {
          try  blankState.write(to: writtenFile, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Couldn't reset file.")
        }
    }
    
    static func saveInformation () {
        let fileName = "GameList"
        let filePath = "Desktop/Class Work/Assessments/Video Game Library"
        let home = FileManager.default.homeDirectoryForCurrentUser
        let writingPath = home.appendingPathComponent(filePath)
        let writtenFile = writingPath.appendingPathComponent("\(fileName).txt")
        
        
        let endOfGameSection = "\n,\n"
        let testingArray = Library.getCurrentLibrary()
        do {
            for game in testingArray {
                let fileHandle = try FileHandle(forWritingTo: writtenFile)
                fileHandle.seekToEndOfFile()
                fileHandle.write("\(game.name)\n".data(using: String.Encoding.utf8)!)
                fileHandle.write("\(game.returnDateString)\n".data(using: String.Encoding.utf8)!)
                fileHandle.write("\(game.ageRequired)\n".data(using: String.Encoding.utf8)!)
                if game.checkedInString != nil {
                    fileHandle.write(("\(game.checkedInString!)".data(using: String.Encoding.utf8)!))
                } else {
                    fileHandle.write("\n".data(using: String.Encoding.utf8)!)
                }
                fileHandle.write(endOfGameSection.data(using: String.Encoding.utf8)!)
                fileHandle.closeFile()
            }
        } catch {
            print("Couldn't save information!")
        }
    }
    func readInformation() {
        let fileName = "GameList"
        let filePath = "Desktop/Class Work/Assessments/Video Game Library"
        let home = FileManager.default.homeDirectoryForCurrentUser
        let writingPath = home.appendingPathComponent(filePath)
        let writtenFile = writingPath.appendingPathComponent("\(fileName).txt")
        do
        {
            let allSavedGames : [String] = try String(contentsOf: writtenFile).components(separatedBy: "\n")
            savedGamesArray = allSavedGames
            implementSave()
        
        } catch {
            print("Error reading save. This is probably your first time running this program. If so, disregard this!")
        }
    }
    func implementSave() { // Not yet functional but it is at a point to where it could be installed.
      //  savedGamesArray.remove(at: (savedGamesArray.count - 1))
       // for (index, element) in savedGamesArray.enumerated() {
       // print("\(index) \(element)")
      //  }
    }
    
    
    
}
