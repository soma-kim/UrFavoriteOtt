package com.urfavoriteott.ufo.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {

    private int userNo;
    private String userId;
    private String userPwd;
    private String userNickname;
    private int userProfile;
    private Date userEnrollDate;
    private String userStatus;
}