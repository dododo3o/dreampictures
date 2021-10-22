package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Cartpaintingtbl;
import com.example.dreampicturespring.entity.Carttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartpaintingRepository extends JpaRepository<Cartpaintingtbl,Integer> {
    @Query(value = "select * from Cartpaintingtbl where Cartpaintingtbl.no_cart = :no_cart", nativeQuery = true)
    List<Cartpaintingtbl> findByno_cart(@Param("no_cart") Integer no_cart);
}