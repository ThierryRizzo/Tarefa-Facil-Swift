import SwiftUI
import AVKit

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    // Estado para controlar a exibição do alerta
    @State private var showAlert: Bool = false
    @State private var errorMessage: String? = nil
    
    // AVPlayer para o vídeo da splash
    @State private var player: AVPlayer? // Mudamos para @State
    @State private var isVideoPlaying = true // Controla o estado do vídeo

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
                loadingView()
                    .onAppear {
                        self.errorMessage = msg
                        self.showAlert = true
                    }
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
            setupPlayer() // Configura o player quando a view aparece
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
    
    // Função para configurar o player
    private func setupPlayer() {
        guard let url = Bundle.main.url(forResource: "Splash Screen", withExtension: "mp4") else {
            print("Video não encontrado")
            return
        }
        
        player = AVPlayer(url: url)
        player?.play() // Inicie a reprodução
        
        // Observa a conclusão do vídeo
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
            isVideoPlaying = false
            viewModel.onAppear() // Muda o estado para ir para a SignInView
        }
    }
}

extension SplashView {
    
    func loadingView() -> some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
                    .ignoresSafeArea(.all)
                    .onAppear {
                        player.play() // Certifique-se de que o vídeo começa a tocar
                    }
            } else {
                Color.white // Cor de fundo enquanto o vídeo está carregando
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
