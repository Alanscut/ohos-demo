// @ts-nocheck
import axios from 'axios'
import fileio from '@ohos.fileio';
import http from '@ohos.net.http'
import request from '@ohos.request';
import ability_featureAbility from '@ohos.ability.featureAbility';

var context = ability_featureAbility.getContext();

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
            let url = "http://ohos.free.idcfengye.com/get/info"
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
            let url = "http://ohos.free.idcfengye.com/post/info"
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
            let url = "http://ohos.free.idcfengye.com/put/info"
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
            let url = "http://ohos.free.idcfengye.com/delete/info"
            axios.delete(url).then((data) => {
              console.info('### response code = ' + data.status);
              console.info('### response data = ' + data.data);
            })
          })
      }

      Button() {
        Text("get image")
          .fontSize(30)
          .onClick(async () => {
            let url = "http://ohos.free.idcfengye.com/download/info";
            let httpReq = http.createHttp();
            let rootPath = '';
            //            httpReq.request(url, { header: { 'responseType': 'stream' } }, (err, data) => {
            httpReq.request(url, { header: { 'Content-Type': 'image/png' } }, (err, data) => {
              context.getFilesDir().then((path) => {
                // 获取内部存储路径
                rootPath = path;
                console.info('### rootPath = ' + rootPath)

                if (!err) {
                  console.info('### data = ' + data.result)
                  console.info('### status = ' + data.responseCode)
                  // 创建写文件流
                  let picPath = rootPath + '/test.jpg';
                  let ss = fileio.createStreamSync(picPath, 'w+');
                  let num = ss.writeSync(data.result)
                  console.info('### num = ' + num)

                  // 创建读文件流
                  let readStream = fileio.createStreamSync(picPath, 'r+');
                  let readNum = readStream.readSync(new ArrayBuffer(1024*1024))
                  console.info('### readNum = ' + readNum)

                } else {
                  console.info('### failed = ' + err.data)
                }
              }).catch((error) => {
                console.info('### Failed to obtain the file directory. Cause: ' + error.message)
              })
            })
          })
      }

      Button() {
        Text("request download image")
          .fontSize(30)
          .onClick(() => {
            request.download({
              //              url: 'http://ohos.free.idcfengye.com/download/info'
              url: 'https://github.com/axios/axios/archive/refs/tags/v0.24.0.zip'
            }, (err, data) => {
              if (err) {
                console.info('### Fail to request download' + err);
                return;
              }
              console.info('### Success to request download' + err);

              let downloadTask = data;
              downloadTask.on('progress', (uploadSize, totalSize) => {
                console.info('### upload totalSize:' + totalSize + "  uploadedSize: " + uploadSize)
              })
              downloadTask.on('complete', () => {
                console.info('### Download Task completed')
              })
            })
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}