package com.example.dreampicturespring.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;
import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZoneId;

@Entity
@Table(name="relytbl")
@Getter
@Setter
@ToString
public class Replytbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPLY_SEQ")
    @SequenceGenerator(sequenceName = "REPLYSQ", allocationSize = 1, name = "REPLY_SEQ")
    private Integer no_reply;
    private String reply;

    @Column(name="writedate")
    private LocalDate writedate;
    @Column(name="no_admin")
    private Integer no_admin;
    @Column(name="no_qa")
    private Integer no_qa;

    public Replytbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDate.now(ZoneId.of("Asia/Seoul"));
        }
    }
}
