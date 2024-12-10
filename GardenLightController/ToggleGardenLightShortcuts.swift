//
//  ToggleGardenLightShortcuts.swift
//  GardenLightController
//
//  Created by Krit Sudduen on 2024-12-10.
//

import AppIntents

struct ToggleGardenLightShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: ToggleGardenLightIntent(),
            phrases: ["Toggle garden light"],
            shortTitle: "Garden Light",
            systemImageName: "gardenlight"
        )
    }
}
