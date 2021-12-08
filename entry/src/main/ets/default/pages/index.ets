import axios from 'axios'

@Entry
@Component
struct Index {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button() {
        Text("get request")
          .fontSize(30)
          .onClick(() => {
            let url = "http://localhost:3000/get/info"
            axios.get(url).then((data) => {
              console.info('### response code = ' + data.status);
              console.info('### response data = ' + data.data);
            })
          })
      }

      Button() {
        Text("post request")
          .fontSize(30)
          .onClick(() => {
            let url = "http://localhost:3000/post/info"
            axios.post(url).then((data) => {
              console.info('### response code = ' + data.status);
              console.info('### response data = ' + data.data);
            })
          })
      }

      Button() {
        Text("put request")
          .fontSize(30)
          .onClick(() => {
            let url = "http://localhost:3000/put/info"
            axios.put(url).then((data) => {
              console.info('### response code = ' + data.status);
              console.info('### response data = ' + data.data);
            })
          })
      }

      Button() {
        Text("delete request")
          .fontSize(30)
          .onClick(() => {
            let url = "http://localhost:3000/delete/info"
            axios.delete(url).then((data) => {
              console.info('### response code = ' + data.status);
              console.info('### response data = ' + data.data);
            })
          })
      }

      Button() {
        Text("upload request")
          .fontSize(30)
          .onClick(() => {
            let url = "http://localhost:3000/upload/info"
            axios.post(url).then((data) => {
              console.info('### response code = ' + data.status);
              console.info('### response data = ' + data.data);
            })
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}