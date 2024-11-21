import SwiftUI

struct PokedexListView: View {
    @ObservedObject private var viewModel: PokedexListViewModel = .init()

    var body: some View {
        VStack {
            List(viewModel.texts) { text in
                Text(text)
            }
            Button("Change") {
                withAnimation {
                    viewModel.changeText()
                }
            }
        }
    }
}

#Preview {
    PokedexListView()
}
