import router from '@system.router';

@Component
struct child {
  @Prop @Watch("watchProp") numProp: number
  @Link @Watch("watchLink") numLink: number

  private watchProp() {
    console.log(`watch numProp: ${this.numProp}`)

  }

  private watchLink() {
    console.log(`watch numLink: ${this.numLink}`)
  }

  build() {
    Column() {
      Text(`numProp: ${this.numProp}`).margin(10).fontSize(15)
      Text(`numLink: ${this.numLink}`).margin(10).fontSize(15)
      Button('print log')
        .onClick(() => {
          console.log(`numProp: ${this.numProp}`)
          console.log(`numLink: ${this.numLink}`)
        }).margin(10)
    }
    .border({ width: 3, color: Color.Red, style: BorderStyle.Solid })
    .padding(15)
    .margin(15)
  }
}

@Entry
@Component
struct watchPropProblem {
  @State numProp: number = 1
  @State numLink: number = 1

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Button('back home').onClick(() => {
        router.back()
      }).offset({ x: 10, y: 10 })

      Text('通过watch监听参数变化时，在watch事件内部调用该参数，prop参数会显示为变化之前的值').fontSize(20)

      child({ numProp: this.numProp, numLink: $numLink }) {
      }

      Button('add').onClick(() => {
        this.numProp++
        this.numLink++
      })
    }
    .width('100%')
    .height('100%')

  }
}
