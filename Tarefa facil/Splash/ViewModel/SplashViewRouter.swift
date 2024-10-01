//
//  SplashViewRouter.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 23/09/24.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return ContentView(viewModel: viewModel)
    }
}
