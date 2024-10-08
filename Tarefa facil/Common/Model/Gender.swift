//
//  Gender.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 06/10/24.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    
    case male = "Masculino"
    case famale = "Feminino"
    
    var id: String{
        self.rawValue
    }
    
}
