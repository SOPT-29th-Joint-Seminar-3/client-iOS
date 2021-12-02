//
//  MyPlayListForm.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/16.
//

import Foundation
import UIKit

struct GetMyMusicResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: GetMyMusicResultData?
}

struct GetMyMusicResultData: Codable {
    let likeCount: Int
    let saveCount: Int
    let recentPlayedCount: Int
    let mostPlayedCount: Int
    let likes: [MyPlayListData]
}

struct MyPlayListData: Codable {
    let id: Int
    let title: String
    let description: String
}

//func dummyMyPlayListData() -> [MyPlayListForm] {
//    var data = [MyPlayListForm]()
//    for x in 1..<11 {
//        data.append(MyPlayListForm(albumImage: UIImage(named: "cover_\(x)")!, albumTitle: "2021.11.09", albumCount: 5))
//    }
//    return data
//}
