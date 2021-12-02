//
//  PlaylistService+Creation.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/12/03.
//

import Foundation
import Alamofire

/**
 PlaylistDetailService에서 만들어진 코드를 재사용하기 위해
 extension으로 서비스 코드를 작성했습니다.
 
 플레이리스트 생성 서비스입니다.
 */
extension PlaylistDetailService {
    public func createPlaylist(
        title: String,
        completion: @escaping (NetworkResult<Any>) -> ()
    ) {
        let url = APIConstants.addNewPlayListURL
        let parameters: Parameters = [
            "title": title,
            "description": "\(title)입니다."
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
                let networkResult = self.judgePlaylistDetailStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
}
