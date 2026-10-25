import SwiftUI

struct ContentView: View {
    @State private var selectedDrink = 0
    @State private var drinkName = ""
    @State private var message = "請選擇一杯飲品"
    @State private var imageName = "cup.and.saucer.fill"
    @State private var sweetness = "微糖"
    @State private var size = "中杯"
    @State private var isFinished = false

    var body: some View {
        VStack(spacing: 10) {
            Text("晨光咖啡機")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.brown)

            VStack(spacing: 8) {
                if isFinished {
                    HStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)

                        Image(systemName: imageName)
                            .foregroundColor(.brown)
                    }
                    .font(.system(size: 58))
                } else {
                    Image(systemName: imageName)
                        .font(.system(size: 75))
                        .foregroundColor(.brown)
                }

                Text(message)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray.opacity(0.3), radius: 5)

            VStack(spacing: 7) {
                HStack {
                    Text("☕️ 選擇飲品")
                        .font(.headline)
                        .foregroundColor(.brown)

                    Spacer()

                    Button("🎲 隨機選擇") {
                        let randomNumber = Int.random(in: 1...3)
                        chooseDrink(randomNumber)
                    }
                    .font(.subheadline)
                    .foregroundColor(.orange)
                }

                HStack(spacing: 10) {
                    Button("美式") {
                        chooseDrink(1)
                    }
                    .padding(9)
                    .foregroundColor(selectedDrink == 1 ? .white : .brown)
                    .background(selectedDrink == 1 ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)

                    Button("拿鐵") {
                        chooseDrink(2)
                    }
                    .padding(9)
                    .foregroundColor(selectedDrink == 2 ? .white : .brown)
                    .background(selectedDrink == 2 ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)

                    Button("可可") {
                        chooseDrink(3)
                    }
                    .padding(9)
                    .foregroundColor(selectedDrink == 3 ? .white : .brown)
                    .background(selectedDrink == 3 ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(9)
            .background(Color.white.opacity(0.8))
            .cornerRadius(15)

            VStack(spacing: 7) {
                Text("🍬 選擇甜度")
                    .font(.headline)
                    .foregroundColor(.brown)

                HStack(spacing: 10) {
                    Button("無糖") {
                        sweetness = "無糖"
                        isFinished = false
                    }
                    .padding(9)
                    .foregroundColor(sweetness == "無糖" ? .white : .brown)
                    .background(sweetness == "無糖" ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)

                    Button("微糖") {
                        sweetness = "微糖"
                        isFinished = false
                    }
                    .padding(9)
                    .foregroundColor(sweetness == "微糖" ? .white : .brown)
                    .background(sweetness == "微糖" ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)

                    Button("正常糖") {
                        sweetness = "正常糖"
                        isFinished = false
                    }
                    .padding(9)
                    .foregroundColor(sweetness == "正常糖" ? .white : .brown)
                    .background(sweetness == "正常糖" ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(9)
            .background(Color.white.opacity(0.8))
            .cornerRadius(15)

            VStack(spacing: 7) {
                Text("🥤 選擇份量")
                    .font(.headline)
                    .foregroundColor(.brown)

                HStack(spacing: 10) {
                    Button("小杯") {
                        size = "小杯"
                        isFinished = false
                    }
                    .padding(9)
                    .foregroundColor(size == "小杯" ? .white : .brown)
                    .background(size == "小杯" ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)

                    Button("中杯") {
                        size = "中杯"
                        isFinished = false
                    }
                    .padding(9)
                    .foregroundColor(size == "中杯" ? .white : .brown)
                    .background(size == "中杯" ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)

                    Button("大杯") {
                        size = "大杯"
                        isFinished = false
                    }
                    .padding(9)
                    .foregroundColor(size == "大杯" ? .white : .brown)
                    .background(size == "大杯" ? Color.brown : Color.brown.opacity(0.15))
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(9)
            .background(Color.white.opacity(0.8))
            .cornerRadius(15)

            Button("開始製作") {
                startMaking()
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(12)
            .foregroundColor(.white)
            .background(selectedDrink == 0 ? Color.gray : Color.green)
            .cornerRadius(12)
            .disabled(selectedDrink == 0)
        }
        .padding(18)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.1).ignoresSafeArea())
    }

    func chooseDrink(_ number: Int) {
        selectedDrink = number
        isFinished = false

        if number == 1 {
            drinkName = "美式咖啡"
            imageName = "mug.fill"
        } else if number == 2 {
            drinkName = "拿鐵"
            imageName = "cup.and.saucer.fill"
        } else {
            drinkName = "可可"
            imageName = "takeoutbag.and.cup.and.straw.fill"
        }

        message = "已選擇：\(drinkName)"
    }

    func startMaking() {
        isFinished = true
        message = "\(size) \(sweetness)的\(drinkName)完成了！"
    }
}

#Preview {
    ContentView()
}
