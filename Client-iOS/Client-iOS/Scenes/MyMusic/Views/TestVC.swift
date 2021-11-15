//
//  TestVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/15.
//

import UIKit

class TestVC: UIViewController {
    
    // MARK: - Dummy Data
    var categoryList = ["내가 좋아한", "내가 보관한", "최근 재생한", "많이 재생한"]
    var iconList = [""]
    var countList = [55, 2, 127, 87]

    @IBOutlet weak var testCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testCollectionView.dataSource = self
        testCollectionView.delegate = self
    
        registerNib()
    }
    
    func registerNib() {
        let xibName = UINib(nibName: "QuickMenuCVC", bundle: nil)
        testCollectionView.register(xibName, forCellWithReuseIdentifier: "QuickMenuCVC")
    }

}

extension UIViewController: UICollectionViewDelegate {
    
}

extension UIViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 162, height: 162)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension UIViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickMenuCVC", for: indexPath) as? QuickMenuCVC else {return UICollectionViewCell()}
    
        cell.iconImageView.backgroundColor = .yellow
        cell.backImageView.backgroundColor = .gray.withAlphaComponent(0.5)
        cell.count = 555
        cell.categoryLabel.text = "내가 좋아하는"
        
        return cell
    }
    
    
}
