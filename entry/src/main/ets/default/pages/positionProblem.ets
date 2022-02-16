import router from '@system.router';


export class Position {
  x: string
  y: string

  constructor(x: string, y: string) {
    this.x = x
    this.y = y
  }

  setValue(x: string, y: string) {
    this.x = x
    this.y = y
  }

  toString(): string {
    return `x: ${this.x}, y: ${this.y}`
  }
}

export class DisplayPosition {
  position: Position
  width: string
  height: string

  constructor(x: string, y: string, width: string, height: string) {
    this.position = new Position(x, y)
    this.width = width
    this.height = height
  }

  setValue(x: string, y: string, width: string, height: string) {
    this.position.setValue(x, y)
    this.width = width
    this.height = height
  }

  toString(): string {
    return `${this.position.toString()}, width: ${this.width}, height: ${this.height}`
  }
}

@Component
export struct OhPopover {
  @Link show: boolean
  @Link @Watch("setDisplayPosition") position: string
  @Link onClose: Function
  @State displayPosition: DisplayPosition = new DisplayPosition('20%', '20%', '60%', '60%')
  private flex_center_class: object = {
    alignItems: ItemAlign.Center,
    direction: FlexDirection.Column
  }

  private aboutToAppear() {
    this.setDisplayPosition()
  }

  private aboutToDisappear() {
    this.onClose()
  }

  private setDisplayPosition() {
    console.log(`set displayPosition, position: ${this.position}`)
    switch (this.position) {
      case 'top':
        this.displayPosition.setValue('0%', '0%', '100%', '50%')
        break;
      case 'left':
        this.displayPosition.setValue('0%', '0%', '50%', '100%')
        break;
      case 'bottom':
        this.displayPosition.setValue('0%', '50%', '100%', '50%')
        break;
      case 'right':
        this.displayPosition.setValue('50%', '0%', '50%', '100%')
        break;
      default:
      //default be center
        this.displayPosition.setValue('20%', '20%', '60%', '60%')
        break;
    }
    console.log(this.displayPosition.toString())
  }

  build() {
    Flex() {
      if (this.show) {
        Stack() {
          Column() {
          }
          .zIndex(1)
          .backgroundColor(Color.Gray)
          .opacity(0.7)
          .width("100%")
          .height('100%')
          .onClick(() => {
            this.show = false
          })

          Column() {
            Text('content of popover')
              .width('50%')
              .height('50%')
              .backgroundColor(Color.Green)
              .fontSize(30)
          }
          .backgroundColor(Color.White)
          .direction(Direction.Ltr)
          .position(this.displayPosition.position)
          .width(this.displayPosition.width)
          .height(this.displayPosition.height)
          .opacity(1)
          .zIndex(2)
        }
      }
    }
    .position({ x: 0, y: 0 })
  }
}

@Entry
@Component
struct f {
  build() {
    Column() {
      Text('点击test按钮，弹出框组件中灰色半透明遮盖背景的这一部分应该是覆盖整个页面的，' +
      '但是ets提供的“通用属性”却只能将元素相对于其父容器进行位置设置。')
        .fontSize(25)
        .margin(15)
      PopoverDem() {
      }
    }
  }
}

@Component
export struct PopoverDem {
  @State show: boolean = false
  @State position: string = 'center'
  @State onClose: Function = () => {
    console.log('close')

  }
  private flex_center_class: object = {
    alignItems: ItemAlign.Center,
    direction: FlexDirection.Column
  }

  build() {
    Flex(this.flex_center_class) {


      Button('back home').onClick(() => {
        router.back()
      }).offset({ x: 10 }).margin(15)


      Column() {
        Button('test').onClick(() => {
          this.show = true
        })
      }.margin(15)

      Row({ space: 20 }) {
        Button('top').onClick(() => {
          this.position = 'top'
          this.show = true
        })
        Button('left').onClick(() => {
          this.position = 'left'
          this.show = true
        })
        Button('bottom').onClick(() => {
          this.position = 'bottom'
          this.show = true
        })
        Button('right').onClick(() => {
          this.position = 'right'
          this.show = true
        })
      }.width('100%').margin({ left: 20, top: 20, bottom: 20 })

      Text('test').height(60).fontSize(25)
      OhPopover({
        show: $show,
        position: $position,
        onClose: $onClose
      }) {
      }
    }
  }
}