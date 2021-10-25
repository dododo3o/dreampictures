package com.example.dreampicturespring.vo;
import lombok.Data;
import java.time.LocalDate;

@Data
public class NoticeVO {
    private Integer no_notice;
    private String title;
    private LocalDate writedate;
    private String content;

}
