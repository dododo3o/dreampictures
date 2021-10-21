package com.example.dreampicturespring.vo;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

import java.time.LocalDate;

@Data
public class NoticeVO {
    private String title;
    private LocalDate writedate;
    private String content;

}
