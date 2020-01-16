//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 16.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath? // хранит выбранную ячейку
    
    var profiles = [ // массив данных для отображения
        Profile(name: "Vasya", secondName: "Pupkin", age: 12),
        Profile(name: "Slavik", secondName: "Wads", age: 59),
        Profile(name: "Mark", secondName: "Kort", age: 42)
    ]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    // передали выбранный профиль
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
