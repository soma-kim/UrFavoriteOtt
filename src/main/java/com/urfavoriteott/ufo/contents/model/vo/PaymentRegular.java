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
public class PaymentRegular {

    private int regNo;
    private int regOrderNo;
    private String userNo;
    private int regPayment;
    private Date regStartDate;
    private Date regEndDate;
    private String regStatus;
    private String regUrl;
}