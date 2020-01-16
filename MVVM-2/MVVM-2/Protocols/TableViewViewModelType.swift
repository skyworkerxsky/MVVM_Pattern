//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 16.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int // кол-во строк
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? // сама ячейка
    
    // протоколы для перехода на контроллер
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
