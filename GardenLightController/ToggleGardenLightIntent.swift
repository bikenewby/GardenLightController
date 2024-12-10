//
//  ToggleGardenLightIntent.swift
//  GardenLightController
//
//  Created by Krit Sudduen on 2024-12-10.
//

import AppIntents

struct ToggleGardenLightIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Garden Light"

    func perform() async throws -> some IntentResult {
        await callToggleGardenLightAPI()
        return .result()
    }

    func callToggleGardenLightAPI() async {
        guard let url = URL(string: "http://192.168.1.90/station1/toggleDevice1") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            let (_, _) = try await URLSession.shared.data(for: request)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

