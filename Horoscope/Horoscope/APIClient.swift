//
//  APIClient.swift
//  Horoscope
//
//  Created by Ian Bailey on 1/13/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import Foundation

import NetworkHelper


struct HoroscopeAPI {
    static func getHoroscope( completion: @escaping (Result <[Horoscope], AppError>) -> ()) {
        
        
//        let horoscopeSign = scope.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "virgo"
        
        let horoscopeURL = "http://sandipbgt.com/theastrologer/api/horoscope/all/today"
        
        guard let url = URL(string: horoscopeURL) else {
            completion(.failure(.badURL(horoscopeURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    let horoscopeResult = try JSONDecoder().decode([Horoscope].self, from: data)
                    completion(.success(horoscopeResult))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            }
        }
    }
}

//for scope: String,
