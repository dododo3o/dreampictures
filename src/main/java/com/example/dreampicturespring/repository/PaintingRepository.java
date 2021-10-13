package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PaintingRepository extends JpaRepository<Paintingtbl,Long> {

    @Query(value = "select pname from Paintingtbl where Paintingtbl.no_membership = :id",nativeQuery = true)
    List<String> findbyno_painiting(@Param(value = "id") int idLong);
}
