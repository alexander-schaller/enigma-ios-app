//
//  Scramblers.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 06/01/18.
//  Copyright © 2018 Alexander John Schaller. All rights reserved.
//

import Foundation


class Scrambler {
    
    let scramblerNumber: Int
    let turnOverNotch : Character!
    var state : Int
    let ringPosition : Int
    let wiring : [Character:Character]
    
    init(_ scramblerNumber : Int, _ state : Int, _ ringPosition : Int) {
        self.scramblerNumber = scramblerNumber
        self.turnOverNotch = TON[scramblerNumber]
        self.state = state
        self.ringPosition = ringPosition - 1
        self.wiring = ScramblerWiring[scramblerNumber]
    }
    
    func updateState() {
        self.state += 1
        self.state %= 26
    }
    
    func turnClockwise(_ character : Character!) -> Character!{
        let characterAscii : Int! = character.formattedAsciiValue()
        
        var tempInt : Int!
        var tempChr : Character!
        tempChr = mod((characterAscii + self.state - self.ringPosition), 26).formattedCharacterFromAscii()
        tempChr = self.wiring[tempChr]
        let ASCIIchr : Int! = tempChr!.formattedAsciiValue()
        tempInt = mod((ASCIIchr - self.state + self.ringPosition), 26)
        
        return tempInt.formattedCharacterFromAscii()
    }
    
    func turnAntiClockwise(_ character : Character!) -> Character!{
        let characterAscii : Int! =  character.formattedAsciiValue()
        var og : [Character:Character] = [:]
        
        for (Key, Value) in self.wiring {
            og[Value] = Key
        }
        
        var tempInt : Int!
        var tempChr : Character!
        tempChr = mod((characterAscii + self.state - self.ringPosition), 26).formattedCharacterFromAscii()
        tempChr = og[tempChr]
        let ASCIIchr : Int! = tempChr!.formattedAsciiValue()
        tempInt = mod((ASCIIchr - self.state + self.ringPosition), 26)
        
        return tempInt.formattedCharacterFromAscii()
    }
}
