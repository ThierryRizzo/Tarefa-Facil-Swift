import SwiftUI

struct BotaoMain: View {
    var icon: String
    var number: String
    var title: String
    var iconColor: Color
    var textColor: Color
    var titleColor: Color
    var backgroundColor: Color
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 35, height: 25)
                        .foregroundColor(iconColor)
                    Spacer()
                    Text(number)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(textColor)
                }
                
                HStack {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                        .foregroundColor(titleColor)
                        .font(.system(size: 16))
                }
            }
            .padding(15)
            .frame(maxWidth: 172, maxHeight: 77)
            .background(backgroundColor)
            .cornerRadius(19)
            .overlay(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(Color(red: 235/255, green: 235/255, blue: 235/255), lineWidth: 1)
            )
        }
    }
}
