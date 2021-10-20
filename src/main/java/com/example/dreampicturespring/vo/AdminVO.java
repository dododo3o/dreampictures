package com.example.dreampicturespring.vo;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.Map;

public class AdminVO {
    //상단 4개 메인메뉴
    private Integer no_notice; //공지사항 글갯수
    private Integer no_qa; //질문사항 글갯수
    private Integer no_payment; //결제고유번호로 총판매 갯수
    private Integer no_membership; //회원가입고유번호로 총회원 수

    //주간통계
    private Integer membershipTotal; //1주간 신규가입자수
    private Integer paymentTotal; //1주간 총 판매갯수
    private Integer paintingTotal;// 1주간 등록된 총 그림수

    //테마별 판매량
    private Map<String, Integer> theme;

    //스타일별 판매량
    private Map<String, Integer> style;

    //최근 판매자
    private Integer no_painting;

    //최근 댓글이 달린 그림
    private Integer no_reply;
}
