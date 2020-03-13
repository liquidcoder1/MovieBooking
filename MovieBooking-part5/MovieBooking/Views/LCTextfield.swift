//
//  LCTextfield.swift
//  MovieBooking
//
//  Created by John K on 21/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct LCTextfield: View {
    
    @Binding var value: String
    var placeholder = "Placeholder"
    var leadingIcon = Image(systemName: "person.crop.circle")
    var isSecure = false
    var onEditingChanged: ((Bool)->()) = {_ in }
    
    var body: some View {
        HStack {
            leadingIcon.imageScale(.large)
                .padding(.vertical)
                        .foregroundColor(Color.gray)
            if isSecure{
                SecureField(placeholder, text: self.$value, onCommit: {
                    self.onEditingChanged(false)
                }).padding(.vertical)
            } else {
                TextField(placeholder, text: self.$value, onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                }).padding(.vertical)
            }
        }
    }
}

struct LCTextfield_Previews: PreviewProvider {
    static var previews: some View {
        LCTextfield(value: .constant(""))
    }
}
