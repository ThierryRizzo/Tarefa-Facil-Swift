import SwiftUI

struct ConfigHome: View {
    
    // Estado do toggle para controlar o modo noturno
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .opacity(0)
                
                Spacer()
                
                Text("Configurações")
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
            
            
            VStack (spacing: 0){
                
                OptMenu(title: "Perfil", textColor: .cortexto, backgroundColor: .fundoBt, borderColor: .bordercor) {
                    print("Foi")
                }
                
                Divider()
                
                OptMenu(title: "Idioma", textColor: .cortexto, backgroundColor: .fundoBt, borderColor: .bordercor) {
                    print("Foi")
                }
                
                Divider()
                
                OptMenu(title: "Acessibilidade", textColor: .cortexto, backgroundColor: .fundoBt, borderColor: .bordercor) {
                    print("Foi")
                }
                
                Divider()
                
                OptMenu(title: "Notificações", textColor: .cortexto, backgroundColor: .fundoBt, borderColor: .bordercor) {
                    print("Foi")
                }
            }
            .padding(0)
    
            Spacer()
            
            
            
            
            
            
            
            HStack {
                Button(action: {
                    // Ação para o botão Início
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 38, height: 32)
                            .foregroundColor(.coriconsBar)
                        Text("Início")
                            .foregroundColor(.coriconsBar)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    // Ação para o botão Adicionar
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
                    // Ação para o perfil
                }) {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.azulicon)
                        Text("Config.")
                            .foregroundColor(.azulicon)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(.fundoBt)
            .frame(height: 40)
        }
        .background(.fundoTela)
    }
}

struct TarefaFacilApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ConfigHome()
                .preferredColorScheme(isDarkMode ? .dark : .light) // Define o modo de cor baseado no toggle
        }
    }
}

#Preview {
    ConfigHome()
}
