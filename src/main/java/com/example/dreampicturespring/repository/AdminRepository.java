package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Admintbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admintbl,Long> {//테이블이름,프라이머리키 데이터타입
    
}