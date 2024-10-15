
# SwiftUI 定價計劃應用程式解析

## ContentView

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(title: "Team", price: "$299", textColor: .white,
                            bgColor: Color(red: 62/255, green: 63/255, blue: 70/255),
                            icon: "wand.and.rays")
                    .padding()
                
                Text("Perfect for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 87)
            }
            
            Spacer()
        }
    }
}
```

這是主要的內容視圖，包含以下元素：
- `HeaderView`：顯示標題
- 兩個並排的 `PricingView`：顯示 Basic 和 Pro 計劃
- 一個單獨的 `PricingView`：顯示 Team 計劃
- 每個 Pro 和 Team 計劃都有額外的說明文字

## HeaderView

```swift
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
```

這個視圖創建了應用程式的標題，包含 "Choose Your Plan" 文字，使用大號粗體圓角字體。

## PricingView

```swift
struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
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
```

這是一個可重用的視圖，用於顯示每個定價計劃。它包括：
- 可選的圖標
- 計劃標題
- 價格
- "per month" 文字
所有元素都可以自定義顏色和背景。

## 預覽提供者

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
```

