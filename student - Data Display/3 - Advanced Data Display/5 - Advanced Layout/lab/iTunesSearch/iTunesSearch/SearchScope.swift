//
//  SearchScope.swift
//  iTunesSearch
//
//  Created by Tyler Radke on 1/29/23.
//

import Foundation


enum SearchScope: CaseIterable {
case all, music, movies, apps, books
    
    var title: String {
        
        switch self {
        case .all: return "All"
        case .music: return "Music"
        case .movies: return "Movies"
        case .apps: return "Apps"
        case .books: return "Books"
        }
        
        
    }
    
    var mediaType: String {
            switch self {
            case .all: return "all"
            case .movies: return "movie"
            case .music: return "music"
            case .apps: return "software"
            case .books: return "ebook"
            }
        }
    
    
}



