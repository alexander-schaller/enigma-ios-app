//
//  ContentView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
    var body: some View {
        HStack(spacing: 10.0) {
            ButtonStackViewSwiftUI(title: "Scramblers", labelButton1: "A", labelButton2: "B", labelButton3: "C")
            ButtonStackViewSwiftUI(title: "Set Ring", labelButton1: "A", labelButton2: "B", labelButton3: "C")
        }
        .padding(.horizontal, 10.0)
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.colorScheme, .dark)
    }
}
