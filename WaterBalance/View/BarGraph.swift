//
//  StatisticsView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 20.05.2022.
//

import SwiftUI


struct BarGraph: View {
    @Binding var stat:[WaterForDay]
    
    func GraphView()->some View{
        GeometryReader{proxy in
            ZStack{
                VStack(spacing: 0){
                    ForEach(getGraphLines(),id: \.self){line in
                        HStack(spacing: 8){
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight:.infinity, alignment: .bottom)
                        .offset(y: -15)
                    }
                }
                HStack{
                    ForEach(stat){water in
                        VStack(spacing: 0){
                            VStack(spacing: 5){
                               Capsule()
                                    .fill(Color.blue)
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: water.waters, size: proxy.size))
                            Text(water.weekDay)
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding(.leading,30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(.leading,30)
        }
        .frame(height: 190)
        .background(.black)
    
        
    }
    func getBarHeight(point: CGFloat, size:CGSize)->CGFloat{
        let max = getMax()
        
        let height = (point / max) * (size.height - 37)
        return height
    }
    var body: some View {
        GraphView()
            .padding(.top,20)
    }
    func getMax()->CGFloat{
        let max = stat.max{first, scnd in
            return scnd.waters > first.waters
        }?.waters ?? 0
        return max
    }
    
    func getGraphLines()->[CGFloat]{
        let max = getMax()
        var lines: [CGFloat] = []
        lines.append(max)
        for index in 1...4{
            let progress = max/4
            lines.append(max-(progress*CGFloat(index)))
        }
        return lines
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
    
        BarGraph(stat: .constant([]))
    }
}

