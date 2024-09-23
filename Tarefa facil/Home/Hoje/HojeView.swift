import SwiftUI

struct HojeView: View {
    
    @StateObject private var tarefa = Tarefa(titulo: "Consulta", data: Date(), hora: "08:00", isCompleted: false)
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // Botão de voltar, se necessário
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .onTapGesture {
                            // Ação para voltar
                        }
                    
                    Spacer()
                    
                    Text("Hoje")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.cortexto)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .opacity(0) // Deixa o botão de opções invisível por enquanto
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.top)
                
                Button(action: { print("foi") }) {
                    HStack {
                        Text("Tarefas Diárias")
                            .foregroundColor(.cortexto)
                            .fontWeight(.bold)
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.cortexto)
                            .font(.headline)
                        
                        Spacer()
                    }
                    .padding()
                }
                
                // Exibição da Tarefa usando o TarefaView
                TarefaView(tarefa: tarefa)
                
                Spacer()
            }
            .background(.fundoTela)
            .navigationBarHidden(true) // Oculta a barra de navegação padrão
        }
    }
}

// Preview
#Preview {
    HojeView()
}
