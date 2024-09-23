import SwiftUI
import Combine

public class Lista: ObservableObject {
    var nome: String
    @Published var tarefas: [Tarefa]
    
    init(nome: String) {
        self.nome = nome
        self.tarefas = []
    }
    
    // Adiciona uma nova tarefa à lista
    func adicionarTarefa(tarefa: Tarefa) {
        tarefas.append(tarefa)
    }
    
    // Remove uma tarefa da lista com base no índice
    func removerTarefa(indice: Int) {
        if indice < tarefas.count {
            tarefas.remove(at: indice)
        }
    }
    
    // Lista todas as tarefas da lista
    func listarTarefas() {
        for (index, tarefa) in tarefas.enumerated() {
            print("\(index + 1). \(tarefa.titulo) - \(tarefa.formatarData()) às \(tarefa.formatarHora())")
        }
    }
}
