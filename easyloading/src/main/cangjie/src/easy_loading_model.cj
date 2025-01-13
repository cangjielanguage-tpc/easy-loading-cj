/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading
import ohos.state_macro_manage.*


@Observed
public class EasyLoadingModel {
    @Publish
    var indicatorType: ?EasyLoadingIndicatorType = Option<EasyLoadingIndicatorType>.None
    @Publish
    var indicatorModel: ?SpinKitFadingGridModel = Option<SpinKitFadingGridModel>.None

    //----------------style-------------------------
    @Publish
    var width: Float64 = 120.0
    @Publish
    var height: Float64 = 120.0
    @Publish
    var background: Color = Color.WHITE
    @Publish
    var borderRadius: Length = 10.vp
    @Publish
    var paddingTop: Float64 = 20.0
    @Publish
    var text: String = "loading..."
    @Publish
    var fontColor: Color = Color.BLACK
    @Publish
    var fontSize: Float64 = 15.0
    @Publish
    var textMarginTop: Float64 = 50.0
    @Publish
    var fontWeight: FontWeight = FontWeight.Normal

    //----------------------mask------------------
    @Publish
    var isMask: Bool = true
    //无动画设置透明度
    @Publish
    var maskOpacityNormal: Float64 = 0.5  //无动画设置透明度
    //有无动画设置透明度
    @Publish
    var maskOpacityFrom: Float64 = 0.0
    @Publish
    var maskOpacityTo: Float64 = 0.5
    @Publish
    var isMaskDisplayAnimator: Bool = false


    //----------------组件显示隐藏-------------------
    @Publish
    var visibility: Visibility = Visibility.None

    //---------------组件动画----------------------
    @Publish
    var isScale: Bool = false
    @Publish
    var scaleFrom: Float32 = 0.0
    @Publish
    var scaleTo: Float32 = 0.0

    @Publish
    var isRotate: Bool = false
    @Publish
    var rotateFrom: Float32 = 0.0
    @Publish
    var rotateTo: Float32 = 0.0

    @Publish
    var isCustomAnimation: Bool = true


    public func setIndicatorType(indicatorType: EasyLoadingIndicatorType): EasyLoadingModel {
        this.indicatorType = indicatorType
        return this
    }
    public func setIndicatorModel(indicatorModel: SpinKitFadingGridModel): EasyLoadingModel {
        this.indicatorModel = indicatorModel
        return this
    }

    //---------------style-----------
    public func setWidth(width: Float64): EasyLoadingModel {
        this.width = width
        return this
    }

    public func setHeight(width: Float64): EasyLoadingModel {
        this.height = height
        return this
    }
    public func setBackground(background: Color): EasyLoadingModel {
        this.background = background
        return this
    }
    public func setBorderRadius(borderRadius: Length): EasyLoadingModel {
        this.borderRadius = borderRadius
        return this
    }
    public func setPaddingTop(paddingTop: Float64): EasyLoadingModel {
        this.paddingTop = paddingTop
        return this
    }
    public func setText(text: String): EasyLoadingModel {
        this.text = text
        return this
    }
    public func setFontColor(fontColor: Color): EasyLoadingModel {
        this.fontColor = fontColor
        return this
    }
    public func setFontSize(fontSize: Float64): EasyLoadingModel {
        this.fontSize = fontSize
        return this
    }
    public func setTextMarginTop(textMarginTop: Float64): EasyLoadingModel {
        this.textMarginTop = textMarginTop
        return this
    }
    public func setFontWeight(fontWeight: FontWeight): EasyLoadingModel {
        this.fontWeight = fontWeight
        return this
    }
    //-----------------mask
    public func setMask(isMask: Bool): EasyLoadingModel {
        this.isMask = isMask
        return this
    }
    public func setMaskDisplayNormal(maskOpacityNormal: Float64): EasyLoadingModel {
        this.maskOpacityNormal = maskOpacityNormal
        return this
    }

    public func setMaskDisplayAnimator(maskOpacityTo: Float64): EasyLoadingModel {
        this.isMaskDisplayAnimator = true
        this.maskOpacityTo = maskOpacityTo
        return this
    }

    public func setMaskDisplayTo(maskOpacityTo: Float64): EasyLoadingModel {
        this.maskOpacityTo = maskOpacityTo
        return this
    }


    //----------------组件显示隐藏-------------------

    public func show(): EasyLoadingModel {
        this.visibility = Visibility.Visible
        if(this.isMaskDisplayAnimator || this.isScale || this.isRotate) {
            this.showAnimator()
        }
        return this
    }
    public func hide(): EasyLoadingModel {
        if(this.isMaskDisplayAnimator || this.isScale || this.isRotate) {
            this.hideAnimator()

            Timer.once(Duration.millisecond * 200, { =>
                this.visibility = Visibility.None
            })
        } else {
            this.visibility = Visibility.None
        }

        return this
    }

    //-------------组件缩放-------------
    public func setScaleAnimator(scaleTo: Float32): EasyLoadingModel {
        this.isScale = true
        this.scaleTo = scaleTo
        return this
    }

    public func setScaleTo(scaleTo: Float32): EasyLoadingModel {
        this.scaleTo = scaleTo
        return this
    }


    //-------------组件旋转-------------
    public func setRotateAnimator(rotateTo: Float32): EasyLoadingModel {
        this.isRotate = true
        this.rotateTo = rotateTo
        return this
    }
    public func setRotateTo(rotateTo: Float32): EasyLoadingModel {
        this.rotateTo = rotateTo
        return this
    }

    private func showAnimator(): Unit {
        animateTo(
            AnimateParam(
                duration: 200,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> AppLog.info("play end")}
            ),
            {=>
                if(this.isMaskDisplayAnimator) {
                    this.maskOpacityFrom = this.maskOpacityTo
                }
                if(this.isScale) {
                    this.scaleFrom = this.scaleTo
                }
                if(this.isRotate) {
                    this.rotateFrom = this.rotateTo
                }
            }
        )
    }

    private func hideAnimator(): Unit {
        animateTo(
            AnimateParam(
                duration: 200,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> AppLog.info("play end")}
            ),
            {=>
                if(this.isMaskDisplayAnimator) {
                    this.maskOpacityFrom = 0.0
                }
                if(this.isScale) {
                    this.scaleFrom = 0.0
                }
                if(this.isRotate) {
                    this.rotateFrom = -this.rotateTo
                }

            }
        )
    }

    public func getIndicatorType(): ?EasyLoadingIndicatorType {
        return this.indicatorType
    }

    public func getIndicatorModel(): ?SpinKitFadingGridModel {
        return this.indicatorModel
    }


}
