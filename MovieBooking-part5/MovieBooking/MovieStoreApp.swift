//
//  ContentView.swift
//  MovieBooking
//
//  Created by John K on 27/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//


import SwiftUI


struct MovieStoreApp: View {
    
    @State private var showDetails = false
    @State private var selectedIndexPath: IndexPath?
    @State private var section: HomeSection = .Popular
    @State private var showSheet = false
    
    @ObservedObject var model = MovieListingViewModel()
    
    var body: some View {
        
        
        return NavigationView {
            
            if model.sectionMovies.isEmpty{
                LoadingView().frame(width: 50, height: 50)
            } else {
                createCollectionView()
                    .sheet(isPresented: self.$showSheet) {
                        if self.selectedIndexPath == nil{
                            MovieListView(section: self.section)
                        } else {
                            SingleMovieView(movieId: self.model.sectionMovies[self.section]?[self.selectedIndexPath!.item].id ?? 0 )
                        }
                }
            }
        }.onAppear {
            self.model.getSectionMovies()
        }
    }
    
    fileprivate func createCollectionView() -> some View {
       
        return MovieCollectionView(allItems: model.sectionMovies,
                                          didSelectItem: { indexPath in
                                           self.selectedIndexPath = indexPath
                                           self.section = HomeSection.allCases[indexPath.section]
                                           self.showSheet.toggle()
               },
                                          seeAllforSection: { section in
                                           self.section = section
                                                          self.showSheet.toggle()
                                                          self.selectedIndexPath = nil
               }).edgesIgnoringSafeArea(.all).navigationBarTitle("Movies")    }
}

struct MovieStoreApp_Previews: PreviewProvider {
    static var previews: some View {
        MovieStoreApp()
    }
}
