//
//  PlaylistDetailModel.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/30.
//

import Foundation

// MARK: - PlaylistDetailModel
struct PlaylistDetailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: PlaylistDetailData
}

// MARK: - PlaylistDetailData
struct PlaylistDetailData: Codable {
    let id: Int
    let title, dataDescription: String
    let total: Int
    let songs: [Song]

    enum CodingKeys: String, CodingKey {
        case id, title
        case dataDescription = "description"
        case total, songs
    }
}

// MARK: - Song
struct Song: Codable {
    let name, singer: String
}
