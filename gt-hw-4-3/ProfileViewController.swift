//
//  ProfileViewController.swift
//  gt-hw-4-3
//
//  Created by ake11a on 2022-11-16.
//

import UIKit

class ProfileViewController: UIViewController {

    var name = ""
    var age = 0
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Profile"
        
        userNameLabel.text = "Name: \(name)"
        ageLabel.text = "Age: \(age)"
        
        setupSubviews()

    }
    func setupSubviews() {
        view.backgroundColor = .blue
        
        view.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
        }
        
        view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
        }
        
    }

}
