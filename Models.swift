import Foundation

struct EmulatorSystem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let iconName: String
}

struct Game: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let system: EmulatorSystem
    let romPath: String
    var artworkPath: String?
    var isFavorite: Bool = false
}
