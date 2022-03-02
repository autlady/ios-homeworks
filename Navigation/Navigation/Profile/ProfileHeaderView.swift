//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 28.02.2022.
//

import UIKit


class ProfileHeaderView: UIView {

    private lazy var imageView: UIImageView = {


        let imageView = UIImageView()

        imageView.image = UIImage(named: "lazy_cat")
        imageView.frame = CGRect(x: 16,y: 16,width: 150,height: 150)
        imageView.layer.borderWidth = 3.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 75
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = true

        return imageView

    }()


    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 180, y: 27, width: 135, height: 30)
        label.text = "Lazy Cat"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = true
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
        textField.isHidden = true
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing // Кнопка «Очистить» при редактировании
         textField.clearButtonMode = .unlessEditing // не появляется во время редактирования, кнопка редактирования появляется после редактирования
         textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
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
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func drawSelf() {
        self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.statusButton)


        let leadingButtonConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor)
        let trailingButtonConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let topButtonConstraint = self.statusButton.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 16)
        let heightButtonConstraint = self.statusButton.heightAnchor.constraint(equalToConstant: 50)

        let bottomLabelConstraint = self.statusLabel.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -34)
        let leadingLabelConstraint = self.statusLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor)
        let heightLabelConstraint = self.statusLabel.heightAnchor.constraint(equalToConstant: 30)

        NSLayoutConstraint.activate([ bottomLabelConstraint, leadingLabelConstraint, heightLabelConstraint,  leadingButtonConstraint, trailingButtonConstraint, topButtonConstraint, heightButtonConstraint
        ].compactMap({ $0 }))
    }


    @objc private func didTapStatusButton() {
        let status = self.statusLabel.text
        if status != nil {
        print(status!)
}
}
}




