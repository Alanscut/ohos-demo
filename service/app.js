const express = require('express')
const fs = require('fs')
const bodyParser = require('body-parser')

const app = express()
app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Credentials': true,
  'Access-Control-Allow-Methods': 'GET',
  'Access-Control-Allow-Headers': 'Content-Type'
}

app.get('/get/info', function(req, res) {
  res.set(cors)
  res.send('Got a GET request at /get/info')
})

app.post('/post/info', function(req, res) {
  res.set(cors)
  console.log('*** POST --> ' + JSON.stringify(req.body))
  res.send('Got a POST request at /post/info')
})

app.put('/put/info', function(req, res) {
  res.set(cors)
  console.log('*** PUT --> ' + JSON.stringify(req.body))
  res.send('Got a PUT request at /put/info')
})

app.delete('/delete/info', function(req, res) {
  res.set(cors)
  res.send('Got a DELETE request at /delete/info')
})

app.post('/download/info', (req, res) => {
  const filePath = './files/test.jpg'
  const fileName = 'test.jpg'
  res.set({
    'content-type': 'application/octet-stream',
    'content-disposition': 'attachment;filename=' + encodeURI(fileName)
  })

  fs.createReadStream(filePath).pipe(res)
})
app.listen(3000, () => {
  console.log('服务开启成功，监听 3000 端口');
})