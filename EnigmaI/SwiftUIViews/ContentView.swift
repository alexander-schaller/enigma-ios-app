//
//  ContentView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct ContentView: View {
    
    var body: some View {
        NavigationView {
            NavigationContentSwiftUIView(shouldScroll: Binding<Bool>.constant(true))
                
                .navigationBarTitle("Enigma I")
                .navigationBarItems(leading:
                    NavigationLink(destination: InfoSwiftUIView(), label: {
                        Text("Help")
                            .padding([.top, .bottom], 3)
                            .padding([.leading, .trailing],10)
                            .foregroundColor(.primary)
                            .background(
                                Rectangle()
                                    .foregroundColor(Color.init(UIColor.systemFill))
                            )
                            .cornerRadius(40)
                        }
                    )
                )
        }
    }
}

@available(iOS 13, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.colorScheme, .dark)
    }
}
