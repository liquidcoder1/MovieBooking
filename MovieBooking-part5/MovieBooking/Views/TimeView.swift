//
//  TimeView.swift
//  MovieBooking
//
//  Created by John Kulimushi on 13/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI


struct TimeView: View {
    var index: Int
    var isSelected: Bool
    var onSelect: ((Int)->()) = {_ in }


    var body: some View {
        Text("\(index):00")
            .foregroundColor(isSelected ? .white : .textColor)
            .padding()
            .background( isSelected ? Color.accent : Color.gray.opacity(0.3))
            .cornerRadius(10).onTapGesture {
                self.onSelect(self.index)
        }
    }
}
