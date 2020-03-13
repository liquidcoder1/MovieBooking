//
//  MovieDetailView.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
     var movie: MovieViewModel
        
   @State private var showSeats: Bool = false
        
        var body: some View {
            
           return VStack(alignment: .leading) {
                createTitle()
            LineRatingView(value: movie.voteAverage)
                createGenreList()
//
                HStack {
                    Text(self.movie.releaseDate).foregroundColor(Color.gray)
                    Spacer()
                    Text(self.movie.runtime ).foregroundColor(Color.gray)
                }.padding(.vertical)
//
                createDescription()
                createChooseSeatButton()
                
                
            }.padding(.horizontal).padding(.bottom, 20)
        }
    
    fileprivate func createTitle() -> some View {
        return Text(self.movie.title)
        .font(.system(size: 35, weight : .black, design: .rounded))
        .layoutPriority(1)
        .multilineTextAlignment(.leading)
        .lineLimit(nil)
    }
    
    fileprivate func createGenreList() -> some View {
        
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(self.movie.genres, id: \.self){ genre in
                    Text(genre)
                        .bold()
                        .padding(5)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                        .foregroundColor(Color.gray)

                }
            }
        }
    }
    
    fileprivate func createDescription() -> some View {
        return Text(self.movie.overview).lineLimit(nil).font(.body)
    }
    
    fileprivate func createChooseSeatButton() -> some View {
        return LCButton(text: "Choose seats") {
            self.showSeats.toggle()
        }.sheet(isPresented: self.$showSeats) {
            SeatsChoiceView(movie: self.movie)
        }.padding(.vertical)
    }
}
