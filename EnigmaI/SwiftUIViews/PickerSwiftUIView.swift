//
//  PickerSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct PickerSwiftUIView: View {
    
    var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var title : String
    @State var selectedLetter = 0;
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Picker(selection: $selectedLetter, label: Text("")) {
                    ForEach(0..<letters.count) {
                        Text(self.letters[$0])
                    }
                }
                .padding(.bottom, 15)
                .labelsHidden()
                .navigationBarTitle(Text(title))
            }
        }
    }
}

@available(iOS 13.0.0, *)
struct PickerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerSwiftUIView(title: "Scramblers")
    }
}
