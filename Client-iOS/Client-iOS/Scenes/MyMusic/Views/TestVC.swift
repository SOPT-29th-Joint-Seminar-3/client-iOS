//
//  TestVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/15.
//

import UIKit

class TestVC: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var testCollectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        testCollectionView.dataSource = self
        testCollectionView.delegate = self
        testCollectionView.contentInsetAdjustmentBehavior = .never
    
        registerNib()
    }
    
    // MARK: - Custom Method
    func registerNib() {
//        let xibName = UINib(nibName: "QuickMenuCV", bundle: nil)
//        testCollectionView.register(xibName, forCellWithReuseIdentifier: "QuickMenuCV")
        
        let xibName = UINib(nibName: "AlbumCoverCVC", bundle: nil)
        testCollectionView.register(xibName, forCellWithReuseIdentifier: "AlbumCoverCVC")
    }

}

// MARK: - UICollectionViewDelegate
extension TestVC: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TestVC: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 380)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UICollectionViewDataSource
extension TestVC: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickMenuCV", for: indexPath) as? QuickMenuCV else {return UICollectionViewCell()}
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCoverCVC", for: indexPath) as? AlbumCoverCVC else {return UICollectionViewCell()}
//
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}
