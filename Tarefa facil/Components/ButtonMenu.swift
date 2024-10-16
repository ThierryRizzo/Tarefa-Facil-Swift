import SwiftUI

struct OptMenu: View {
    var icon: String
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var borderColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                HStack(spacing: 10){
                    Image(systemName: icon )
                        .foregroundColor(textColor)
                        .frame(maxWidth: 20)
                    Text(title)
                        .foregroundColor(textColor) // Cor do texto
                        .fontWeight(.medium)
                }
            
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(textColor) // Cor do ícone (mesma do texto)
            }
            .padding()
            .background(backgroundColor)
            .frame(width: .infinity, height: .infinity)
            
            
        }
        
    }
}

struct OptMenu_Previews: PreviewProvider {
    static var previews: some View {
        OptMenu(
            icon: "checkmark.circle.fill",
            title: "Tarefas diárias",
            textColor: .black,
            backgroundColor: .white,
            borderColor: Color(red: 235/255, green: 235/255, blue: 235/255)
        ) {
            print("Botão clicado")
        }
    }
}
