package com.kk.pogo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    public Integer usid;
    public String username;  /*账号*/
    public String password; /*密码*/
    public String name; /*用户名*/
    public String sex;   /*性别*/
    public String email;/*邮箱*/
    public String phone;/*联系号*/
    public String permission; /*用户权限*/
}

