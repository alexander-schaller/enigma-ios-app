//
//  InfoTextSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 25/05/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import SwiftUI
@available(iOS 13, *)
struct InfoTextSwiftUIView<Content: View>: View {
    
    init(title: String, description: String, @ViewBuilder builder: @escaping () -> Content) {
        self.title = title
        self.viewBuilder = builder
        self.description = description
    }
    
    var viewBuilder: () -> Content

    var title: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                   .font(Font.init(UIFont
                    .boldSystemFont(ofSize: 26)))
                Spacer()
            }.padding(.bottom)
            HStack {
                Text(description)
                Spacer()
            }.padding(.bottom)
            viewBuilder()
        }.padding()
    }
}
@available(iOS 13, *)
struct InfoTextSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoTextSwiftUIView(title: "Scramblers", description: "With these you select the order of the Scramblers from left to right. You can also select which Scramblers are used in each position.") {
                Image("ScramblersInfoView")
            .resizable()
            .scaledToFit()
        }
    }
}
