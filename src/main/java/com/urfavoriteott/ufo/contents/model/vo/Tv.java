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
public class Tv {

    private int tvId;
    private String originalName;
    private String name;
    private String genres;
    private String tagline;
    private String overview;
    private int episodeCount;
    private Date airDate;
    private String creator;
    private String cast;
    private int rating;
    private String networksName;
    private String networksCountry;
    private String networksLogoPath;
    private int seasonNumber;
    private String backdropPath;
    private String posterPath;
    private int views;
    private Date registerDate;
    private String tvStatus;
    private Date deleteDate;
}