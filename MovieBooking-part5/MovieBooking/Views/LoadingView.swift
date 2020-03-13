//
//  LoadingView.swift
//  MovieBooking
//
//  Created by John K on 22/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    var lineWidth: CGFloat = 3
    
    @State private var flag = false
    
    var body: some View {
        
        return VStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round, lineJoin: .round, dash: [10,10], dashPhase: flag ? 0 : 40))
                .fill(LinearGradient(gradient: Gradient(colors: [Color.accent, .darkPurple]) , startPoint: .leading, endPoint: .trailing))
                .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false))
                .onAppear {
                    self.flag = true
                    
            }.onDisappear {
                self.flag = false
            }
        }
    }
    
    func stop() {
        self.flag = false
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
