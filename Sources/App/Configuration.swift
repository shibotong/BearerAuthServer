//
//  File.swift
//  
//
//  Created by Shibo Tong on 24/7/2024.
//

import Foundation

@MainActor
class Configuration: Codable {
    static let config: Configuration = {
        let configPath = "/BearerAuth/config.json"
        if let configuration = readFile(atPath: configPath) {
            return configuration
        } else {
            return Configuration(tokens: [], targetURL: "")
        }
    }()
    
    let tokens: [String]
    let targetURL: String
    
    init(tokens: [String], targetURL: String) {
        self.tokens = tokens
        self.targetURL = targetURL
    }
}

func readFile(atPath path: String) -> Configuration? {
    do {
        let fileURL = URL(filePath: path)
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        return try decoder.decode(Configuration.self, from: data)
    } catch {
        print("Error reading file: \(error)")
        return nil
    }
}
