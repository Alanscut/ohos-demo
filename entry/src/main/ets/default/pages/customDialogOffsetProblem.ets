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

@CustomDialog
struct CustomDialogExample {
  @Prop width: string
  @Prop height: string
  controller: CustomDialogController

  build() {
    Column() {
      Column() {
        Text('dialog content').fontSize(40)
      }
      .width(this.width)
      .height(this.height)
      .backgroundColor(Color.White)
      .border({ color: Color.Red, style: BorderStyle.Solid, width: 3 })
    }
    .transition({ type: TransitionType.Insert, translate : {x:1.0,y:1.0} })
    .transition({ type: TransitionType.Delete, translate: { x: 1.0, y: 0.0 } })
  }
}

@Entry
@Component
struct f {
  @State position: string = 'top'
  @State widthSize: number = 200
  @State heightSize: number = 100
  @State flag: boolean = true

  build() {
    Column({ space: 10 }) {
      Button('back home').onClick(() => {
        router.back()
      }).offset({ x: 5,y: 5 })
      Text('third tier').height(60).fontSize(25)

      testDialog({ position: $position, width: 50, height: 50 }) {
      }

      Button('left').onClick(() => {
        this.position = 'left'
      })
      Button('top').onClick(() => {
        this.position = 'top'
      })
      Button('right').onClick(() => {
        this.position = 'right'
      })
      Button('bottom').onClick(() => {
        this.position = 'bottom'
      })
      Button('center').onClick(() => {
        this.position = 'center'
      })
    }
  }
}


//@Entry
@Component
struct testDialog {
  @Link @Watch("setDisplayPosition") position: string
  @Prop width: number
  @Prop height: number
//参数格式为数字，类型为百分比，设置宽和高，上方/下方弹出时设置宽度无效，左侧/右侧弹出时设置高度无效
//DisplayPosition参数，x,y,width,height
  @State displayPosition: DisplayPosition  = new DisplayPosition('0%', '-25%', '100%', '50%')



  private aboutToAppear() {
    this.setDisplayPosition()
  }

  private setDisplayPosition() {
    console.log(`set displayPosition, position: ${this.position}`)
    switch (this.position) {
      case 'top':
        this.displayPosition.setValue('0%', `-${(100 - this.height) / 2}%`, '100%', `${this.height}%`)
        break;
      case 'left':
        this.displayPosition.setValue(`-${(100 - this.width) / 2}%`, '0%', `${this.width}%`, '100%')
        break;
      case 'bottom':
        this.displayPosition.setValue('0%', `${(100 - this.height) / 2}%`, '100%', `${this.height}%`)
        break;
      case 'right':
        this.displayPosition.setValue(`${(100 - this.width) / 2}%`, '0%', `${this.width}%`, '100%')
        break;
      default:
      //default be center
        this.displayPosition.setValue('0%', '0%', `${this.width}%`, `${this.height}%`)
        break;
    }
    this.dialogController = new CustomDialogController({
      builder: CustomDialogExample({
        width: this.displayPosition.width,
        height: this.displayPosition.height
      }),
      cancel: this.existApp,
      autoCancel: true,
      offset: {
        dx: this.displayPosition.position.x,
        dy: this.displayPosition.position.y
      },
      customStyle: true
    })
  }

  dialogController: CustomDialogController  = new CustomDialogController({
    builder: CustomDialogExample({
      width: this.displayPosition.width,
      height: this.displayPosition.height
    }),
    cancel: this.existApp,
    autoCancel: true,
    offset: {
      dx: this.displayPosition.position.x,
      dy: this.displayPosition.position.y
    },
    customStyle: true
  })

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Column() {
      Text('点击chick me查看初始dialog宽高和位置，点击left，然后再次点击click me查看dialog宽高发生了改变但是位置仍旧是向上平移25%向左平移0%')
      .fontSize(20).margin(20)
      Button('click me')
        .onClick(() => {
          console.log(this.displayPosition.toString())
          this.dialogController.open()
        }).backgroundColor(0x317aff).height(90)
    }.width('100%').margin({ top: 5 })
  }
}