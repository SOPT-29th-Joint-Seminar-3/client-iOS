//
//  APIConstants.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/27.
//

struct APIConstants {
    // MARK: Base URL
    static let baseURL = "https://asia-northeast3-wesopt29-328c5.cloudfunctions.net/api"
    
    // MARK: Feature URL
    static let getMyPlayListURL = baseURL + "/user/"
    static let addNewPlayListURL = baseURL + "/playlist"
    
    static func getMyPlayListDetailURL(id: String) -> String {
        return baseURL + "/playlist/\(id)"
    }
    
    static func likeMyPlayListURL(id: String) -> String {
        return baseURL + "/playlist/\(id)/like"
    }
}
