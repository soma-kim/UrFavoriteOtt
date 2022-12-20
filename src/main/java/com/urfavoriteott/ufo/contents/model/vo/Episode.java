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
public class Episode {

    private int episodeId;
    private int tvId;
    private int seasonNumber;
    private int episodeNumber;
    private String name;
    private String overview;
    private int runTime;
    private Date airDate;
    private String stillPath;
    private String videoKey;
    private Date RegisterDate;
    private String episodeStatus;
    private Date deleteDate;
}