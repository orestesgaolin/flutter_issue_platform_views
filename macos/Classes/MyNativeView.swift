//
//  MyNativeView.swift
//  native_view
//
//  Created by Dominik Roszkowski on 21/08/2022.
//

import SwiftUI

@available(macOS 11.00, *)
struct MyNativeView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello from SwiftUI")
                .font(.headline)
            Text("within Flutter")
                .font(.body)
        }
    }
}

@available(macOS 11.00, *)
struct MyNativeView_Previews: PreviewProvider {
    static var previews: some View {
        MyNativeView()
            
    }
}
