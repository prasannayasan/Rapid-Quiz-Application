package com.yasan.rapidquiz.dao;

import com.yasan.rapidquiz.model.RapidQuiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RapidQuizDao extends JpaRepository<RapidQuiz, Integer> {

    Optional<RapidQuiz> findByTitle(String title);
}
