package com.yasan.rapidquiz.feign;
import com.yasan.rapidquiz.dto.QuizAnswer;
import com.yasan.rapidquiz.dto.RapidQuizDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient("Question-Service")
public interface QuestionFeign {

    @GetMapping("question/quiz")
    public ResponseEntity<List<Integer>> getQuestionsForQuiz(@RequestParam String difficulty, @RequestParam Integer numQ);
    @PostMapping("question/ids")
    public ResponseEntity<List<RapidQuizDTO>> getQuestionsByIds(@RequestBody List<Integer> questionIds);
    @PostMapping("question/submit")
    public ResponseEntity<Integer> calculateResult(@RequestBody List<QuizAnswer> quizAnswers);
}
