package com.urfavoriteott.ufo.cs.model.vo;

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
public class Notice {

    private int noticeNo;
    private String noticeTitle;
    private String noticeContent;
    private Date NoticeRegisterDate;
    private int noticeHit;
    private String noticeStatus;
}