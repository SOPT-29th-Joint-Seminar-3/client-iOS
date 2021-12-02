//
//  PlaylistDetailVC+DataSource.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/24.
//

import UIKit

final class PlaylistDetailVCDataSource: NSObject, UICollectionViewDataSource {
    var data : PlaylistDetailData?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch PlaylistDetailSection.allCases[section] {
        case .albumCover:   return 1
        case .albumTrack:   return data?.songs?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch PlaylistDetailSection.allCases[indexPath.section] {
        case .albumCover:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCVC", for: indexPath) as? AlbumCoverCVC else { return UICollectionViewCell() }
            if let albumCoverData = data {
                cell.setData(data: albumCoverData)
                cell.arrowButton.alpha = 1.0
            }
            return cell
            
        case .albumTrack:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumTrackCVC.ID, for: indexPath) as! AlbumTrackCVC
            if let albumTrackData = data?.songs {
                cell.albumImageView.image = UIImage(named: "cover_\(indexPath.row+1)")
                cell.setData(data: albumTrackData[indexPath.row])
            }
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
            
            view.songCountLabel.text = "\(data?.total ?? 0)"
            
            return view
        default: return UICollectionReusableView()
        }
    
    }
}

