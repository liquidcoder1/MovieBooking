// File: MovieListingViewModel.swift
// Project: MovieBooking

// Created at 01/02/2020 by Liquidcoder
// Visit https://www.liquidcoder.com for more
// Copyright © Liquidcoder. All rights reserved

import SwiftUI
import Combine

class MovieListingViewModel: ObservableObject {
    private var webService = WebService()
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var sectionMovies =  [HomeSection: [MovieViewModel]]()
    @Published var movie = MovieViewModel.default
    @Published var paginatedMovies = [MovieViewModel]()
    
    func getSectionMovies()  {
          webService
              .getSectionsPublisher()
              .receive(on: DispatchQueue.main)
              .sink(receiveCompletion: { status in
                  print(status)
              }) { (topRated,upcoming, popular, nowPlaying) in
                  self.sectionMovies[.TopRated] = topRated.results.map(MovieViewModel.init)
                  self.sectionMovies[.Upcoming] = upcoming.results.map(MovieViewModel.init)
                  self.sectionMovies[.Popular] = popular.results.map(MovieViewModel.init)
                  self.sectionMovies[.NowPlaying] = nowPlaying.results.map(MovieViewModel.init)
          }.store(in: &self.cancellableSet)
      }
      
      func getPaginatedMovies(for section: HomeSection, page: Int)  {
          webService.getPaginatedPublisher(for: section, page: page)
              .receive(on: DispatchQueue.main)
              .sink(receiveCompletion: { status in
                  print(status)
              }) { page in
                  self.paginatedMovies.append(contentsOf:  page.results.map(MovieViewModel.init))
          }.store(in: &self.cancellableSet)
      }
      
      func getMovieDetail(id: Int)  {
          webService.getMovieDetailPublisher(for: id)
              .receive(on: DispatchQueue.main)
              .sink(receiveCompletion: { status in
                  print(status)
              }) { movie in
                  self.movie = MovieViewModel(movie: movie)
          }.store(in: &self.cancellableSet)
      }
}
