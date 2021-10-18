package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Carttbl;
import com.example.dreampicturespring.entity.Commenttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepository extends JpaRepository<Commenttbl,Integer> {

    @Query(value = "select commentstbl.comments,commentstbl.no_membership from commentstbl where commentstbl.no_painting = :no_painting", nativeQuery = true)
    List<String> findCommenttbl(@Param("no_painting") Integer no_painting);

}