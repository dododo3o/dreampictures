package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.entity.Paintingtbl;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaintingRepository extends JpaRepository<Paintingtbl,Long> {
//   List<Paintingtbl> findbypname(String pname);

}
