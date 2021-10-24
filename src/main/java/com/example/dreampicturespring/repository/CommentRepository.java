package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Commentstbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface CommentRepository extends JpaRepository<Commentstbl,Integer> {

    @Query(value = "select commentstbl.comments,commentstbl.no_membership from commentstbl where commentstbl.no_painting = :no_painting", nativeQuery = true)
    List<String> findCommenttbl(@Param("no_painting") Integer no_painting);

    @Query(value = "select count(*) from commentstbl where commentstbl.no_painting = :no_painting", nativeQuery = true)
    Integer countByno_painting(@Param("no_painting") Integer no_painting);

    @Query(value = "select commentstbl.no_comment from commentstbl where commentstbl.no_membership = :no_membership and commentstbl.no_painting = :no_painting", nativeQuery = true)
    Integer findByNo_comment(@Param("no_membership") Integer no_membership,@Param("no_painting") Integer no_painting);
}