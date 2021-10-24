package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Carttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Carttbl,Integer> {//테이블이름,프라이머리키 데이터타입


    @Query(value = "select * from Carttbl where Carttbl.no_membership = :no_membership", nativeQuery = true)
    Carttbl findByno_membership(@Param("no_membership") Integer no_membership);
}