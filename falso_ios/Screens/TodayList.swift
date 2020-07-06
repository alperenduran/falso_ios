//
//  TodayList.swift
//  falso_ios
//
//  Created by Alperen Duran on 2.07.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct TodayList: View {
    @ObservedObject var store = TodayStore()
    var body: some View {
        NavigationView {
            List(self.store.matchs) { match in
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        HStack {
                            KFImage(match.homeLogo)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text(match.homeTeam)
                        }
                        
                        HStack {
                            KFImage(match.awayLogo)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text(match.awayTeam)
                        }
                    }
                    
                    Spacer()
                    
                    Text(match.time)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            ).foregroundColor(.gray)
                    )
                }
                
            }.navigationBarTitle("Günün Maçları")
                .alert(isPresented: $store.showError) {
                    Alert(
                        title: Text("Error"),
                        message: Text(store.errorMessage)
                    )
            }
        }.navigationBarColor(.some(UIColor(named: "falsoRed")!))
            .navigationViewStyle(StackNavigationViewStyle())
    }
}
