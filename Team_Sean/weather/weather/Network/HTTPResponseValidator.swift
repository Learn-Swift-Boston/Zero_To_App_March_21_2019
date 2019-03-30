//
//  HTTPResponseValidator.swift
//  weather
//
//  Created by Jamie Chu on 3/30/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import Foundation

enum FetchResult<T: Decodable, U: Error> {
    case success(T)
    case failure(U)
}

struct HTTPResponseValidator<T: Decodable, U: Error> {
    private let validResponseCodes = (200..<300)
    private let sessionTuple: (data: Data?, response: URLResponse?, error: Error?)
    private let decoder = JSONDecoder()
    
    init(sessionTuple: (data: Data?, response: URLResponse?, error: Error?)) {
        self.sessionTuple = sessionTuple
    }
    
    //this will return a Result based on
    var validationResult: FetchResult<T, NetworkErrors> {
        if let error = sessionTuple.error {
            return .failure(.clientSide(error))
        }
        
        guard let responseCode = (sessionTuple.response as? HTTPURLResponse)?.statusCode else {
            return .failure(.noResponse)
        }
        
        guard validResponseCodes.contains(responseCode) else {
            return .failure(.badResponseCode(responseCode))
        }
        
        guard let data = sessionTuple.data else {
            return .failure(.noData)
        }
        
        let decodableInstance: T? = validate(data: data)
        guard let validDecodableInstance = decodableInstance else {
            print("serialization error for type: \(type(of: decodableInstance))")
            return .failure(.deserialization)
        }
        
        return .success(validDecodableInstance)
    }
    
    // MARK: - Helpers
    private func validate<V: Decodable>(data: Data) -> V? {
        let instance = try? decoder.decode(V.self, from: data)
        return instance
    }
}
