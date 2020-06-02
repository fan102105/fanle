package com.itheima.exception;

/**
 * 用于显示用户错误信息的异常
 */
public class CustomerErrorMsgException extends Exception {

    /**
    有参构造方法
     */
    public CustomerErrorMsgException(String message) {
        super(message);
    }
}
