package com.example.dreampicturespring.repository;
import com.example.dreampicturespring.entity.Inouttbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface InoutRepository extends JpaRepository<Inouttbl,Integer> {

}