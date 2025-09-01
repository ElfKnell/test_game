//
//  EncodableExtension.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

extension Encodable {
    
    func toFirestoreData() throws -> [String: Any] {
        
        let data = try JSONEncoder().encode(self)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionary = json as? [String: Any] else {
            throw NSError(
                domain: "EncodingError",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Failed to encode object"]
            )
        }
        return dictionary
        
    }
}
