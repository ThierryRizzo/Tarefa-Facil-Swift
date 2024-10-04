//
//  SignUpViewModel.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 03/10/24.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var uiState: SignUpUIState = .none
    
    
    
    func createAccount (email: String, password: String){
        
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            //            self.uiState = .error("erro na resposta do servidor")
            self.uiState = .goToSignInScreen/*error("Não foi dessa vez")*/
        }
    }
    
    
    
}


extension SignUpViewModel {
    
    func SignInView() -> some View {
        return SignUpViewRouter.makeSignInView()
    }
    
}
