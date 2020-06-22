//
//  OutputSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander Schaller on 14/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct OutputSwiftUIView: View {
    
    @Binding var inputText: String
    @Binding var outputText: String
    
    @Binding var plugboard: String
    
    var padding: CGFloat
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    ScrollView {
                            Text(self.outputText)
                            .font(Font.init(UIFont.boldSystemFont(ofSize: 25)))
                                .lineLimit(10)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .onTapGesture {
                                    //Open View that says copied to clipboard
                                    let pasteboard = UIPasteboard.general
                                    pasteboard.string = self.outputText
                                    
                            }
                    }
                        // Make better dimensions
                    .frame(width:  UIScreen.main.bounds.width - 50 - padding, height: 25, alignment: .center)
                    
                    
                    Spacer()
                }
                // TODO: - Modify the functions such that they run correct functions
                TextField("Input", text: self.$inputText)
                    .padding([.top, .bottom], 8)
                    .padding([.leading,.trailing])
                    .background(
                        Rectangle().foregroundColor(Color.init(UIColor.systemFill))
                )
                    .cornerRadius(15)
            }
            .padding()
            .background(Color.init(UIColor.secondarySystemBackground))
            .cornerRadius(25)
        }
    }
}

@available(iOS 13, *)
struct OutputSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        OutputSwiftUIView(inputText: Binding<String>.constant(""), outputText: Binding<String>.constant("A B CD E dfa fsadf sad fas fsa fasd f fas f asd f a fds a sdf sSKLAhkj ksjahf fakjsd fhkjdsf"), plugboard: Binding<String>.constant(""), padding: 8) .padding(8)
        .environment(\.colorScheme, .dark)
    }
}
