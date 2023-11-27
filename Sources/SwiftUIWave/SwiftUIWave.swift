//public struct SwiftUIWave {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
//
////
////  WavyView.swift
////  SwiftUIWaveImage
////
////  Created by 유영웅 on 2023/11/27.
////

import SwiftUI

public struct WaveImage: View {
    
    
    let color:Color
    var height:WavyHeight?
    var speed:WavySpeed?
    var amplitude:WavyAmplitude?
    
    @State var phase:CGFloat = 0.0
    
    public init(color:Color,height:WavyHeight?,speed:WavySpeed?,amplitude:WavyAmplitude?){
        self.phase = speed?.speed ?? 0
        self.color = color
        self.height = height
        self.amplitude = amplitude
    }
    
    public var body: some View {
        ZStack{
            Wave(reverse: true, progress: (height?.height ?? 0.5) + 0.03, addX: amplitude?.amplitude[0] ?? 0.2, phase: phase)
                .fill(
                    LinearGradient(colors: [color.opacity(0.2),color], startPoint: .top, endPoint: .bottom)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses:false)){
                        self.phase = .pi * 2
                    }
                }
            Wave(reverse: true, progress: (height?.height ?? 0.5) + 0.05, addX: amplitude?.amplitude[1] ?? 0.4, phase: phase)
                .fill(
                    color.opacity(0.2)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses:false)){

                        self.phase = .pi * 2
                    }
                }
            Wave(reverse: false, progress: (height?.height ?? 0.5) + 0.07, addX: amplitude?.amplitude[2] ?? 0.4, phase: phase)
                .fill(
                    color.opacity(0.2)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses:false)){

                        self.phase = .pi * 2
                    }
                }
            Wave(reverse: false, progress: (height?.height ?? 0.5) + 0.05, addX: amplitude?.amplitude[3] ?? 0.5, phase: phase)
                .fill(
                    color.opacity(0.2)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses:false)){
                        self.phase = .pi * 2
                    }
                }
        }
        .onAppear{
            self.phase = speed?.speed ?? 0
        }
        .ignoresSafeArea()
    }
}

struct WavyView_Previews: PreviewProvider {
    static var previews: some View {
        WaveImage(color: .brown, height: .high,speed: .slow, amplitude: .low)
    }
}


public enum WavyAmplitude{
    case high
    case middle
    case low
    
    var amplitude:[CGFloat]{
        switch self{
        case .high:
            return [1,1.2,1.2,1.3]
        case .middle:
            return [0.6,0.8,0.8,0.9]
        case .low:
            return [0.2,0.4,0.4,0.5]
        }
    }
}

public enum WavyHeight{
    case varyHigh
    case high
    case middle
    case low
    case veryLow
    
    var height:CGFloat{
        switch self{
        case .varyHigh:
            return 0.8
        case .high:
            return 0.65
        case .middle:
            return 0.5
        case .low:
            return 0.2
        case .veryLow:
            return 0.1
        }
    }
}

public enum WavySpeed{
    case fast
    case normal
    case slow
    
    var speed:CGFloat{
        switch self{
        case .fast:
            return 50
        case .normal:
            return 20
        case .slow:
            return 0
        }
    }
}


struct Wave:Shape{
    
    let reverse:Bool
    let progress:CGFloat
    let addX:CGFloat
    var applitude:CGFloat = 10  //진폭
    var waveLength:CGFloat = 30 //진동수
    var phase:CGFloat
    
    
    var animatableData: CGFloat{
        get{ phase }
        set{ phase = newValue}
    }
    
    func path(in rect:CGRect) -> Path{
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let progressHeight = height * (1 - progress)
        
        
        if reverse{
            path.move(to: CGPoint(x: 0, y: progressHeight))
            
            for x in stride(from:0 , to: width + 10, by: 10){
                let y = progressHeight + sin(phase +  x*addX/waveLength) * applitude
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x:width ,y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            return path
        }else{
            path.move(to: CGPoint(x: width, y: progressHeight))
            
            for x in stride(from: width, to: -10, by: -10){
                let y = progressHeight + sin(phase +  (width - x)*addX/waveLength) * applitude
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x:0,y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            return path
        }
    }
}
