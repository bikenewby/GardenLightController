//
//  ContentView.swift
//  GardenLightController
//
//  Created by Krit Sudduen on 2024-12-10.
//

import SwiftUI

struct ContentView: View {
    @State private var responseMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Button(action: toggleGardenLight) {
                Text("ToggleGardenLight")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Text(responseMessage)
                .padding()
        }
        .padding()
    }

    func toggleGardenLight() {
        guard let url = URL(string: "http://192.168.1.90/station1/toggleDevice1") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    responseMessage = "Error: \(error.localizedDescription)"
                }
                return
            }

            if let data = data {
                if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    DispatchQueue.main.async {
                        responseMessage = "Response: \(jsonResponse)"
                    }
                } else {
                    DispatchQueue.main.async {
                        responseMessage = "Invalid Response"
                    }
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

