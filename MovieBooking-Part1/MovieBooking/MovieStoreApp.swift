//
//  ContentView.swift
//  MovieBooking
//
//  Created by John K on 27/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct MovieStoreApp: View {
    
    @ObservedObject private var model = MovieViewModel()

    var body: some View {

        let movieCollectionView = createCollectionView().edgesIgnoringSafeArea(.all).navigationBarTitle("Movies")
        
        return NavigationView {
            movieCollectionView
        }
    }
    
    fileprivate func createCollectionView() -> MovieCollectionView {
        return MovieCollectionView(allItems: model.allItems, didSelectItem: { indexPath in }, seeAllforSection: { section in })
    }
}

struct MovieStoreApp_Previews: PreviewProvider {
    static var previews: some View {
        MovieStoreApp()
    }
}
