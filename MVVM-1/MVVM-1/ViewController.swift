//
//  ViewController.swift
//  MVVM-1
//
//  Created by Алексей Макаров on 15.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: ViewModel! {
        
        didSet {
            self.nameLabel.text = viewModel.name
            self.secondNameLabel.text = viewModel.secondName
            self.ageLabel.text = viewModel.age
        }
    }
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel()
    }

}

