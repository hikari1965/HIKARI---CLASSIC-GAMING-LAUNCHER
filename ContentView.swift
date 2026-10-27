import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: LibraryManager
    @State private var selectedGame: Game?
    
    var body: some View {
        NavigationView {
            List(library.systems) { system in
                Label(system.name, systemImage: system.iconName)
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200)
            
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                    TextField("Search games...", text: $library.searchText)
                }
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                        ForEach(library.filteredGames) { game in
                            GameCard(game: game)
                                .onTapGesture { selectedGame = game }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("HIKARI Library")
        }
        .preferredColorScheme(.dark)
    }
}

struct GameCard: View {
    let game: Game
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .cornerRadius(8)
                .overlay(Image(systemName: "gamecontroller").font(.largeTitle).foregroundColor(.white.opacity(0.5)))
            
            Text(game.title).font(.headline).lineLimit(1)
            Text(game.system.name).font(.caption).foregroundColor(.secondary)
        }
        .padding(8)
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsManager
    var body: some View {
        Form {
            Toggle("Performance Mode (Intel Optimization)", isOn: $settings.performanceMode)
            Toggle("Enable Shaders", isOn: $settings.enableShaders)
        }
        .frame(width: 400, height: 300)
        .padding()
    }
}
