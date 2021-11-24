//
//  PlaylistDetailVC+DataSource.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/24.
//

import UIKit

final class PlaylistDetailVCDataSource: NSObject, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch PlaylistDetailSection.allCases[section] {
        case .albumCover:    return 1
        case .albumTrack:   return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch PlaylistDetailSection.allCases[indexPath.section] {
        case .albumCover:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCVC", for: indexPath) as? AlbumCoverCVC else { return UICollectionViewCell() }
            return cell
        case .albumTrack:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumTrackCVC.ID, for: indexPath) as! AlbumTrackCVC
            let data = dummyAlbumTrackListData()
            cell.setData(data: data[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch PlaylistDetailSection.allCases[indexPath.section] {
        case .albumTrack:
            guard let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "AlbumTrackHeaderView",
                for: indexPath
            ) as? AlbumTrackHeaderView else {
                return UICollectionReusableView()
            }
            return view
        default: return UICollectionReusableView()
        }
    
    }
}

