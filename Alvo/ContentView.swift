//
//  ContentView.swift
//  Alvo
//
//  Created by Cáren Sousa on 08/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var target = Int.random(in: 1...100)
    @State private var sliderNumber: Double = 50
    @State private var pointsLost: Int = 0
    @State private var showingAlert = false
    @State private var alertText = ""
    
    func calcPointsLost() {
        var PointsLostPerMove = 0
        
        if target >= Int(sliderNumber) {
            PointsLostPerMove = target - Int(sliderNumber)
        }
        else {
            PointsLostPerMove = (target - Int(sliderNumber)) * (-1)
        }
        
        pointsLost = pointsLost + PointsLostPerMove
    }
    
    func wonorLost() -> Bool {
        if target == Int(sliderNumber) {
            return true
        }
        return false
    }
    
    func updateTarget() {
        target = Int.random(in: 1...100)
    }
    
    
//um objeto que está em conformidade com o Viewprotocolo, mas não queremos dizer o q
    var body: some View {
        
        ZStack{
            Color.yellow.ignoresSafeArea()
            
            VStack {
                VStack() {
                    Text("Total de pontos perdidos = \(pointsLost)")
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                }
                VStack {
                        Text("Arrisque onde está o número...")
                            .bold()
                }
                    
                VStack {
                    Text("\(target)")
                }
                
                HStack {
                    Text("1")
                    Slider(value: $sliderNumber, in: 1...100)
                    Text("100")
                }
                
                Button("Acertei?", role: .cancel) {
                    if wonorLost() {
                        alertText = "Parabéns! Você acertou"
                    }
                    else {
                        alertText = "Que pena, vc chutou \(Int(sliderNumber))"
                    }
                    showingAlert = true
                    
                    calcPointsLost()
                    updateTarget()

                }
                .alert(alertText, isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding(.top, 2.0)
    }
}


//1-) calcular a pontuação do usuário : (target - sliderNumber) - número positivo
//2-) criar uma variável chamada points para  armazenar os pontos do usuário
//3-) Assim que o usuário clicar em acertei, colocar um novo número randômico para ele tentar acertar
//4-) mostrar a diferença dos pontos tem um texto na tela
