//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 16.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

protocol DetailViewModelType {
    
    var description: String { get }
    var age: Box<String?> { get }
}
