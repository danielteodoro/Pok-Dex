//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Daniel Teodoro on 26/10/24.
//

import SwiftUI

@main
struct PokeDexApp: App {
    @State private var selection = 0
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
