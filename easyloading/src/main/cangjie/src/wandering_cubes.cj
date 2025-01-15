/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class WanderingCubesModel {
    @Publish
    var width: Float64 = 50.0
    @Publish
    var height: Float64 = 50.0
    @Publish
    var rectWidth: Float64 = 13.0
    @Publish
    var rectHeight: Float64 = 13.0
    @Publish
    var color: Array<Color> = [Color.BLACK, Color.BLACK]
    @Publish
    var duration: Int32 = 400
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT
    //----
    @Publish
    var scale1: Float32 = 1.0
    @Publish
    var rotate1: Float32 = 0.0
    @Publish
    var scale2: Float32 = 1.0
    @Publish
    var rotate2: Float32 = 0.0
    @Publish
    var translateX1: Float64 = 0.0
    @Publish
    var translateY1: Float64 = 0.0
    @Publish
    var translateX2: Float64 = 0.0
    @Publish
    var translateY2: Float64 = 0.0

    public func setWidth(width: Float64): WanderingCubesModel {
        this.width = width
        return this
    }
    public func setHeight(height: Float64): WanderingCubesModel {
        this.height = height
        return this
    }
    public func setInsideWidth(width: Float64): WanderingCubesModel {
        this.rectWidth = width
        return this
    }
    public func setInsidHeight(height: Float64): WanderingCubesModel {
        this.rectHeight = height
        return this
    }
    public func setColor(color: Array<Color>): WanderingCubesModel {
        this.color = color
        return this
    }
    public func setDuration(duration: Int32): WanderingCubesModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): WanderingCubesModel {
        this.shapeStyle = shapeStyle
        return this
    }


    public func setAnimator1(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale1 = 0.5
                this.rotate1 = -90.0
                this.translateX1 = x
                this.translateY1 = y
            }
        )

    }
    public func setAnimator2(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale1 = 1.0
                this.rotate1 = -180.0
                this.translateX1 = x
                this.translateY1 = y
            }
        )
    }
    public func setAnimator3(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale1 = 0.5
                this.rotate1 = -270.0
                this.translateX1 = x
                this.translateY1 = y
            }
        )
    }
    public func setAnimator4(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale1 = 1.0
                this.rotate1 = -360.0
                this.translateX1 = x
                this.translateY1 = y
            }
        )
    }

    public func setAnimator5(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale2 = 0.5
                this.rotate2 = -90.0
                this.translateX2 = x
                this.translateY2 = y
            }
        )
    }
    public func setAnimator6(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale2 = 1.0
                this.rotate2 = -180.0
                this.translateX2 = x
                this.translateY2 = y
            }
        )
    }
    public func setAnimator7(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale2 = 0.5
                this.rotate2 = -270.0
                this.translateX2 = x
                this.translateY2 = y
            }
        )
    }
    public func setAnimator8(delay: Int32, x: Float64, y: Float64) {

        animateTo(
            AnimateParam(
                duration: duration,
                delay: delay,
                curve: Curve.EaseInOut,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {=> }
            ),
            {=>
                this.scale2 = 1.0
                this.rotate2 = -360.0
                this.translateX2 = x
                this.translateY2 = y
            }
        )
    }


}

@Component
public class WanderingCubes {
    @State
    var model: WanderingCubesModel = WanderingCubesModel()

    func build() {
        Stack() {
            Stack() {
                if(this.model.shapeStyle == ShapeStyle.RECT) {
                    Rect()
                    .fill( this.model.color[0])
                    .width(this.model.rectWidth)
                    .height(this.model.rectHeight)
                    .scale(this.model.scale1)
                    .rotate(this.model.rotate1)
                    .translate(x: this.model.translateX1, y: this.model.translateY1)

                } else {
                    Circle()
                    .fill( this.model.color[0])
                    .width(this.model.width)
                    .height(this.model.height)
                    .scale(this.model.scale1)
                    .rotate(this.model.rotate1)
                    .translate(x: this.model.translateX1, y: this.model.translateY1)
                }

            }

            .width(100.percent)
            .height(100.percent)
            .align(Alignment.TopStart)
            .onAppear({ =>
                let option1 = AnimatorOptions(
                        duration: 100,
                        easing: "ease",
                        delay: 0,
                        fill: AnimatorFill.Both,
                        direction: AnimatorDirection.AlternateReverse,
                        iterations: 1,
                        begin: 0.0,
                        end: 1.0
                    )
                let option2 = AnimatorOptions(
                    duration: this.model.duration * 4,
                    easing: "ease",
                    delay: 0,
                    fill: AnimatorFill.Both,
                    direction: AnimatorDirection.AlternateReverse,
                    iterations: 1,
                    begin: 0.0,
                    end: 1.0
                )
                let animator = AnimatorResult(option1)
                animator.play()
                animator.onfinish = { =>
                    this.model.setAnimator1(this.model.duration * 0,  this.model.width - this.model.rectWidth, 0.0)
                    this.model.setAnimator2(this.model.duration * (1), this.model.width - this.model.rectWidth, this.model.width - this.model.rectWidth)
                    this.model.setAnimator3(this.model.duration * (2), 0.0, this.model.width - this.model.rectWidth)
                    this.model.setAnimator4(this.model.duration * (3), 0.0, 0.0)

                    this.model.scale1 = 1.0
                    this.model.rotate1 = 0.0
                    this.model.translateX1 = 0.0
                    this.model.translateY1 = 0.0
                    animator.reset(option2)
                    animator.play()
                }

           })

            Stack() {
                if(this.model.shapeStyle == ShapeStyle.RECT) {
                    Rect()
                    .fill( this.model.color[1])
                    .width(this.model.rectWidth)
                    .height(this.model.rectHeight)
                    .scale(this.model.scale2)
                    .rotate(this.model.rotate2)
                    .translate(x: this.model.translateX2, y: this.model.translateY2)
                } else {
                    Circle()
                    .fill( this.model.color[1])
                    .width(this.model.width)
                    .height(this.model.height)
                }

            }

            .width(100.percent)
            .height(100.percent)
            .align(Alignment.BottomEnd)
            .onAppear({ =>
                let option1 = AnimatorOptions(
                        duration: 100,
                        easing: "ease",
                        delay: 0,
                        fill: AnimatorFill.Both,
                        direction: AnimatorDirection.AlternateReverse,
                        iterations: 1,
                        begin: 0.0,
                        end: 1.0
                    )
                let option2 = AnimatorOptions(
                    duration: this.model.duration * 4,
                    easing: "ease",
                    delay: 0,
                    fill: AnimatorFill.Both,
                    direction: AnimatorDirection.AlternateReverse,
                    iterations: 1,
                    begin: 0.0,
                    end: 1.0
                )
                let animator = AnimatorResult(option1)
                animator.play()
                animator.onfinish = { =>
                    this.model.setAnimator5(this.model.duration * 0, -(this.model.width - this.model.rectWidth), 0.0)
                    this.model.setAnimator6(this.model.duration * 1, -(this.model.width - this.model.rectWidth), -(this.model.width - this.model.rectWidth))
                    this.model.setAnimator7(this.model.duration * 2, 0.0, -(this.model.width - this.model.rectWidth))
                    this.model.setAnimator8(this.model.duration * 3, 0.0, 0.0)

                    this.model.scale2 = 1.0
                    this.model.rotate2 = 0.0
                    this.model.translateX2 = 0.0
                    this.model.translateY2 = 0.0

                    animator.reset(option2)
                    animator.play()
                }


           })
        }
        .width(this.model.width)
        .height(this.model.height)


    }
}
