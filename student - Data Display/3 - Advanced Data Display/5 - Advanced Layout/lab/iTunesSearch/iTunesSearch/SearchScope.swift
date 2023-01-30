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



<<<<<<< HEAD
=======

func fetchAndHandleItemsForSearchScopes(_ searchScopes:​    [SearchScope], withSearchTerm searchTerm: String)​    async throws ​    {​      try await withThrowingTaskGroup(of: (SearchScope,​         [StoreItem]).self) { group in​          for searchScope in searchScopes { group.addTask { ​                try Task.checkCancellation()​                // Set up query dictionary​                let query = [​                   "term": searchTerm,​                   "media": searchScope.mediaType,​                   "lang": "en_us",​                   "limit": "50" ​                 ]​                 return (searchScope, try await​                    self.storeItemController.fetchItems(matching:​                       query))​            }​        }​        for try await (searchScope, items) in group {​            try Task.checkCancellation() if searchTerm ==​               self.searchController.searchBar.text && ​                  (self.selectedSearchScope == .all || searchScope​                     == self.selectedSearchScope) {​               await handleFetchedItems(items)​             }​        }​     }​ }
>>>>>>> a27f7654c116ec5ede4cdf156fd486a58e7febe7
