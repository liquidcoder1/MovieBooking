//
//  MovieListRow.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct MovieListRow<T: Movie>: View {
    var movie: T
    
    fileprivate func createImage() -> some View {
        return Image(uiImage: UIImage(named: "\(movie.image).jpg") ?? UIImage() )
        .resizable()
        .aspectRatio(contentMode: .fit).cornerRadius(20)
    }
        
    fileprivate func createTitle() -> some View {
        return Text(movie.title)
        .font(.system(size: 25, weight: .black, design: .rounded))
        .foregroundColor(Color.white)
    }
    
    var body: some View {
        
       return ZStack(alignment: .bottom) {
        createImage()
        
        VStack(alignment: .leading) {
                createTitle()
                LineRatingView(value: movie.rating)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]) , startPoint: .bottom , endPoint: .top)).cornerRadius(20)
                .shadow(radius: 10)
        
        }.padding(.vertical)
    }
}
