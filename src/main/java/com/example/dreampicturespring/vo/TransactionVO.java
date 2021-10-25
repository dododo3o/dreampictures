package com.example.dreampicturespring.vo;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;
import org.springframework.util.StringUtils;
import java.time.LocalDate;
import java.time.ZoneId;
@Data
public class TransactionVO {
    private String pname;
    private String paintingimg;
    private String avatarimg;
    private String nickname;

    private String buyer_avatarimg;
    private String buyer_nickname;
    private String buyer_email;
    private String buyer_tel;
    private String buyer_addr;
    private LocalDate transactionDate;


    public TransactionVO() {}
    public TransactionVO(Paintingtbl paintingtbl, Membershiptbl sellerMembershiptbl, Membershiptbl buyerMembershiptbl){
        this.pname = paintingtbl.getPname();
        this.paintingimg = sellerMembershiptbl.getImg();;
        this.avatarimg = sellerMembershiptbl.getImg();
        this.nickname = sellerMembershiptbl.getNickname();
        this.buyer_avatarimg = buyerMembershiptbl.getImg();
        this.buyer_nickname = buyerMembershiptbl.getNickname();
        this.buyer_email = buyerMembershiptbl.getEmail();
        this.buyer_tel = buyerMembershiptbl.getTel();
        this.buyer_addr = buyerMembershiptbl.getAddr();

        if(StringUtils.isEmpty(transactionDate)){ this.transactionDate = LocalDate.now(ZoneId.of("Asia/Seoul"));}
    }
}
