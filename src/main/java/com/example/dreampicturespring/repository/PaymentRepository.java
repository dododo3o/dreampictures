package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Paymenttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Paymenttbl,Integer> {

}
