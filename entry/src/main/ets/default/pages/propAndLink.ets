import router from '@system.router';

@Entry
@Component
struct PropAndLink {
  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Button('back home').onClick(() => {
        router.back()
      }).offset({ x: 10, y: 10 })




    }
    .width('100%')
    .height('100%')
  }
}
