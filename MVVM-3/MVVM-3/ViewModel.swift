//
//  ViewModel.swift
//  MVVM-3
//
//  Created by Алексей Макаров on 17.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    // MARK: - Outlets
    
    @IBOutlet weak var networkManager: NetworkManager!
    
    private var movies: [String]?
    
    func fetchMovies(completion: @escaping()->()) {
        networkManager.fetchMovies { [weak self] movies in
            self?.movies = movies
            completion()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return movies?.count ?? 0
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else { return "" }
        return movies[indexPath.row]
    }
    
}
