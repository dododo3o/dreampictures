package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Noticetbl;
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

    @Query(value = "SELECT * FROM qatbl ORDER BY qatbl.no_qa DESC OFFSET :page*16 ROWS FETCH FIRST 16 ROWS ONLY", nativeQuery = true)
    List<Qatbl> findpage_qa(@Param("page") Integer page);

    @Query(value = "select * from qatbl order by qatbl.no_qa desc", nativeQuery = true)
    List<Qatbl> find_sort();
}

