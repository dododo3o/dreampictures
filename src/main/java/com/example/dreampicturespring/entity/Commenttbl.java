package com.example.dreampicturespring.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import javax.persistence.*;
@Entity//엔터티라고 선언해줘야함
@Table(name="Carttbl")//sql의 테이블이름이기때문에 이름틀리면 나가리
@Getter
@Setter
@ToString//모든데이터타입을 스트링을 바꿔줌
public class Commenttbl {
    @Id //바로아래있는 멤버를 프라이머리키지정해준다.
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Comment_SEQ")//맴버테이블의 시퀀스를 만들어준다.
    @SequenceGenerator(sequenceName = "COMMENTSQ", allocationSize = 1, name = "Comment_SEQ")//시퀀스를 만들어주는데 오른쪽의 시퀀스 이름을 똑같이 맞춰야한다.
    private Integer no_comment;
    private Integer no_membership;
    private String comments;
    private Integer no_painting;

    public Commenttbl(){

    }
}