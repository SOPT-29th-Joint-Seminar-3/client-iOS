//
//  AlbumTrackListForm.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/19.
//

import UIKit

struct AlbumTrackListForm {
    var albumImage: UIImage
    var songTitle: String
    var artist: String
}

func dummyAlbumTrackListData() -> [AlbumTrackListForm] {
    var data = [AlbumTrackListForm]()
    for x in 1..<6 {
        data.append(AlbumTrackListForm(albumImage: UIImage(named: "cover_\(x)")!, songTitle: "21", artist: "Gracie Abrams"))
    }
    return data
}
