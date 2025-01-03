/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class DoubleBounceModel {
    var colors: Array<Color> = [Color.BLACK]

    var size: Float64 = 50.0

    var duration: Int64 = 1000

    var mAnimator: ?DoubleBoundChartAnimator = None

    @Publish
    var scaleValue: Float64 = 1.0

    public func init_data() {
        this.mAnimator = DoubleBoundChartAnimator(this)
    }

    public func onAnimationUpdate(result: AnimatorResult): Unit {
        this.scaleValue = this.mAnimator().getPhaseY()
    }

    public func animateY(time: Int32, easing!: String = "linear") {
        this.mAnimator().animateY(time, easing: easing)
    }

    public func offAnimateY() {
        this.mAnimator().offAnimateY()
    }

    public func getColors(): Array<Color> {
        return this.colors
    }

    public func setColors(colors: Array<Color>): DoubleBounceModel {
        this.colors = colors
        return this
    }

    public func getSize(): Float64 {
        return this.size
    }

    public func setSize(size: Float64): DoubleBounceModel {
        this.size = size
        return this
    }
    public func getScaleValue(): Float64 {
        return this.scaleValue
    }
}

@Component
public class DoubleBounceComponent {
    @State
    var doubleBounceModel: ?DoubleBounceModel = Option<DoubleBounceModel>.None

    @State
    var size: Float64 = 0.0
    var color: Color = Color.WHITE

    var width: Float64 = 300.0

    var height: Float64 = 300.0
    protected override func aboutToAppear() {
        if (doubleBounceModel.isNone()) {
            throw Exception("doubleBounceModel cannot be Null")
        }
        this.size = this.doubleBounceModel().getSize()
    }
    protected override func aboutToDisappear() {
        if (doubleBounceModel.isNone()) {
            throw Exception("doubleBounceModel cannot be Null")
        }
        this.doubleBounceModel().offAnimateY()
    }

    func build() {
        RelativeContainer() {
            Row() {
                DoubleScaleXYComponent(size: this.size, doubleBounceModel: this.doubleBounceModel())
            }.width(this.size).height(this.size).align(Alignment.Center).alignRules(
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
public class DoubleScaleXYComponent {
    @State
    var doubleBounceModel: DoubleBounceModel = DoubleBounceModel()

    @State
    var size: Float64 = 0.0

    @State
    var colors: Array<Color> = [Color.BLACK]

    @State
    var alignment: Alignment = Alignment.Center

    protected override func aboutToAppear() {
        colors = this.doubleBounceModel.getColors()
    }

    func build() {
        Stack(Alignment.Center) {
            Rect(width: this.size, height: this.size).fill(this.colors[0 % this.colors.size]).scale(
                Float32(abs(1.0 - doubleBounceModel.getScaleValue())))
            Rect(width: this.size, height: this.size).fill(this.colors[1 % this.colors.size]).scale(
                Float32(abs(doubleBounceModel.getScaleValue())))
        }
    }
}
