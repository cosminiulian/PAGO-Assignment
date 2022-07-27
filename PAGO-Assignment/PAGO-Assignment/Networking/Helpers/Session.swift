//
//  Session.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

struct Session {
    
    static let shared = Session()
    private let session = URLSession.shared
    
    private init() { }
    
    typealias Completion<T> = (Result<T, NetworkError>) -> Void
    
    func request<T: Decodable>(httpMethod: HTTPMethod,
                               urlString: String,
                               headers: [String: String]? = nil,
                               bodyData: Data? = nil,
                               completion: @escaping Completion<T>) {
        
        // Check the validity of the URL
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        // Create the URL request
        let urlRequest = createURLRequest(httpMethod: httpMethod,
                                          url: url,
                                          headers: headers,
                                          bodyData: bodyData)
        // Data task
        let task = session.dataTask(with: urlRequest) { data, response, error in
            // Check for error
            if let error = error {
                completion(.failure(.existingError(description: error.localizedDescription)))
                return
            }
            // Check the validity of the response
            guard let response = response as? HTTPURLResponse, response.isSuccessful else {
                completion(.failure(.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)))
                return
            }
            // Check the validity of the data
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            // Decode data
            do {
                let value = try JSONDecoder().decode(T.self, from: data)
                completion(.success(value))
            } catch {
                completion(.failure(.failedToDecode))
            }
        }
        task.resume() // execute the data task
    }
    
    // Create the URL Request
    func createURLRequest(httpMethod: HTTPMethod,
                          url: URL,
                          headers: [String: String]? = nil,
                          bodyData: Data? = nil) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = bodyData
        
        let dataIsLoaded = UserDefaults.standard.bool(forKey: UserDefaultsKey.dataIsLoaded)
        if dataIsLoaded {
            print("Load from the cache")
            // Load from the cache
            request.cachePolicy = .returnCacheDataDontLoad
        } else {
            print("Load from the source")
            // Load from the source
            request.cachePolicy = .reloadIgnoringLocalCacheData
            UserDefaults.standard.set(true, forKey: UserDefaultsKey.dataIsLoaded)
        }
        
        return request
    }
    
}
