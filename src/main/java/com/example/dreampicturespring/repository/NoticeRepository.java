package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Noticetbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface NoticeRepository extends JpaRepository<Noticetbl,Integer> {//테이블이름,프라이머리키 데이터타입
    @Query(value = "SELECT * FROM Noticetbl ORDER BY Noticetbl.no_notice DESC OFFSET :page*15 ROWS FETCH FIRST 15 ROWS ONLY", nativeQuery = true)
    List<Noticetbl> findpage(@Param("page") Integer page);

    @Query(value = "SELECT * FROM Noticetbl ORDER BY Noticetbl.no_notice DESC OFFSET :page*16 ROWS FETCH FIRST 16 ROWS ONLY", nativeQuery = true)
    List<Noticetbl> findpage_notice(@Param("page") Integer page);
}