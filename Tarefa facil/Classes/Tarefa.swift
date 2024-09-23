import SwiftUI
import Combine

class Tarefa: ObservableObject, Identifiable {
    var id = UUID()
    var titulo: String
    var data: Date
    var hora: String
    @Published var isCompleted: Bool // Usamos @Published para que o SwiftUI observe as mudanças
    
    init(titulo: String, data: Date, hora: String, isCompleted: Bool = false) {
        self.titulo = titulo
        self.data = data
        self.hora = hora
        self.isCompleted = isCompleted
    }
    
    // Formata a data para exibição
    func formatarData() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: data)
    }
    
    // Formata a hora para exibição
    func formatarHora() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Formato de 24 horas
        guard let date = formatter.date(from: hora) else { return hora } // Retorna a hora original se não puder converter
        formatter.dateFormat = "hh:mm a" // Formato de 12 horas com AM/PM
        return formatter.string(from: date)
    }
}
