//
//  SplashViewModel.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 23/09/24.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
            //            self.uiState = .error("erro na resposta do servidor")
            self.uiState = .goToSignInScreen
        }
        
    }
}

extension SplashViewModel {
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
    
}

extension SplashViewModel {
    func HomeView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
    
}

