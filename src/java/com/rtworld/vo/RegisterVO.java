package com.rtworld.vo;

public class RegisterVO {
    private String username;
    private String password;
    private String confirmpassword;

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    private String tel;
    private String mail;

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        return "RegisterVO{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", confirmpassword='" + confirmpassword + '\'' +
                ", tel='" + tel + '\'' +
                ", mail='" + mail + '\'' +
                '}';
    }
}
