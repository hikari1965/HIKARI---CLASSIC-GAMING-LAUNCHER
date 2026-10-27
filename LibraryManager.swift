import SwiftUI
import Combine

class LibraryManager: ObservableObject {
    @Published var games: [Game] = []
    @Published var systems: [EmulatorSystem] = [
        EmulatorSystem(name: "PlayStation 2", iconName: "gamecontroller"),
        EmulatorSystem(name: "GameCube", iconName: "gamecontroller.fill")
    ]
    @Published var searchText: String = ""
    
    var filteredGames: [Game] {
        if searchText.isEmpty { return games }
        return games.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    init() {
        games = [
            Game(title: "God of War II", system: systems[0], romPath: "/roms/ps2/gow2.iso"),
            Game(title: "Super Mario Sunshine", system: systems[1], romPath: "/roms/gc/sms.iso")
        ]
    }
}

class SettingsManager: ObservableObject {
    @Published var performanceMode: Bool = false
    @Published var enableShaders: Bool = true
}
