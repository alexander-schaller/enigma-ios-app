//
//  ButtonStackViewViewSwiftUI.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 11/12/19.
//  Copyright © 2019 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct ButtonStackViewSwiftUI: View {
    
    var title: String
    var labelButton1: String
    var labelButton2: String
    var labelButton3: String    
    
    var body: some View {
        VStack(spacing: 5.0) {
            HStack {
                Text(title.uppercased())
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .bold()
                    .padding(.leading)
                Spacer()
            }
            Button(action: {
                PickerSwiftUIView()
                
            }, label: {
                Spacer()
                Text(labelButton1)
                    .foregroundColor(.primary)
                    .bold()
                
                Spacer()
            })
                .padding(.leading, 25)
                .padding(.trailing, 25)
                .padding(.top, 2)
                .padding(.bottom, 2)
                .background(Color.init(UIColor.systemFill))
                .cornerRadius(5)
            Button(action: {
                // -TODO: Open Picker View
            }, label: {
                Spacer()
                Text(labelButton2)
                    .foregroundColor(.primary)
                    .bold()
                Spacer()
            })
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .padding(.top, 2)
            .padding(.bottom, 2)
            .background(Color.init(UIColor.systemFill))
            .cornerRadius(5)
            Button(action: {
                // -TODO: Open Picker View
            }, label: {
                Spacer()
                Text(labelButton3)
                    .foregroundColor(.primary)
                    .bold()
                Spacer()
            })
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .padding(.top, 2)
            .padding(.bottom, 2)
            .background(Color.init(UIColor.systemFill))
            .cornerRadius(5)
        }
        .padding(.top, 5)
        .padding(.bottom, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        .background(Color.init(UIColor.secondarySystemBackground))
    .cornerRadius(25)
        
    }
}

@available(iOS 13.0.0, *)
struct ButtonStackViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStackViewSwiftUI(title: "Scramblers", labelButton1: "A", labelButton2: "B", labelButton3: "C")
         .environment(\.colorScheme, .light)
    }
}
