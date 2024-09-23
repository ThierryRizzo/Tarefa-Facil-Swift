import SwiftUI

struct ProgramadosView: View {
    
    @State private var isTaskCompleted: Bool = false // Variável de estado para controlar o status da tarefa
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 25, height: 20)
                
                Spacer()
                
                Text("Programados")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cortexto)
                
                Spacer()
                
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .opacity(0)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.top)
            
            
            
            Button(action: {print("foi")
            }) {
                HStack{
                    
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

            
            
                Button(action: {
                    isTaskCompleted.toggle() // Alterna o estado da tarefa entre concluída e não concluída
                }) {
                    HStack {
                        Image(systemName: isTaskCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(isTaskCompleted ? .green : .gray)
                            .font(.system(size: 24))
                            .padding(.trailing, 5)
                        
                        VStack {
                            Text("Ir para a consulta")
                                .foregroundColor(.cortexto)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("Amanhã, 10:30")
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray)
                            
                        }
                        
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.cortexto)
                            .font(.title2)
                    }
                    .padding()
                    .background(.fundoBt)
                    .cornerRadius(19)
                    .padding(.horizontal)
                }

            
            Spacer()
        }
        .background(.fundoTela)
    }
}

// Use um nome diferente no Preview
#Preview {
    ProgramadosView() // ou renomeie se houver conflito
}
