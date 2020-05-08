package com.yottabyte.constants;

public class WebDriverConst {

    // 等待元素的超时时间
    public static final int WAIT_FOR_ELEMENT_TIMEOUT = 10 * 1000;

    // 等待元素轮询查看的时间间隔
    public static final int WAIT_FOR_ELEMENT_POLLING_DURING = 100;

    // 当页面在加载中，等待元素的超时时间
    public static final int WAIT_FOR_ELEMENT_TIMEOUT_WHEN_PAGE_LOADING = 5 * 1000;

    // 等待异步加载的元素的超时时间
    public static final int WAIT_FOR_ELEMENT_LOADED_ASYNC_TIMEOUT = 10 * 1000;

    // 等待页面加载完毕
    public static final int WAIT_FOR_DOM_READY_TIMEOUT = 10 * 1000;
}
