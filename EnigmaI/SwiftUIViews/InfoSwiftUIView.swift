//
//  InfoSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 25/05/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import SwiftUI
@available(iOS 13, *)
struct InfoSwiftUIView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                InfoTextSwiftUIView(title: "Scramblers", description: "With these you select the order of the Scramblers from left to right. You can also select which Scramblers are used in each position."){
                        Image("ScramblersInfoView")
                    .resizable()
                    .scaledToFit()
                }
                InfoTextSwiftUIView(title: "Buttons", description: "This stack of buttons lets you pick the settings of the individual Scramblers. First you select the visible letter (the one you can see through the little window), and in the second stack you select the ring position") {
                        Image("ButtonsInfoView")
                    .resizable()
                    .scaledToFit()
                }
                InfoTextSwiftUIView(title: "Plugboard", description: "In the Plugboard you select different word pairs that you want to switch out with eachother therefore if you select the pair AP all As become Ps and vice versa. Then all you have to do is type out the word pairs in sequence.") {
                        Image("PlugboardInfoView")
                }
                InfoTextSwiftUIView(title: "Encryption", description: "To encrypt a message you select all your settings, then you type your message in the input box and tap done. Your encrypted message will appear above.") {
                    Text("")
                }
                InfoTextSwiftUIView(title: "Decryption", description: "To decrypt a message that you got, you first need to know the initial settings that the other person used, and enter them. Next, you type out the encrypted message and tap done, the message appears above.") {
                    Text("")
                }
                Spacer()
            }.navigationBarTitle("Help")
        }
    }
}

@available(iOS 13, *)
struct InfoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSwiftUIView()
        .environment(\.colorScheme, .light)
    }
}
