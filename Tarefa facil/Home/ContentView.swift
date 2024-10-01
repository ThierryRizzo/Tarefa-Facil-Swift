import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    
    var body: some View {
        NavigationView {
            
            VStack (spacing:30){
                
                VStack(spacing:15) {
                    
                    HStack(spacing: 15) {
                        
                        
                        BotaoMain(
                            icon: "calendar",
                            number: "2",
                            title: "Hoje",
                            iconColor: .azulicon,
                            textColor: .cortexto,
                            titleColor: .cortexto,
                            backgroundColor: .fundoBt,
                            imgWidth: 30,
                            imgheight: 28,
                            bordercolor: .bordercor
                        )
                        
                        
                        
                        
                        BotaoMain(icon: "calendar.badge.clock",
                                  number: "7",
                                  title: "Agendados",
                                  iconColor: .vermelhoicon,
                                  textColor: .cortexto,
                                  titleColor: .cortexto,
                                  backgroundColor: .fundoBt,
                                  imgWidth: 35,
                                  imgheight: 30,
                                  bordercolor: .bordercor) {
                            print("Botão 'Agendados' clicado")
                        }
                    }
                    
                    HStack(spacing: 15){
                        BotaoMain(icon: "tray.fill",
                                  number: "9",
                                  title: "Todos",
                                  iconColor: .orange,
                                  textColor: .cortexto,
                                  titleColor: .cortexto,
                                  backgroundColor: .fundoBt,
                                  imgWidth: 33,
                                  imgheight: 25,
                                  bordercolor: .bordercor) {
                            print("Botão 'Todos' clicado")
                        }
                        
                        BotaoMain(icon: "checkmark.circle.fill",
                                  number: "2",
                                  title: "Concluídos",
                                  iconColor: .green,
                                  textColor: .cortexto,
                                  titleColor: .cortexto,
                                  backgroundColor: .fundoBt,
                                  imgWidth: 30,
                                  imgheight: 30,
                                  bordercolor: .bordercor) {
                            print("Botão 'Concluídos' clicado")
                        }
                        
                        
                    }
                }
                
                
                VStack(spacing: 20){
                    
                    HStack{
                        
                        Text("Listas")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.cortexto)
                        
                        Spacer()
                        
                        Menu {
                            Button(action: {
                                print("Criar nova lista clicado")
                                // Ação para criar uma nova lista
                            }) {
                                Label("Criar nova lista", systemImage: "plus")
                            }
                            
                            Button(action: {
                                print("Deletar lista clicado")
                                // Ação para deletar a lista
                            }) {
                                Label("Deletar lista", systemImage: "trash")
                            }
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.cortexto)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    
                    
                    ScrollView{
                        VStack{
                            
                            Listas(title: "Tarefas Diárias",
                                   textColor: .cortexto,
                                   backgroundColor: .fundoBt,
                                   borderColor: .bordercor){
                                print("Botão 'Concluídos' clicado")
                            }
                            
                            Listas(title: "Remédios",
                                   textColor: .cortexto,
                                   backgroundColor: .fundoBt,
                                   borderColor: .bordercor){
                                print("Botão 'Concluídos' clicado")
                            }
                            
                            Listas(title: "Trabalho",
                                   textColor: .cortexto,
                                   backgroundColor: .fundoBt,
                                   borderColor: .bordercor){
                                print("Botão 'Concluídos' clicado")
                            }
                            
                            
                            
                        }
                    }
                    
                }
                
                
                //                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 38, height: 32)
                                .foregroundColor(.azulicon)
                            Text("Início")
                                .foregroundColor(.azulicon)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    // Ícone de Adicionar
                    Button(action: {
                        // Ação para adicionar nova lista
                    }) {
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.coriconsBar)
                            Text("Adicionar")
                                .foregroundColor(.coriconsBar)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    // Ícone de Perfil
                    Button(action: {
                        // Ação para ir ao perfil
                    }) {
                        VStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.coriconsBar)
                            Text("Perfil")
                                .foregroundColor(.coriconsBar)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.fundoBt)
                .frame(height: 40)
            }
            .padding(.top)
            .background(.fundoTela)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: HomeViewModel())
    }
}
