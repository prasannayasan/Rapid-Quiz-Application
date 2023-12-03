package com.yasan.rapidquiz.service;

import com.yasan.rapidquiz.dao.RapidQuizDao;
import com.yasan.rapidquiz.dto.RapidQuizDTO;
import com.yasan.rapidquiz.dto.QuizAnswer;
import com.yasan.rapidquiz.feign.QuestionFeign;
import com.yasan.rapidquiz.model.RapidQuiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RapidQuizService {

    @Autowired
    RapidQuizDao rapidQuizDao;

    @Autowired
    QuestionFeign questionFeign;

    public ResponseEntity<String> createRapidQuiz(String title, String difficulty, Integer numQ) {
        System.out.println("Entered createRapidQuiz");
        List<Integer> questions = questionFeign.getQuestionsForQuiz(difficulty.toUpperCase(), numQ).getBody();
         RapidQuiz rapidQuiz = new RapidQuiz();
         rapidQuiz.setTitle(title);
         rapidQuiz.setQuestionIds(questions);
         rapidQuizDao.save(rapidQuiz);
         return new ResponseEntity<>("Quiz created for title - " + title, HttpStatus.CREATED);
    }

    public ResponseEntity<List<RapidQuizDTO>> getRapidQuizByTitle(String title) {
        System.out.println("Entered getRapidQuizByTitle");
        Optional<RapidQuiz> rapidQuiz = rapidQuizDao.findByTitle(title);
        if(rapidQuiz.isPresent()) {
            List<Integer> questions = rapidQuiz.get().getQuestionIds();
            System.out.println("Values of questions : " + questions);
            List<RapidQuizDTO> rapidQuizQuestions = questionFeign.getQuestionsByIds(questions).getBody();
            return new ResponseEntity<>(rapidQuizQuestions, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<Integer> calculateResult(Integer quizId, List<QuizAnswer> quizAnswer) {
        System.out.println("Entered calculateResult");
        Optional<RapidQuiz> quiz = rapidQuizDao.findById(quizId);
        if(!quiz.isPresent()) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        int result = questionFeign.calculateResult(quizAnswer).getBody();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}
