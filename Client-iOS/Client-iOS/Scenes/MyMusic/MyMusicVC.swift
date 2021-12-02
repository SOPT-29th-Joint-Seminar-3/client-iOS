//
//  MyMusicVC.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/13.
//

import UIKit

final class MyMusicVC: BaseVC {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    private let dataSource = MyMusicVCDataSource()
    let getMyMusicService = GetMyMusicService.shared
    
    // MARK: - Life cycles
    
    override func viewWillAppear(_ animated: Bool) {
        fetchMyMusicData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setCollectionView()
        registerNibs()
    }
    
    // MARK: - Setup
    
    private func setStyle() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
    
    private func registerNibs() {
        collectionView.register(
            UINib(nibName: "QuickMenuCV",bundle: nil),
            forCellWithReuseIdentifier: "QuickMenuCV"
        )
        
        collectionView.register(
            UINib(nibName: "MyPlayListHeaderView",bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "MyPlayListHeaderView")
        
        collectionView.register(
            UINib(nibName: MyPlayListCVC.ID,bundle: nil),
            forCellWithReuseIdentifier: MyPlayListCVC.ID
        )
        
        collectionView.register(
            UINib(nibName: "MyPlayListFooterView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "MyPlayListFooterView"
        )
    }
    
    // MARK: - Custom Method
    
    private func fetchMyMusicData() {
        getMyMusicService.requestGetMyMusic(id: "1") { responseData in
            switch responseData {
            case .success(let myMusicResponse):
                guard let response = myMusicResponse as? GetMyMusicResponseData else { return }
                self.dataSource.countList = [
                    response.data?.likeCount ?? 0,
                    response.data?.saveCount ?? 0,
                    response.data?.recentPlayedCount ?? 0,
                    response.data?.mostPlayedCount ?? 0
                ]
                self.dataSource.myPlayList = response.data?.likes ?? [MyPlayListData]()
                self.dataSource.dataCount = (response.data?.likes.count ?? 0) / 2
                self.collectionView.reloadData()

            default:
                print("데이터 불러오기 실패")
            }
        }
    }
}

// MARK: - CollectionView Delegate
extension MyMusicVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch MyMusicSection.allCases[indexPath.section] {
        case .myPlayList:
            let vc = UIStoryboard(name: "PlaylistDetailVC", bundle: nil)
                .instantiateViewController(withIdentifier: "PlaylistDetailVC") as! PlaylistDetailVC
            show(vc, sender: self)
        default:
            return
        }
    }
}
