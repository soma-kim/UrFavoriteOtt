package com.urfavoriteott.ufo.contents.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.urfavoriteott.ufo.contents.model.service.MovieService;
import com.urfavoriteott.ufo.contents.model.vo.Movie;

@Controller
public class MovieController {

    @Autowired
    private MovieService movieService;

    private String baseUrl = "https://api.themoviedb.org/3/";
    private String movieTopRated = "movie/top_rated";
    private String moviePopular = "movie/popular";
    private String movieLatest = "movie/upcoming";
    private String movieVideo1 = "movie/";
    private String movieVideo2 = "/videos";
    private String movieSimilar1 = "movie/";
    private String movieSimilar2 = "/similar";
    private String key = "?api_key=40154e686dd0abd5dd77271873687488";
    private String language = "&language=ko&page=1";
    private String page = "&page=1";
    private String result = "";
    private ArrayList<Movie> resultList = null;


    public ArrayList<Movie> getMovieTopRated() {

        try {

        	resultList = new ArrayList<>();

            URL url = new URL(baseUrl + movieTopRated + key + language + page);

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONArray list = (JSONArray) jsonObject.get("results");

            for(int i = 0; i < 5; i++) {
            	Movie m = new Movie();
            	JSONObject content = (JSONObject) list.get(i);

            	m.setBackdropPath("https://image.tmdb.org/t/p/original" + content.get("backdrop_path").toString());

            	resultList.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }

    public ArrayList<Movie> getMoviePopular() {

        try {

        	resultList = new ArrayList<>();

            URL url = new URL(baseUrl + moviePopular + key + language + page);

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONArray list = (JSONArray) jsonObject.get("results");

            for(int i = 0; i < list.size(); i++) {
            	Movie m = new Movie();
            	JSONObject content = (JSONObject) list.get(i);

            	m.setPosterPath("https://image.tmdb.org/t/p/w500" + content.get("poster_path").toString());

            	resultList.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }

    public ArrayList<Movie> getMovieLatest() {

        try {

        	resultList = new ArrayList<>();

            URL url = new URL(baseUrl + movieLatest + key + language + page);

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONArray list = (JSONArray) jsonObject.get("results");

            for(int i = 0; i < list.size(); i++) {
            	Movie m = new Movie();
            	JSONObject content = (JSONObject) list.get(i);

            	m.setPosterPath("https://image.tmdb.org/t/p/w500" + content.get("poster_path").toString());
            	m.setMovieId((int)content.get("id"));

            	resultList.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }

    public ArrayList<Movie> getMovieVideo(String id) {

        try {

        	resultList = new ArrayList<>();

            URL url = new URL(baseUrl + movieVideo1 + id + movieVideo2 + key + language);

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONArray list = (JSONArray) jsonObject.get("results");

            for(int i = 0; i < list.size(); i++) {
            	Movie m = new Movie();
            	JSONObject content = (JSONObject) list.get(i);

            	m.setVideoKey(content.get("key").toString());

            	resultList.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }

    public ArrayList<Movie> getMovieSimilar(String id) {

        try {

        	resultList = new ArrayList<>();

            URL url = new URL(baseUrl + movieSimilar1 + id + movieSimilar2 + key + language + page);

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONArray list = (JSONArray) jsonObject.get("results");

            for(int i = 0; i < list.size(); i++) {
            	Movie m = new Movie();
            	JSONObject content = (JSONObject) list.get(i);

            	m.setPosterPath("https://image.tmdb.org/t/p/w500" + content.get("poster_path").toString());
            	m.setMovieId((int)content.get("id"));

            	resultList.add(m);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }
}