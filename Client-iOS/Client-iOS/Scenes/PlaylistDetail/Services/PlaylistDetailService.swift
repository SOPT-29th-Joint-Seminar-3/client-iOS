//
//  PlaylistDetailService.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/30.
//

import Foundation

import Alamofire

struct PlaylistDetailService {
    static let shared = PlaylistDetailService()
    
    func getPlaylistDetail(userId: Int,
                           completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.getMyPlayListDetailURL(id: "\(userId)")
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default)
        
        dataRequest.responseData { response in
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
    
    func judgePlaylistDetailStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return getPlaylistDetailData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func getPlaylistDetailData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(PlaylistDetailModel.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
}
