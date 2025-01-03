/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

internal import ohos.base.Length
internal import ohos.base.Color
internal import ohos.base.LengthType
internal import ohos.component.TouchEvent
internal import ohos.component.SwiperController
internal import ohos.component.TabsController
internal import ohos.component.px2vp

internal import ohos.hilog.Hilog
internal import ohos.display.getDefaultDisplaySync
internal import ohos.display.Display
internal import std.collection.ArrayList
internal import ohos.component.*

internal import std.math.*
internal import std.collection.ArrayList
internal import std.sync.{Timer}
internal import std.time.*
internal import ohos.hilog.Hilog
internal import std.format.Formatter
internal import std.convert.Parsable
internal import ohos.base.CJResource

internal import ohos.router.Router
internal import std.sync.{Timer}
internal import std.collection.ArrayList
internal import std.time.*

internal import ohos.base.*
internal import ohos.state_manage.*
internal import ohos.concurrency.*
internal import ohos.animator.*

extend<T> Option<T> {
    operator func ()(): T {
        this.getOrThrow()
    }
}