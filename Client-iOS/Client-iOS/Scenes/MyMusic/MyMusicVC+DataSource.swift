//
//  MyMusicVC+DataSource.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/18.
//

import UIKit

final class MyMusicVCDataSource: NSObject, UICollectionViewDataSource {
    // 데이터 가변적으로 보여주기 위한 변수
    var dataCount = 5
    var countList = [0, 0, 1, 0]
    var dataCount = 0
    var countList = [0, 0, 0, 0]
    var myPlayList = [MyPlayListData]()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MyMusicSection.allCases[section] {
        case .quickMenu:    return 1
        case .myPlayList:   return dataCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch MyMusicSection.allCases[indexPath.section] {
        case .quickMenu:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickMenuCV", for: indexPath) as! QuickMenuCV
            cell.countList = countList
            cell.quickMenuCollectionView.reloadData()
            return cell
        case .myPlayList:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPlayListCVC.ID, for: indexPath) as! MyPlayListCVC
//            let data = dummyMyPlayListData()
//            cell.setData(data: data[indexPath.row])
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
                // 🙋🏻‍♂️ - 이 부분에서 데이터 개수만 변경해주면서 펼치기/접기 눌렀을 때 아이템 개수 조절
                view.action = { [weak self] (state: ToggleState) in
                    switch state {
                    case .fold:
                        self?.dataCount = 10
                    case .unfold:
                        self?.dataCount = 5
                    }
                    collectionView.reloadData()
                }
                return view
            }
        default:
            return UICollectionReusableView()
        }
        
    }
}
