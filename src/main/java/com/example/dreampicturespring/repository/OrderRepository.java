package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Ordertbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface OrderRepository extends JpaRepository<Ordertbl,Integer> {//테이블이름,프라이머리키 데이터타입
    
}