package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Noticetbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoticeRepository extends JpaRepository<Noticetbl,Long> {//테이블이름,프라이머리키 데이터타입
    
}