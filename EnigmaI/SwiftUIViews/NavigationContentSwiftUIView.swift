//
//  NavigationContentSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 26/05/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct NavigationContentSwiftUIView: View {
    @ObservedObject private var keyboard = KeyboardResponder()
    // Binding Variables
    @State var Scrambler1 = 0;
    @State var Scrambler2 = 1;
    @State var Scrambler3 = 2;
    
    @State var labelScrambler1 = 0;
    @State var labelScrambler2 = 1;
    @State var labelScrambler3 = 2;
    
    @State var labelRing1 = 0;
    @State var labelRing2 = 0;
    @State var labelRing3 = 0;
    
    @State var plugboard = "";
    
    @State var inputText = "";
    @State var outputText = "";
    // Other Variables
    var padding: CGFloat = 20;
    @Binding var shouldScroll: Bool;
    
    var body: some View {
        ScrollView(axes, showsIndicators: false){
            VStack(spacing: 10.0){
                ScramblerPickerSwiftUIView(labelButton1: self.$Scrambler1, labelButton2: self.$Scrambler2, labelButton3: self.$Scrambler3)
                HStack(spacing: 10.0) {
                    ButtonStackSwiftUIView(title: "Scramblers", labelButton1: self.$labelScrambler1, labelButton2: self.$labelScrambler2, labelButton3: self.$labelScrambler3)
                    ButtonStackSwiftUIView(title: "Set Ring", labelButton1: self.$labelRing1, labelButton2: self.$labelRing2, labelButton3: self.$labelRing3)
                }
                PlugboardSwiftUIView(plugboard: self.$plugboard)
                Spacer(minLength: UIScreen.main.bounds.height/5)
                OutputSwiftUIView(inputText: self.$inputText, outputText: self.$outputText, plugboard: self.$plugboard, padding: padding)
            }
        }
        .frame(width:  UIScreen.main.bounds.width - padding,   alignment: .center)
    }
    
    private var axes: Axis.Set {
        return shouldScroll ? .vertical : []
    }
    
    private func keyboardManager() {
        
    }
}
@available(iOS 13, *)
struct NavigationContentSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContentSwiftUIView(shouldScroll: Binding<Bool>.constant(false))
    }
}
