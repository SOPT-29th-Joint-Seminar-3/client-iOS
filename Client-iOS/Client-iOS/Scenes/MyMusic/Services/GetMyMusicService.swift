//
//  MyMusicService.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/12/02.
//

import Alamofire

struct GetMyMusicService {
    static let shared = GetMyMusicService()

    func requestSignIn(id: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.getMyPlayListURL + id
//        let header: HTTPHeaders = ["Content-Type": "application/json"]
//        let body: Parameters = [
//            "email": email,
//            "password": password
//        ]
        
        let request = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeSignInStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let error):
                print(error)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignInStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isVaildSignInData(data: data)
        case 400: return isVaildSignInData(data: data) // .pathErr
        case 500: return isVaildSignInData(data: data) // .serverErr
        default: return .networkFail
        }
    }
    
    private func isVaildSignInData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignInResponseData.self, from: data) else { return .pathErr }
        return .success(decodedData)
    }
}
