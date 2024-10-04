//
//  SignUpViewRouter.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 04/10/24.
//

import SwiftUI

enum SignUpViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
}
