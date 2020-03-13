//
//  ScreenShape.swift
//  MovieBooking
//
//  Created by John K on 11/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI


struct ScreenShape: Shape {

    var screenCurveture: CGFloat = 30
    var isClip = false
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x + screenCurveture, y: rect.origin.y +  screenCurveture))
            path.addQuadCurve(to: CGPoint(x: rect.width - screenCurveture, y: rect.origin.y + screenCurveture), control: CGPoint(x: rect.midX, y: rect.origin.y) )
           
            if isClip{
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
                path.closeSubpath()
            }
        }
    }
}

