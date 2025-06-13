//
//  AlgorithmSelectionView.swift
//  RoadCode
//
//

import SwiftUI

struct AlgorithmSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedAlgorithm: String? = nil
    
    let algorithms = ["스택/큐", "DFS/BFS", "탐욕법", "트리"]
    
    
    var body: some View {
            VStack(spacing: 30) {

                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                        
                        
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
                }
                .padding(.top, 70)
                .padding(.horizontal)
                

                Text("학습할 알고리즘을 선택하세요")
                    .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                

                VStack(spacing: 16) {
                    ForEach(algorithms, id: \.self) { algorithm in
                        AlgorithmButton(title: algorithm, isSelected: selectedAlgorithm == algorithm) {
                            selectedAlgorithm = algorithm
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
  
                NavigationLink {
                    DailyGoalSelectionView(
                        selectedLanguage: "",
                        selectedTestContent: selectedAlgorithm ?? ""
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
    
    
    struct AlgorithmButton: View {
        let title: String
        let isSelected: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                HStack {
                    Text(title)
                        .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
                )
                .cornerRadius(8)
                .padding(.horizontal, 15)
            }
        }
    }
