//
//  ViewController.swift
//  UIContextMenuInteractionExample
//
//  Created by Domo on 12/11/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.collectionViewLayout = CollectionViewController.makeCollectionViewLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            // Create an action for sharing
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
                // Show share sheet
            }

            // Create an action for copy
            let rename = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc")) { action in
                // Perform copy
            }

            // Create an action for delete with destructive attributes (highligh in red)
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
                // Perform delete
            }

            // Create a UIMenu with all the actions as children
            return UIMenu(title: "", children: [share, rename, delete])
        }
    }
    
    private static func makeCollectionViewLayout() -> UICollectionViewLayout {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 3),
                                                 heightDimension: .fractionalHeight(1))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)

           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalWidth(1.0 / 3))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                          subitem: item,
                                                          count: 3)
           group.interItemSpacing = .fixed(10)

           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 10

           return UICollectionViewCompositionalLayout(section: section)
       }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = Data.colors[indexPath.row]
        cell.backgroundColor = Data.colors[indexPath.row]
        return cell
    }

}

