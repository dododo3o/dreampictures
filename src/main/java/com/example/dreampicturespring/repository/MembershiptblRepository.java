package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Membership;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MembershiptblRepository extends JpaRepository<Membership,Long> {
        List<Membership> findByemail(String email);
}
