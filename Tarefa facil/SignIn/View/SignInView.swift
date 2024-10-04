import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    @State var navigationHidden = true
    @State var showInvalidEmailAlert = false // Estado para exibir alerta de email inválido
    
    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 45) {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            
                            VStack(spacing: 25) {
                                Button(action: {
                                    print("Foi lá") // Ação de login com Google
                                }) {
                                    HStack {
                                        Image("GoogleIcon")
                                        Text("Entrar com o Google")
                                            .foregroundColor(.azulicon)
                                            .fontWeight(.bold)
                                    }
                                }
                                .frame(width: 342, height: 52)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 19)
                                        .stroke(.azulicon, lineWidth: 2)
                                )
                                
                                Text("Ou")
                                    .foregroundColor(.gray)
                                
                                // Campos de email e senha
                                VStack(spacing: 15) {
                                    TextField("Email", text: $email)
                                        .padding()
                                        .frame(width: 342, height: 52)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 19)
                                                .stroke(showInvalidEmailAlert ? Color.red : Color(UIColor.quaternaryLabel), lineWidth: 1)
                                        )
                                        .autocapitalization(.none) // Para garantir que o e-mail não tenha maiúsculas
                                        .keyboardType(.emailAddress) // Tipo de teclado apropriado
                                    
                                    SecureField("Senha", text: $password)
                                        .padding()
                                        .frame(width: 342, height: 52)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 19)
                                                .stroke(showInvalidEmailAlert ? Color.red : Color(UIColor.quaternaryLabel), lineWidth: 1)
                                        )
                                    
                                    HStack(spacing: 2) {
                                        Spacer()
                                        Text("Não tem uma conta?")
                                            .foregroundColor(.gray)
                                        
                                        
                                        ZStack{
                                            NavigationLink(
                                                destination: viewModel.signUpView(),
                                                tag: 1,
                                                selection: $action,
                                                label: { EmptyView() }
                                            )
                                        }
                                        
                                        Button("Criar conta") {
                                            self.action = 1
                                        }
                                        .foregroundColor(.azulicon)
                                    }
                                    .padding(.trailing, 30)
                                    .font(.footnote)
                                }
                                
                                // Botão de Entrar
                                Button(action: {
                                    if isValidEmail(email) {
                                        viewModel.login(email: email, password: password)
                                        print("Email: \(email)\n senha: \(password)")
                                    } else {
                                        showInvalidEmailAlert = true // Exibe alerta se o email for inválido
                                    }
                                }) {
                                    Text("Entrar")
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
                            
                            Spacer()
                        }
                        .padding(.vertical, 50)
                        
                        
                        if case SignInUIState.error(let value) = viewModel.uiState {
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(
                                        title: Text("Tarefa Fácil"),
                                        message: Text(value),
                                        dismissButton: .destructive(Text("Tentar novamente")) {
                                            viewModel.uiState = .none
                                        }
                                    )
                                }
                        }
                    }
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(navigationHidden)
                    .background(.fundoTela)
                }
            }
        }
    }
    
    // Função para validar o formato de e-mail
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}
