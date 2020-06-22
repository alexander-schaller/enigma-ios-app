//
//  EnigmaViewController.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 25/05/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class EngimaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController()
    }
    
    private func addChildViewController() {
        if #available(iOS 13, *) {
            let EnigmaView = ContentView()
            add(UIHostingController<ContentView>(rootView: EnigmaView),frame: view.frame)
        } else {
            add(ViewController(), frame: view.frame)
        }
    }
}
