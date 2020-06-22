//
//  ContainerSwiftUIView.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 22/06/20.
//  Copyright © 2020 Alex Schaller. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct ContainerSwiftUIView<Content: View>: View {
    
    init(title: String, cornerRadius: CGFloat, @ViewBuilder builder: @escaping () -> Content) {
        self.title = title
        self.viewBuilder = builder
        self.cornerRadius = cornerRadius
    }
    
    var viewBuilder: () -> Content
    
    var title: String
    
    var cornerRadius: CGFloat
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
                viewBuilder()
            }
            .padding(.top, 5)
            .padding([.bottom, .leading, .trailing], 12)
            .background(Color.init(UIColor.secondarySystemBackground))
        .cornerRadius(cornerRadius)
            
    }
}

@available(iOS 13, *)
struct ContainerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerSwiftUIView(title: "Ring", cornerRadius: 25) {
            Text("Text")
        }
        .environment(\.colorScheme, .light)
    }
}
