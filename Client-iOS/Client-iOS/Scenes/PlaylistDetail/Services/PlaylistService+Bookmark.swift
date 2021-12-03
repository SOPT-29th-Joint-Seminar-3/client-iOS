//
//  PlaylistService+Bookmark.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/12/03.
//

import Foundation
import Alamofire

extension PlaylistDetailService {
    public func bookmarkPlaylist(
        userId: Int,
        playlistId: String,
        completion: @escaping (NetworkResult<Any>) -> ()
    ) {
        let url = APIConstants.likeMyPlayListURL(id: playlistId)
        let parameters: Parameters = [
            "user_id": userId
        ]
        let request = AF.request(url,
                                 method: .post,
                                 parameters: parameters,
                                 encoding: JSONEncoding.default)
        
        request.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                let networkResult = self.judgePlaylistBookmarkStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    func judgePlaylistBookmarkStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return getPlaylistBookmarkData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func getPlaylistBookmarkData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(PlaylistBookmarkModel.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
}
