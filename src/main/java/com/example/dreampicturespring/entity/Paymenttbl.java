package com.example.dreampicturespring.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="paymenttbl")
@Getter
@Setter
@ToString
public class Paymenttbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PAY_SEQ")
    @SequenceGenerator(sequenceName = "PAYMENTSQ", allocationSize = 1, name = "PAY_SEQ")
    private Integer no_payment;

    @Column(name="paymentprice")
    private String paymentprice;

    @Column(name="paymentdate")
    private LocalDateTime paymentdate;

    @Column(name="cardcompony")
    private String cardcompony;

    private Integer no_membership;

    private Integer no_order;

    private Integer no_cart;

    public Paymenttbl(){
        if(StringUtils.isEmpty(paymentdate)){
            this.paymentdate = LocalDateTime.now();
        }
    }
}
