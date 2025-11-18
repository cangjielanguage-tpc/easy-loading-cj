<div align="center">
<h1>easy-loading-cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v1.0.0-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v1.0.3-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-90%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

easy-loading-cj 提供了27种 loading/Toast 动画加载效果。

<p align="left">
<img src="./doc/assets/easyloading_gif_demo.gif"  width="30%">
</p>

## 特性

- 提供 27 种 动画加载效果  分别为RotatePlain,DoubleBounce,ShowWave,WanderingCubes,FadingFour,FadingCube,Pulse,SpinChasingDots，SpinChasingDots,ThreeBounce,Circle,StaticCircle,RotateCircles,RotateFourCircles,
  RotateEightCircles,CubeGrid,FadingCircle,RotateCircle,FoldingCube,PumpHeart,HourGlass,PouringHourGlass,SpinKitFadingGrid,Ring,MoveRing,SpinningCircle,SquareCircle,DualRing
- 提供 Toast 功能

### 源码目录

```shell
├─AppScope
├─doc            # API文档和使用手册存放目录                   
├─entry          # 示例代码文件夹                  
├─easyloading    # easyloading 库源目录                  
│  └─src
│      └─main
│          ├─cangjie
│          │  └─src          # easyloading  27种动画效果源码                         
│          └─resources
├─hvigor     # 构建工具目录
├─README.md  # easy-loading-cj 介绍及使用说明
```
## 接口说明

主要类和函数接口说明详见 [API](doc/feature_api.md)

## 使用说明

### 编译构建

1. 源码编译

```shell
   1.下载源码 
   git clone https://gitcode.com/Cangjie-TPC/easy-loading-cj.git
   
   2.引用源码
   复制easyloading模块,粘贴到自身项目根级目录,并在cjpm.toml中添加依赖
   
    [dependencies.easyloading]
       path = "../../../../easyloading/src/main/cangjie"
       version = "1.0.0"
      
   3.使用源码
   import easyloading.*
   
```

2. har包编译

```shell
   1.下载源码 
   git clone https://gitcode.com/Cangjie-TPC/easy-loading-cj.git
   
   2.har包编译
   选中easyloading模块,点击 Build -> Make Module 'easyloading' 等待编译完成
   
   3.使用har包
   获取har包 easyloading\build\default\outputs\default\easyloading.har 复制到自身项目/libs下,并在oh-package.json5中添加依赖
     "dependencies": {
       "easyloading": "file:./libs/easyloading.har"
     }

   4.使用源码
   import easyloading.*
   
```

## 功能示例

详见 `entry`

### 

```cangjie
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.resource_manager.*
import easyloading.*

@Entry
@Component
public class EntryView {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()  // 测试 fadeGrid 指示器
    @State
    var loadingModel1: EasyLoadingModel = EasyLoadingModel()  // 测试Toast---无图标
    @State
    var loadingModel2: EasyLoadingModel = EasyLoadingModel()  // 测试Toast---有图标
    @State
    var loadingModel3: EasyLoadingModel = EasyLoadingModel() //测试Toast---offset
    @State
    var fadeGridmodel: ?FadingGridModel = Option<FadingGridModel>.None //  fadeGridModel 
    @State
    var toastModel: ?ToastModel = Option<ToastModel>.None   // ToastModel

    protected override func aboutToAppear(): Unit {
        //-----测试指示器-------------
        this.fadeGridmodel = FadingGridModel()
        .setColorArray([Color.BLACK])
        .setSize(50.0)
        .setRowsGap(2.0)
        .setColumnsGap(2.0)

        this.loadingModel
        .setIndicatorType(EasyLoadingIndicatorType.FADINGGRID)
        .setFadingGridModel(this.fadeGridmodel.getOrThrow())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

        //--------------测试Toast---无图标--------

        this.loadingModel1
        .setText("Toast")
        .setWidth(80.0)
        .setHeight(50.0)
        .setBackground(Color.BLACK)
        .setFontColor(Color.WHITE)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

         //--------------测试Toast---有图标--------
        this.toastModel = ToastModel()
        .setWidth(50.0)
        .setHeight(50.0)
        .setIcon(@r(app.media.dui))

        this.loadingModel2
        .setText("Great Success!")
        .setWidth(140.0)
        .setHeight(110.0)
        .setBackground(Color.BLACK)
        .setFontColor(Color.WHITE)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setToastModel(this.toastModel.getOrThrow())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

        //--------------测试Toast---offset--------
        this.loadingModel3
        .setText("Toast")
        .setWidth(80.0)
        .setHeight(50.0)
        .setBackground(Color.BLACK)
        .setFontColor(Color.WHITE)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setMaskDisplayAnimator(0.5)
        .setIsOffset(true)
        .setOffsetDirection(Alignment.Top)
        .setOffsetY(70.0)

    }
    func build() {
         Column {
            Column() {
                Column() {
                    Row{
                        Text("show").fontColor(Color.BLUE).margin(right:10)
                        .onClick ({ event =>
                            this.loadingModel = this.loadingModel.show()
                        })

                        Text("showToast").fontColor(Color.BLUE).margin(right:10)
                        .onClick ({ event =>
                            this.loadingModel1 = this.loadingModel1.show()
                        })

                        Text("showToastSuccess").fontColor(Color.BLUE).margin(right:10)
                        .onClick ({ event =>
                            this.loadingModel2 = this.loadingModel2.show()
                        })

                    }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                    .margin(bottom: 30)
                }
                Column() {
                        Row{
                            Text("showToastOffset").fontColor(Color.BLUE).margin(right:10)
                            .onClick ({ event =>
                                this.loadingModel3 = this.loadingModel3.show()
                            })

                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 30)
                    }
            }
            Column() {
                EasyLoading(model: this.loadingModel)
                EasyLoading(model: this.loadingModel1)
                EasyLoading(model: this.loadingModel2)
                EasyLoading(model: this.loadingModel3)
            }.position(x: 0.vp,y: 0.vp).zIndex(100)
        }.width(100.percent).height(100.percent)
    }
}
```
<p align="left">
<img src="./doc/assets/sl.gif"  width="30%">
</p>

## 约束与限制

在下述版本验证通过：

    Cangjie Support Plugin 5.1.1.840
    
    1.PouringHourGlass PumpingHeart两个加载动画没有填充效果

## 开源协议

本项目基于 [MIT License](./LICENSE)，请自由的享受和参与开源。

## 参与贡献

欢迎给我们提交 PR，欢迎给我们提交 Issue，欢迎参与任何形式的贡献。
