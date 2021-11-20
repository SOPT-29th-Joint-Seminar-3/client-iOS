//
//  MyMusicVC+Layout.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/18.
//

import UIKit

extension MyMusicVC {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex, env) -> NSCollectionLayoutSection? in
            switch MyMusicSection.allCases[sectionIndex] {
            case .quickMenu:        return self?.quickMenuSectionLayout()
            case .myPlayList:       return self?.playListLayout()
            default: return nil
//            case .playStatus:       return self?.playStatusSectionLayout()
            }
        }
    }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(130)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
    }
    
    func quickMenuSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1))
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(380)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func playListLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(86)
            ),
            subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 9, leading: 15, bottom: 9, trailing: 15
        )

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }
    

}
