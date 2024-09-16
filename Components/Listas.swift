import SwiftUI

struct Listas: View {
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
                Text(title)
                    .foregroundColor(textColor) // Cor do texto
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(textColor) // Cor do ícone (mesma do texto)
            }
            .padding()
            .background(backgroundColor) // Cor de fundo
            .cornerRadius(19)
            .frame(width: 358, height: 51)
            .overlay(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(borderColor, lineWidth: 1) // Cor da borda
            )
        }
    }
}

struct Listas_Previews: PreviewProvider {
    static var previews: some View {
        Listas(
            title: "Tarefas diárias",
            textColor: .black,
            backgroundColor: .white,
            borderColor: Color(red: 235/255, green: 235/255, blue: 235/255)
        ) {
            print("Botão clicado")
        }
    }
}
