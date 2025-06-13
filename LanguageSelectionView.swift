//
//  LanguageSelectionView.swift
//  RoadCode
//
//

import SwiftUI

struct LanguageSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedLanguage: String? = nil
    @State private var navigateToNext = false
    
    let language = ["JAVA", "Python", "C"]
    
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
                        
                        Text("학습 계획 설정")
                            .font(.custom("SpoqaHanSansNeo-Medium", size: 18))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        Spacer()
                        
                        Image(systemName: "chevron.left")
                            .opacity(0)
                    }
                }
                .navigationBarBackButtonHidden()
                .padding(.top, 70)
                .padding(.horizontal)
                
                Text("학습할 언어를 선택하세요")
                    .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                VStack(spacing: 16) {
                    LanguageButton(title: "JAVA", imageName: "java", isSelected: selectedLanguage == "JAVA") {
                        selectedLanguage = "JAVA"
                    }
                    
                    LanguageButton(title: "Python", imageName: "python", isSelected: selectedLanguage == "Python") {
                        selectedLanguage = "Python"
                    }
                    
                    LanguageButton(title: "C", imageName: "c", isSelected: selectedLanguage == "C") {
                        selectedLanguage = "C"
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    if selectedLanguage != nil {
                        navigateToNext = true
                    }
                }) {
                    Text("다음")
                        .font(.custom("SpoqaHanSansNeo-Bold", size: 17))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.main)
                        .cornerRadius(20)
                }
                .disabled(selectedLanguage == nil)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                
                .navigationDestination(isPresented: $navigateToNext) {
                    DailyGoalSelectionView(
                        selectedLanguage: selectedLanguage ?? "",
                        selectedTestContent: ""
                    )
                }
            }
            
        }
    }
        struct LanguageButton: View {
            var title: String
            var imageName: String
            var isSelected: Bool
            var action: () -> Void
            
            var body: some View {
                Button(action: action) {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(title)
                            .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                            .foregroundColor(.black)
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
