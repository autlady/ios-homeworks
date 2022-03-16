//
//  ViewController.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 18.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    struct Post {
        var title: String
    }

    let lastPost = Post.init(title: "Мой пост")

    let firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    let secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(buttonsStackView)
        self.buttonsStackView.addArrangedSubview(firstButton)
        self.buttonsStackView.addArrangedSubview(secondButton)
        self.activateConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
    }

    private func activateConstraints() {

        let firstStackViewConstraint =  buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let secondStackViewConstraint = buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        let leadingFirstButtonConstraint = self.firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailingFirstButtonConstraint = self.firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)

        let leadingSecondButtonConstraint = self.secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        let trailingSecondButtonConstraint = self.secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)

        NSLayoutConstraint.activate([
            firstStackViewConstraint, secondStackViewConstraint, leadingFirstButtonConstraint, trailingFirstButtonConstraint, leadingSecondButtonConstraint, trailingSecondButtonConstraint
        ])
    }

    @objc private func didTapButton() {
        let postVC = PostViewController()
        postVC.navigationItem.title = lastPost.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}
