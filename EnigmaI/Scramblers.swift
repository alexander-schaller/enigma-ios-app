//
//  Scramblers.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 06/01/18.
//  Copyright © 2018 Alexander John Schaller. All rights reserved.
//

import Foundation


class Scrambler {
    let Wiring : [Character:Character]
    let TurnOverNotch : Character!
    var State : Int
    var RingPosition : Int
    init(_ Wiring : [Character:Character], _ TurnOverNotch : Character, _ State : Int, _ RingPosition : Int) {
        self.Wiring = Wiring
        self.TurnOverNotch = TurnOverNotch
        self.State = State
        self.RingPosition = RingPosition
        self.ring_setting()
    }
    
    func ring_setting() {
        self.RingPosition -= 1
    }
    
    func state_up() {
        self.State += 1
        self.State %= 26
    }
    
    func forward(_ l : Character!) -> Character!{
        let new_l : Int! = ASCII[l]
        
        var TempInt : Int!
        var TempChr : Character!
        TempChr = ABC[mod((new_l + self.State - self.RingPosition), 26)]
        TempChr = self.Wiring[TempChr]
        let ASCIIchr : Int! = ASCII[TempChr]
        TempInt = mod((ASCIIchr - self.State + self.RingPosition), 26)
        
        return ABC[TempInt]
    }
    
    func backward(_ l : Character!) -> Character!{
        let new_l : Int! = ASCII[l]
        var og : [Character:Character] = [:]
        
        for (Key, Value) in self.Wiring {
            og[Value] = Key
        }
        
        var TempInt : Int!
        var TempChr : Character!
        TempChr = ABC[mod((new_l + self.State - self.RingPosition), 26)]
        TempChr = og[TempChr]
        let ASCIIchr : Int! = ASCII[TempChr]
        TempInt = mod((ASCIIchr - self.State + self.RingPosition), 26)
        
        return ABC[TempInt]
    }
}
