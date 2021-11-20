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
        setCollectionView()
        registerNibs()
    }
    
    private func setCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.dataSource = dataSource
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
