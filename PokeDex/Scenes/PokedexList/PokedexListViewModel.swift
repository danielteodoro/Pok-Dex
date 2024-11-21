import Combine
import Foundation
import SwiftUI

class PokedexListViewModel: ObservableObject {
    @Published var texts: [String] = [
        "Hello, World!",
        "Hi, Planet",
        "Bye, moon"
    ]
    
    func changeText() {
        texts.sort(by: { $0.count < $1.count })
        print("Changed")
    }
}

extension String: @retroactive Identifiable {
    public var id: Self { self }
}
