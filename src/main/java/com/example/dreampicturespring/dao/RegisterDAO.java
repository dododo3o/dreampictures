package com.example.dreampicturespring.dao;


import com.example.dreampicturespring.inter.IsimpleRegisterDAO;
import com.example.dreampicturespring.vo.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RegisterDAO  {

    @Autowired
    private JdbcTemplate template;

    public List<RegisterVO> searchRegisterVo() {
        String query = "Select * from table1";
        List<RegisterVO> vos = template.query(query, new BeanPropertyRowMapper<RegisterVO>(RegisterVO.class));

        System.out.println("==============");
        for(RegisterVO vo:vos){
            System.out.println(vos.size());
            System.out.println(vo);
        }
        return vos;
    }
}
