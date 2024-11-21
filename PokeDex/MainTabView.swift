import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    let pokemonListView: PokedexListView = .init()

    var body: some View {
        TabView(selection: $selection) {
            pokemonListView
            .tabItem {
                Text("Pokedex")
                Icon(selection == 0 ? .pokeballFilled : .pokeballOutline)
            }
                .tag(0)

            Text("Region")
                .tabItem {
                    Icon(selection == 1 ? .pokeRegionFilled : .pokeRegionOutline)
                    Text("Region")
                }
                .tag(1)

            Text("Favorites")
                .tabItem {
                    Icon(selection == 2 ? .favoritesFilled : .favoritesOutline)
                    Text("Favorites")
                }
                .tag(2)
        }
        .tint(.blueTintColor)
    }
}

#Preview {
    MainTabView()
}
