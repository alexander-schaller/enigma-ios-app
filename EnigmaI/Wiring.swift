//
//  Wiring.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 06/01/18.
//  Copyright © 2018 Alexander John Schaller. All rights reserved.
//

import Foundation

let TON : [Character] = ["Q","E","V","J","Z"]

let ABC : [Int:Character] = [0:"A", 1:"B", 2:"C", 3:"D", 4:"E", 5:"F", 6:"G", 7:"H", 8:"I", 9:"J", 10:"K", 11:"L", 12:"M", 13:"N", 14:"O", 15:"P", 16:"Q", 17:"R", 18:"S", 19:"T", 20:"U", 21:"V", 22:"W", 23:"X", 24:"Y", 25:"Z"]

let ASCII : [Character:Int] = ["A":0, "B":1, "C":2, "D":3, "E":4, "F":5, "G":6, "H":7, "I":8, "J":9, "K":10, "L":11, "M":12, "N":13, "O":14, "P":15, "Q":16, "R":17, "S":18, "T":19, "U":20, "V":21, "W":22, "X":23, "Y":24, "Z":25]

let Scramblers : [[Character:Character]] = [["D": "F", "C": "M", "G": "D", "O": "Y", "W": "B", "R": "U", "U": "A", "V": "I", "H": "Q", "T": "P", "J": "Z", "Z": "J", "E": "L", "B": "K", "S": "S", "I": "V", "P": "H", "K": "N", "Y": "C", "F": "G", "M": "O", "L": "T", "N": "W", "Q": "X", "A": "E", "X": "R"], ["D": "K", "C": "D", "G": "R", "O": "M", "W": "F", "R": "G", "U": "P", "V": "Y", "H": "U", "T": "N", "J": "B", "Z": "E", "E": "S", "B": "J", "S": "Z", "I": "X", "P": "C", "K": "L", "Y": "O", "F": "I", "M": "W", "L": "H", "N": "T", "Q": "Q", "A": "A", "X": "V"], ["D": "H", "C": "F", "G": "C", "O": "Y", "W": "U", "R": "W", "U": "K", "V": "M", "H": "P", "T": "A", "J": "T", "Z": "O", "E": "J", "B": "D", "S": "G", "I": "R", "P": "E", "K": "X", "Y": "Q", "F": "L", "M": "Z", "L": "V", "N": "N", "Q": "I", "A": "B", "X": "S"], ["D": "V", "C": "O", "G": "J", "O": "X", "W": "C", "R": "F", "U": "K", "V": "D", "H": "A", "T": "G", "J": "Q", "Z": "B", "E": "P", "B": "S", "S": "T", "I": "Y", "P": "L", "K": "U", "Y": "W", "F": "Z", "M": "R", "L": "I", "N": "H", "Q": "N", "A": "E", "X": "M"], ["D": "R", "C": "B", "G": "T", "O": "L", "W": "F", "R": "W", "U": "Q", "V": "O", "H": "Y", "T": "J", "J": "P", "Z": "K", "E": "G", "B": "Z", "S": "M", "I": "U", "P": "X", "K": "S", "Y": "C", "F": "I", "M": "N", "L": "D", "N": "H", "Q": "A", "A": "V", "X": "E"], ["D": "H", "C": "U", "G": "L", "O": "M", "W": "V", "R": "B", "U": "C", "V": "W", "H": "D", "T": "Z", "J": "X", "Z": "T", "E": "Q", "B": "R", "S": "F", "I": "P", "P": "I", "K": "N", "Y": "A", "F": "S", "M": "O", "L": "G", "N": "K", "Q": "E", "A": "Y", "X": "J"]]
