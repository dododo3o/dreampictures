package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Membershiptbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface MembershiptblRepository extends JpaRepository<Membershiptbl,Integer> {
        @Override
        Membershiptbl getById(Integer aInteger);
        Membershiptbl findByemail(String email);
        Boolean existsByemail(String email);
        Boolean existsBytel(String tel);
        Boolean existsBynickname(String nickname);

        @Transactional
        @Modifying(clearAutomatically = true)
        @Query(value = "UPDATE membershiptbl SET membershiptbl.dreampay = :money + membershiptbl.dreampay WHERE membershiptbl.no_membership = :no_membership", nativeQuery = true)
        Integer UpdateDreampayPlus(@Param("money") Integer money, @Param("no_membership")Integer no_membership);

        @Transactional
        @Modifying(clearAutomatically = true)
        @Query(value = "UPDATE membershiptbl SET membershiptbl.dreampay = :money + membershiptbl.dreampay WHERE membershiptbl.no_membership = :no_membership", nativeQuery = true)
        Integer UpdateDreampayMinus(@Param("money") Integer money, @Param("no_membership")Integer no_membership);
}


