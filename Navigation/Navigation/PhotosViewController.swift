//
//  PhotosViewController.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 23.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private enum Constants {
        static let itemCount: CGFloat = 3
    }

var images = [UIImage]()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8

        return layout
    }()

private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
}()


override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .lightGray
    self.view.addSubview(self.collectionView)

    for i in 0...19 {
        if let image = UIImage(named: "cat\(i)") {
            images.append(image)
        }
    }

    let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
    let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
    let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

    NSLayoutConstraint.activate([
        topConstraint, leftConstraint, rightConstraint, bottomConstraint
    ])
}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Photo Gallery"
    }

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        let image = images[indexPath.item]
        cell.photoImageView.image = image

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
            let image = images[indexPath.item]
            cell.photoImageView.image = image
        cell.frame = self.view.bounds
        cell.contentMode = .scaleAspectFit
        cell.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissImage))
        cell.addGestureRecognizer(tap)
        self.view.addSubview(cell)
        }
    @objc func dismissImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
}


