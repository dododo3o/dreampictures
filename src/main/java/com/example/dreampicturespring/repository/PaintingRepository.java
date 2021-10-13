package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;
public interface PaintingRepository extends JpaRepository<Paintingtbl,Long> {
    @Query(value = "select membershiptbl.nickname,paintingtbl.pname,membershiptbl.img from paintingtbl, membershiptbl where paintingtbl.no_membership = membershiptbl.no_membership",nativeQuery = true)
    List<String> findAllPainting_Desc();

/*    @Query(value = "select * from paintingtbl where width<=500 or height<=200 or style='oils' or theme='still' = :id",nativeQuery = true)
    List<String>*/
}