//
//  MyMusicService.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/12/02.
//

import Alamofire

struct GetMyMusicService {
    static let shared = GetMyMusicService()
    
    func requestGetMyMusic(id: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.getMyPlayListURL + id
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeMyMusicStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let error):
                print(error)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeMyMusicStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isVaildMyMusicData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isVaildMyMusicData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GetMyMusicResponseData.self, from: data) else { return .pathErr }
        return .success(decodedData)
    }
}
