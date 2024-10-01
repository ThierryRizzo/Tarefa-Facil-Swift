//
//  SignInViewRouter.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 30/09/24.
//

import SwiftUI

enum SignInViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return ContentView(viewModel: viewModel)
    }
}
