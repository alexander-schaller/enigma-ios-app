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
        NavigationView {
            HStack(spacing: 10.0) {
                ButtonStackViewSwiftUI(title: "Scramblers", labelButton1: "A", labelButton2: "B", labelButton3: "C")
                ButtonStackViewSwiftUI(title: "Set Ring", labelButton1: "A", labelButton2: "B", labelButton3: "C")
            }
            .padding(.horizontal, 10.0)
            .navigationBarTitle("Enigma I")
        .navigationBarItems(leading:
            Button(action: {
                // -TODO: Add action to Help View
            }, label: {
                Text("Help")
                    .padding([.top, .bottom], 3)
                    .padding([.leading, .trailing],10)
                    .foregroundColor(.primary)
                    .background(
                        Rectangle()
                            .foregroundColor(Color.init(UIColor.systemFill))
                    )
                .cornerRadius(40)
            })
            )
        }
        
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.colorScheme, .dark)
    }
}
