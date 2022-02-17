import router from '@system.router'

@Entry
@Component
struct TypeProblem {
  @State value: number | Array<number> = 40

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Button('back home').onClick(() => {
        router.back()
      }).offset({ x: 10,y: 10 })
      Text(this.value + '')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
  }
}