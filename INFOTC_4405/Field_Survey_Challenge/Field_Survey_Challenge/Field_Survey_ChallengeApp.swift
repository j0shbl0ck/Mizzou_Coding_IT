//
//  Field_Survey_ChallengeApp.swift
//  Field_Survey_Challenge
//
//  Created by Josh Block on 11/10/22.
//

import SwiftUI

struct FieldData: Codable, Identifiable {
    var id = UUID()
    let status: String
    var observations: [Field]
    
    enum CodingKeys: String,CodingKey {
        case status
        case observations
    }
}

struct Field: Codable, Identifiable {
    var id = UUID()
    let classification: String
    let title: String
    let description: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case classification
        case title
        case description
        case date
    }
}

class FieldLoader {
    class func load(jsonFileName: String) -> FieldData? {
        var fieldData: FieldData?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                fieldData = try? jsonDecoder.decode(FieldData.self, from: jsonData)
        }
        return fieldData
    }
}

@main
struct Field_Survey_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
