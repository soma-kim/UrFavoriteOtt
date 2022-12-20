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
public class Record {

    private int recordNo;
    private int userNo;
    private int movieId;
    private int episodeId;
    private int recordTime;
    private String recordStatus;
}