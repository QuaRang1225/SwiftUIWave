# SwiftUIWave

**SwiftUIWave**는 `Path` 객체를 반환하는 `Shape`를 활용하여 화면에 파도물결처럼 부드러운 움직이는 이미지를 보여줍니다. 여라가지 옵션을 사용하여 뷰를 커스터마이징할 수 있습니다.

- 사용화면

![red](https://github.com/QuaRang1225/SwiftUIWave/assets/31721255/5f18adde-7a21-4b26-89ad-f94d20c455b0)
![brown](https://github.com/QuaRang1225/SwiftUIWave/assets/31721255/849bfa2f-1049-4f81-b15f-49db1225c20e)

## Installation
이 컴포넌트는 `Swift Package Manager`를 사용하여 설치할 수 있습니다.
```
https://github.com/QuaRang1225/SwiftUIWave.git
```

## Usage
**SwiftUIWave**는 총 4가지의 옵션이 존재합니다.
> color
- 물결 색상 설정
- `Color`타입 준수
  
> height
- 물결의 높이 설정
- `WaveHeight`타입 준수

```swift
    case varyHigh   //전체의 80%높이
    case high       //전체의 65%높이
    case middle     //전체의 50%높이
    case low        //전체의 20%높이
    case veryLow    //전체의 10%높이
```
> speed
- 물결의 속도 설정
- `WaveSpeed`타입 준수

```swift
    case fast    //빠른 물결
    case normal  //적당한 물결
    case slow    //잔잔한 물결
```
> amplitude
- 물결의 진폭 설정
- `WavyAmplitude`타입 준수
```swift
    case high    //높은 진폭
    case middle  //적당한 진폭
    case low     //낮은 진폭
```
### 사용 예시
```swift
import SwiftUI
import SwiftUIWave

struct TestView: View {
    var body: some View {
        WaveImage(color: .red, height: .low, speed: .slow, amplitude: .low)
    }
}
```

## Reference

## Version
v.1.0.0 - 생성
