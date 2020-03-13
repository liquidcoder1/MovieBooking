// File: WebService.swift
// Project: MovieBooking

// Created at 31/01/2020 by Liquidcoder
// Visit https://www.liquidcoder.com for more
// Copyright © Liquidcoder. All rights reserved


import Foundation
import Combine


struct  WebService {
    
     private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
         decoder.keyDecodingStrategy = .convertFromSnakeCase
         return decoder
     }()
     
     private var session: URLSession = {
        let config = URLSessionConfiguration.default
         config.urlCache = URLCache.shared
         config.waitsForConnectivity = true
         config.requestCachePolicy = .returnCacheDataElseLoad
         return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
     }()
     
    
    private func createPublisher<T: Codable>(for url: URL) -> AnyPublisher<T, Error>{
         return session.dataTaskPublisher(for: url)
                        .map({$0.data})
                        .decode(type: T.self, decoder: decoder)
                        .eraseToAnyPublisher()
     }
    
    func getSectionsPublisher() -> AnyPublisher<(TMDBResult, TMDBResult, TMDBResult, TMDBResult), Error>{
        Publishers.Zip4(createPublisher(for: .topRated),
                        createPublisher(for: .upcoming),
                        createPublisher(for: .popular),
                        createPublisher(for: .nowPlaying)) // Zip all 4 publishers to run them in parallel
                        .eraseToAnyPublisher() // Erase the complex publisher to a simple AnyPublisher
    }
    
    
    func getPaginatedPublisher(for section: HomeSection, page: Int) -> AnyPublisher<TMDBResult, Error> {
        let url =  URL.movies(for: section, page: page)
        return createPublisher(for: url)
    }
    
    func getMovieDetailPublisher(for id: Int) -> AnyPublisher<Movie, Error> {
        createPublisher(for: .movie(with: id))
    }
     

}
