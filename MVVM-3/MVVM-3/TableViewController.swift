//
//  ViewController.swift
//  MVVM-3
//
//  Created by Алексей Макаров on 17.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var viewModel: ViewModel!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.titleForCell(atIndexPath: indexPath)
        
        return cell
    }
    
}

