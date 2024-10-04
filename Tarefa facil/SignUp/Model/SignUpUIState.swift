//
//  SignUpUIState.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 04/10/24.
//

import Foundation

enum SignUpUIState{
    case none
    case loading
    case goToSignInScreen
    case error(String)
}
