//
//  LogInViewController.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 19.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setUpView()
        self.tapGesture()
        self.infoTextField.delegate = self
        self.passwordTextField.delegate = self
        }

    private lazy var logoImageView: UIImageView = {

        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView

    }()

    private lazy var stackView: UIStackView = {  // Создаем стек инициализации
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16

        return stackView
    }()

    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var infoTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email or phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clearButtonMode = .whileEditing
         textField.clearButtonMode = .unlessEditing
         textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clearButtonMode = .whileEditing
         textField.clearButtonMode = .unlessEditing
         textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        let image = UIImage(named: "blue_pixel")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = UIColor(named: "Color")

        if button.isSelected {
            button.alpha = 0.8
        } else if button.isHighlighted {
            button.alpha = 0.8
        } else if !button.isEnabled {
            button.alpha = 0.8
        } else {
            button.alpha = 1
        }
        button.addTarget(self, action: #selector(self.didTapLogInButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setUpView() {

        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(logoImageView)
        self.stackView.addArrangedSubview(textFieldStackView)
        self.stackView.addArrangedSubview(logInButton)
        self.textFieldStackView.addArrangedSubview(infoTextField)
        self.textFieldStackView.addArrangedSubview(passwordTextField)

        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let contentViewCenterConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let contentViewWidth = self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewBottomAnchor = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)

        let topLogoConstraint = self.logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)

        let heightLogoConstraint = self.logoImageView.heightAnchor.constraint(equalToConstant: 100)

        let widthLogoConstraint = self.logoImageView.widthAnchor.constraint(equalToConstant: 100)

        let centerLogoConstraint = self.logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)

        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let stackViewBottomAnchor = self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -300)

        let infoTextFieldHeightAnchor = self.infoTextField.heightAnchor.constraint(equalToConstant: 50)
        let passwordTextFieldHeightAnchor = self.passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        let heightButtonConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)



        NSLayoutConstraint.activate([ scrollViewTopConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, scrollViewLeftConstraint, contentViewCenterConstraint, contentViewWidth, contentViewTopConstraint, contentViewBottomAnchor, topLogoConstraint, heightLogoConstraint, widthLogoConstraint,  centerLogoConstraint, stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, stackViewBottomAnchor, infoTextFieldHeightAnchor, passwordTextFieldHeightAnchor, heightButtonConstraint])
}
    private func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        self.view.addGestureRecognizer(tapGesture)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }

    @objc private func didTapLogInButton() {
        if logInButton.isSelected {
            logInButton.alpha = 0.8
        } else if logInButton.isHighlighted {
            logInButton.alpha = 0.8
        } else if !logInButton.isEnabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1
        }

        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)

    }
}
