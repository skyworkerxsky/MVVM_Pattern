//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 16.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    var age: Box<String?> = Box(nil)
    
    private var profile: Profile
    
    var description: String {
        return String(describing: "\(profile.name) \(profile.secondName) is \(profile.age) old.")
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
