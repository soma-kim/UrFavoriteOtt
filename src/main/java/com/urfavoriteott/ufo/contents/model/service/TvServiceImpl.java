package com.urfavoriteott.ufo.contents.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.contents.model.dao.TvDao;

@Service
public class TvServiceImpl implements TvService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private TvDao tvDao;
}