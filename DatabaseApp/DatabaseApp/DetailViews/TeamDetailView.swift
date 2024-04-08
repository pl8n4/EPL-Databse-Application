//
//  TeamDetailView.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/6/24.
//

import SwiftUI

struct TeamDetailView: View {
    var team: CombinedTeamData
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: PlayerStatsCoordinatorViewModel
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left") // System-provided icon
                        Text("Back")
                    }
                }
                .padding(.leading)
                .accentColor(.primary)
                
                Spacer()
                
                Text(team.teamName)
                    .bold()
                    .font(.title)
                
                Spacer()
                Spacer()
            }
            Divider()
            ScrollView {
                VStack {
                    // Display the team's generic info here
                    HStack{
                        Text("\(team.stadiumName)")
                            .font(.subheadline)
                        Spacer()
                        Image(team.teamName).resizable().scaledToFit().frame(width: 150, height: 100)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7)
                        Divider()
                        
                    }.padding(.all)
                    // A custom view that you create for team's generic info like logo, name, stadium, etc.
                    // Pass filtered player stats to PlayerStatsDetailView
                    PlayerStatsDetailView(viewModel: viewModel, teamID: team.teamID)
                }
            }
            .navigationBarHidden(true)
            .onAppear{
                viewModel.fetchAllDataAndCalculateStats()
            }
        }
    }
}

/*
#Preview {
    TeamDetailView()
}
*/