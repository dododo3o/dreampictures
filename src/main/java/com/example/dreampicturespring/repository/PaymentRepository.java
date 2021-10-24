package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Paymenttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface PaymentRepository extends JpaRepository<Paymenttbl,Integer> {
    @Query(value = "select * from paymenttbl where paymenttbl.no_membership = :no_membership", nativeQuery = true)
    List<Paymenttbl> findByno_membership(@Param("no_membership") Integer no_membership);
}
