//
//  Seat.swift
//  MovieBooking
//
//  Created by John K on 11/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import Foundation


struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0) }
}
