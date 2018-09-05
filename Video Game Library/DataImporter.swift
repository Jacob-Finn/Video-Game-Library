//
//  DataImporter.swift
//  Video Game Library
//
//  Created by Jacob Finn on 9/4/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation

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
            print("error")
        }
    }
    func implementSave() { // Not yet functional but it is at a point to where it could be installed.
        savedGamesArray.remove(at: (savedGamesArray.count - 1))
        for (index, element) in savedGamesArray.enumerated() {
       // print("\(index) \(element)")
        
            
        }
    }
    
    
    
}
