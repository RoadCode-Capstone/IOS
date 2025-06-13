//
//  DailyGoalSelectionView.swift
//  RoadCode
//
//

import SwiftUI

struct DailyGoalSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedGoal: Int? = nil
    
    let goals = [1, 2, 3, 4, 5]
    
    let selectedLanguage: String
    let selectedTestContent: String
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30) {
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    .navigationBarBackButtonHidden()
                    
                    Spacer()
                    Text("학습 계획 설정")
                        .font(.custom("SpoqaHanSansNeo-Medium", size: 18))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    
                    Image(systemName: "chevron.left")
                        .opacity(0)
                }
                .padding(.top, 70)
                .padding(.horizontal)
                

                Text("일일 학습 목표를 선택하세요")
                    .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                

                HStack(spacing: 16) {
                    ForEach(goals, id: \.self) { goal in
                        GoalCircleButton(number: goal, isSelected: selectedGoal == goal) {
                            selectedGoal = goal
                        }
                    }
                }
                .padding(.horizontal)
                .offset(y: +10)
                
                Spacer()
                
                NavigationLink {
                    LevelTestStartView(
                        selectedLanguage: selectedLanguage,
                        selectedTestContent: selectedTestContent
                    )
                } label: {
                    Text("다음")
                        .font(.custom("SpoqaHanSansNeo-Bold", size: 17))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.main)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
    
    
    struct GoalCircleButton: View {
        let number: Int
        let isSelected: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text("\(number)")
                    .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .overlay(
                        Circle()
                            .stroke(isSelected ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .clipShape(Circle())
            }
        }
    }
    
}
