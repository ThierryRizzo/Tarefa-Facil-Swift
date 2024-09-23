//
//  AddTaskHome.swift
//  Tarefa facil
//
//  Created by Thierry Rizzo on 16/09/24.
//

import SwiftUI

struct AddTaskHome: View {
    @State private var name: String = ""
    @State private var selectedTime: Date = Date()
    @State private var date: Date = Date()
    @State private var selectedItem: String = ""
    
    let items = ["Lista","Tarefas diárias", "Remédios", "Trabalho"]
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .opacity(0)
                
                Spacer()
                
                Text("Nova Tarefa")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cortexto)
                
                Spacer()
                
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .opacity(0)
                
            }// Título e opções
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.top)
            
            VStack {
                
                TextField("Nome da tarefa", text: $name)
                    .padding()
                    .background(.fundoBt)
                    .cornerRadius(19)
                    .overlay(
                        RoundedRectangle(cornerRadius: 19)
                            .stroke(.bordercor, lineWidth: 1))
                    .frame(maxWidth: 364)
                
//                Divider()
                
                DatePicker("Data:", selection: $date, displayedComponents: .date)
                    .padding(.horizontal)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Divider()
                
                HStack {
                    
                    Text("Escolha o Horário:")
                        .fontWeight(.regular)
                        .foregroundColor(.cortexto)
                    
                    Spacer()
                    
                    DatePicker("Horário", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(CompactDatePickerStyle()) // Estilo Compacto
                        .labelsHidden()
                    
                }
                .frame(maxWidth: 364)
                
                Divider()
                
                HStack{
                    
                    Text("Escolha uma lista:")
                        .fontWeight(.regular)
                        .foregroundColor(.cortexto)
                    
                    Spacer()
                    
                    Picker("Selecione uma lista", selection: $selectedItem) {
                        ForEach(items, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                    
                }
                .frame(maxWidth: 364)
                .padding(0)
                
                
                Divider()
                
                
                Button(action: {
                    print("isso")
                }) {
                    HStack (spacing: 10) {
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        
                        
                        
                        Text("Criar Tarefa")
                            .foregroundColor(.white) // Cor do texto
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            
                    }
                    .padding(.horizontal)
                    .cornerRadius(19)
                    .frame(width: 180, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 19)
                            .stroke(.white, lineWidth: 0)
                    
                    )
                }
                .background(name.isEmpty ? .gray : .green)
                .cornerRadius(19)
                .overlay(
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(.bordercor, lineWidth: 0))
                .padding()
                
                
                
            }
            
            
            Spacer()
            
            HStack {
                
                Button(action: {
                    
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 38, height: 32)
                            .foregroundColor(.coriconsBar)
                        Text("Início")
                            .foregroundColor(.coriconsBar)
                    }
                }
                .frame(maxWidth: .infinity)
                
                
                Button(action: {
                    
                }) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.azulicon)
                        Text("Adicionar")
                            .foregroundColor(.azulicon)
                    }
                }
                .frame(maxWidth: .infinity)
                
                // Ícone de Perfil
                Button(action: {
                    // Ação para ir ao perfil
                }) {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.coriconsBar)
                        Text("Config.")
                            .foregroundColor(.coriconsBar)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(.fundoBt)
            .frame(height: 40)
            
        }// VStack total
        .background(.fundoTela)
    }
    
}

#Preview {
    AddTaskHome()
}
