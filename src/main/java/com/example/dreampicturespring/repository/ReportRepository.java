package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Replytbl;
import com.example.dreampicturespring.entity.Reporttbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Reporttbl,Integer> {

}
