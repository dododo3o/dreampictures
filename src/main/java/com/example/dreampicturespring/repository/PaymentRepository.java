package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Paymenttbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentRepository extends JpaRepository<Paymenttbl,Long> {

}
