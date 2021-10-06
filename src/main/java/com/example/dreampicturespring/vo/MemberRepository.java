package com.example.dreampicturespring.vo;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member,Long> {

    Member findByName(String name);

//    Test findBytest(String name);

}
