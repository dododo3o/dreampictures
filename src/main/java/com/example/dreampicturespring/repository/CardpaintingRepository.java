package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Cartpaintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CardpaintingRepository extends JpaRepository<Cartpaintingtbl,Integer> {//테이블이름,프라이머리키 데이터타입
}