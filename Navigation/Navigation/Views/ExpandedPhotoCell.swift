//
//  ExpandedCell.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 14.04.2022.
//

import UIKit

protocol ExpandedCellDelegate: AnyObject {
    func pressedButton(view: ExpandedPhotoCell)
}

class ExpandedPhotoCell: UIView {
    weak var delegate: ExpandedCellDelegate?
    var pressButtonCancel = UITapGestureRecognizer()

    lazy var imageExpandedCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var buttonCancel: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(systemName: "multiply.square")
        button.tintColor = .white
        button.alpha = 0
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        drawSelf()
        setupGesture()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        self.addSubview(imageExpandedCell)
        self.addSubview(buttonCancel)

        NSLayoutConstraint.activate([
            imageExpandedCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageExpandedCell.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageExpandedCell.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageExpandedCell.heightAnchor.constraint(equalTo: self.widthAnchor),
            buttonCancel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110),
            buttonCancel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            buttonCancel.widthAnchor.constraint(equalToConstant: 30),
            buttonCancel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setupGesture() {
        pressButtonCancel.addTarget(self, action: #selector(pressedButton(_:)))
        buttonCancel.addGestureRecognizer(pressButtonCancel)
    }

    @objc func pressedButton(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.pressedButton(view: self)
    }
}
