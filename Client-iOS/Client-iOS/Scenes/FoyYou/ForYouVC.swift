//
//  ForYouVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/12/23.
//

import UIKit

class ForYouVC: BaseVC {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setCollectionView()
    }
    
    // MARK: - Setup
    
    private func setStyle() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setCollectionView() {
        collectionView.backgroundColor = .yellow
    }
    
    private func registerNibs() {
        
    }
}
