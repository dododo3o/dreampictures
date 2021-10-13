package com.example.dreampicturespring.repository;


import com.example.dreampicturespring.entity.Membership;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MembershiptblRepository extends JpaRepository<Membership,Long> {
        Membership findByemail(String email);
        Boolean existsByemail(String email);
        Boolean existsBytel(String tel);
        Boolean existsBynickname(String nickname);

}


