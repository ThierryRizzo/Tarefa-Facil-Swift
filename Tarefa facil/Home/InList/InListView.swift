import SwiftUI

struct InListView: View {
    
    @State private var isTaskCompleted: Bool = false // Variável de estado para controlar o status da tarefa
    @State private var tarefa = Tarefa(titulo: "Ir para a consulta", data: Date(), hora: "10:30", isCompleted: false)
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 25, height: 20)
                
                Spacer()
                
                Text("Tarefas diárias")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cortexto)
                
                Spacer()
                
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.top)
            
            
            
            Button(action: {
                print ("Tela Add tarefa da lista")
            }) {
                
                HStack{
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.azulicon)
                        
                        
                    
                    Text("Adicionar Tarefa")
                        .foregroundColor(.azulicon)
                }
                .padding(16)
                
                
                Spacer()
                    
            }
            

            TarefaView(tarefa: tarefa)
                            .onTapGesture {
                                tarefa.isCompleted.toggle() // Alterna o estado da tarefa entre concluída e não concluída
                            }

            
            Spacer()
        }
        .background(.fundoTela)
    }
}

// Use um nome diferente no Preview
#Preview {
    InListView() // ou renomeie se houver conflito
}
