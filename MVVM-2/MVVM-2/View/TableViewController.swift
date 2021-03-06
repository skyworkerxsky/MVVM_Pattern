//
//  TableViewController.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 16.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private var viewModel: TableViewViewModelType? // ссылка на viewModel
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel() // создали viewModel
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numberOfRows() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        guard let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel

        return cell
    }

    // переходим по выбранной ячейке
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return } // проверяем модель
        viewModel.selectRow(atIndexPath: indexPath) // получили IndexPath
    
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    // подготавливаем переход где генерируем viewModel и передаем его
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }
        
        if identifier == "detailSegue" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.viewModel = viewModel.viewModelForSelectedRow()
            }
        }
    }
    
}
