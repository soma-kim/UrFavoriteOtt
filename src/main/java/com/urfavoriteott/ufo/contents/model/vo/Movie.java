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
public class Movie {

    private int movieId;
    private String originalTitle;
    private String title;
    private String genres;
    private String tagline;
    private String overview;
    private int runTime;
    private Date releaseDate;
    private String director;
    private String cast;
    private int certification;
    private String productionName;
    private String productionCountry;
    private String productionLogoPath;
    private int collectionId;
    private String collectionName;
    private String backdropPath;
    private String posterPath;
    private String videoKey;
    private int views;
    private Date registerDate;
    private String movieStatus;
    private Date deleteDate;
}