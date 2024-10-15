import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack {
                // 基本方案視圖
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                ZStack {
                    // 專業方案視圖
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    // 專業方案的標籤
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87) // 調整標籤位置
                }
            }
            .padding(.horizontal)
            
            ZStack {
                // 團隊方案視圖
                PricingView(title: "Team", price: "$299", textColor: .white,
                            bgColor: Color(red: 62/255, green: 63/255, blue: 70/255),
                            icon: "wand.and.rays")
                    .padding()
                
                // 團隊方案的標籤
                Text("Perfect for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110) // 調整標籤位置
            }
            
            Spacer() // 填充剩餘空間
        }
    }
}

// 頁面標題視圖
struct HeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding()
    }
}

// 定價方案視圖
struct PricingView: View {
    var title: String // 方案標題
    var price: String // 方案價格
    var textColor: Color // 文字顏色
    var bgColor: Color // 背景顏色
    var icon: String? // 可選圖標
    
    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}

// 預覽提供者（用於Xcode預覽）
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 新的預覽語法（適用於較新版本的Xcode）
#Preview {
    ContentView()
}
