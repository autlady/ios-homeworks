//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 23.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    var images = [UIImage]()

    private enum Constant {
        static let itemCount: CGFloat = 4
    }


    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var arrowImage: UIImageView = {

        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
         imageView.clipsToBounds = true

        return imageView

    }()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8

        return layout
    }()

    private lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")

        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .systemGray6
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.photosLabel)
        self.stackView.addArrangedSubview(self.arrowImage)
        self.backView.addSubview(photoCollectionView)
        activateConstraints()
        for i in 0...19 {
            if let image = UIImage(named: "cat\(i)") {
                images.append(image)
            }
    }
    }

    func activateConstraints() {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)

        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)

        let imageYAnchor = self.arrowImage.centerYAnchor.constraint(equalTo: self.photosLabel.centerYAnchor)

        let photoCollectionViewTopConstraint = self.photoCollectionView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor)
        let photoCollectionViewLeadingConstraint = self.photoCollectionView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let photoCollectionViewTrailingConstraint = self.photoCollectionView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let photoCollectionViewConstraint = self.photoCollectionView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12)
        let photoCollectionViewHeight = self.photoCollectionView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, bottomConstraint, trailingConstraint,
            stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint,
            photoCollectionViewTopConstraint, photoCollectionViewLeadingConstraint,
            photoCollectionViewTrailingConstraint, photoCollectionViewConstraint,
            photoCollectionViewHeight, imageYAnchor
        ])
    }

    func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize { // размеры ячейки
        let needWidth = width - 4 * spacing
        let itemWidth = floor(needWidth / Constant.itemCount)

        return CGSize(width: itemWidth, height: itemWidth)
    }
}


extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
            let image = images[indexPath.item]
            cell.photoImageView.image = image

            return cell
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
            return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
        }
}


