//
//  OkShape.swift
//  MovieBooking
//
//  Created by John K on 22/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct OkShape: Shape {
         
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x, y: rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width, y: rect.origin.y))
        }
    }
}
