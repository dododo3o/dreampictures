package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Membershiptbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Membershiptbl,Long> {//테이블이름,프라이머리키 데이터타입
    
}