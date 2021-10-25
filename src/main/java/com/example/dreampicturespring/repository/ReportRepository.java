package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Reporttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Reporttbl,Integer> {

    @Query(value = "select reporttbl.no_membership from reporttbl where reporttbl.no_painting = :no_painting", nativeQuery = true)
    List<Integer> isOverlap(@Param("no_painting") Integer no_painting);

    @Query(value = "select reporttbl.no_painting from reporttbl", nativeQuery = true)
    List<Integer> findAllpaint();
}