# easy-loading-cj 特性文档

## 介绍

easy-loading-cj 提供了多种 loading/Toast 动画加载效果。

## 1 动画指示器

### 1.1 EasyLoadingModel

动画指示器数据配置类

```cangjie

public class EasyLoadingModel {
    /**
     * 设置动画指示器类型，默认 None
     *
     * 参数 indicatorType - 动画指示器类型
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setIndicatorType(indicatorType: EasyLoadingIndicatorType): EasyLoadingModel 
    /**
     * 设置 FadingGrid 动画效果的数据
     * 
     * 参数 fadingGridModel - FadingGrid 动画效果的数据
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setFadingGridModel(fadingGridModel: FadingGridModel): EasyLoadingModel
    /**
     * 设置 CubeGrid 动画效果的数据
     *
     * 参数 cubeGridModel - CubeGrid 动画效果的数据
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setCubeGridModel(cubeGridModel: CubeGridModel): EasyLoadingModel 
    /**
     * 设置 PumpingHeart 动画效果的数据
     *
     * 参数 pumpingHeartModel - PumpingHeart 动画效果的数据
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setPumpingHeartModel(pumpingHeartModel: PumpingHeartModel): EasyLoadingModel 
    /**
     * 设置 Toast 动画效果的数据
     *
     * 参数 toastModel - Toast 动画效果的数据
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setToastModel(toastModel: ToastModel): EasyLoadingModel
    /**
     * 获取 FadingGrid 数据配置类
     *
     * 返回 ?FadingGridModel - FadingGrid 数据配置类
     */
    public func getFadingGridModel(): ?FadingGridModel 
    /**
     * 获取 CubeGridModel 数据配置类
     *
     * 返回 ?CubeGridModel - CubeGridModel 数据配置类
     */
    public func getCubeGridModel(): ?CubeGridModel
    /**
     * 获取 PumpingHeartModel 数据配置类
     *
     * 返回 ?PumpingHeartModel - PumpingHeartModel 数据配置类
     */
    public func getPumpingHeartModel(): ?PumpingHeartModel 
    /**
     * 获取 ToastModel 数据配置类
     *
     * 返回 ?ToastModel - ToastModel 数据配置类
     */
    public func getToastModel(): ?ToastModel
    /**
     * 获取动画指示器类型
     *
     * 返回 ?EasyLoadingIndicatorType - 动画指示器类型
     */
    public func getIndicatorType(): ?EasyLoadingIndicatorType 

    /**
     * 设置指示器宽度，默认 120.0
     *
     * 参数 width - 指示器宽度
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */    
    public func setWidth(width: Float64): EasyLoadingModel
    /**
     * 设置指示器高度，默认 120.0
     *
     * 参数 height - 指示器高度
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setHeight(height: Float64): EasyLoadingModel 
    /**
     * 设置指示器背景颜色，默认 Color.WHITE
     *
     * 参数 background - 指示器背景颜色
     * 返回 EasyLoadingModel - 动画指示器数据配置类 
     */
    public func setBackground(background: Color): EasyLoadingModel
    /**
     * 设置指示器圆角，默认 10.vp
     *
     * 参数 borderRadius - 指示器圆角
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setBorderRadius(borderRadius: Length): EasyLoadingModel 
    /**
     * 设置指示器顶部内边距，默认 20.0
     *
     * 参数 paddingTop - 顶部内边距
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setPaddingTop(paddingTop: Float64): EasyLoadingModel
    /**
     * 设置指示器文本内容，默认 "loading..."
     *
     * 参数 text - 指示器文本内容 
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setText(text: String): EasyLoadingModel
    /**
     * 设置指示器文本颜色，默认 Color.BLACK
     *
     * 参数 fontColor - 指示器文本颜色
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setFontColor(fontColor: Color): EasyLoadingModel
    /**
     * 设置指示器文本字体大小，默认 15.0
     *
     * 参数 fontSize - 文本字体大小
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setFontSize(fontSize: Float64): EasyLoadingModel
    /**
     * 设置指示器文本上边距，默认 50.0
     *
     * 参数 textMarginTop - 文本上边距
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setTextMarginTop(textMarginTop: Float64): EasyLoadingModel 
    /**
     * 设置指示器文本字体粗细，默认 FontWeight.Normal
     *
     * 参数 fontWeight - 文本字体粗细
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setFontWeight(fontWeight: FontWeight): EasyLoadingModel 

    /**
     * 是否设置遮罩，默认 true
     *
     * 参数 isMask - true:设置，falseL:不设置
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setMask(isMask: Bool): EasyLoadingModel
    /**
     * 设置遮罩颜色，默认 Color.BLACK
     *
     * 参数 maskBgColor - 遮罩颜色
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setMaskBgColor(maskBgColor: Color): EasyLoadingModel
    /**
     * 设置遮罩透明度，默认 0.5，在没有设置透明度动画的情况下
     *
     * 参数 maskOpacityNormal - 遮罩透明度
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setMaskDisplayNormal(maskOpacityNormal: Float64): EasyLoadingModel
    /**
     * 设置遮罩透明度动画时透明度大小，默认 0.5
     *
     * 参数 - 
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setMaskDisplayAnimator(maskOpacityTo: Float64): EasyLoadingModel 

    /**
     * 动画指示器显示
     *
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func show(): EasyLoadingModel
    /**
     * 动画指示器消失
     *
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func hide(): EasyLoadingModel

    /**
     * 是否点击遮罩的任意位置，遮罩消失，默认 true
     *
     * 参数 isClickAnyHide - true:消失，false：不消失
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func isClickMaskAnyHide(isClickAnyHide: Bool): EasyLoadingModel

    /**
     * 是否设置缩放效果动画效果，默认 false
     *
     * 参数 isScale - true:设置，false:不设置
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */    
    public func setIsScale(isScale: Bool): EasyLoadingModel 
    /**
     * 设置缩放动画时，缩放的大小,默认 1.0
     *
     * 参数 scaleTo - 缩放的大小
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setScaleAnimator(scaleTo: Float32): EasyLoadingModel 


    /**
     * 是否设置旋转动画效果，默认 false
     *
     * 参数 isRotate - true:设置，false:不设置
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */    
    public func setIsRotate(isRotate: Bool): EasyLoadingModel
    /**
     * 设置旋转动画效果时，旋转的角度大小，默认 360.0
     *
     * 参数 rotateTo - 旋转的角度大小
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setRotateAnimator(rotateTo: Float32): EasyLoadingModel 


    /**
     * 是否设置组件平移动画效果，默认 false
     *
     * 参数 isOffset - true:设置。false:不设置
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */    
    public func setIsOffset(isOffset: Bool): EasyLoadingModel 
    /**
     * 设置组件平移方向，默认 Alignment.Center 
     *
     * 参数 direction - 平移方向
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setOffsetDirection(direction: Alignment): EasyLoadingModel 
    /**
     * 设置组件动画效果 X 方向偏移大小，默认 0.0
     *
     * 参数 offsetX - X 偏移大小
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setOffsetX(offsetX: Float64): EasyLoadingModel 
    /**
     * 设置组件动画效果 Y 方向偏移大小，默认 0.0
     *
     * 参数 offsetY - Y 方向偏移大小
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setOffsetY(offsetY: Float64): EasyLoadingModel
    
    /**
     * 是否设置组件透明度动画效果，默认 false
     *
     * 参数 Opacity - true:设置，false:不设置
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */    
    public func setIsOpacity(Opacity: Bool): EasyLoadingModel 
    /**
     * 设置组件透明度动画效果时透明度大小
     *
     * 参数 opacityTo - 透明度
     * 返回 EasyLoadingModel - 动画指示器数据配置类
     */
    public func setAnimatorOpacity(opacityTo: Float64): EasyLoadingModel
}
```
### 1.2 EasyLoading

动画指示器组件

```cangjie
@Component
public class EasyLoading {
    @State    
    var model: EasyLoadingModel = EasyLoadingModel()  // 指示器数据配置类
}
```

### 1.3 EasyLoadingIndicatorType

动画指示器类型

```cangjie
public enum EasyLoadingIndicatorType {
    | FADINGCIRCLE
    | CIRCLE
    | THREEBOUNCE
    | CHASINGGDOTS
    | WAVE
    | WANDERINGCUBES
    | ROTATINNGPLAIN
    | DOUBLEBOUNCE
    | FADINGFOUR
    | FADINGCUBE
    | PLUSE
    | CUBEGRID
    | ROTATINGCIRCLE
    | FOLDINGCUBE
    | PUMPINGHEART
    | DUALRING
    | HOURGLASS
    | POURINGGHOURGLASS
    | FADINGGRID
    | RING
    | RIPPLE
    | SPINNINGCIRCLE
    | SQUARECIRCLE
    | TOAST
}
```

## 2 动画效果

### 2.1 FadingGrid

#### 2.1.1 FadingGridModel

```cangjie

public class FadingGridModel {
    /**
     * 设置  的宽度，默认 120.0
     *
     * 参数 width - 宽度
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setWidth(width: Float64): FadingGridModel 
    /**
     * 设置 FadingGrid 的高度，默认120.0
     *
     * 参数 height - 高度
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setHeight(height: Float64): FadingGridModel
    /**
     * 设置水平间距，默认 10.0
     *
     * 参数 rowsGap - 水平间距
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setRowsGap(rowsGap: Float64): FadingGridModel
    /**
     * 设置垂直间距，默认 10.0
     *
     * 参数 columnsGap - 垂直间距
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setColumnsGap(columnsGap: Float64): FadingGridModel
    /**
     * 设置颜色数组，默认 [Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED]
     *
     * 参数 colorArray - 颜色数组
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setColorArray(colorArray: Array<Color>): FadingGridModel
    /**
     * 设置动画时长，默认 600
     *
     * 参数 duration - 动画时长
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setDuration(duration: Int32): FadingGridModel
    /**
     * 设置起始透明度大小，默认 0.4
     *
     * 参数 startOpcity - 起始透明度
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setStartOpcity(startOpcity: Float64): FadingGridModel
    /**
     * 设置结尾透明度大小，默认 0.9
     *
     * 参数 endOpcity - 结尾透明度 
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */
    public func setEndOpcity(endOpcity: Float64): FadingGridModel
    /**
     * 设置形状，默认 ShapeStyle.RECT
     *
     * 参数 shapeStyle - 形状
     * 返回 FadingGridModel - FadingGrid 数据配置类
     */   
    public func setShapeStyle(shapeStyle: ShapeStyle): FadingGridModel
}
```

#### 2.1.2 FadingGrid 组件

```cangjie
@Component
public class FadingGrid {
    @State
    var model: FadingGridModel = FadingGridModel()  // FadingGrid 数据配置类
}
```


### 2.2 CubeGrid

#### 2.2.1 CubeGridModel

```cangjie

public class CubeGridModel {
    /**
     * 设置  的宽度，默认 120.0
     *
     * 参数 width - 宽度
     * 返回 CubeGridModel - CubeGrid 数据配置类
     */
    public func setWidth(width: Float64): CubeGridModel 
    /**
     * 设置 CubeGrid 的高度，默认120.0
     *
     * 参数 height - 高度
     * 返回 CubeGridModel - CubeGrid 数据配置类
     */
    public func setHeight(height: Float64): CubeGridModel
   
    /**
     * 设置颜色数组，默认 [Color(0xf44236), Color(0x4cb050)]
     *
     * 参数 colorArray - 颜色数组
     * 返回 CubeGridModel - CubeGrid 数据配置类
     */
    public func setColorArray(colorArray: Array<Color>): CubeGridModel
    /**
     * 设置动画时长，默认 600
     *
     * 参数 duration - 动画时长
     * 返回 CubeGridModel - CubeGrid 数据配置类
     */
    public func setDuration(duration: Int32): CubeGridModel

    /**
     * 设置形状，默认 ShapeStyle.RECT
     *
     * 参数 shapeStyle - 形状
     * 返回 CubeGridModel - CubeGrid 数据配置类
     */   
    public func setShapeStyle(shapeStyle: ShapeStyle): CubeGridModel
}
```

#### 2.2.2  CubeGrid 组件

```cangjie
@Component
public class CubeGrid {
    @State
    var model: CubeGridModel = CubeGridModel()  // CubeGrid 数据配置类
}
```


### 2.3 DualRing

#### 2.3.1 DualRingModel

```cangjie

public class DualRingModel {
    /**
     * 设置  的宽度，默认 100.0
     *
     * 参数 width - 宽度
     * 返回 DualRingModel - DualRing 数据配置类
     */
    public func setWidth(width: Float64): DualRingModel 
    /**
     * 设置 DualRing 的高度，默认100.0
     *
     * 参数 height - 高度
     * 返回 DualRingModel - DualRing 数据配置类
     */
    public func setHeight(height: Float64): DualRingModel
   
    /**
     * 设置圆环颜色，默认 Color.RED
     *
     * 参数 color - 圆环颜色
     * 返回 DualRingModel - DualRing 数据配置类
     */
    public func setColor(color: Color): DualRingModel

    /**
     * 设置圆环背景颜色，默认 Color.BLACK
     *
     * 参数 bgColor - 圆环背景颜色
     * 返回 DualRingModel - DualRing 数据配置类
     */
    public func setBgColor(bgColor: Color): DualRingModel
    /**
     * 设置动画时长，默认 1200
     *
     * 参数 duration - 动画时长
     * 返回 DualRingModel - DualRing 数据配置类
     */
    public func setDuration(duration: Int32): DualRingModel

    /**
     * 设置圆环宽度，默认 10.0
     *
     * 参数 borderWidth - 圆环宽度
     * 返回 DualRingModel - DualRingModel 数据配置类
     */   
    public func setBorderWidth(borderWidth: Float64): DualRingModel
}
```

#### 2.3.2 组件

```cangjie
@Component
public class DualRing {
    @State
    var model: DualRingModel = DualRingModel() // DualRing 数据配置类
}
```

### 2.4 WanderingCubes

#### 2.4.1 WanderingCubesModel

```cangjie

public class WanderingCubesModel {
    /**
     * 设置 WanderingCubes 的宽度，默认 50.0
     *
     * 参数 width - 宽度
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */
    public func setWidth(width: Float64): WanderingCubesModel 
    /**
     * 设置 WanderingCubes 的高度，默认 50.0
     *
     * 参数 height - 高度
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */
    public func setHeight(height: Float64): WanderingCubesModel

    /**
     * 设置内部元素的宽度，默认 13.0
     *
     * 参数 width - 内部元素的宽度
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */
    public func setInsideWidth(width: Float64): WanderingCubesModel 
    /**
     * 设置设置内部元素的高度，默认 13.0
     *
     * 参数 height - 内部元素的高度
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */
    public func setInsidHeight(height: Float64): WanderingCubesModel
   
    /**
     * 设置内部元素颜色，默认 [Color.BLACK, Color.BLACK]
     *
     * 参数 color - 内部元素颜色数组，长度至少 为 2
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */
    public func setColor(color: Array<Color>): WanderingCubesModel

    /**
     * 设置动画时长，默认 400
     *
     * 参数 duration - 动画时长
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */
    public func setDuration(duration: Int32): WanderingCubesModel
    /**
     * 设置形状，默认 ShapeStyle.RECT
     *
     * 参数 shapeStyle - 形状
     * 返回 WanderingCubesModel - WanderingCubes 数据配置类
     */   
    public func setShapeStyle(shapeStyle: ShapeStyle): WanderingCubesModel
}
```

#### 2.4.2 WanderingCubes 组件

```cangjie
@Component
public class WanderingCubes {
    @State
    var model: WanderingCubesModel = WanderingCubesModel()  // WanderingCubes 数据配置类
}
```


### 2.5 PumpingHeart

#### 2.5.1 PumpingHeartModel

```cangjie

public class PumpingHeartModel {
    /**
     * 设置 PumpingHeart 的宽度，默认 120.0
     *
     * 参数 width - 宽度
     * 返回 PumpingHeartModel - PumpingHeart 数据配置类
     */
    public func setWidth(width: Float64): PumpingHeartModel 
    /**
     * 设置 PumpingHeart 的高度，默认 120.0
     *
     * 参数 height - 高度
     * 返回 PumpingHeartModel - PumpingHeart 数据配置类
     */
    public func setHeight(height: Float64): PumpingHeartModel

   
    /**
     * 设置内部元素颜色，默认 Color.RED
     *
     * 参数 color - 内部元素颜色
     * 返回 PumpingHeartModel - PumpingHeart 数据配置类
     */
    public func setColor(color: Color): PumpingHeartModel

    /**
     * 设置动画时长，默认 600
     *
     * 参数 duration - 动画时长
     * 返回 PumpingHeartModel - PumpingHeart 数据配置类
     */
    public func setDuration(duration: Int32): PumpingHeartModel
    /**
     * 设置形状，默认 ShapeStyle.RECT
     *
     * 参数 shapeStyle - 形状
     * 返回 PumpingHeartModel - PumpingHeart 数据配置类
     */   
    public func setShapeStyle(shapeStyle: ShapeStyle): PumpingHeartModel
}
```

#### 2.5.2 PumpingHeart 组件

```cangjie
@Component
public class PumpingHeart {
    @State
    var model: PumpingHeartModel = PumpingHeartModel()  // PumpingHeart 数据配置类
}
```


### 2.6 ToastIndicator

#### 2.6.1 ToastModel

```cangjie

public class ToastModel {
    /**
     * 设置 Toast 的宽度，默认 120.0
     *
     * 参数 width - 宽度
     * 返回 ToastModel - Toast 数据配置类
     */
    public func setWidth(width: Float64): ToastModel 
    /**
     * 设置 Toast 的高度，默认 120.0
     *
     * 参数 height - 高度
     * 返回 ToastModel - Toast 数据配置类
     */
    public func setHeight(height: Float64): ToastModel

    /**
     * 设置 Toast 图标
     *
     * 参数 icon - 图标
     * 返回 ToastModel - Toast 数据配置类
     */   
    public func setIcon(icon: CJResource): ToastModel

    /**
     * 设置 Toast 图标
     *
     * 参数 icon - 图标
     * 返回 ToastModel - Toast 数据配置类
     */
    public func setIcon(icon: String): ToastModel

    /**
     * 设置 Toast 图标
     *
     * 参数 icon - 图标
     * 返回 ToastModel - Toast 数据配置类
     */
    public func setIcon(icon: PixelMap): ToastModel
}
```

#### 2.5.2 ToastIndicator 组件

```cangjie
@Component
public class ToastIndicator {
    @State
    var model: ToastModel = ToastModel()
}
```

## 3 其他

```cangjie
public enum ShowShapeType {
    | Circle  //圆形
    | Rect    //方形
}
```

## 4 示例

### 4.1 动画效果实例
```
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.resource_manager.*
internal import easyloading.*

@Entry
@Component
public class AllTest {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()
    @State
    var fadeGridmodel: ?FadingGridModel = Option<FadingGridModel>.None

    protected override func aboutToAppear(): Unit {
        //-----测试指示器-------------
        this.fadeGridmodel = FadingGridModel()
        .setColorArray([Color.BLACK])
        .setWidth(50.0)
        .setHeight(50.0)
        .setRowsGap(2.0)
        .setColumnsGap(2.0)

        this.loadingModel
        .setIndicatorType(EasyLoadingIndicatorType.FADINGGRID)
        .setFadingGridModel(this.fadeGridmodel())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)     

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
                    }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                    .margin(bottom: 30)
                }

            }
            Column() {
                EasyLoading(model: this.loadingModel)
            }.position(x: 0.vp,y: 0.vp).zIndex(100)
        }.width(100.percent).height(100.percent)
    }
}
```

### 4.2 不带图标 Toast 示例
```
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.resource_manager.*
internal import easyloading.*

@Entry
@Component
public class AllTest {
    @State
    var loadingModel1: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel3: EasyLoadingModel = EasyLoadingModel()

    protected override func aboutToAppear(): Unit {
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
        //.setScaleAnimator(1.0)
        //.setRotateAnimator(360.0)


    }
    func build() {
         Column {
            Column() {
                Column() {
                    Row{
                        Text("showToast").fontColor(Color.BLUE).margin(right:10)
                        .onClick ({ event =>
                            this.loadingModel1 = this.loadingModel1.show()
                        })

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
                EasyLoading(model: this.loadingModel1)
                EasyLoading(model: this.loadingModel3)
            }.position(x: 0.vp,y: 0.vp).zIndex(100)
        }.width(100.percent).height(100.percent)
    }
}
```

### 4.3 带图标 Toast 示例
```
import ohos.state_macro_manage.*
import ohos.resource_manager.*

@Entry
@Component
public class AllTest {
    @State
    var loadingModel2: EasyLoadingModel = EasyLoadingModel()
    @State
    var toastModel: ?ToastModel = Option<ToastModel>.None

    protected override func aboutToAppear(): Unit {
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
        .setToastModel(this.toastModel())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

    }
    func build() {
         Column {
            Column() {
                Column() {
                    Row{
                        Text("showToastSuccess").fontColor(Color.BLUE).margin(right:10)
                        .onClick ({ event =>
                            this.loadingModel2 = this.loadingModel2.show()
                        })

                    }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                    .margin(bottom: 30)
                }
            }
            Column() {
                EasyLoading(model: this.loadingModel2)
            }.position(x: 0.vp,y: 0.vp).zIndex(100)
        }.width(100.percent).height(100.percent)
    }
}
```