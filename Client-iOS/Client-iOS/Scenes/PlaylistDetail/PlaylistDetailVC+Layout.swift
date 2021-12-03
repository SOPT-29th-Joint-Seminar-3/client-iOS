//
//  PlaylistDetailVC+Layout.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/24.
//

import UIKit

extension PlaylistDetailVC {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex, env) -> NSCollectionLayoutSection? in
            switch PlaylistDetailSection.allCases[sectionIndex] {
            case .albumCover:        return self?.albumCoverSectionLayout()
            case .albumTrack:       return self?.albumTrackSectionLayout()
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
    
    func albumCoverSectionLayout() -> NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = []
        return section
    }
    
    func albumTrackSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(61)
            ),
            subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 14, leading: 20, bottom: 0, trailing: 20
        )

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }
    

}
