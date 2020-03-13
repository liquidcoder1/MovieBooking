//
//  Ticket.swift
//  MovieBooking
//
//  Created by John K on 20/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import Foundation

struct Ticket: Identifiable {
    var id: UUID
    var movie: MovieViewModel
    var date: TicketDate
    var hour: String
    
    static var `default`: Ticket{
        .init(id: UUID(), movie: MovieViewModel.default, date: TicketDate.default, hour: "")
    }
}
