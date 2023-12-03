package com.yasan.rapidquiz.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class QuizAnswer {
    private Integer id;
    private String response;
}
