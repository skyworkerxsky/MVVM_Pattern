//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by Алексей Макаров on 17.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

// имитация network manager
class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["Movie 1", "Movie 2", "Movie 3"])
    }
}

