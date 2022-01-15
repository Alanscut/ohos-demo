
# FAQ

## 1.通过远程模拟器在本地调试http请求失败

> 需要依次检查

- 检查是否配置了 `ohos.permission.INTERNET` 权限
- 检查是否配置了 `"cleartextTraffic": true`
- 本地启动的服务，**需要映射到公网**，通过公网地址访问，如果不能直接访问 `http://localhost:3000/get/user`，而要先将`127.0.0.1:3000`映射到公网（如`ohos.example`）后访问，如：`http://ohos.example/get/user`

## 2.无法启动ets工程测试用例

> 默认模板创建的ETS工程（API 7）的`ohosTestImplementation` 版本号为`1.0.0.100`，需要更改为 `2.0.0.100`

## 3.旧版IDE上打开最新版IDE上创建的工程提示gradle版本过低

> 通常这种提示版本过低的原因是项目配置文件build.gradle中的插件版本号不兼容导致的，如最新的 `3.0.0.800` 创建的项目部分默认参数如下：

```
classpath 'com.huawei.ohos:hap:3.0.5.2'
classpath 'com.huawei.ohos:decctest:1.2.7.2'
```

而在上一个版本 `3.0.0.691` 中的默认参数为：

```
classpath 'com.huawei.ohos:hap:3.0.3.4'
classpath 'com.huawei.ohos:decctest:1.2.6.0'
```

只有将 `build.gradle` 中的版本号调整到与当前 IDE 版本所匹配的版本号即可正常工作。最简单的做法就是在当前 IDE 中创建一个新的模板项目，然后配置文件中的参数拷贝到需要更改版本号的项目中。