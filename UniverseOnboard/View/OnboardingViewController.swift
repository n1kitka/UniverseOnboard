//
//  OnboardingViewController.swift
//  UniverseOnboard
//
//  Created by Никита Савенко on 02.12.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    private let titleLabel = UILabel()
    private let questionLabel = UILabel()
    private let stackView = UIStackView()
    private let continueButton = UIButton()
    
    private let viewModel: OnboardingViewModel

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        viewModel.fetchOnboardingData()
    }
    
    private func setupUI() {
        view.backgroundColor = mainBackgroundColor
        
        // Title
        titleLabel.text = "Let's setup App for you"
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        titleLabel.textColor = mainLblTextColor
        view.addSubview(titleLabel)
        
        // Question
        questionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        questionLabel.textColor = mainLblTextColor
        view.addSubview(questionLabel)
        
        // Answer Buttons StackView
        stackView.axis = .vertical
        stackView.spacing = 12
        view.addSubview(stackView)
        
        // Continue Button
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(continueTextColor, for: .normal)
        continueButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        continueButton.backgroundColor = continueBtnColor
        continueButton.layer.cornerRadius = 30
        continueButton.isEnabled = false

        view.addSubview(continueButton)
        
        // Constraints
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.greaterThanOrEqualTo(view.safeAreaLayoutGuide).inset(48)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }

}
