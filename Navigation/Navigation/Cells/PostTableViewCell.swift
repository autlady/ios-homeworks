//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 20.03.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    struct ViewModel: ViewModelProtocol {
        var author, description, image: String
        var likes: Int
        var views: Int
    }

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical) // свойства нужны чтобы autolayout правильно располагал элементы
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
//        imageView.contentMode = .scaleAspectFill

        return imageView
    }()


    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var likesLabel: UILabel = { // количество лайков
        let label = UILabel()
        label.text  = "Likes:"
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var viewsLabel: UILabel = { // количество просмотров
        let label = UILabel()
        label.text  = "Views: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() { //обнуление информации в ячейках
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.postImageView.image = nil
        self.descriptionLabel.text = nil
        self.viewsLabel.text = nil
        self.likesLabel.text = nil
    }

    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.backView.addSubview(self.authorLabel)
        self.backView.addSubview(self.postImageView)
        self.backView.addSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.likesLabel)
        self.stackView.addArrangedSubview(self.viewsLabel)

        let backViewConstraints = self.backViewConstraints()
        let authorLabelConstraints = self.authorLabelConstraints()
        let imageConstraints = self.imageConstraints()
        let descriptionLabelConstraints = self.descriptionLabelConstraints()
        let stackViewConstraints = self.stackViewConstraints()

        NSLayoutConstraint.activate(
            backViewConstraints +
            authorLabelConstraints +
            imageConstraints +
            descriptionLabelConstraints +
            stackViewConstraints)
    }

    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }

    private func authorLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.authorLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let leadingConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)

        return [
            topConstraint, leadingConstraint, trailingConstraint
        ]
    }

    private func imageConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let leadingConstraint = self.postImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.postImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let widthImageView = self.postImageView.heightAnchor.constraint(equalTo: self.backView.widthAnchor, multiplier: 1.0)

        return [
            topConstraint, leadingConstraint, trailingConstraint, widthImageView
        ]
    }

    private func descriptionLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16)
        let leadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)

        return [
            topConstraint, leadingConstraint, trailingConstraint
        ]
    }

    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
}

extension PostTableViewCell: Setupable { // загружаем модель

    func setup(with viewModel: ViewModelProtocol) { // наполнение ячейки
        guard let viewModel = viewModel as? ViewModel else { return }

        self.authorLabel.text = viewModel.author
        self.postImageView.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text? += String(viewModel.likes)
        self.viewsLabel.text? += String(viewModel.views)

    }
}


