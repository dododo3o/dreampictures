package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Qatbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QaRepository extends JpaRepository<Qatbl,Integer> {

    @Query(value = "select * from qatbl ", nativeQuery = true)
    List<String> findAllNotice_Desc();


}