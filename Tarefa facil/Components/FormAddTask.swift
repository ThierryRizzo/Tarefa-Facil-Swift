import SwiftUI

struct FormView: View {
    @State private var name: String = ""
    @State private var date: Date = Date()
    @State private var time: Date = Date()
    @State private var selectedItem: String = ""
    @State private var isTimePickerVisible: Bool = false
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4"] // Opções para o Picker
    
    // Formato para exibir a hora
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Campo para nome (String)
            TextField("Nome da tarefa", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Campo para data
            DatePicker("Data", selection: $date, displayedComponents: .date)
                .padding()
                .datePickerStyle(CompactDatePickerStyle())
            
            // Campo para horário como TextField
            TextField("Horário", text: Binding(
                get: { timeFormatter.string(from: time) },
                set: { _ in }
            ))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onTapGesture {
                isTimePickerVisible.toggle() // Exibe o seletor de horário
            }
            
            // Picker para selecionar o item
            Picker("Selecione um item", selection: $selectedItem) {
                ForEach(items, id: \.self) {
                    Text($0)
                }
            }
            .padding()
            .pickerStyle(MenuPickerStyle()) // Estilo expansível ao clicar
            
            Spacer() // Para espaçar os campos na tela
        }
        .padding()
        .sheet(isPresented: $isTimePickerVisible) {
            // Seletor de horário exibido em uma folha (sheet)
            VStack {
                DatePicker("Selecione o horário", selection: $time, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                Button("Confirmar") {
                    isTimePickerVisible = false
                }
                .padding()
            }
            .padding()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

import SwiftUI

struct TimePickerView: View {
    @State private var selectedTime: Date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Escolha o Horário")
                .font(.headline)
            
            // DatePicker no modo Compacto
            DatePicker("Horário", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle()) // Estilo Compacto
                .labelsHidden()
            
            Text("Horário selecionado: \(timeFormatted)")
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
    }
    
    // Função para formatar o horário
    var timeFormatted: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: selectedTime)
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView()
    }
}
