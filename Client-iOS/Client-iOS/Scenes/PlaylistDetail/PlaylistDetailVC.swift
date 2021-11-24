//
//  PlaylistDetailVC.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/13.
//

import UIKit

final class PlaylistDetailVC: BaseVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let dataSource = PlaylistDetailVCDataSource()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setCollectionView()
        registerNibs()
    }
    
    private func setStyle() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.dataSource = dataSource
    }
    
    private func registerNibs() {
        collectionView.register(
            UINib(nibName: "AlbumCoverCVC",bundle: nil),
            forCellWithReuseIdentifier: "AlbumCoverCVC"
        )
        
        collectionView.register(
            UINib(nibName: "AlbumTrackHeaderView",bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "AlbumTrackHeaderView")
        
        collectionView.register(
            UINib(nibName: AlbumTrackCVC.ID,bundle: nil),
            forCellWithReuseIdentifier: AlbumTrackCVC.ID
        )
    }
}
