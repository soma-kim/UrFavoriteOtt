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
public class Sales {

	private int total; // 총 매출
    private String dateRange; // 날짜범위 (월, 년)
    
}
