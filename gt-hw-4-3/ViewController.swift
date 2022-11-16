//
//  ViewController.swift
//  gt-hw-4-3
//
//  Created by ake11a on 2022-11-05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var controller: InfoController?
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 24)
        
        label.isHidden = true
        return label
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "User name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Age"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        return textField
    }()

    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(enterTap), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var authStackView: UIStackView = {
        let stackView = UIStackView()
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = InfoController(view: self)
        
        setupSubviews()
    }
    
    func setupSubviews() {
        
        view.backgroundColor = .lightGray

        view.addSubview(errorLabel)
        view.addSubview(authStackView)
        authStackView.addArrangedSubview(userNameTextField)
        authStackView.addArrangedSubview(ageTextField)
        authStackView.addArrangedSubview(enterButton)
        
//        authStackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(320)
//        }
        
        let authStackViewCenterXConstraint = authStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let authStackViewCenterYConstraint = authStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let authStackViewLeadingConstraint = authStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let authStackViewTrailingConstraint = authStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let authStackViewHeightConstraint = authStackView.heightAnchor.constraint(equalToConstant: 150)
        
        let errorLabelCenterX = errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let errorLabelTop = errorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let errorLabelBottom = errorLabel.bottomAnchor.constraint(equalTo: authStackView.topAnchor)

        NSLayoutConstraint.activate([
            authStackViewCenterXConstraint, authStackViewCenterYConstraint, authStackViewLeadingConstraint, authStackViewTrailingConstraint, authStackViewHeightConstraint,
            errorLabelCenterX, errorLabelTop, errorLabelBottom
        ])
        
    }
    
    @objc func enterTap() {
        if let age = Int(ageTextField.text!) {
            errorLabel.isHidden = true
            
            if let authOk = controller?.authControl(userInfo: (userNameTextField.text!, age)) {
                if authOk {
                    errorLabel.isHidden = true
                    
                    let profileViewController = ProfileViewController()
                    profileViewController.name = userNameTextField.text!
                    profileViewController.age = age
                    
                    navigationController?.pushViewController(profileViewController, animated: true)
                } else {
                    errorLabel.text = "User not found!"
                    errorLabel.isHidden = false
                }
            }
        } else {
            errorLabel.text = "Age must be number!"
            errorLabel.isHidden = false
        }
    }
}

