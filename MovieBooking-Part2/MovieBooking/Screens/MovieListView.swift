//
//  MovieListView.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct MovieListView<T: Movie>: View {
    
    var movies: [T]
    var section: HomeSection
    
    var body: some View {
        NavigationView {
            List(0..<movies.count) { i in
                    MovieListRow<T>(movie: self.movies[i])
            }.navigationBarTitle(section.rawValue)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView<Popular>(movies: [], section: .Trending)
    }
}
