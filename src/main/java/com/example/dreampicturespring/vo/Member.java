package com.example.dreampicturespring.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEM_SEQ")
    @SequenceGenerator(sequenceName = "MEMBER_SEQ", allocationSize = 1, name = "MEM_SEQ")
    private Long id;
    private String name;
    private String email;
    private LocalDateTime updateTime;
    public Member(){
        if(StringUtils.isEmpty(updateTime)){
            this.updateTime = LocalDateTime.now();
        }
    }
}
