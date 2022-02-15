import router from '@system.router';

@Entry
@Component
struct Index {
  build() {
    Column({ space: 30 }) {
        Button('requestDem').onClick(() => {
          router.push({
            uri: 'pages/requestDem'
          })
        })
//        Button('prop').onClick(() => {
//          router.push({
//            uri: 'pages/propAndLink'
//          })
//        })
    }
    .width('100%')
    .height('100%')
    .margin(15)
  }
}