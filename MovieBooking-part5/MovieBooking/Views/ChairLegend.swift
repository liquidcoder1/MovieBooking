//
//  ChairLegend.swift
//  MovieBooking
//
//  Created by John K on 12/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct ChairLegend: View {
    var text = "Selected"
    var color: Color = .gray
    
    var body: some View {
        HStack{
            ChairView(width: 20,accentColor: color, isSelectable: false)
            Text(text).font(.subheadline).foregroundColor(color)
        }.frame(maxWidth: .infinity)
    }
}


struct ChairLegend_Previews: PreviewProvider {
    static var previews: some View {
        ChairLegend()
    }
}
