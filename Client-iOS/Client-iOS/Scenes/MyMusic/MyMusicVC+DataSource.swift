//
//  MyMusicVC+DataSource.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/18.
//

import UIKit

final class MyMusicVCDataSource: NSObject, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MyMusicSection.allCases[section] {
        case .quickMenu:    return 1
        case .myPlayList:   return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch MyMusicSection.allCases[indexPath.section] {
        case .quickMenu:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickMenuCV", for: indexPath) as! QuickMenuCV
            return cell
        case .myPlayList:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPlayListCVC.ID, for: indexPath) as! MyPlayListCVC
            let data = dummyMyPlayListData()
            cell.setData(data: data[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch MyMusicSection.allCases[indexPath.section] {
        case .myPlayList:
            // TODO: - 중복 코드 개선
            // header, footer 뷰 꺼내오는 부분 제네릭 이용해서 개선하기
            if kind == UICollectionView.elementKindSectionHeader {
                guard let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "MyPlayListHeaderView",
                    for: indexPath
                ) as? MyPlayListHeaderView else {
                    return UICollectionReusableView()
                }
                return view
            } else {
                guard let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: "MyPlayListFooterView",
                    for: indexPath
                ) as? MyPlayListFooterView else {
                    return UICollectionReusableView()
                }
                return view
            }
        default:
            return UICollectionReusableView()
        }
        
    }
}
