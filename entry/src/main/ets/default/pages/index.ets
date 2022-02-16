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
        Button('space problem').onClick(() => {
          router.push({
            uri: 'pages/spaceProblem'
          })
        })
        Button('watch prop problem').onClick(() => {
          router.push({
            uri: 'pages/watchPropProblem'
          })
        })
        Button('offset problem of customDialog').onClick(() => {
          router.push({
            uri: 'pages/customDialogOffsetProblem'
          })
        })
        Button('position problem').onClick(() => {
          router.push({
            uri: 'pages/positionProblem'
          })
        })
    }
    .width('100%')
    .height('100%')
    .margin({top:30})
  }
}