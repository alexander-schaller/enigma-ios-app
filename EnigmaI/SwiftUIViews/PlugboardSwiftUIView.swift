//
//  PlugboardSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 22/06/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct PlugboardSwiftUIView: View {
    
    @Binding var plugboard: String
    
    var body: some View {
        ContainerSwiftUIView(title: "Plugboard", cornerRadius: 15) {
            TextField("", text: self.$plugboard)
                .padding([.top, .bottom], 8)
                .padding([.leading,.trailing])
                .background(
                    Rectangle().foregroundColor(Color.init(UIColor.systemFill))
            )
                .cornerRadius(10)
        }
    }
}

@available(iOS 13, *)
struct PlugboardSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PlugboardSwiftUIView(plugboard: Binding<String>.constant("")).environment(\.colorScheme, .dark)
    }
}
