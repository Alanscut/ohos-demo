import router from '@system.router'

@Entry
@Component
struct widthProblem {
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
      Text('父元素宽度为0，子元素消失')
        .fontSize(30)
      Column() {
        Button('test')
      }
        .width(0)
    }
    .width('100%')
    .height('100%')
  }
}