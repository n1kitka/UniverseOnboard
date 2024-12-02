//
//  ViewController.swift
//  UniverseOnboard
//
//  Created by Никита Савенко on 29.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel: OnboardingViewModel

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        viewModel.fetchOnboardingData()
    }


}

