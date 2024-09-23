import SwiftUI

struct TarefaView: View {
    @ObservedObject var tarefa: Tarefa // Observa as mudanças no modelo Tarefa
    
    var body: some View {
        Button(action: {
            tarefa.isCompleted.toggle() // Alterna o estado da tarefa entre concluída e não concluída
        }) {
            HStack {
                Image(systemName: tarefa.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(tarefa.isCompleted ? .green : .gray)
                    .font(.system(size: 24))
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text(tarefa.titulo)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                    
                    Text("\(tarefa.formatarData()), \(tarefa.hora)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(.primary)
                    .font(.title2)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(19)
            .padding(.horizontal)
        }
    }
}
