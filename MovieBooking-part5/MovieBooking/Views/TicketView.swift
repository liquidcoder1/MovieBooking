//
//  TicketView.swift
//  MovieBooking
//
//  Created by John K on 20/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct TicketView: View {

    var ticket: Ticket
    var seat = Seat.default
    
    var body: some View {
      VStack(spacing: 0) {
        TopTicketView(ticket: ticket, seat: seat)
                      .background(Color.background)
                      .clipShape(TicketShape())
                  .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)

                  DashedSeperator()
                      .stroke(Color.gray, style: StrokeStyle(lineWidth: 1,dash: [4,8], dashPhase: 4))
                      .frame(height: 0.4)
                      .padding(.horizontal)

                  BottomTicketView()
                      .background(Color("barcodeBG"))
                   .clipShape(TicketShape().rotation(Angle(degrees: 180)))
                  .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)

      }.padding()
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(ticket: Ticket.default)
    }
}
