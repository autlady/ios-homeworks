//
//  ProfileViewController.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 19.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.setupNavigationBar()
        self.setUpView()
        tapGesture()
        }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Profile"
    }

    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private func setUpView() {

        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.statusButton)

        self.profileHeaderView.backgroundColor = .lightGray

        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)

        let leadingStatusButtonConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingStatusButtonConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomStatusButtonConstraint = self.statusButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let heightStatusButtonConstraint = self.statusButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, self.heightConstraint, leadingStatusButtonConstraint, trailingStatusButtonConstraint, bottomStatusButtonConstraint, heightStatusButtonConstraint
        ].compactMap({ $0 }))
    }
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        self.view.addGestureRecognizer(tapGesture)
    }
}

extension ProfileViewController: ProfileHeaderViewProtocol {

    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 250 : 220

        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}


