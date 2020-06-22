//
//  ButtonStackViewViewSwiftUI.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct ButtonStackSwiftUIView: View {
    
    var title: String
    var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @Binding var labelButton1: Int;
    @Binding var labelButton2: Int;
    @Binding var labelButton3: Int;
        
    var body: some View {
        ContainerSwiftUIView(title: title, cornerRadius: 25) {
            NavigationLink(destination: PickerSwiftUIView(title: self.title, selectedLetter: self.$labelButton1)) {
                Spacer()
                if self.title.contains("Ring") {
                    // -TODO: Increase Font size and padding
                    Text("\(self.labelButton1 + 1)")
                    .foregroundColor(.primary)
                    .bold()
                } else {
                    Text(self.letters[self.labelButton1])
                    .foregroundColor(.primary)
                    .bold()
                }
                Spacer()
            }
                .padding([.leading, .trailing], 25)
                .padding([.top, .bottom], 2)
                .background(Color.init(UIColor.systemFill))
                .cornerRadius(5)
            NavigationLink(destination: PickerSwiftUIView(title: self.title, selectedLetter: self.$labelButton2)) {
                Spacer()
                if self.title.contains("Ring") {
                    Text("\(self.labelButton2 + 1)")
                    .foregroundColor(.primary)
                    .bold()
                } else {
                    Text(self.letters[self.labelButton2])
                    .foregroundColor(.primary)
                    .bold()
                }
                Spacer()
            }
            .padding([.leading, .trailing], 25)
            .padding([.top, .bottom], 2)
            .background(Color.init(UIColor.systemFill))
            .cornerRadius(5)
            NavigationLink(destination: PickerSwiftUIView(title: self.title, selectedLetter: self.$labelButton3)) {
                Spacer()
                if self.title.contains("Ring") {
                    Text("\(self.labelButton3 + 1)")
                    .foregroundColor(.primary)
                    .bold()
                } else {
                    Text(self.letters[self.labelButton3])
                    .foregroundColor(.primary)
                    .bold()
                }
                Spacer()
            }
            .padding([.leading, .trailing], 25)
            .padding([.top, .bottom], 2)
            .background(Color.init(UIColor.systemFill))
            .cornerRadius(5)
        }
    
    }
}

@available(iOS 13, *)
struct ButtonStackViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStackSwiftUIView(title: "Ring", labelButton1: Binding<Int>.constant(0), labelButton2: Binding<Int>.constant(1), labelButton3: Binding<Int>.constant(2))
         .environment(\.colorScheme, .light)
    }
}
