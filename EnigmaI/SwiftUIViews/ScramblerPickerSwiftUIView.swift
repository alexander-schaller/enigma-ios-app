//
//  ScramblerPickerSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 22/06/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct ScramblerPickerSwiftUIView: View {
    @Binding var labelButton1: Int;
    @Binding var labelButton2: Int;
    @Binding var labelButton3: Int;
    
    var body: some View {
        ContainerSwiftUIView(title: "Pick Scrambler", cornerRadius: 25) {
            HStack{
                NavigationLink(destination: PickerSwiftUIView(letters: "12345", title: "Pick 1st Scrambler", selectedLetter: self.$labelButton1)) {
                    Spacer()
                    Image("Scrambler\((self.labelButton1 + 1).toRoman)_EnigmaApp")
                        .resizable()
                    .scaledToFit()
                    Spacer()
                }
                NavigationLink(destination: PickerSwiftUIView(letters: "12345", title: "Pick 2nd Scrambler", selectedLetter: self.$labelButton2)) {
                    Spacer()
                    Image("Scrambler\((self.labelButton2 + 1).toRoman)_EnigmaApp")
                    .resizable()
                    .scaledToFit()
                    Spacer()
                }
                NavigationLink(destination: PickerSwiftUIView(letters: "12345", title: "Pick 3rd Scrambler", selectedLetter: self.$labelButton3)) {
                    Spacer()
                    Image("Scrambler\((self.labelButton3 + 1).toRoman)_EnigmaApp")
                        .resizable()
                    .scaledToFit()
                    Spacer()
                }
            }
            
        }
    }
}

@available(iOS 13, *)
struct ScramblerPickerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScramblerPickerSwiftUIView(labelButton1: Binding<Int>.constant(1), labelButton2: Binding<Int>.constant(1), labelButton3: Binding<Int>.constant(1))
    }
}
