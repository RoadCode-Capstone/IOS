//
//  LearningTypeSelectionView.swift
//  RoadCode
//
//

import SwiftUI

struct LearningTypeSelectionView: View {
    @State private var selectedType: String? = nil
    @State private var showLanguageselectionView = false
    @State private var showAlgorithmselectionView = false
    
    let learningType = ["언어", "알고리즘"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                HStack {
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
                
                Text("학습 유형을 선택하세요")
                    .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                VStack(spacing: 16) {
                    ForEach(learningType, id: \.self) { type in
                        LearningTypeButton(title: type, isSelected: selectedType == type) {
                            selectedType = type
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Group {
                    if selectedType == "언어" {
                        NavigationLink {
                            LanguageSelectionView()
                        } label: {
                            NextButtonLabel()
                        }
                    } else if selectedType == "알고리즘" {
                        NavigationLink {
                            AlgorithmSelectionView()
                        } label: {
                            NextButtonLabel()
                        }
                        
                    } else {
                        NextButtonLabel()
                    }
                }
                .disabled(selectedType == nil)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                
            }
            .navigationBarBackButtonHidden()
        }
    }
                
        private func NextButtonLabel() -> some View {
                Text("다음")
                    .font(.custom("SpoqaHanSansNeo-Bold", size: 17))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.main)
                    .cornerRadius(20)
        }
    }
    
            struct LearningTypeButton: View {
                var title: String
                var isSelected: Bool
                var action: () -> Void
                
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
