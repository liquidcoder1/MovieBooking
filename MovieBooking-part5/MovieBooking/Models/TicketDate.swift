//
//  TicketDate.swift
//  MovieBooking
//
//  Created by John K on 13/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import Foundation

import Foundation

struct TicketDate: Equatable {
    var day: String
    var month: String
    var year: String
    
    static var `default`: TicketDate { TicketDate(day: "", month: "", year: "") }
    
    
    
}
