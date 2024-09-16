import SwiftUI

struct BotaoMain: View {
    var icon: String
    var number: String
    var title: String
    var iconColor: Color
    var textColor: Color
    var titleColor: Color
    var backgroundColor: Color
    var imgWidth: Double
    var imgheight: Double
    var bordercolor: Color
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: imgWidth, height: imgheight)
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
                        .fontWeight(.medium)
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
                    .stroke(bordercolor, lineWidth: 1)
            )
        }
    }
}
