package com.urfavoriteott.ufo.admin.model.vo;

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
public class Report {

    private int reportNo;
    private String reviewNo;
    private String comNo;
    private String comRplNo;
    private String userNo;
    private String reportReason;
    private Date reportDate;
    private String reportStatus;
}