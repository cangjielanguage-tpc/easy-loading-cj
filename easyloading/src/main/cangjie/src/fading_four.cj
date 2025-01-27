/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FadingFourModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT
    @Publish
    var duration: Int32 = 600
    public func setSize(size: Float64): FadingFourModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): FadingFourModel {
        this.colors = colors
        return this
    }

    public func setDuration(duration: Int32): FadingFourModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): FadingFourModel {
        this.shapeStyle = shapeStyle
        return this
    }
}

@Component
public class FadingFour {
    @State
    var model: FadingFourModel = FadingFourModel()

    @State
    var fadeValueArr: ObservedArray<Float64> = ObservedArray<Float64>(1.0, 1.0, 1.0, 1.0)

    protected override func aboutToAppear(): Unit {
    }

    protected override func aboutToDisappear() {
    }

    func build() {
        Column() {
            Row() {
                if (this.model.shapeStyle == ShapeStyle.RECT) {
                    Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[0]).fill(
                        this.model.colors[0 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: 0,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[0] = 0.0
                            }
                        )
                    })
                    Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[1]).fill(
                        this.model.colors[1 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: this.model.duration / 2,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[1] = 0.0
                            }
                        )
                    })
                } else {
                    Circle().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[0]).
                        fill(this.model.colors[0 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: 0,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[0] = 0.0
                            }
                        )
                    })
                    Circle().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[1]).
                        fill(this.model.colors[1 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: this.model.duration / 2,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[1] = 0.0
                            }
                        )
                    })
                }
            }.justifyContent(FlexAlign.SpaceBetween).width(this.model.size)

            Row() {
                if (this.model.shapeStyle == ShapeStyle.RECT) {
                    Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[3]).fill(
                        this.model.colors[3 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: this.model.duration / 2 * 3,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[3] = 0.0
                            }
                        )
                    })
                    Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[2]).fill(
                        this.model.colors[2 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: this.model.duration / 2 * 2,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[2] = 0.0
                            }
                        )
                    })
                } else {
                    Circle().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[3]).
                        fill(this.model.colors[3 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: this.model.duration / 2 * 3,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[3] = 0.0
                            }
                        )
                    })
                    Circle().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[2]).
                        fill(this.model.colors[2 % this.model.colors.size]).onAppear(
                        {
                        => animateTo(
                            AnimateParam(
                                duration: this.model.duration,
                                delay: this.model.duration / 2 * 2,
                                curve: Curve.EaseInOut,
                                iterations: -1,
                                playMode: PlayMode.Alternate,
                                onFinish: {=>}
                            ),
                            {
                                => this.fadeValueArr[2] = 0.0
                            }
                        )
                    })
                }
            }.justifyContent(FlexAlign.SpaceBetween).width(this.model.size)
        }.justifyContent(FlexAlign.SpaceBetween).alignRules(
            AlignRuleOption(
                top: VerticalAnchor("__container__", VerticalAlign.Top),
                bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                right: HorizontalAnchor("__container__", HorizontalAlign.End),
            )
        ).width(this.model.size).height(this.model.size)
    }
}
