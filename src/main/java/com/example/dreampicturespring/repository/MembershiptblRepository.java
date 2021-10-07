package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Membership;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MembershiptblRepository extends JpaRepository<Membership,Long> {
}
