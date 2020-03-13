//
//  MovieDetailView.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct SingleMovieView: View {
    
    var movieId: Int = -1
    
    @ObservedObject var model = MovieListingViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        createPosterImage()
                        MovieDetailView(movie: self.model.movie)
                    }
                }.edgesIgnoringSafeArea(.top)
                .onAppear {
                    self.model.getMovieDetail(id: self.movieId)
                }
        }
    
    
    
       fileprivate func createPosterImage() -> some View {
        return KFImage(source: .network(model.movie.posterUrl)).resizable()
           .aspectRatio(contentMode: .fit)
       }
}
