# 2019년 OpenHack 프로젝트 (담소)
## [ About ]

[담소 발표 PDF](https://github.com/dr-24/iOS/blob/master/PublicData/presentation.pdf)

**담소**는 금연을 하고 싶은 사람들을 위한 웃고 즐길 수 있는 **금연을 돕는 어플리케이션**입니다. 

기존에 있던 어플리케이션들은 단순히 흡연량만을 전달하는 역할을 했고, 지속적인 통계와 데이터를 유지하기 위해서 그 수치를 직접 입력해야하는 불편한 점들을 지녔습니다. 

또한, 대부분 보기 불편한 UI/ UX로 이루어져 아무리 꾸준히 이용하려해도 흡연 습관이 개선 되지 않는 문제점이 있었습니다. 

이러한 문제점을 보안하여 일반적인 통계치가 아닌, 좀 더 재미있는 기준들을 제안해보았습니다. 이렇게 조금더 가볍고 재미있게 금연에 대한 동기부여를 제공합니다. 

- 메인 페이지
  지금까지 사용한 담배의 개수를 파악하고 그에 상응하는 수면 시간, 치킨 , 커피, 저축양 등을 보여줍니다.

  또한 주간 흡연 기록을 날짜, 요일, 시간 등으로 상세하게 확인할 수 있습니다.

  

  ![main](http://bit.ly/2X5UQUS)

  

- 상태 페이지
  블루투스 기기를 연결하고 상태를 확인할 수 있습니다.

  간단한 그래프를 통해 당일로부터 일주일 간의 흡연량을 확인 할 수 있습니다.

  

  ![status](http://bit.ly/2J8kpj0)

  

- 차트 페이지 - 구현 필요

  목표 달성량, 혈액 순환률 등에 관한 여러가지 종류의 차트를 볼 수 있습니다.

  

- 더보기 페이지 - 구현 필요

  알람 설정, 정보 확인 등의 기능을 제공합니다.

  

## [ WorkFlow ]

![workflow](https://github.com/dr-24/iOS/blob/master/PublicData/workFlow.pdf)



## [ Develop Environment ]

- Language :  **Swift 5**

- iOS Depolyment Target : **12.2**

  

## [ Library ]

1. DataBase

- [RealmSwift](https://github.com/realm/realm-cocoa)

2. Layout

- [Charts](https://github.com/danielgindi/Charts)

