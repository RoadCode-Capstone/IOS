//
//  LevelTestResultView.swift
//  RoadCode
//
//

import SwiftUI

struct TestResult: Identifiable {
    let id = UUID()
    let title: String
    let isCorrect: Bool
}

struct LevelTestResultView: View {
    
    let results: [TestResult]
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 24) {
                
                Text("레벨 테스트 결과")
                    .font(.custom("SpoqaHanSansNeo-Medium", size: 18))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 70)
                
                
                VStack(spacing: 4) {
                    Text("레벨 테스트 결과로")
                    Text("맞춤 로드맵을 생성했어요")
                }
                .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                
                resultSection
                
                Spacer()
                
                
                NavigationLink {
                    MainView()
                } label: {
                    Text("홈으로 돌아가기")
                        .font(.custom("SpoqaHanSansNeo-Bold", size: 17))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.second)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            .navigationBarBackButtonHidden()
        }
    }
    
    private var resultSection: some View {
        VStack(spacing: 0) {
            ForEach(results) { item in
                HStack {
                    Text(item.title)
                    Spacer()
                    Text(item.isCorrect ? "정답" : "오답")
                        .foregroundColor(item.isCorrect ? .green : .red)
                }
                .padding()
                
                if item.id != results.last?.id {
                    Divider()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}
