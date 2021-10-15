package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Admintbl;
import com.example.dreampicturespring.entity.Membershiptbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AdminRepository extends JpaRepository<Admintbl,Long> {//테이블이름,프라이머리키 데이터타입

    @Query(value = "select admintbl.adminpwd from admintbl where admintbl.adminid = :adminID ", nativeQuery = true)
    String findByadminID(@Param("adminID") String adminID);
}