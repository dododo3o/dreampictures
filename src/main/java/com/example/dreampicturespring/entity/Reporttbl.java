package com.example.dreampicturespring.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="reporttbl")
@Getter
@Setter
@ToString
public class Reporttbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPORT_SEQ")
    @SequenceGenerator(sequenceName = "REPORTSQ", allocationSize = 1, name = "REPORT_SEQ")
    private Long no_report;
    private Long no_membership;
    private Long no_painting;
}
