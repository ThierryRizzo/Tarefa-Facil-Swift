//
//  SignInView.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 23/09/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    
    var body: some View {
        
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState{
                viewModel.homeView()
            } else{
                
                NavigationView {
                    ScrollView (showsIndicators: false) {
                        
                        VStack (spacing: 45){
                            
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            
                            
                            VStack(spacing:25){
                                Button(action: {
                                    print("Foi lá") // Chama a ação se estiver definida
                                }) {
                                    Image("GoogleIcon")
                                    Text("Entrar com o Google")
                                        .foregroundColor(.azulicon)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 342, height: 52)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 19)
                                        .stroke(.azulicon, lineWidth: 2))
                                
                                Text("Ou")
                                    .foregroundColor(.gray)
                                
                                VStack{
                                    
                                    VStack (spacing: 15){
                                        TextField("Email", text: $email)
                                            .padding()
                                            .frame(width: 342, height: 52)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 19)
                                                    .stroke(.quaternary, lineWidth: 2))
                                        
                                        
                                        VStack (spacing:10) {
                                            
                                            SecureField("Senha", text: $password)
                                                .padding()
                                                .frame(width: 342, height: 52)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 19)
                                                        .stroke(.quaternary, lineWidth: 2))
                                            
                                            HStack (spacing:5){
                                                
                                                Spacer()
                                                
                                                Text("Não tem uma conta?")
                                                    .foregroundColor(.gray)
                                                
                                                
                                                
                                                
                                                ZStack {
                                                    NavigationLink(
                                                        destination: Text("Tela de cadastro"),
                                                        tag: 1,
                                                        selection: $action,
                                                        label: {EmptyView()})
                                                    
                                                    Button("Criar conta"){
                                                        self.action = 1
                                                    }
                                                    .foregroundColor(.azulicon)
                                                }
                                                
                                                
                                            }
                                            .padding(.trailing, 30)
                                            
                                            .font(.footnote)
                                        }
                                    }
                                    
                                    
                                    
                                    Button(action: {
                                        viewModel.login(email: email, password: password)
                                        print("Email: \(email)\n senha: \(password)")
                                    }) {
                                        Text("Entrar")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                    .frame(width: 342, height: 52)
                                    .background(RoundedRectangle(cornerRadius: 19)
                                        .fill(.azulicon)/*Color(red: 123/255, green: 184/255, blue: 255/255))*/)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 19)
                                            .stroke(Color("azulicon"), lineWidth: 0)
                                    )
                                    .contentShape(Rectangle()) // Garante que o botão seja clicável em toda a área
                                    .padding(.top, 30)
                                    
                                }
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            Spacer()
                            
                            
                            
                        }// Vstack
                        .padding(.vertical, 50)
                        
                        if case SignInUIState.error(let value) = viewModel.uiState{
                            Text("")
                            .alert(isPresented: .constant(true)) {
                                Alert(
                                    title: Text("Tarefa Fácil"),
                                    message: Text(value),
                                    dismissButton: .destructive(Text("Tentar novamente")) {
                                       viewModel.uiState = .none
                                    })
                                    }
                        }
                        
                    }
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(navigationHidden)
                    
                    
                }
                
            }
        }
        
        
    }// Body View
    
    
}// View



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}


