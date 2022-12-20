package com.urfavoriteott.ufo.contents.model.vo;

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
public class Payment {

    private String payNo;
    private String payOrderNo;
    private String userNo;
    private int payment;
    private Date payDate;
    private Date payEndDate;
    private String payStatus;
    private String payUrl;
}