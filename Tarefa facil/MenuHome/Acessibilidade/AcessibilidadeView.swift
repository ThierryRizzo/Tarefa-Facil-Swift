import SwiftUI

struct AcessibilidadeView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @AppStorage("fontSize") private var fontSize: Double = 16 // Define o tamanho padrão da fonte
    
    var body: some View {
        
        VStack{
            
            HStack {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 25, height: 20)
                    
                
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
            
            
            VStack {
            HStack {
                Toggle(isOn: $isDarkMode) {
                    HStack {
                        Image(systemName: "moon")
                        Text("Modo Noturno")
                            .foregroundColor(.cortexto)
                            .font(.system(size: CGFloat(fontSize)))
                            .fontWeight(.medium)
                    }
                }
            }
            .padding()
            .background(.fundoBt)
                
                
            
                Divider()
                
                
                
                VStack (spacing: 0){
                    
                    HStack{
                        
                        Image(systemName: "textformat")
                        
                        Text("Tamanho da Fonte")
                            .font(.system(size: CGFloat(fontSize)))
                            .foregroundColor(.cortexto)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding()
                    
                    
                    Slider(value: $fontSize, in: 16...20, step: 1) {
                        Text("Tamanho da Fonte")
                    }
                    .padding()
                    
                    
                    HStack{
                        Image(systemName: "textformat.size.smaller")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Spacer()
                        
                        Image(systemName: "textformat.size.larger")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                }
                
                
            }
            .background(.fundoBt)
            
            Spacer()
        
        }
        .background(.fundoTela)
        
    }
}
    
#Preview {
    AcessibilidadeView()
}
