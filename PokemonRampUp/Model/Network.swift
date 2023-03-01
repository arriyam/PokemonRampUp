//
//  Network.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-14.
//
import Foundation
import UIKit

// TO-DO [POKEMON-0012] Create unit test for Network model
protocol Network {
    func loadJSONObject<T: Decodable>(stringURL: String, type: T.Type) async throws -> T
    func loadUIImage(urlString: String?) async throws -> UIImage?
}

struct DefaultNetwork: Network {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

     func loadJSONObject<T: Decodable>(stringURL: String, type: T.Type) async throws -> T {
         guard let url = URL(string: stringURL) else {
             throw NetworkError.invalidURL
         }

         guard let (data, _) = try? await urlSession.data(from: url) else{
             throw NetworkError.requestError
         }

         let decoder = JSONDecoder()
         decoder.keyDecodingStrategy = .convertFromSnakeCase
         guard let objectT = try? decoder.decode(T.self, from: data) else {
             throw NetworkError.dateParseError
         }

         return objectT
     }
    
    func loadUIImage(urlString: String?) async throws -> UIImage? {
        if (urlString == nil){
            return nil
        }
        
        guard let url = URL(string: urlString!) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidURL
        }

        guard let image = UIImage(data: data) else {
            throw NetworkError.invaildImageData
        }
        return image
    }
 }
