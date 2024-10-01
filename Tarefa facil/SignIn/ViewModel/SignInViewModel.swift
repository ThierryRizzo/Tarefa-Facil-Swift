//
//  SignInViewModel.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 23/09/24.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    func login (email: String, password: String){
        
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            //            self.uiState = .error("erro na resposta do servidor")
            self.uiState = .goToHomeScreen/*error("Não foi dessa vez")*/
        }
    }
    
}

extension SignInViewModel {
    
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
}

