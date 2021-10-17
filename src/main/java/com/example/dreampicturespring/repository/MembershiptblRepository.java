package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Membershiptbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MembershiptblRepository extends JpaRepository<Membershiptbl,Integer> {
        @Override
        Membershiptbl getById(Integer aInteger);
        Membershiptbl findByemail(String email);
        Boolean existsByemail(String email);
        Boolean existsBytel(String tel);
        Boolean existsBynickname(String nickname);

        @Query(value = "UPDATE membershiptbl SET membershiptbl.dreampay = :money + membershiptbl.dreampay WHERE membershiptbl.no_membership = :no_membership", nativeQuery = true)
        String UpdateDreampay(@Param("money") String money,@Param("no_membership")String no_membership);
}


