式：

# SwiftUI 定價計劃應用程式詳細解析

## 導入框架
```swift
import SwiftUI
```
這行導入了SwiftUI框架，使我們能夠使用SwiftUI的所有功能來構建用戶界面。

## ContentView 結構
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            // 內容...
        }
    }
}
```
`ContentView` 是應用程式的主要視圖。它遵循 `View` 協議，並在 `body` 屬性中定義了視圖的結構。

### 主要佈局
1. **HeaderView**：顯示在頂部的標題。
2. **HStack**：水平排列兩個定價方案（Basic 和 Pro）。
3. **ZStack**：用於Team方案，允許在定價視圖上疊加標籤。

### Basic 和 Pro 方案
```swift
HStack {
    PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
    
    ZStack {
        PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
        
        Text("Best for designer")
            // 樣式設置...
            .offset(x: 0, y: 87)
    }
}
.padding(.horizontal)
```
- 使用 `HStack` 水平排列兩個 `PricingView`。
- Pro 方案使用 `ZStack` 來添加 "Best for designer" 標籤。
- `.offset(x: 0, y: 87)` 用於調整標籤的位置。

### Team 方案
```swift
ZStack {
    PricingView(title: "Team", price: "$299", textColor: .white,
                bgColor: Color(red: 62/255, green: 63/255, blue: 70/255),
                icon: "wand.and.rays")
        .padding()
    
    Text("Perfect for teams with 20 members")
        // 樣式設置...
        .offset(x: 0, y: 87)
}
```
- 使用 `ZStack` 來疊加 "Perfect for teams with 20 members" 標籤。
- Team 方案包含一個圖標 "wand.and.rays"。

### Spacer
```swift
Spacer() // 填充剩餘空間
```
使用 `Spacer()` 將所有內容推到視圖的頂部。

## HeaderView 結構
```swift
struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                Text("Your Plan")
                // 文字樣式...
            }
            Spacer()
        }
        .padding()
    }
}
```
- 創建一個包含兩行文字的標題。
- 使用 `VStack` 垂直排列文字，並設置為左對齊。
- `Spacer()` 確保文字靠左對齊。

## PricingView 結構
```swift
struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            // 內容...
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
```
- 可重用的視圖，用於顯示每個定價方案。
- 使用參數來自定義標題、價格、顏色和可選圖標。
- `.frame()` 設置視圖的尺寸。
- `.cornerRadius(10)` 添加圓角效果。

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

