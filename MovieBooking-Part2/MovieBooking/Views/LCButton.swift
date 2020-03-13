//
//  LCButton.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct LCButton: View {
    var text = "Buy Tickets"
    var action = {}
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(text)
                    .font(.system(size: 20, weight: Font.Weight.semibold))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical)
                    .accentColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.accent, .darkPurple]) , startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
        }.padding(.vertical)
    }
}

struct LCButton_Previews: PreviewProvider {
    static var previews: some View {
        LCButton()
    }
}
