//
//  PlaylistBookmarkModel.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/12/03.
//

import Foundation

// MARK: - PlaylistBookmarkModel
struct PlaylistBookmarkModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: PlaylistBookmarkData?
}

// MARK: - PlaylistBookmarkData
struct PlaylistBookmarkData: Codable {
    let id, userId, playlistId: Int
}
