//
//  QuickMenuCV.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/16.
//

import UIKit

class QuickMenuCV: UICollectionViewCell {
    
    // MARK: - Dummy Data
    var categoryList = ["내가 좋아한", "내가 보관한", "최근 재생한", "많이 재생한"]
    var iconList = [""]
    var countList = [55, 2, 127, 87]
    
    @IBOutlet weak var quickMenuCollectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quickMenuCollectionView.dataSource = self
        quickMenuCollectionView.delegate = self
        
        registerNib()
    }
    
    func registerNib() {
        let xibName = UINib(nibName: "QuickMenuCVC", bundle: nil)
        quickMenuCollectionView.register(xibName, forCellWithReuseIdentifier: "QuickMenuCVC")
    }
}

extension QuickMenuCV: UICollectionViewDelegate {
    
}

extension QuickMenuCV: UICollectionViewDelegateFlowLayout {
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

extension QuickMenuCV: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickMenuCVC", for: indexPath) as? QuickMenuCVC else {return UICollectionViewCell()}
    
        cell.iconImageView.backgroundColor = .yellow
        cell.backImageView.backgroundColor = .gray.withAlphaComponent(0.5)
        cell.countLabel.text = "\(countList[indexPath.item])곡"
        cell.categoryLabel.text = "\(categoryList[indexPath.item])"
        
        let font = UIFont.systemFont(ofSize: 14)
        let fullText = cell.countLabel.text ?? ""
        let range = (fullText as NSString).range(of: "곡")
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        cell.countLabel.attributedText = attributedString
        
        return cell
    }
}
