
# FAQ

## 1.通过远程模拟器在本地调试http请求失败

> 需要依次检查

- 检查是否配置了 `ohos.permission.INTERNET` 权限
- 检查是否配置了 `"cleartextTraffic": true`
- 本地启动的服务，**需要映射到公网**，通过公网地址访问，如果不能直接访问 `http://localhost:3000/get/user`，而要先将`127.0.0.1:3000`映射到公网（如`ohos.example`）后访问，如：`http://ohos.example/get/user`

## 2.无法启动ets工程测试用例

> 默认模板创建的ETS工程（API 7）的`ohosTestImplementation` 版本号为`1.0.0.100`，需要更改为 `2.0.0.100`

