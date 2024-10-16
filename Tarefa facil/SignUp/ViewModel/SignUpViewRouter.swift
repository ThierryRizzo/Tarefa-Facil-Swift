//
//  SignUpViewRouter.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 04/10/24.
//

import SwiftUI


enum SignUpViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return ContentView(viewModel: viewModel)
    }
    
}
