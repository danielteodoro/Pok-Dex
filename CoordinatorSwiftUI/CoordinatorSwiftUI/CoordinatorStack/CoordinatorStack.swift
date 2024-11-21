//
//  CoordinatorStack.swift
//  CoordinatorSwiftUI
//
//  Created by Daniel Teodoro on 11/11/24.
//

import SwiftUI

struct CoordinatorStack<CoordinatorPage: Coordinatable>: View {

    @State private var coordinator = Coordinator<CoordinatorPage>()

    var body: some View {
        NavigationStack(path: $coordinator.path) {

        }
    }
}
