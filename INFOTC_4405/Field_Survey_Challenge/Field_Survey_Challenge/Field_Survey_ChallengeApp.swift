//
//  Field_Survey_ChallengeApp.swift
//  Field_Survey_Challenge//
//  Created by Josh Block on 11/14/22.
//

import SwiftUI
import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct FieldObservation: Codable, Identifiable {
    var id = UUID()
    var classification: Classification
    var title: String
    var description: String
    var date: Date

    private enum CodingKeys: String, CodingKey {
        case classification, title, description, date
    }
}

struct FieldObservations: Codable {
    var status: String
    var observations: [FieldObservation]
}

class FieldObservationsLoader {
    class func load(jsonFileName: String) -> FieldObservations? {
        var fieldObservations: FieldObservations?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                fieldObservations = try? jsonDecoder.decode(FieldObservations.self, from: jsonData)
            }

        return fieldObservations
    }
}

@main
struct Field_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
