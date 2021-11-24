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
    
    // MARK: - Life cycles
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
    }
}

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
