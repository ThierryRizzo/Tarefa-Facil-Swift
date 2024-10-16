//
//  SignInViewModel.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 23/09/24.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    let publisher = PassthroughSubject<Bool, Never>()
    
    
    
    @Published var uiState: SignInUIState = .none
    
    
    init() {
        cancellable = publisher.sink { value in
            print ("Usuário criado com sucesso! \(value)")
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    
    deinit {
        
    }
    
    
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
    
    func signUpView() -> some View {
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}

