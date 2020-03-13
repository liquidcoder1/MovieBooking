//
//  DashedSeperator.swift
//  MovieBooking
//
//  Created by John K on 21/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct DashedSeperator: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.origin.y ))
        path.closeSubpath()
        return path
    }
}

