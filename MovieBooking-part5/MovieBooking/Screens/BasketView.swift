//
//  BasketView.swift
//  MovieBooking
//
//  Created by John K on 20/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct BasketView: View {
    var ticket: Ticket
    var selectedSeats: [Seat]
    @State private var showPaymentScreen = false
    
    var body: some View {
        
        return
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(selectedSeats) { seat in
                            GeometryReader { gr in
                                self.renderTicket(Ticket(id: self.ticket.id, movie:  self.ticket.movie, date:  self.ticket.date, hour:  self.ticket.hour), seat: seat , angle: gr.frame(in: .global).minX / -10)
                            }.frame(width: UIScreen.main.bounds.width)
                        }
                    }
                }
                LCButton(text: "Buy", action: {self.showPaymentScreen.toggle()})
                    .sheet(isPresented: self.$showPaymentScreen, content: {
                        PaymentView()
                    })
                    .padding(.horizontal)
                    .padding(.bottom)
        }
    }
    
    func renderTicket(_ ticket: Ticket, seat: Seat, angle: CGFloat) -> some View {
        
        return TicketView(ticket: ticket, seat: seat)
            .rotation3DEffect(Angle(degrees: Double(angle)) , axis: (x: 0, y: 10.0, z: 0))
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(ticket: Ticket.default, selectedSeats: [])
    }
}
