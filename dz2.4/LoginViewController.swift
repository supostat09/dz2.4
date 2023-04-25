//
//  ViewController.swift
//  dz2.4
//
//  Created by Абдулла-Бек on 15/4/23.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        return view
        
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please sign in to continue."
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "EMAIL"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "PASSWORD"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Sign up"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        view.addSubview(logoImage)
        view.addSubview(loginLabel)
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(label)
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.trailing.equalToSuperview()
            make.height.width.equalTo(180)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.leading.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        label.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
    }
        
        @objc func loginButtonTapped() {
            let username = loginTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            if AuthManager.shared.login(username: username, password: password) {
                let mainVC = MainViewController()
                navigationController?.pushViewController(mainVC, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Incorrect email or password", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
    }

