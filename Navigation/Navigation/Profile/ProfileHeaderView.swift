//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 28.02.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "lazy_cat"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        return stackView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lazy Cat"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Sleeping"
        label.textColor = .gray
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите статус"
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        self.drawSelf()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        self.addSubview(stackView)
        self.addSubview(textField)
        self.addSubview(setStatusButton)
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(labelStackView)
        self.labelStackView.addArrangedSubview(fullNameLabel)
        self.labelStackView.addArrangedSubview(statusLabel)
        self.textField.delegate = self

        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.topAnchor)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

        let avatarImageViewWidthConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 138)
        let avatarImageViewHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 138)

        let buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 16)
        let buttonLeadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonBottomConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)

        let topTextFieldConstraint = self.textField.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -10)
        let leadingTextFieldConstraint = self.textField.leadingAnchor.constraint(equalTo: self.labelStackView.leadingAnchor)
        let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 40)
        let trailingTextFieldConstraint = self.textField.trailingAnchor.constraint(equalTo: self.labelStackView.trailingAnchor)

        NSLayoutConstraint.activate([ stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, avatarImageViewWidthConstraint, buttonTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, avatarImageViewHeightConstraint, buttonHeightConstraint, buttonBottomConstraint, topTextFieldConstraint, leadingTextFieldConstraint, heightTextFieldConstraint, trailingTextFieldConstraint
        ])
    }

    private var statusText: String? = nil

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }

    @objc private func didTapStatusButton() {
        guard textField.text != "" else {
            textField.vibrate()
            return
        }
        statusText = textField.text!
        statusLabel.text = "\(statusText ?? "")"
        self.textField.text = nil
        self.endEditing(true)
    }
}

extension UIView {
    func vibrate() {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.05
    animation.repeatCount = 5
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
    layer.add(animation, forKey: "position")
    }
}

