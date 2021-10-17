package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Carttbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardRepository extends JpaRepository<Carttbl,Integer> {//테이블이름,프라이머리키 데이터타입
}