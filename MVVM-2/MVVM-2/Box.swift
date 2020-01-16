//
//  Box.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 17.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

// класс обертка для отслеживания изменений
class Box<T> {
    
    typealias Listener = (T) -> ()
    
    var listener: Listener? // создаем наблюдателя
    
    // как только меняется value передаем значения в Listener
    var value: T {
        
        didSet {
            listener?(value)
        }
    }
    
    // связываем свойства и наблюдателя
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
}
