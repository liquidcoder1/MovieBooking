//
//  MovieListView.swift
//  MovieBooking
//
//  Created by John K on 04/01/2020.
//  Copyright © 2020 Liquidcoder. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    var section: HomeSection
    @ObservedObject var model = MovieListingViewModel()
    @State private var page: Int = 1
    
    var body: some View {
        NavigationView {
            List{
                ForEach(0..<model.paginatedMovies.count, id: \.self) { i in
                    MovieListRow(movie: self.model.paginatedMovies[i]).onAppear {
                        if i == self.model.paginatedMovies.count - 1{
                            
                            self.page += 1
                            self.model.getPaginatedMovies(for: self.section, page: self.page)
                        }

                    }
                }
            }.navigationBarTitle(section.rawValue)
        }.onAppear {
            self.model.getPaginatedMovies(for: self.section, page: self.page)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(section: .TopRated)
    }
}
