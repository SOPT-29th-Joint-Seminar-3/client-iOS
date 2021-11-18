//
//  MyPlayListForm.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/16.
//

import UIKit
// 여기에 데이터 형태랑 더미데이터 넣어 뒀는데... TableView 그리면서 데이터 갖다 쓰면 되고... 뷰컨에 올릴 때에는 dummyMyPlayListData()만 뷰컨 내부에 옮기시면 될 듯합니다...

struct MyPlayListForm {
    var albumImage: UIImage
    var albumTitle: String
    var albumCount: Int
}

func dummyMyPlayListData() -> [MyPlayListForm] {
    var data = [MyPlayListForm]()
    for x in 1..<11 {
        data.append(MyPlayListForm(albumImage: UIImage(named: "cover_\(x)")!, albumTitle: "2021.11.09", albumCount: 5))
    }
    return data
}
