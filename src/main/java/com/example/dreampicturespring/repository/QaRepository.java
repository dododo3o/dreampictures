package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Qatbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface QaRepository extends JpaRepository<Qatbl,Integer> {

    @Query(value = "select * from qatbl where qatbl.no_membership = :no_membership ", nativeQuery = true)
    List<Qatbl> findbyno_membership(@Param("no_membership") Integer no_membership);
}

