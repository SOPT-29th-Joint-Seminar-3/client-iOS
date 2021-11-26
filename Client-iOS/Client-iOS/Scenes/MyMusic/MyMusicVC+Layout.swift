//
//  MyMusicVC+Layout.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/18.
//

import UIKit

// Compositional Layout을 이용해서 레이아웃을 잡았습니다.
// PlaylistDetail 뷰도 동일
extension MyMusicVC {
    /// 각 섹션을 조합해 전체 영역에 대한 레이아웃 생성
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex, env) -> NSCollectionLayoutSection? in
            switch MyMusicSection.allCases[sectionIndex] {
            case .quickMenu:        return self?.quickMenuSectionLayout()
            case .myPlayList:       return self?.playListLayout()
            }
        }
    }
    
    /// Playlist HeaderView Layout
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(130)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
    }
    
    /// QuickMenu Layout
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
    
    /// Playlist Layout
    /// 플레이리스트 셀에 관한 영역
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
