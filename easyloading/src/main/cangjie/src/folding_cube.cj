/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FoldingCubeModel {
    @Publish
    var width: Float64 = 100.0
    @Publish
    var height: Float64 = 100.0
    @Publish
    var color: Color = Color.RED
    @Publish
    var duration: Int32 = 600
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    public func setWidth(width: Float64): FoldingCubeModel {
        this.width = width
        return this
    }
    public func setHeight(height: Float64): FoldingCubeModel {
        this.height = height
        return this
    }
    public func setColorArray(color: Color): FoldingCubeModel {
        this.color = color
        return this
    }
    public func setDuration(duration: Int32): FoldingCubeModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): FoldingCubeModel {
        this.shapeStyle = shapeStyle
        return this
    }
}

@Component
public class FoldingCube {
    @State
    var model: FoldingCubeModel = FoldingCubeModel()

    var settings11: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings12: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings21: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings22: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings31: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings32: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings41: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var settings42: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context11: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings11)
    var context12: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings12)
    var context21: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings21)
    var context22: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings22)
    var context31: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings31)
    var context32: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings32)
    var context41: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings41)
    var context42: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings42)

    @State
    var angle11: Float32 = 0.0
    @State
    var opacity11: Float64 = 0.0
    @State
    var angle12: Float32 = 0.0
    @State
    var opacity12: Float64 = 0.0

    @State
    var angle21: Float32 = 0.0
    @State
    var opacity21: Float64 = 0.0
    @State
    var angle22: Float32 = 0.0
    @State
    var opacity22: Float64 = 0.0

    @State
    var angle31: Float32 = 0.0
    @State
    var opacity31: Float64 = 0.0
    @State
    var angle32: Float32 = 0.0
    @State
    var opacity32: Float64 = 0.0

    @State
    var angle41: Float32 = 0.0
    @State
    var opacity41: Float64 = 0.0
    @State
    var angle42: Float32 = 0.0
    @State
    var opacity42: Float64 = 0.0

    protected override func aboutToAppear(): Unit {
        let option1 = AnimatorOptions(
            duration: 100,
            easing: "ease",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: 0.0,
            end: 1.0
        )
        let option2 = AnimatorOptions(
            duration: this.model.duration * 7,
            easing: "ease",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: 0.0,
            end: 1.0
        )
        let animator = AnimatorResult(option1)
        animator.play()
        animator.onfinish = {
            =>
            this.animator11()
            this.animator21()
            this.animator31()
            this.animator41()


            var animatorResult1 = AnimatorResult(setAnimatorOption1())
            animatorResult1.onframe = {
                value: Float64 => this.opacity12 = value
            }
            animatorResult1.play()

            var animatorResult2 = AnimatorResult(setAnimatorOption2())
            animatorResult2.onframe = {
                value: Float64 => this.opacity22 = value
            }
            animatorResult2.play()

            var animatorResult3 = AnimatorResult(setAnimatorOption3())
            animatorResult3.onframe = {
                value: Float64 => this.opacity32 = value
            }
            animatorResult3.play()
            this.animator12()
            this.animator22()
            this.animator32()

            animator.reset(option2)
            animator.play()
        }
    }

    protected override func aboutToDisappear() {
    }

    func animator11() {
        this.angle41 = 0.0
        this.opacity41 = 0.0
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: 0,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>
                    this.opacity11 = 0.0
                    this.opacity12 = 1.0
                    this.angle11 = 0.0
                }
            ),
            {
                =>
                this.angle11 = 180.0
                this.opacity11 = 1.0
            }
        )
    }

    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in",
            delay: this.model.duration * 4,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }

    func animator12() {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration * 4,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>
                    this.angle12 = 0.0
                    this.opacity12 = 0.0
                }
            ),
            {
                => this.angle12 = 180.0
            }
        )
    }

    func animator21() {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration * 1,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>
                    this.opacity21 = 0.0
                    this.opacity22 = 1.0
                    this.angle21 = 0.0
                }
            ),
            {
                =>
                this.angle21 = -180.0
                this.opacity21 = 1.0
            }
        )
    }

    func setAnimatorOption2(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in",
            delay: this.model.duration * 5,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }

    func animator22() {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration * 5,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>
                    this.angle22 = 0.0
                    this.opacity22 = 0.0
                }
            ),
            {
                => this.angle22 = 180.0
            }
        )
    }

    func animator31() {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration * 2,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>
                    this.opacity31 = 0.0
                    this.opacity32 = 1.0
                    this.angle31 = 0.0
                }
            ),
            {
                =>
                this.angle31 = -180.0
                this.opacity31 = 1.0
            }
        )
    }

    func setAnimatorOption3(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in",
            delay: this.model.duration * 6,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: 1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }
    func animator32() {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration * 6,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>
                    this.angle32 = 0.0
                    this.opacity32 = 0.0
                }
            ),
            {
                => this.angle32 = 180.0
            }
        )
    }

    func animator41() {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration * 3,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    =>

                    //                    this.opacity11 = 1.0
                }
            ),
            {
                =>
                this.angle41 = 180.0
                this.opacity41 = 1.0
            }
        )
    }

    func build() {
        Column() {
            Stack() {

                //-----------------1---------------------------------
                Canvas(this.context11).width(100.percent).height(100.percent).rotate(x: 0.0, y: 1.0, angle: this.angle11,
                    centerX: 50.vp, centerY: 50.vp).opacity(this.opacity11).onAppear(
                    {
                        =>
                        this.angle11 = 0.0
                        this.opacity11 = 0.0
                    }
                ).onReady(
                    {
                        =>
                        this.context11.beginPath()
                        this.context11.moveTo(0, 0)
                        this.context11.lineTo(50, 0)
                        this.context11.lineTo(50, 50)
                        this.context11.lineTo(0, 50)
                        this.context11.closePath()
                        this.context11.lineWidth(5.0)
                        this.context11.fillStyle(this.model.color)
                        this.context11.fill()
                    }
                )
                //-----------------12---------------------------------
                Canvas(this.context12).width(100.percent).height(100.percent).rotate(x: 1.0, y: 0.0, angle: this.angle12,
                    centerX: 50.vp, centerY: 50.vp).opacity(this.opacity12).onAppear({
                    =>
                }).onReady(
                    {
                        =>
                        this.context12.beginPath()
                        this.context12.moveTo(50, 0)
                        this.context12.lineTo(100, 0)
                        this.context12.lineTo(100, 50)
                        this.context12.lineTo(50, 50)
                        this.context12.closePath()
                        this.context12.fillStyle(this.model.color)
                        this.context12.fill()
                    }
                )
                //-----------------21---------------------------------

                Canvas(this.context21).width(100.percent).height(100.percent).rotate(x: 1.0, y: 0.0, angle: this.angle21
                ).opacity(this.opacity21).onAppear({
                    =>
                }).onReady(
                    {
                        =>
                        this.context21.beginPath()
                        this.context21.moveTo(50, 0)
                        this.context21.lineTo(100, 0)
                        this.context21.lineTo(100, 50)
                        this.context21.lineTo(50, 50)
                        this.context21.closePath()
                        this.context21.fillStyle(this.model.color)
                        this.context21.fill()
                    }
                )
                //-----------------22---------------------------------

                Canvas(this.context22).width(100.percent).height(100.percent).rotate(x: 0.0, y: 1.0, angle: this.angle22
                ).opacity(this.opacity22).onAppear({
                    =>
                }).onReady(
                    {
                        =>
                        this.context22.beginPath()
                        this.context22.moveTo(50, 50)
                        this.context22.lineTo(100, 50)
                        this.context22.lineTo(100, 100)
                        this.context22.lineTo(50, 100)
                        this.context22.closePath()
                        this.context22.fillStyle(this.model.color)
                        this.context22.fill()
                    }
                )
                //-----------------3---------------------------------
                Canvas(this.context31).width(100.percent).height(100.percent).rotate(x: 0.0, y: 1.0, angle: this.angle31
                ).opacity(this.opacity31).onAppear({
                    =>
                }).onReady(
                    {
                        =>
                        this.context31.beginPath()
                        this.context31.moveTo(50, 50)
                        this.context31.lineTo(100, 50)
                        this.context31.lineTo(100, 100)
                        this.context31.lineTo(50, 100)
                        this.context31.closePath()
                        this.context31.fillStyle(this.model.color)
                        this.context31.fill()
                    }
                )
                //-----------------32---------------------------------
                Canvas(this.context32).width(100.percent).height(100.percent).rotate(x: 1.0, y: 0.0, angle: this.angle32
                ).opacity(this.opacity32).onAppear({
                    =>
                }).onReady(
                    {
                        =>
                        this.context32.beginPath()
                        this.context32.moveTo(0, 50)
                        this.context32.lineTo(50, 50)
                        this.context32.lineTo(50, 100)
                        this.context32.lineTo(0, 100)
                        this.context32.closePath()
                        this.context32.fillStyle(this.model.color)
                        this.context32.fill()
                    }
                )
                //                //-----------------4---------------------------------
                Canvas(this.context41).width(100.percent).height(100.percent).rotate(x: 1.0, y: 0.0, angle: this.angle41
                ).opacity(this.opacity41).onAppear({
                    =>
                }).onReady(
                    {
                        =>
                        this.context41.beginPath()
                        this.context41.moveTo(0, 50)
                        this.context41.lineTo(50, 50)
                        this.context41.lineTo(50, 100)
                        this.context41.lineTo(0, 100)
                        this.context41.closePath()
                        this.context41.fillStyle(this.model.color)
                        this.context41.fill()
                    }
                )
            }.width(100.percent).height(100.percent).rotate(0).backgroundColor(Color.WHITE)
        }.width(this.model.width).height(this.model.height)
    }
}
