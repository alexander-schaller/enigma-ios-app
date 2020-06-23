//
//  Enigma.swift
//  EnigmaI
//
//  Created by Alex on 22.12.17.
//  Copyright © 2017 Alexander John Schaller. All rights reserved.
//

import Foundation

// Adds a trailing space after 2 characters
func addTrailingSpace(of str: String) -> String {
    return str.chunk(n: 2)
        .map{ String($0) }.joined(separator: " ")
}

// Lets you use the += operation for dictionaries
func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}

// Modulo operation function for "true" modulo operation
func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
}

// MARK: Main Enigma Function
func Enigma(_ input:String, _ plugboard:String, _ scramblerNumber:[String], _ scramblerState:[Character]?, _ ringPosition:[Int]?) -> String {
    
    // Initalizing all the variables for the function
    let scramblerNumberInLocation: [Int] = [scramblerNumber[0].roman, scramblerNumber[1].roman, scramblerNumber[2].roman]
    
    let scramblerStateInLocation: [Int] = [scramblerState![0].formattedAsciiValue(), scramblerState![1].formattedAsciiValue(), scramblerState![2].formattedAsciiValue()]
    
    let Scramblers: [Scrambler] = [Scrambler(scramblerNumberInLocation[0], scramblerStateInLocation[0], ringPosition![0]), Scrambler(scramblerNumberInLocation[1], scramblerStateInLocation[1], ringPosition![1]), Scrambler(scramblerNumberInLocation[2], scramblerStateInLocation[2], ringPosition![2])]
    
    let plugboard = plugboard.replacingOccurrences(of: " ", with: "")
    var plugboardDictionary : [Character:Character] = [:]
    var reversedPlugboardDictionary : [Character:Character] = [:]
    
    // Takes all the pairs in the plugboards and turns them into a dictionary
    var counter = 0
    var plugboardValue:Character = "A"
    for i in plugboard {
        if counter % 2 != 0 {
            plugboardDictionary[plugboardValue] = i
        }
        else {
            plugboardValue = i
        }
        counter += 1
    }
    
    // Creating a reversed version of the plugboard dictionary in so that each letter can also be found backwards
    for (Key, Value) in plugboardDictionary {
        reversedPlugboardDictionary[Value] = Key
    }
    
    // Joining the two dictionaries together
    plugboardDictionary += reversedPlugboardDictionary
    
    var turnOverNotchStatus: [Bool?] = [false, false, false]
        
    if Scramblers[2].state == Scramblers[2].turnOverNotch.formattedAsciiValue() {
        turnOverNotchStatus[0] = true
    }
    if Scramblers[1].state == Scramblers[1].turnOverNotch.formattedAsciiValue() {
        turnOverNotchStatus[1] = true
    }
    
    var output:String = ""
    
    for l in input {
        
        if l == " " {
            output.append(" ")
            continue
        }
        
        let pbd = plugboardLinking(l, plugboardDictionary)
        
        Scramblers[2].updateState()
        
        if turnOverNotchStatus[0]! {
            Scramblers[1].updateState()
            turnOverNotchStatus[0] = false
            turnOverNotchStatus[2] = true
        }
        if turnOverNotchStatus[1]! && turnOverNotchStatus[2]! {
            Scramblers[0].updateState()
            Scramblers[1].updateState()
            turnOverNotchStatus[1] = false
            turnOverNotchStatus[2] = false
        }
        
        let letter_new1 = Scramblers[2].turnClockwise(pbd)
        let letter_new2 = Scramblers[1].turnClockwise(letter_new1)
        let letter_new3 = Scramblers[0].turnClockwise(letter_new2)
        
        if Scramblers[2].state == Scramblers[2].turnOverNotch.formattedAsciiValue() {
            turnOverNotchStatus[0] = true
        }
        if Scramblers[1].state == Scramblers[1].turnOverNotch.formattedAsciiValue() {
            turnOverNotchStatus[1] = true
        }
        
        let rf : Character? = ScramblerWiring[5][letter_new3!]
        let letter_back1 = Scramblers[0].turnAntiClockwise(rf!)
        let letter_back2 = Scramblers[1].turnAntiClockwise(letter_back1)
        let letter_back3 = Scramblers[2].turnAntiClockwise(letter_back2)
        
        let pbd2:Character? = plugboardLinking(letter_back3!, plugboardDictionary)
        
        output.append(pbd2!)
        
    }
    return output
}

func plugboardLinking(_ l : Character, _ PB : [Character:Character]) -> Character {
    
    var pbo : Character! = l
    if PB[l] != nil {
        pbo = PB[l]
    }
    
    return pbo
}
