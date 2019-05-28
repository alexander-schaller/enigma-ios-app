//
//  Enigma.swift
//  EnigmaI
//
//  Created by Alex on 22.12.17.
//  Copyright © 2017 Alexander John Schaller. All rights reserved.
//

import Foundation

// MARK: Adons

extension String {
    
    //
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    
    // Indexing
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
}



extension Collection {
    public func chunk(n: Int) -> [SubSequence] {
        var res: [SubSequence] = []
        var i = startIndex
        var j: Index
        while i != endIndex {
            j = index(i, offsetBy: n, limitedBy: endIndex) ?? endIndex
            res.append(self[i..<j])
            i = j
        }
        return res
    }
}

func AddTrailingSpace(of str: String) -> String {
    return str.chunk(n: 2)
        .map{ String($0) }.joined(separator: " ")
}

func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}

func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
}

// MARK: Main Function

func Enigma(_ Input:String, _ Plugboard:String, _ SL:[String]?, _ SP:[Character]?, _ RP:[Int]?) -> String {
    let ScramblerNum : [String:Int] = ["I":0,"II":1,"III":2,"IV":3,"V":4]
    
    var SL1 : Int?
    var SL2 : Int?
    var SL3 : Int?
    
    var SP1 : Int?
    var SP2 : Int?
    var SP3 : Int?
    
    SL1 = ScramblerNum[SL![0]]
    SL2 = ScramblerNum[SL![1]]
    SL3 = ScramblerNum[SL![2]]
        
    SP1 = ASCII[SP![0]]
    SP2 = ASCII[SP![1]]
    SP3 = ASCII[SP![2]]
    
    let S1 = Scrambler(Scramblers[SL1!], TON[SL1!], SP1!, RP![0])
    let S2 = Scrambler(Scramblers[SL2!], TON[SL2!], SP2!, RP![1])
    let S3 = Scrambler(Scramblers[SL3!], TON[SL3!], SP3!, RP![2])
    
    var pb:String = Plugboard
    pb = pb.replacingOccurrences(of: " ", with: "")
    var PB : [Character:Character] = [:]
    var BP : [Character:Character] = [:]
    
    var counter = 0
    var sto:Character = "A"
    for i in pb {
        if counter % 2 != 0 {
            PB[sto] = i
        }
        else {
            sto = i
        }
        counter += 1
    }
    
    for (Key, Value) in PB {
        BP[Value] = Key
    }
    
    PB += BP
    
    var x : Bool? = false ; var y : Bool? = false ; var z : Bool? = false
        
    if S3.State == ASCII[S3.TurnOverNotch] {
        x = true
    }
    if S2.State == ASCII[S2.TurnOverNotch] {
        y = true
    }
    
    var output:String = ""
    
    for l in Input {
        
        let pbd = plugboard(l, PB)
        
        S3.state_up()
        
        if x! {
            S2.state_up()
            x = false
            z = true
        }
        if y! && z! {
            S1.state_up()
            S2.state_up()
            y = false
            z = false
        }
        
        let letter_new1 = S3.forward(pbd)
        let letter_new2 = S2.forward(letter_new1)
        let letter_new3 : Character? = S1.forward(letter_new2)
        
        if S3.State == ASCII[S3.TurnOverNotch] {
            x = true
        }
        if S2.State == ASCII[S2.TurnOverNotch] {
            y = true
        }
        
        let rf : Character? = Scramblers[5][letter_new3!]
        let letter_back1 = S1.backward(rf!)
        let letter_back2 = S2.backward(letter_back1)
        let letter_back3 : Character? = S3.backward(letter_back2)
        
        let pbd2:Character? = plugboard(letter_back3!, PB)
        
        output.append(pbd2!)
        
    }
    return output
}

func plugboard(_ l : Character, _ PB : [Character:Character]) -> Character {
    
    var pbo : Character! = l
    if PB[l] != nil {
        pbo = PB[l]
    }
    
    return pbo
}
