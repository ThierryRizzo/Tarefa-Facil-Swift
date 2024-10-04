//
//  SignUpView.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 03/10/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var showInvalidEmailAlert = false
    
    @State private var showAlert: Bool = false
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var document = ""
    @State var phone = ""
    @State var birthday = ""
    //Gênero
    
    
    var body: some View {
        
        ZStack {
            Color.fundoTela
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack{
                    
                    VStack{
                        emailField
                        passwordField
                        btnCriar
                        Spacer()
                    }
                    .padding(.top, 30)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Certificando-se de que o VStack ocupe toda a tela
            }
            .navigationTitle("Criar conta")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Tarefa Fácil"),
                message: Text("Conta criada com sucesso!"),
                dismissButton: .default(Text("OK")) {
                    print("Saiu do App")
                }
            )
        }
    }
        
    
}

    
    


extension SignUpView {
    var emailField: some View {
        TextField("Email", text: $email)
            .padding()
            .frame(width: 342, height: 52)
            .overlay(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(showInvalidEmailAlert ? Color.red : Color(UIColor.quaternaryLabel), lineWidth: 1)
            )
            .autocapitalization(.none) // Para garantir que o e-mail não tenha maiúsculas
            .keyboardType(.emailAddress)
            .autocorrectionDisabled(true)
    }
}

extension SignUpView {
    var passwordField: some View {
        SecureField("Senha", text: $password)
            .padding()
            .frame(width: 342, height: 52)
            .overlay(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(showInvalidEmailAlert ? Color.red : Color(UIColor.quaternaryLabel), lineWidth: 1)
            )
    }
}






extension SignUpView {
    var btnCriar: some View {
        Button(action: {
            if isValidEmail(email) {
                viewModel.createAccount(email: email, password: password)
                print("Email: \(email)\n senha: \(password)")
                showAlert.toggle()
                
            } else {
                showInvalidEmailAlert = true // Exibe alerta se o email for inválido
            }
        }) {
            Text("Criar conta")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 342, height: 52)
        .background(RoundedRectangle(cornerRadius: 19)
            .fill(.azulicon))
        .overlay(
            RoundedRectangle(cornerRadius: 19)
                .stroke(.azulicon, lineWidth: 0)
        )
        .contentShape(Rectangle()) // Garante que o botão seja clicável em toda a área
        .padding(.top, 30)
        .alert(isPresented: $showInvalidEmailAlert) {
            Alert(title: Text("Email inválido"), message: Text("Por favor, insira um email válido."), dismissButton: .default(Text("OK")))
        }
    }
}



func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignUpViewModel()
        SignUpView(viewModel: viewModel)
    }
}
