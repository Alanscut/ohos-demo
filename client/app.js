const axios = require('axios')
const fs = require('fs')
const path = require('path')

const instance = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 1000,
  header: { 'X-Custom-header': 'foobar' },
})

function get() {
  instance.get('/get/info').then((data) => {
    console.log('*** data = ', data.data)
  })
}

get()

function post() {
  instance.post('/post/info', { post: { a: 1, b: 2 } }).then((data) => {
    console.log('*** data = ', data.data)
  })
}

post()

function put() {
  instance.put('/put/info', { put: { a: 3, b: 4 } }).then((data) => {
    console.log('*** data = ', data.data)
  })
}

put()

function del() {
  instance.delete('/delete/info').then((data) => {
    console.log('*** data = ', data.data)
  })
}

del()

async function download() {
  const filePath = path.resolve(__dirname, 'file', 'test.jpg')
  const writer = fs.createWriteStream(filePath)

  const response = await axios({
    url: 'http://localhost:3000/download/info',
    method: 'GET',
    responseType: 'stream',
  })

  response.data.pipe(writer)
  return new Promise((resolve, reject) => {
    writer.on('finish', resolve)
    writer.on('error', reject)
  })
}

download()
