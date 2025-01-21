/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class RingModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var color: Color = Color.RED
    @Publish
    var strokeWidth: Float64 = 1.0

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): RingModel {
        this.size = size
        return this
    }

    public func setColor(color: Color): RingModel {
        this.color = color
        return this
    }
    public func setDuration(duration: Int32): RingModel {
        this.duration = duration
        return this
    }

    public func setStrokeWidth(strokeWidth: Float64): RingModel {
        this.strokeWidth = strokeWidth
        return this
    }
}

@Component
public class Ring {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    @State
    var model: RingModel = RingModel()
    @State
    var size: Float64 = 50.0
    @State
    var scaleValue: Float64 = 0.0
    @State
    var rotateValue: Float64 = 0.0
    @State
    var angleValue1: Float64 = -120.0
    @State
    var angleValue2: Float64 = 0.0

    var angle: Float64 = 90.0

    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult1: ?AnimatorResult = None
    var animatorResult3: ?AnimatorResult = None
    var animatorResult0: ?AnimatorResult = None
    var animatorResult: ?AnimatorResult = None
    protected override func aboutToAppear() {
        this.size = this.model.size
        animatorResult = AnimatorResult(setAnimatorOption())
        animatorResult().onframe = {
            value: Float64 => this.scaleValue = value
        }
        animatorResult().play()

        animatorResult1 = AnimatorResult(setAnimatorOption1()) // end Angel
        animatorResult1().onframe = {
            value: Float64 => this.angleValue2 = value
        }
        animatorResult1().play()

        animatorResult3 = AnimatorResult(setAnimatorOption3()) // start Angel
        animatorResult3().onframe = {
            value: Float64 => this.angleValue1 = value
        }

        animatorResult0 = AnimatorResult(setAnimatorOption0()) // 停顿 this.duration / 2
        animatorResult0().play()
        animatorResult0().onfinish = {
            =>
            animatorResult3().play()
            animatorResult3().onfinish = {
                =>
                this.angleValue1 = -120.0
                animatorResult0().play()
            }
        }
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
        if (let Some(animator0) <- animatorResult0) {
            animator0.finish()
        }
        if (let Some(animator1) <- animatorResult1) {
            animator1.finish()
        }
        if (let Some(animator3) <- animatorResult3) {
            animator3.finish()
        }
    }

    func setAnimatorOption(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration / 2,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func setAnimatorOption0(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration / 2,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 210.0
        )
        return option
    }

    func setAnimatorOption3(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration / 2,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: -120.0,
            end: 90.0
        )
        return option
    }

    func build() {
        Row() {
            Stack(Alignment.Center) {
                //                    Text("zzz ${Float32(this.rotateValue)}")
                Canvas(this.context).width(this.size - this.scaleValue).height(this.size - this.scaleValue).onReady(
                    {
                        =>
                        this.context.lineWidth(6)
                        context.beginPath()
                        context.arc(this.size / 2.0, this.size / 2.0, this.size / 2.0 - 3.0,
                            this.angleValue1 * (Float64.PI / 180.0), this.angleValue2 * (Float64.PI / 180.0))

                        context.strokeStyle(this.model.color)
                        context.stroke()
                    }
                ).rotate(Float32(this.rotateValue))
            }.onAppear(
                {
                => animateTo(
                    AnimateParam(
                        duration: this.model.duration,
                        delay: 0,
                        curve: Curve.Ease,
                        iterations: -1,
                        playMode: PlayMode.Normal,
                        onFinish: {=>}
                    ),
                    {
                        => this.rotateValue = 150.0
                    }
                )
            })
        }.width(this.size).height(this.size)
    }
}
