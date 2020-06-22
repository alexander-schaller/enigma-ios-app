//
//  Extensions.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/06/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import Foundation
import UIKit

// MARK: Adons

extension String {
    
    // Returns the ith character of a string
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    
    // Indexing
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    var roman: Int {
        switch self {
        case "I":
            return 0
        case "II":
            return 1
        case "III":
            return 2
        case "IV":
            return 3
        case "V":
            return 4
        default:
            return 0
        }
    }

}

extension Character {
    
    // Returns the formatted ascii value of a character as an integer
    public func formattedAsciiValue () -> Int {
        let asciiValue = Int(self.asciiValue!) - 65
        return asciiValue
    }
}

extension Int {
    // Returns the formatted character from an integer through ascii
    public func formattedCharacterFromAscii () -> Character {
        let unicodeScalar = UnicodeScalar(self + 65)
        let character = Character(unicodeScalar!)
        return character
    }
    
    var toRoman: String {
        switch self {
        case 1:
            return "I"
        case 2:
            return "II"
        case 3:
            return "III"
        case 4:
            return "IV"
        case 5:
            return "V"
        default:
            return "undef."
        }
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



extension ViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return textField != self.OutputTextView
    }
    
}
// Extenstion for the StackView to get a property that adds a background and curves the corner
extension UIStackView {
    public func addBackground(color: UIColor, cornerRadius: CGFloat) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.layer.cornerRadius = cornerRadius
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

extension UITextField {
    
    // Makes a rounded text field with a specific corner radius and background color
    public func addRoundedCornersAndBackground(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UIButton {
    // Adds rounded corners and a background color to a button
    public func formatToSpec(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
}

extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect) {
        addChild(child)
        child.view.frame = frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
