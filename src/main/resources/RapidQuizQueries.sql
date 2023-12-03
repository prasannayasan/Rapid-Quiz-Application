Rapid Quiz Migration Queries :

CREATE DATABASE rapidfire;
CREATE DATABASE questions;

CREATE TABLE QUESTION(
   ID INT PRIMARY KEY     NOT NULL,
   QUESTION     TEXT      NOT NULL,
   DIFFICULTY   TEXT      NOT NULL,
   ANSWER       TEXT 	  NOT NULL,
   option1      TEXT 	  NOT NULL,
   option2      TEXT 	  NOT NULL,
   option3      TEXT	  NOT NULL,
   option4      TEXT	  NOT null,
   MARK         INT       NOT null,
   CREATED_ON   TIMESTAMP default CURRENT_TIMESTAMP not null,
   UPDATED_ON   TIMESTAMP default CURRENT_TIMESTAMP not null
);

ALTER TABLE QUESTION ALTER COLUMN DIFFICULTY TYPE TEXT;
ALTER TABLE QUESTION ALTER COLUMN DIFFICULTY TYPE varchar(150);
ALTER TABLE QUESTION ALTER COLUMN MARK TYPE INTEGER USING (MARK::integer);
ALTER TABLE QUESTION ALTER COLUMN UPDATED_ON DROP NOT NULL;

CREATE  FUNCTION update_created_on_question()
RETURNS TRIGGER AS $$
BEGIN
    NEW.CREATED_ON = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_question_task_created_on
    BEFORE INSERT
    ON
        QUESTION
    FOR EACH ROW
EXECUTE PROCEDURE update_created_on_question();

CREATE  FUNCTION update_updated_on_question()
RETURNS TRIGGER AS $$
BEGIN
    NEW.UPDATED_ON = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_question_task_updated_on
    BEFORE UPDATE
    ON
        QUESTION
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_on_question();

INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(1, 'Who invented Java Programming?', 'EASY', '(b) Java programming was developed by James Gosling at Sun Microsystems in 1995. James Gosling is well known as the father of Java', 'James Gosling', 'Dennis Ritchie', 'Bjarne Stroustrup', 'Guido van Rossum', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(2, 'Which statement is true about Java', 'EASY', '(d) Java is called Platform Independent Language as it primarily works on the principle of compile once, run everywhere', 'Java is a sequence-dependent programming language', 'Java is a code dependent programming language', 'Java is a platform-dependent programming language', 'Java is a platform-independent programming language', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(3, 'Which of these cannot be used for a variable name in Java?', 'EASY', '(c) Keywords are specially reserved words that can not be used for naming a user-defined variable, for example: class, int, for, etc', 'identifier & keyword', 'identifier', 'keyword', 'none of the mentioned', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(4, 'Which environment variable is used to set the java path?', 'EASY', '(d) JAVA_HOME is used to store a path to the java installation', 'MAVEN_Path', 'JavaPATH', 'JAVA', 'JAVA_HOME', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(5, 'Which of the following is not an OOPS concept in Java?', 'EASY', '(c) There are 4 OOPS concepts in Java. Inheritance, Encapsulation, Polymorphism and Abstraction.', 'Polymorphism', 'Inheritance', 'Compilation', 'Encapsulation', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(6, 'What is not the use of “this” keyword in Java?', 'EASY', '(b) “this” is an important keyword in java. It helps to distinguish between local variable and variables passed in the method as parameters.', 'Referring to the instance variable when a local variable has the same name', 'Passing itself to the method of the same class', 'Passing itself to another method', 'Calling another constructor in constructor chaining', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(7, 'What will be the error in the following Java code? <<< byte b = 50; b = b * 50; >>>', 'EASY', '(d) While evaluating an expression containing int, bytes or shorts, the whole expression is converted to int then evaluated and the result is also of type int.', 'b cannot contain value 50', 'b cannot contain value 100, limited by its range', 'No error in this code', '* operator has converted b * 50 into int, which can not be converted to byte without casting', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(8, ' Which of these keywords are used for the block to be examined for exceptions?', 'EASY', '(d) try is used for the block that needs to checked for exception', 'check', 'throw', 'catch', 'try', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(9, ' What is the numerical range of a char data type in Java?', 'EASY', '(c) Char occupies 16-bit in memory, so it supports 216 i:e from 0 to 65535.', '0 to 256', ' -128 to 127', '0 to 65535', '0 to 32767', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(10, 'Which class provides system independent server side implementation?', 'EASY', '(d) ServerSocket is a java.net class which provides system independent implementation of server side socket connection.', 'Server', 'ServerReader', 'Socket', 'ServerSocket', 1);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(11, 'Which of these operators is used to allocate memory to array variable in Java?', 'MEDIUM', '(c) Operator new allocates a block of memory specified by the size of an array, and gives the reference of memory allocated to the array variable.', 'malloc', 'alloc', 'new', 'new malloc', 2);
INSERT INTO public.QUESTION
(id, question, difficulty, answer, option1, option2, option3, option4, mark)
VALUES(12, 'Which of these methods is used to check for infinitely large and small values?', 'MEDIUM', '(a) isinfinite() method returns true is the value being tested is infinitely large or small in magnitude.', 'isInfinite()', 'isNaN()', 'IsBlob()', 'IsLarge()', 2);

ALTER TABLE QUESTION DROP COLUMN QUESTION;
update QUESTION set option1 = 'Java is sequence-dependent programming language' where id = 2;

ALTER TABLE public.QUESTIONS RENAME TO question;

select * from QUESTION;
select * from Question where difficulty = 'EASY';















