//
//  Funnel Chart Solution.swift
//  Funnel Chart Excercise
//
//  Created by Michael Knych on 6/1/24.
//

import SwiftUI
import Charts

struct FunnelChartItem: Identifiable {
  let id = UUID()
  let name: String
  let numerical: Double
  
  
}

struct Funnel_Chart_Solution: View {
  let items: [FunnelChartItem] = [
    .init(name: "A", numerical: 1000000),
    .init(name: "B", numerical: 500000),
    .init(name: "C", numerical: 250000),
    .init(name: "D", numerical: 125000),
    .init(name: "E", numerical: 63500),
    .init(name: "F", numerical: 31250)
  
  ]
  
  let numericalName: String = "Sales"
  let stringName: String = "Day"
  
  @State private var isAnnotated: Bool = true
  
    var body: some View {
      GeometryReader { geometry in
        NavigationStack {
          VStack {
            HStack {
              Chart(items) { item in
                let maxValue = getMaxValue()
                let xStart = maxValue / 2 - item.numerical / 2
                let xEnd = xStart + item.numerical
                BarMark(xStart: .value(numericalName, xStart),
                        xEnd: .value(numericalName, xEnd), 
                        y: .value(stringName, item.name))
                .foregroundStyle(by: .value(numericalName, item.name))
                .annotation(position: .trailing) {
                  Text("\(Int(item.numerical))")
                    .opacity(isAnnotated ? 1.0 : 0.0)
                }
              }
              .padding()
              .chartXAxis(.hidden)
              .chartYAxis(.hidden)
              .chartLegend(.hidden)
              .chartPlotStyle { plotArea in
                plotArea
                  .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
              }
              .padding()
              
              Spacer()
            }
            .background(Color.cyan
              .opacity(0.7)
              .clipShape(.rect(cornerRadius: 10.0))
                .shadow(color: .cyan.opacity(0.4), radius: 3, x: 3, y: 3)
            )
            .padding()
            
            Spacer()
            
          }
          .navigationTitle("Funnel Chart")
          .onTapGesture {
            isAnnotated.toggle()
          }
        }
      }
    }
  
  func getMaxValue() -> Double {
    items[0].numerical
  }
}

#Preview {
    Funnel_Chart_Solution()
}
