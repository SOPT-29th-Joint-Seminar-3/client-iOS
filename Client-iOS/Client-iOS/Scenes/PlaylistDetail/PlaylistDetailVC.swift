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
        fetchPlaylistDetail()
        setStyle()
        setCollectionView()
        registerNibs()
        setNotification()
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
    
    private func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(pop), name: Notification.Name("pop"), object: nil)
    }
    
    func fetchPlaylistDetail() {
        PlaylistDetailService.shared.getPlaylistDetail(userId: 1) { responseData in
            switch responseData {
            case .success(let listResponse):
                guard let response = listResponse as? PlaylistDetailModel else { return }
                if let totalData = response.data {
                    self.dataSource.data = totalData
                    self.collectionView.reloadData()
                }

            case .requestErr(let msg):
                print("requestErr \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}
