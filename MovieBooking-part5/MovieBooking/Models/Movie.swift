// File: Movie.swift
// Project: MovieBooking

// Created at 31/01/2020 by Liquidcoder
// Visit https://www.liquidcoder.com for more
// Copyright © Liquidcoder. All rights reserved

import SwiftUI


struct TMDBResult: Codable {
    let page:Int
    let totalPages:Int
    let results: [Movie]
}


struct Genre:Codable {
    let id:Int
    let name:String
}

struct ProductionCompany: Codable {
    let name: String
}


struct Movie: Codable {
 
    let id:Int?
    let title:String?
    let releaseDate:String?
    let overview:String?
    let popularity:CGFloat?
    let genres: [Genre]?
    let voteAverage:CGFloat?
    let originalLanguage: String?
    let posterPath:String?
    let backdropPath:String?
    let voteCount:Int?
    let status:String?
    let runtime,revenue:Int?
    let budget: Int?
    let productionCompanies: [ProductionCompany]?

    static var `default`: Movie {
        Movie(id: 0, title: "", releaseDate: "", overview: "", popularity: 0, genres: [], voteAverage: 0, originalLanguage: "", posterPath: "", backdropPath: "", voteCount: 0, status: "", runtime: 0, revenue: 0, budget: 0, productionCompanies: [])
    }
}
