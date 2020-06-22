//
//  PickerSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct PickerSwiftUIView: View {
    
    var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var title : String
    @Binding var selectedLetter: Int
    
    var body: some View {
        VStack {
            Spacer()
            Picker(selection: $selectedLetter, label: Text("")) {
                ForEach(0..<letters.count) {
                    if self.title.contains("Ring") {
                        Text("\($0 + 1)")
                    } else if self.title.contains("Scramblers"){
                        Text(self.letters[$0])
                    } else {
                        Text(($0 + 1).toRoman)
                    }
                }
            }
            .padding(.bottom, 15)
            .labelsHidden()
            .navigationBarTitle(Text(title))
        }
    }
}

@available(iOS 13, *)
struct PickerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerSwiftUIView(title: "Pick", selectedLetter: Binding<Int>.constant(0))
    }
}
