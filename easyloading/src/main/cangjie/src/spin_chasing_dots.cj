/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class SpinChasingDotsModel {
    var colors: Array<Color> = [Color.BLACK]

    var size: Float64 = 50.0

    var duration: Int64 = 1000

    var mAnimator: ?SpinChasingDotsChartAnimator = None

    @Publish
    var rotateValue: Float64 = 0.0

    @Publish
    var scaleValue: Float64 = 1.0

    public func init_data() {
        this.mAnimator = SpinChasingDotsChartAnimator(this)
    }

    public func onAnimationUpdate(result: AnimatorResult): Unit {
        this.rotateValue = this.mAnimator().getRotateValue()
    }

    public func onAnimationUpdateScale(result: AnimatorResult): Unit {
        this.scaleValue = this.mAnimator().getScaleValue()
    }

    public func animateY(time: Int32) {
        this.mAnimator().animateY(time)
    }

    public func offAnimateY() {
        this.mAnimator().offAnimateY()
    }

    public func getColors(): Array<Color> {
        return this.colors
    }

    public func setColors(colors: Array<Color>): SpinChasingDotsModel {
        this.colors = colors
        return this
    }

    public func getSize(): Float64 {
        return this.size
    }

    public func setSize(size: Float64): SpinChasingDotsModel {
        this.size = size
        return this
    }
    public func getRotateValue(): Float64 {
        return this.rotateValue
    }
    public func getScaleValue(): Float64 {
        return this.scaleValue
    }
}

@Component
public class SpinChasingDotsComponent {
    @State
    var spinChasingDotsModel: ?SpinChasingDotsModel = Option<SpinChasingDotsModel>.None

    @State
    var size: Float64 = 0.0
    var color: Color = Color.WHITE

    var width: Float64 = 300.0

    var height: Float64 = 300.0
    protected override func aboutToAppear() {
        if (spinChasingDotsModel.isNone()) {
            throw Exception("doubleBounceModel cannot be Null")
        }
        this.size = this.spinChasingDotsModel().getSize()
    }
    protected override func aboutToDisappear() {
        if (spinChasingDotsModel.isNone()) {
            throw Exception("doubleBounceModel cannot be Null")
        }
        this.spinChasingDotsModel().offAnimateY()
    }

    func build() {
        RelativeContainer() {
            Stack(Alignment.TopStart) {
                SpinRotateComponent(size: this.size, spinChasingDotsModel: this.spinChasingDotsModel())
            }.width(this.size).height(this.size).alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            )
        }.width(this.width).height(this.height).backgroundColor(this.color).border(width: 2.vp, color: Color(0x6699ff))
    }
}

@Component
public class SpinRotateComponent {
    @State
    var spinChasingDotsModel: SpinChasingDotsModel = SpinChasingDotsModel()

    @State
    var size: Float64 = 0.0

    @State
    var colors: Array<Color> = [Color.BLACK]

    @State
    var alignment: Alignment = Alignment.Center

    protected override func aboutToAppear() {
        colors = this.spinChasingDotsModel.getColors()
    }

    func build() {
        Stack() {
            Column() {
                Rect(width: this.size * 0.6, height: this.size * 0.6).fill(this.colors[0 % this.colors.size]).scale(
                    Float32(abs(1.0 - spinChasingDotsModel.getScaleValue())))
            }.justifyContent(FlexAlign.Start).width(100.percent).height(100.percent).alignItems(HorizontalAlign.Start)

            Column() {
                Rect(width: this.size * 0.6, height: this.size * 0.6).fill(this.colors[1 % this.colors.size]).scale(
                    Float32(abs(spinChasingDotsModel.getScaleValue())))
            }.justifyContent(FlexAlign.End).width(100.percent).height(100.percent).alignItems(HorizontalAlign.Start)
        }.rotate(x: 0.0, y: 0.0, z: 1.0, centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp,
            angle: Float32(spinChasingDotsModel.getRotateValue()))
    }
}
