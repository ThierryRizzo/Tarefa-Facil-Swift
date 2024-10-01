import SwiftUI

struct SplashView: View {

    @State private var showFirstLogo: Bool = true
    @ObservedObject var viewModel: SplashViewModel
    
    // Estado para controlar a exibição do alerta
    @State private var showAlert: Bool = false
    @State private var errorMessage: String? = nil

    var body: some View {
        
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()

            case .goToSignInScreen:
                viewModel.signInView()

            case .goToHomeScreen:
                viewModel.HomeView()
                
            case .error(let msg):
                // Atualiza o estado de exibição do alerta
                loadingView()
                    .onAppear {
                        self.errorMessage = msg
                        self.showAlert = true
                    }
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Tarefa Fácil"),
                message: Text(errorMessage ?? "Unknown Error"),
                dismissButton: .destructive(Text("Sair")) {
                    print("Saiu do App")
                }
            )
        }
    }
}

extension SplashView {
    
    func loadingView() -> some View {
        ZStack {
            if showFirstLogo {
                Image("Logo 2")
                    .resizable()
                    .frame(width: 300, height: 140)
                    .transition(.opacity)
            } else {
                Image("Logo")
                    .resizable()
                    .frame(width: 300, height: 140)
                    .transition(.opacity)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { _ in
                withAnimation(.linear(duration: 0.7)) {
                    showFirstLogo.toggle()
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
