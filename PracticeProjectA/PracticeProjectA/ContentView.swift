//
//  ContentView.swift
//  PracticeProjectA
//

import SwiftUI
import UIKit

struct User {
    var name: String
    var calories: Int
    var steps: Int
    var workoutMinutes: Int
}

struct ContentView: View {
    
    // MARK: - State
    @State private var isAnimating = false
    @State private var tapped = false
    @State private var isDark = true
    
    // MARK: - Data
    let user = User(name: "Ja'Den", calories: 245, steps: 8200, workoutMinutes: 45)
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                // 🔥 Animated Flame
                Image(systemName: "flame.fill")
                    .imageScale(.large)
                    .foregroundStyle(.orange)
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                
                // 👤 Profile Image
                Image("fit")
                    .resizable()
                    .scaledToFill()
                    .frame(width: tapped ? 270 : 250, height: tapped ? 270 : 250)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(tapped ? Color.blue : Color.red, lineWidth: 8)
                    )
                    .shadow(radius: 10)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            tapped.toggle()
                        }
                    }
                
                // 👋 Greeting
                VStack(spacing: 6) {
                    Text("Hello, \(user.name)!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(isDark ? .white : .black)
                    
                    Text("Welcome back 👋")
                        .foregroundColor(.gray)
                }
                
                // 📊 Stats Section
                HStack(spacing: 30) {
                    StatView(value: "\(user.calories)", label: "Calories")
                    StatView(value: "\(user.steps)", label: "Steps")
                    StatView(value: "\(user.workoutMinutes)m", label: "Workout")
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
                // 🎯 Goal Card
                VStack(spacing: 10) {
                    Text("Today's Goal")
                        .foregroundColor(.white)
                    
                    Text("🔥 Burn 500 kcal")
                        .bold()
                        .foregroundColor(.orange)
                    
                    ProgressView(value: 0.6)
                        .tint(.orange)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                // 🌗 Dark Mode Toggle
                Toggle("Dark Mode", isOn: $isDark)
                    .padding()
                    .foregroundColor(isDark ? .white : .black)
                
                // 🚀 Button
                Button(action: {
                    let impact = UIImpactFeedbackGenerator(style: .medium)
                    impact.impactOccurred()
                    
                    print("Get Started tapped")
                }) {
                    Text("Get Started")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // 🌅 Background
            .background(
                LinearGradient(
                    gradient: Gradient(colors: isDark ? [.black, .orange.opacity(0.6)] : [.white, .orange.opacity(0.3)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            // 🧭 Navigation
            .navigationTitle("Dashboard")
            .toolbar {
                Image(systemName: "gear")
                    .foregroundColor(.orange)
            }
        }
    }
}

// MARK: - Reusable Stat View
struct StatView: View {
    var value: String
    var label: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ContentView()
}
