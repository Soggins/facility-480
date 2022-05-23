//
//  MyReservationsTopBarView.swift
//  Facility480
//
//  Created by Hector Martin on 3/5/22.
//

import SwiftUI

struct MyReservationsTopBarView: View {
    var fixed = true
    var geoWidth: CGFloat
    @Binding var selectedTab: MyReservationsTabEnum

    private func updateSelectedTab(_ row: MyReservationsTabEnum) {
        withAnimation {
            selectedTab = row
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(MyReservationsTabEnum.allCases, id: \.self) { row in
                            Button(action: {
                                updateSelectedTab(row)
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack (alignment: .center) {
                                        // Text
                                        Text(row.getName())
                                            .font(Font.system(size: 18, weight: .semibold))
                                            .foregroundColor(selectedTab == row ? Color.black : Color.gray)
                                            .animation(.easeInOut, value: selectedTab)
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(MyReservationsTabEnum.allCases.count)) : .none, height: 52)
                                    // Bar Indicator
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(selectedTab == row ? Color.green : Color.clear)
                                        .frame(width: 125 ,height: 10)
                                        .offset(y: 10 / 2)
                                        .clipped()
                                        .frame(height: 5)
                                        .animation(.easeInOut, value: selectedTab)
                                }.fixedSize()
                            })
                            .accentColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                            
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
//                        print(selectedTab)
                    }
                }
            }
        }
        .frame(height: 50)
        .onAppear(perform: {
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

struct MyReservationsTopBarView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationsTopBarView(fixed: true,
             geoWidth: 375,
             selectedTab: .constant(.history))
    }
}
