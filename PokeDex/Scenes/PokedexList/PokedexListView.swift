import SwiftUI

struct PokedexListView: View {
    @ObservedObject private var vm: PokedexListViewModel = .init()
    
    var body: some View {
        VStack {
            List(vm.texts) { text in
                Text(text)
            }
            Button("Change") {
                withAnimation{
                    vm.changeText()
                }
            }
        }
        .onAppear() {

        }
    }
}

#Preview {
    PokedexListView()
}
