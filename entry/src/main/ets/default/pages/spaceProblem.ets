import router from '@system.router';

@Entry
@Component
struct SpaceProblem {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Stretch, justifyContent: FlexAlign.SpaceAround }) {
      Button('back home').onClick(() => {
        router.back()
      }).offset({ x: 5,y: 5 })
      Text('在 Column 和 Row 中使用space会导致容器无法完全覆盖内部元素，原因是space扩展的高度（宽度）容器组件没有计算').fontSize(20)
      Column({space:20}){
        Text('Column with space').fontSize(20)
        Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green})
        Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green})
        Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green})
      }
      .padding(10)
      .border({width:3,style:BorderStyle.Solid,color:Color.Red})
      .width('100%')
      Column(){
        Text('without space').fontSize(20).margin(10)
        Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green}).margin(10)
        Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green}).margin(10)
        Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green}).margin(10)
      }
      .padding(10)
      .border({width:3,style:BorderStyle.Solid,color:Color.Red})
      Flex({justifyContent: FlexAlign.SpaceAround}){
        Row({space:30}){
          Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green})
          Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green})
        }
        .padding(10)
        .border({width:3,style:BorderStyle.Solid,color:Color.Red})
        Row(){
          Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green}).margin(10)
          Text('content').border({width:3,style:BorderStyle.Solid,color:Color.Green}).margin(10)
        }
        .padding(10)
        .border({width:3,style:BorderStyle.Solid,color:Color.Red})
      }
    }
    .width('100%')
    .height('100%')
  }
}