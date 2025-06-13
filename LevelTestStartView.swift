//
//  LevelTestStartView.swift
//  RoadCode
//
//

import SwiftUI

struct LevelTestStartView: View {
    @Environment(\.dismiss) var dismiss
    
    let selectedLanguage: String
    let selectedTestContent: String
    
    var body: some View {
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
                
                
                Spacer()
                
                Text("레벨 테스트")
                    .font(.custom("SpoqaHanSansNeo-Medium", size: 18))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                Image(systemName: "chevron.left")
                    .opacity(0)
            }
            .padding(.top, 70)
            .padding(.horizontal)
            

            Text("레벨 테스트를 시작할게요")
                .font(.custom("SpoqaHanSansNeo-Light", size: 16))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
            

            VStack(alignment: .leading, spacing: 18) {
                Text("주의사항")
                    .font(.custom("SpoqaHanSansNeo-Medium", size: 16))
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("• 제한 시간은 2시간이에요.")
                    Text("• 사용 언어는 ‘\(selectedLanguage)’예요.")
                    Text("• 테스트 내용은 ‘\(selectedTestContent)’예요.")
                    Text("• 제한 시간이 종료되거나, 종료 버튼을 누르면 종료돼요.")
                        .lineLimit(1)
                }
                .font(.custom("SpoqaHanSansNeo-Light", size: 13.4))
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            .padding(.horizontal,25)
            
            Spacer()
            
            NavigationLink { LevelTestView()
            } label: {
                    Text("시작하기")
                        .font(.custom("SpoqaHanSansNeo-Bold", size: 17))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.main)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .navigationBarBackButtonHidden()
            }
        }
    }
