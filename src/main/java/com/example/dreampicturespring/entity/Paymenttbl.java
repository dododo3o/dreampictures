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
    private Long no_payment;

    @Column(name="paymentprice")
    private String paymentprice;

    @Column(name="paymentdate")
    private LocalDateTime paymentdate;

    @Column(name="cardcompony")
    private String cardcompony;

    @Column(name="cardnum")
    private int cardnum;

    @Column(name="cvcnum")
    private int cvcnum;

    private String VALIDTHRU;

    private Long no_membership;

    private Long no_order;

    private Long no_cart;

    public Paymenttbl(){
        if(StringUtils.isEmpty(paymentdate)){
            this.paymentdate = LocalDateTime.now();
        }
    }
}
