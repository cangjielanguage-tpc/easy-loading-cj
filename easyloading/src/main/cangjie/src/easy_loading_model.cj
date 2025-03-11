/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class EasyLoadingModel {
    @Publish
    var indicatorType: ?EasyLoadingIndicatorType = Option<EasyLoadingIndicatorType>.None
    //------------动画指示器----------
    @Publish
    var fadingGridModel: ?FadingGridModel = Option<FadingGridModel>.None
    @Publish
    var cubeGridModel: ?CubeGridModel = Option<CubeGridModel>.None
    @Publish
    var pumpingHeartModel: ?PumpingHeartModel = Option<PumpingHeartModel>.None

    @Publish
    var circleModel: ?CircleModel = Option<CircleModel>.None

    @Publish
    var doubleBounceModel: ?DoubleBounceModel = Option<DoubleBounceModel>.None

    @Publish
    var fadingCircleModel: ?FadingCircleModel = Option<FadingCircleModel>.None

    @Publish
    var fadingCubeModel: ?FadingCubeModel = Option<FadingCubeModel>.None

    @Publish
    var fadingFourModel: ?FadingFourModel = Option<FadingFourModel>.None

    @Publish
    var foldingCubeModel: ?FoldingCubeModel = Option<FoldingCubeModel>.None

    @Publish
    var hourGlassModel: ?HourGlassModel = Option<HourGlassModel>.None

    @Publish
    var pouringHourGlassModel: ?PouringHourGlassModel = Option<PouringHourGlassModel>.None

    @Publish
    var pulseModel: ?PulseModel = Option<PulseModel>.None

    @Publish
    var ringModel: ?RingModel = Option<RingModel>.None

    @Publish
    var rotateCircleModel: ?RotateCircleModel = Option<RotateCircleModel>.None

    @Publish
    var rotatePlainModel: ?RotatePlainModel = Option<RotatePlainModel>.None

    @Publish
    var spinChasingDotsModel: ?SpinChasingDotsModel = Option<SpinChasingDotsModel>.None

    @Publish
    var spinningCircleModel: ?SpinningCircleModel = Option<SpinningCircleModel>.None

    @Publish
    var squareCircleModel: ?SquareCircleModel = Option<SquareCircleModel>.None

    @Publish
    var threeBounceModel: ?ThreeBounceModel = Option<ThreeBounceModel>.None

    @Publish
    var waveModel: ?WaveModel = Option<WaveModel>.None

    @Publish
    var wanderingCubesModel: ?WanderingCubesModel = Option<WanderingCubesModel>.None

    @Publish
    var rotateEightCirclesModel: ?RotateEightCirclesModel = Option<RotateEightCirclesModel>.None

    @Publish
    var rotateFourCirclesModel: ?RotateFourCirclesModel = Option<RotateFourCirclesModel>.None

    @Publish
    var rotateCirclesModel: ?RotateCirclesModel = Option<RotateCirclesModel>.None

    @Publish
    var moveRingModel: ?MoveRingModel = Option<MoveRingModel>.None

    @Publish
    var staticCircleModel: ?StaticCircleModel = Option<StaticCircleModel>.None

    //-------------Toast----------
    @Publish
    var toastModel: ?ToastModel = Option<ToastModel>.None

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
    @Publish
    var alignment: Alignment = Alignment.Center

    //----------------------mask------------------
    @Publish
    var isMask: Bool = true
    @Publish
    var maskBgColor: Color = Color.BLACK
    //无动画设置透明度
    @Publish
    var maskOpacityNormal: Float64 = 0.5 //无动画设置透明度

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
    @Publish
    var isClickAnyHide: Bool = true

    //---------------组件动画----------------------
    //缩放
    @Publish
    var isScale: Bool = false
    @Publish
    var scaleFrom: Float32 = 0.0
    @Publish
    var scaleTo: Float32 = 0.0
    //旋转
    @Publish
    var isRotate: Bool = false
    @Publish
    var rotateFrom: Float32 = 0.0
    @Publish
    var rotateTo: Float32 = 0.0
    //平移
    @Publish
    var isOffset: Bool = false
    @Publish
    var offsetXFrom: Float64 = 0.0
    @Publish
    var offsetXTo: Float64 = 0.0
    @Publish
    var offsetYFrom: Float64 = 0.0
    @Publish
    var offsetYTo: Float64 = 0.0
    @Publish
    var duration: Int32 = 200
    //透明度
    @Publish
    var isOpacity: Bool = false
    @Publish
    var opacityFrom: Float64 = 0.0
    @Publish
    var opacityTo: Float64 = 0.0

    public func setIndicatorType(indicatorType: EasyLoadingIndicatorType): EasyLoadingModel {
        this.indicatorType = indicatorType
        return this
    }
    public func setFadingGridModel(fadingGridModel: FadingGridModel): EasyLoadingModel {
        this.fadingGridModel = fadingGridModel
        return this
    }
    public func setCubeGridModel(cubeGridModel: CubeGridModel): EasyLoadingModel {
        this.cubeGridModel = cubeGridModel
        return this
    }
    public func setPumpingHeartModel(pumpingHeartModel: PumpingHeartModel): EasyLoadingModel {
        this.pumpingHeartModel = pumpingHeartModel
        return this
    }
    public func setCircleModel(circleModel: CircleModel): EasyLoadingModel {
        this.circleModel = circleModel
        return this
    }

    public func setDoubleBounceModel(doubleBounceModel: DoubleBounceModel): EasyLoadingModel {
        this.doubleBounceModel = doubleBounceModel
        return this
    }

    public func setFadingCircleModel(model: FadingCircleModel): EasyLoadingModel {
        this.fadingCircleModel = model
        return this
    }

    public func setFadingCubeModel(model: FadingCubeModel): EasyLoadingModel {
        this.fadingCubeModel = model
        return this
    }
    public func setFadingFourModel(model: FadingFourModel): EasyLoadingModel {
        this.fadingFourModel = model
        return this
    }
    public func setFoldingCubeModel(model: FoldingCubeModel): EasyLoadingModel {
        this.foldingCubeModel = model
        return this
    }

    public func setHourGlassModel(model: HourGlassModel): EasyLoadingModel {
        this.hourGlassModel = model
        return this
    }

    public func setPouringHourGlassModel(model: PouringHourGlassModel): EasyLoadingModel {
        this.pouringHourGlassModel = model
        return this
    }
    public func setPulseModel(model: PulseModel): EasyLoadingModel {
        this.pulseModel = model
        return this
    }
    public func setRingModel(model: RingModel): EasyLoadingModel {
        this.ringModel = model
        return this
    }
    public func setRotateCircleModel(model: RotateCircleModel): EasyLoadingModel {
        this.rotateCircleModel = model
        return this
    }

    public func setRotatePlainModel(model: RotatePlainModel): EasyLoadingModel {
        this.rotatePlainModel = model
        return this
    }

    public func setSpinningCircleModel(model: SpinningCircleModel): EasyLoadingModel {
        this.spinningCircleModel = model
        return this
    }

    public func setSpinChasingDotsModel(model: SpinChasingDotsModel): EasyLoadingModel {
        this.spinChasingDotsModel = model
        return this
    }

    public func setSquareCircleModel(model: SquareCircleModel): EasyLoadingModel {
        this.squareCircleModel = model
        return this
    }

    public func setThreeBounceModel(model: ThreeBounceModel): EasyLoadingModel {
        this.threeBounceModel = model
        return this
    }

    public func setWaveModel(model: WaveModel): EasyLoadingModel {
        this.waveModel = model
        return this
    }

    public func setWanderingCubesModel(model: WanderingCubesModel): EasyLoadingModel {
        this.wanderingCubesModel = model
        return this
    }

    public func setRotateEightCirclesModel(model: RotateEightCirclesModel): EasyLoadingModel {
        this.rotateEightCirclesModel = model
        return this
    }

    public func setRotateFourCirclesModel(model: RotateFourCirclesModel): EasyLoadingModel {
        this.rotateFourCirclesModel = model
        return this
    }

    public func setRotateCirclesModel(model: RotateCirclesModel): EasyLoadingModel {
        this.rotateCirclesModel = model
        return this
    }
    public func setMoveRingModel(model: MoveRingModel): EasyLoadingModel {
        this.moveRingModel = model
        return this
    }

    public func setStaticCircleModel(model: StaticCircleModel): EasyLoadingModel {
        this.staticCircleModel = model
        return this
    }

    public func setToastModel(toastModel: ToastModel): EasyLoadingModel {
        this.toastModel = toastModel
        return this
    }

    public func getFadingGridModel(): ?FadingGridModel {
        return this.fadingGridModel
    }
    public func getCubeGridModel(): ?CubeGridModel {
        return this.cubeGridModel
    }
    public func getPumpingHeartModel(): ?PumpingHeartModel {
        return this.pumpingHeartModel
    }
    public func getCircleModel(): ?CircleModel {
        return this.circleModel
    }
    public func getDoubleBounceModel(): ?DoubleBounceModel {
        return this.doubleBounceModel
    }
    public func getFadingCircleModel(): ?FadingCircleModel {
        return this.fadingCircleModel
    }
    public func getFadingCubeModel(): ?FadingCubeModel {
        return this.fadingCubeModel
    }
    public func getFadingFourModel(): ?FadingFourModel {
        return this.fadingFourModel
    }

    public func getFoldingCubeModel(): ?FoldingCubeModel {
        return this.foldingCubeModel
    }

    public func getHourGlassModel(): ?HourGlassModel {
        return this.hourGlassModel
    }
    public func getPouringHourGlassModel(): ?PouringHourGlassModel {
        return this.pouringHourGlassModel
    }
    public func getPulseModel(): ?PulseModel {
        return this.pulseModel
    }
    public func getRingModel(): ?RingModel {
        return this.ringModel
    }
    public func getRotateCircleModel(): ?RotateCircleModel {
        return this.rotateCircleModel
    }
    public func getRotatePlainModel(): ?RotatePlainModel {
        return this.rotatePlainModel
    }
    public func getSpinChasingDotsModel(): ?SpinChasingDotsModel {
        return this.spinChasingDotsModel
    }
    public func getSpinningCircleModel(): ?SpinningCircleModel {
        return this.spinningCircleModel
    }
    public func getSquareCircleModel(): ?SquareCircleModel {
        return this.squareCircleModel
    }
    public func getThreeBounceModel(): ?ThreeBounceModel {
        return this.threeBounceModel
    }

    public func getWaveModel(): ?WaveModel {
        return this.waveModel
    }

    public func getWanderingCubesModel(): ?WanderingCubesModel {
        return this.wanderingCubesModel
    }
    public func getRotateEightCirclesModel(): ?RotateEightCirclesModel {
        return this.rotateEightCirclesModel
    }
    public func getRotateFourCirclesModel(): ?RotateFourCirclesModel {
        return this.rotateFourCirclesModel
    }
    public func getRotateCirclesModel(): ?RotateCirclesModel {
        return this.rotateCirclesModel
    }
    public func getMoveRingModel(): ?MoveRingModel {
        return this.moveRingModel
    }
    public func getStaticCircleModel(): ?StaticCircleModel {
        return this.staticCircleModel
    }
    public func getToastModel(): ?ToastModel {
        return this.toastModel
    }

    public func getIndicatorType(): ?EasyLoadingIndicatorType {
        return this.indicatorType
    }

    //---------------style-----------
    public func setWidth(width: Float64): EasyLoadingModel {
        this.width = width
        return this
    }

    public func setHeight(height: Float64): EasyLoadingModel {
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
    public func setMaskBgColor(maskBgColor: Color): EasyLoadingModel {
        this.maskBgColor = maskBgColor
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

    //----------------组件显示隐藏-------------------

    public func show(): EasyLoadingModel {
        this.visibility = Visibility.Visible
        if (this.isMaskDisplayAnimator || this.isScale || this.isRotate || this.isOffset || this.isOpacity) {
            this.showAnimator()
        }
        return this
    }
    public func hide(): EasyLoadingModel {
        if (this.isMaskDisplayAnimator || this.isScale || this.isRotate || this.isOffset || this.isOpacity) {
            this.hideAnimator()

            Timer.once(
                Duration.millisecond * 200,
                {
                    => this.visibility = Visibility.None
                }
            )
        } else {
            this.visibility = Visibility.None
        }

        return this
    }
    public func isClickMaskAnyHide(isClickAnyHide: Bool): EasyLoadingModel {
        this.isClickAnyHide = isClickAnyHide
        return this
    }

    //-------------组件缩放-------------
    public func setIsScale(isScale: Bool): EasyLoadingModel {
        this.isScale = isScale
        return this
    }

    public func setScaleAnimator(scaleTo: Float32): EasyLoadingModel {
        this.isScale = true
        this.scaleTo = scaleTo
        return this
    }

    //-------------组件旋转-------------
    public func setIsRotate(isRotate: Bool): EasyLoadingModel {
        this.isRotate = isRotate
        return this
    }

    public func setRotateAnimator(rotateTo: Float32): EasyLoadingModel {
        this.isRotate = true
        this.rotateTo = rotateTo
        return this
    }

    //---------组件平移--------------------
    public func setIsOffset(isOffset: Bool): EasyLoadingModel {
        this.isOffset = isOffset
        return this
    }
    public func setOffsetDirection(direction: Alignment): EasyLoadingModel {
        this.alignment = direction
        return this
    }

    public func setOffsetX(offsetX: Float64): EasyLoadingModel {
        if (this.isOffset) {
            this.offsetXTo = offsetX
        } else {
            this.offsetXFrom = offsetX
        }

        return this
    }
    public func setOffsetY(offsetY: Float64): EasyLoadingModel {
        if (this.isOffset) {
            this.offsetYTo = offsetY
        } else {
            this.offsetYFrom = offsetY
        }
        return this
    }
    //---------组件透明度--------------------
    public func setIsOpacity(Opacity: Bool): EasyLoadingModel {
        this.isOpacity = Opacity
        return this
    }

    public func setAnimatorOpacity(opacityTo: Float64): EasyLoadingModel {
        this.isOpacity = true
        this.opacityTo = opacityTo
        return this
    }

    private func showAnimator(): Unit {
        animateTo(
            AnimateParam(
                duration: this.duration,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal
            ),
            {
                =>
                if (this.isMaskDisplayAnimator) {
                    this.maskOpacityFrom = this.maskOpacityTo
                }
                if (this.isScale) {
                    this.scaleFrom = this.scaleTo
                }
                if (this.isRotate) {
                    this.rotateFrom = this.rotateTo
                }
                if (this.isOffset) {
                    this.offsetXFrom = this.offsetXTo
                    this.offsetYFrom = this.offsetYTo
                }
                if (this.isOpacity) {
                    Hilog.error(0, "", "2----${this.isOpacity}")
                    this.opacityFrom = this.opacityTo
                }
            }
        )
    }

    private func hideAnimator(): Unit {
        animateTo(
            AnimateParam(
                duration: this.duration,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> AppLog.info("play end")}
            ),
            {
                =>
                if (this.isMaskDisplayAnimator) {
                    this.maskOpacityFrom = 0.0
                }
                if (this.isScale) {
                    this.scaleFrom = 0.0
                }
                if (this.isRotate) {
                    this.rotateFrom = -this.rotateTo
                }
                if (this.isOffset) {
                    this.offsetXFrom = 0.0
                    this.offsetYFrom = 0.0
                }
                if (this.isOpacity) {
                    this.opacityFrom = 0.0
                }
            }
        )
    }
}
