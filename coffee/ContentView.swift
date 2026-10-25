import SwiftUI

struct ContentView: View {
    @State private var selectedDrink: Drink?

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.brown.opacity(0.18), Color.orange.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 28) {
                    header
                    coffeeDisplay
                    drinkButtons
                }
                .padding(24)
                .frame(maxWidth: 560)
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var header: some View {
        VStack(spacing: 8) {
            Text("晨光咖啡機")
                .font(.largeTitle.bold())

            Text("選擇一杯飲品，開始你的美好一天")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }

    private var coffeeDisplay: some View {
        VStack(spacing: 20) {
            Image(systemName: selectedDrink?.systemImage ?? "cup.and.saucer.fill")
                .font(.system(size: 84))
                .foregroundStyle(selectedDrink?.color ?? .brown)
                .symbolEffect(.bounce, value: selectedDrink)
                .accessibilityHidden(true)

            VStack(spacing: 6) {
                Text(selectedDrink == nil ? "想喝點什麼？" : "\(selectedDrink!.name)完成了！")
                    .font(.title2.bold())
                    .contentTransition(.numericText())

                Text(selectedDrink == nil ? "請點選下方飲品按鈕" : "小心燙口，請慢慢享用")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 260)
        .padding(24)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 28))
        .overlay {
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white.opacity(0.55), lineWidth: 1)
        }
        .shadow(color: .brown.opacity(0.12), radius: 18, y: 10)
        .animation(.spring(duration: 0.45), value: selectedDrink)
    }

    private var drinkButtons: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("飲品選單")
                .font(.headline)

            HStack(spacing: 12) {
                drinkButton(for: .americano)
                drinkButton(for: .latte)
                drinkButton(for: .cocoa)
            }
        }
    }

    private func drinkButton(for drink: Drink) -> some View {
        let isSelected = selectedDrink == drink

        return Button {
            selectedDrink = drink
        } label: {
            VStack(spacing: 10) {
                Image(systemName: drink.systemImage)
                    .font(.title2)

                Text(drink.name)
                    .font(.headline)
                    .lineLimit(1)

                Text(drink.detail)
                    .font(.caption)
                    .opacity(0.8)
            }
            .foregroundStyle(isSelected ? Color.white : Color.primary)
            .frame(maxWidth: .infinity, minHeight: 112)
            .padding(.horizontal, 8)
            .background(
                isSelected ? drink.color : Color.white.opacity(0.72),
                in: RoundedRectangle(cornerRadius: 20)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? drink.color : Color.brown.opacity(0.14), lineWidth: 2)
            }
            .shadow(
                color: isSelected ? drink.color.opacity(0.3) : .clear,
                radius: 10,
                y: 6
            )
            .scaleEffect(isSelected ? 1.04 : 1)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(drink.name)，\(drink.detail)")
        .accessibilityValue(isSelected ? "已選取，製作完成" : "未選取")
    }
}

private enum Drink: Hashable {
    case americano
    case latte
    case cocoa

    var name: String {
        switch self {
        case .americano:
            "美式"
        case .latte:
            "拿鐵"
        case .cocoa:
            "可可"
        }
    }

    var detail: String {
        switch self {
        case .americano:
            "濃郁醒腦"
        case .latte:
            "香醇滑順"
        case .cocoa:
            "甜蜜溫暖"
        }
    }

    var systemImage: String {
        switch self {
        case .americano:
            "mug.fill"
        case .latte:
            "cup.and.saucer.fill"
        case .cocoa:
            "takeoutbag.and.cup.and.straw.fill"
        }
    }

    var color: Color {
        switch self {
        case .americano:
            .brown
        case .latte:
            .orange
        case .cocoa:
            .pink
        }
    }
}

#Preview {
    ContentView()
}
