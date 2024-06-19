package com.kk.pogo;

import lombok.Data;

@Data
public class Account<T> {
    /*
    * -1 用户名错误
    * -2 密码错误
    * 0 成功
    * */
    private Integer code;
    private T admin;
}
