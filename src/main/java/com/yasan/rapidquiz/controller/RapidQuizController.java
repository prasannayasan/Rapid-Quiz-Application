package com.yasan.rapidquiz.controller;

import com.yasan.rapidquiz.dto.RapidQuizDTO;
import com.yasan.rapidquiz.dto.QuizAnswer;
import com.yasan.rapidquiz.service.RapidQuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("rapidquiz")
public class RapidQuizController {

    @Autowired
    RapidQuizService rapidQuizService;

    @GetMapping("title/{title}")
    public ResponseEntity<List<RapidQuizDTO>> getQuizByTitle(@PathVariable String title) {
        return rapidQuizService.getRapidQuizByTitle(title);
    }

    @PostMapping("add")
    public ResponseEntity<String> createQuiz(@RequestParam String title, @RequestParam String difficulty, @RequestParam Integer numQ) {
        return rapidQuizService.createRapidQuiz(title, difficulty, numQ);
    }

    @PostMapping("submit/{quizId}")
    public ResponseEntity<Integer> submitAnswers(@PathVariable Integer quizId, @RequestBody List<QuizAnswer> quizAnswer) {
        return rapidQuizService.calculateResult(quizId, quizAnswer);
    }
}
