package com.yasan.rapidquiz.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Data
@Entity
public class RapidQuiz {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer id;
    private String title;

    @ElementCollection
    private List<Integer> questionIds;
}
