//
//  MovieDetailView.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct SingleMovieView<T: Movie>: View {
    
    var movie: T
    
    var body: some View {
        ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        createPosterImage()
                        MovieDetailView(movie: self.movie)
                    }
                }.edgesIgnoringSafeArea(.top)
        }
    
    
       fileprivate func createPosterImage() -> some View {
           return Image(uiImage: UIImage(named: "\(movie.image).jpg") ?? UIImage() ).resizable()
           .aspectRatio(contentMode: .fit)
       }
}

struct SingleMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMovieView<Popular>(movie: Popular.default)
    }
}
