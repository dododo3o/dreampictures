package com.example.dreampicturespring.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;
import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZoneId;

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
    private Integer paymentprice;

    @Column(name="paymentdate")
    private LocalDate paymentdate;

    private Integer no_membership;
    private Integer no_painting;
    public Paymenttbl(){
        if(StringUtils.isEmpty(paymentdate)){
            this.paymentdate = LocalDate.now(ZoneId.of("Asia/Seoul"));
        }

    }

}
