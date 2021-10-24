package com.example.dreampicturespring.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import javax.persistence.*;
@Entity
@Table(name="reporttbl")
@Getter
@Setter
@ToString
public class Reporttbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPORT_SEQ")
    @SequenceGenerator(sequenceName = "REPORTSQ", allocationSize = 1, name = "REPORT_SEQ")
    private Integer no_report;
    private Integer no_membership;
    private Integer no_painting;
    private Integer status;

    public void parser(Integer num){
        switch (num){
            case 1: this.status = 0;
            case 2: this.status = 1;
            case 3: this.status = 2;
            case 4: this.status = 3;
            default: break;
        }
    }

}
