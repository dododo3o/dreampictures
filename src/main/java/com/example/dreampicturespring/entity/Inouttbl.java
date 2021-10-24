package com.example.dreampicturespring.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import javax.persistence.*;
@Entity
@Table(name="inouttbl")
@Getter
@Setter
@ToString
public class Inouttbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INOUT_SEQ")
    @SequenceGenerator(sequenceName = "INOUTSQ", allocationSize = 1, name = "INOUT_SEQ")
    private Integer no_inout;
    private Integer status;
    private Integer money;
    private Integer fee;
    private Integer no_membership;

    public Inouttbl() {}
}
