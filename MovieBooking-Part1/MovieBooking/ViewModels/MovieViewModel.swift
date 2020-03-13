//
//  MovieViewModel.swift
//  MovieBooking
//
//  Created by John K on 27/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

enum HomeSection: String, CaseIterable {
    case Trending
    case Popular
    case Upcoming
    case Actors
}


class MovieViewModel: ObservableObject {
    
    @Published var allItems: [HomeSection:[Codable]] = [:]
    
    init() {
        getAll()
    }
    
    private func getAll(){
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let result = try decoder.decode(MovieBundle.self, from: data)
                allItems = [HomeSection.Trending: result.trending,
                            HomeSection.Popular: result.popular,
                            HomeSection.Upcoming: result.upcoming,
                            HomeSection.Actors: result.actors]
                
            } catch let e{
                print(e)
            }
        }
    }
}

