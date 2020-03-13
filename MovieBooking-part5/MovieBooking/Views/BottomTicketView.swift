//
//  BottomTicketView.swift
//  MovieBooking
//
//  Created by John K on 21/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//


import SwiftUI

struct BottomTicketView: View {
    var body: some View {
         Image("Barcode")
                       .resizable()
                       .scaledToFit()
                       .padding(30)
                       .frame(minWidth: 0.0, maxWidth: .infinity)
            .foregroundColor(Color.gray)
    }
}

struct BottomTicketView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTicketView()
    }
}
