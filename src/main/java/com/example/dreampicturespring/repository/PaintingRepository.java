package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

import java.util.List;

public interface PaintingRepository extends JpaRepository<Paintingtbl,Long> {


    @Query(value = "select membershiptbl.img, membershiptbl.nickname, paintingtbl.pname from paintingtbl, membershiptbl where paintingtbl.no_membership = membershiptbl.no_membership",nativeQuery = true)
    List<String> findAllPainting_Desc();

}
