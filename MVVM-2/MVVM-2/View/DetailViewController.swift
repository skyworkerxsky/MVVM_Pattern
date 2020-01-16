//
//  ViewController.swift
//  MVVM-2
//
//  Created by Алексей Макаров on 16.01.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var detailLabel: UILabel!
    var viewModel: DetailViewModelType?
    
    // MARK: - Init
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.detailLabel.text = viewModel.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // связали свойство age с detailLabel
        viewModel?.age.bind { [unowned self] in
            guard let string = $0 else { return }
            self.detailLabel.text = string
        }
        
        delay(delay: 5) {
            self.viewModel?.age.value = "some new value"
        }
        
    }
    
    // метод с задержкой
    private func delay(delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }

}
