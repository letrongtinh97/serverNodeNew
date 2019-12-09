create database tbl_thionline;

go
create table admins(
  admin_id integer NOT NULL,
  username varchar(16) NOT NULL,
  email varchar(50) DEFAULT NULL,
  password varchar(32) NOT NULL,
  name varchar(50) NOT NULL,
  permission integer DEFAULT '1',
  last_login timestamp NOT NULL,
  gender_id integer NOT NULL DEFAULT '1',
  avatar varchar(255) DEFAULT 'avatar-default.jpg',
  birthday date NOT NULL

)
go

create table chats (

   	ID int NOT NULL,
  	username varchar(16)  NOT NULL,
  	name varchar(50)  NOT NULL,
  	time_sent timestamp NOT NULL,
  	chat_content text  NOT NULL,
  	class_id int NOT NULL
)

create table classes (
	class_id int NOT NULL,
  	grade_id int NOT NULL,
  	class_name varchar(50) NOT NULL,
  	teacher_id int NOT NULL
)
-- giới tính
create table genders (
   	gender_id int NOT NULL,
  	gender_detail varchar(20)  NOT NULL
)

INSERT INTO `genders` (`gender_id`, `gender_detail`) VALUES
(1, 'Chưa Xác Định'),
(2, 'Nam'),
(3, 'Nữ');
-- bang khối
create table grades (
    grade_id int NOT NULL,
    detail varchar(30) NOT NULL
)
INSERT INTO `grades` (`grade_id`, `detail`) VALUES
(1, 'Khối 1'),
(2, 'Khối 2'),
(3, 'Khối 3'),
(4, 'Khối 4'),
(5, 'Khối 5'),
(6, 'Khối 6'),
(7, 'Khối 7'),
(8, 'Khối 8'),
(9, 'Khối 9'),
(10, 'Khối 10'),
(11, 'Khối 11'),
(12, 'Khối 12');


create table levels (
 	level_id int NOT NULL,
  	level_detail varchar(255)  DEFAULT NULL
)

INSERT INTO `levels` (`level_id`, `level_detail`) VALUES
(1, 'Dễ'),
(2, 'Trung Bình'),
(3, 'Khó');


-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE notifications (
  notification_id int NOT NULL,
  username varchar(16)  NOT NULL,
  name varchar(50)  NOT NULL,
  notification_title text  NOT NULL,
  notification_content text NOT NULL,
  time_sent timestamp NOT NULL
)
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE permissions (
  permission int NOT NULL,
  permission_detail varchar(20) NOT NULL
)


-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`permission`, `permission_detail`) VALUES
(1, 'Admin'),
(2, 'Giáo Viên'),
(3, 'Học Sinh');


-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE questions (
  grade_id int NOT NULL,
  unit int NOT NULL,
  level_id int NOT NULL,
  question_content text  NOT NULL,
  answer_a text NOT NULL,
  answer_b text NOT NULL,
  answer_c text NOT NULL,
  answer_d text NOT NULL,
  correct_answer text  NOT NULL,
  question_id int NOT NULL,
  subject_id int NOT NULL DEFAULT '1',
  sent_by varchar(255) NOT NULL,
  status_id int NOT NULL
)


-- Cấu trúc bảng cho bảng `quest_of_test`
--

CREATE TABLE quest_of_test (
  test_code int NOT NULL,
  question_id int NOT NULL,
  timest timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
)

create function update_stamp() returns trigger as $$begin new.timest := now(); return new; end;$$ language plpgsql
create trigger tg_update  before update on quest_of_test for each row execute procedure update_stamp();


CREATE TABLE scores (
  student_id int NOT NULL,
  test_code int NOT NULL,
  score_number varchar(10) DEFAULT NULL,
  core_detail varchar(50) NOT NULL,
  completion_time timestamp DEFAULT NULL
)


-- Cấu trúc bảng cho bảng `statuses`
--

CREATE TABLE statuses (
  status_id int NOT NULL,
  detail varchar(50)  NOT NULL
)


INSERT INTO `statuses` (`status_id`, `detail`) VALUES
(1, 'Mở'),
(2, 'Đóng'),
(3, 'Chờ Duyệt'),
(4, 'Đã Duyệt'),
(5, 'Cho Phép Xem Đáp Án'),
(6, 'Kết Thúc'),
(7, 'Ẩn');


-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE students (
  student_id int NOT NULL,
  username varchar(16) NOT NULL,
  email varchar(50)  DEFAULT NULL,
  password varchar(32) NOT NULL,
  name varchar(50) NOT NULL,
  permission int DEFAULT '3',
  class_id int NOT NULL,
  last_login timestamp NOT NULL,
  gender_id int NOT NULL DEFAULT '1',
  avatar varchar(255) DEFAULT 'avatar-default.jpg',
  birthday date NOT NULL,
  doing_exam int DEFAULT NULL,
  starting_time timestamp DEFAULT NULL,
  time_remaining varchar(11) DEFAULT NULL
)

-- Cấu trúc bảng cho bảng `student_notifications`
--

CREATE TABLE student_notifications (
  ID int NOT NULL,
  notification_id int NOT NULL,
  class_id int NOT NULL
)

-- Cấu trúc bảng cho bảng `student_test_detail`
--

CREATE TABLE student_test_detail (
  ID int NOT NULL,
  student_id int NOT NULL,
  test_code int NOT NULL,
  question_id int NOT NULL,
  answer_a text ,
  answer_b text ,
  answer_c text ,
  answer_d text ,
  student_answer text ,
  timest timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
)

create trigger tg_update  before update on student_test_detail for each row execute procedure update_stamp();

-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE subjects (
  subject_id int NOT NULL,
  subject_detail varchar(255)  NOT NULL
)


-- Cấu trúc bảng cho bảng `teachers`
--

CREATE TABLE teachers (
  teacher_id int NOT NULL,
  username varchar(16) NOT NULL,
  email varchar(50) DEFAULT NULL,
  password varchar(32) NOT NULL,
  name varchar(50) NOT NULL,
  permission int DEFAULT '2',
  last_login timestamp NOT NULL,
  gender_id int NOT NULL DEFAULT '1',
  avatar varchar(255) DEFAULT 'avatar-default.jpg',
  birthday date NOT NULL
)


-- Cấu trúc bảng cho bảng `teacher_notifications`
--

CREATE TABLE teacher_notifications (
  ID int NOT NULL,
  notification_id int NOT NULL,
  teacher_id int NOT NULL
)


-- Cấu trúc bảng cho bảng `tests`
--

CREATE TABLE tests (
  test_code int NOT NULL,
  test_name varchar(255)  NOT NULL,
  password varchar(32)  NOT NULL,
  subject_id int DEFAULT NULL,
  grade_id int NOT NULL,
  total_questions int NOT NULL,
  time_to_do int NOT NULL,
  note text NOT NULL,
  status_id int DEFAULT NULL,
  timest timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

create trigger tg_update  before update on tests for each row execute procedure update_stamp();
- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE admins
  ADD PRIMARY KEY (admin_id),
  ADD UNIQUE  (username),
  ADD UNIQUE (email),
  ADD KEY n4 (permission),
  ADD KEY admins_gender_id (gender_id);

--
-- Chỉ mục cho bảng `chats`
--
ALTER TABLE chats
  ADD PRIMARY KEY (ID),
  ADD KEY class_id (class_id);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE classes
  ADD PRIMARY KEY (class_id),
  ADD UNIQUE


  (class_name),
  ADD KEY n7 (teacher_id),
  ADD KEY k4(grade_id);

--
-- Chỉ mục cho bảng `genders`
--
ALTER TABLE genders
  ADD PRIMARY KEY (gender_id);

--
-- Chỉ mục cho bảng `grades`
--
ALTER TABLE grades
  ADD PRIMARY KEY (grade_id);

--
-- Chỉ mục cho bảng `levels`
--
ALTER TABLE levels
  ADD PRIMARY KEY (level_id);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE notifications
  ADD PRIMARY KEY (notification_id);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE permissions
  ADD PRIMARY KEY (permission);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE questions
  ADD PRIMARY KEY (question_id),
  ADD KEY k9 (grade_id),
  ADD KEY unit (unit),
  ADD KEY subjects_key (subject_id),
  ADD KEY level_id(level_id),
  ADD KEY status_id (status_id);

--
-- Chỉ mục cho bảng `quest_of_test`
--
ALTER TABLE quest_of_test
  ADD PRIMARY KEY (test_code,question_id),
  ADD KEY question_id (question_id),
  ADD KEY test_code (test_code);

--
-- Chỉ mục cho bảng `scores`
--
ALTER TABLE scores
  ADD PRIMARY KEY (student_id,test_code),
  ADD KEY student_id (student_id),
  ADD KEY test_code (test_code);

--
-- Chỉ mục cho bảng `statuses`
--
ALTER TABLE statuses
  ADD PRIMARY KEY (status_id);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE students
  ADD PRIMARY KEY (student_id),
  ADD UNIQUE (username),
  ADD UNIQUE (email),
  ADD KEY n9(class_id),
  ADD KEY n11 (permission),
  ADD KEY students_gender_id (gender_id);

--
-- Chỉ mục cho bảng `student_notifications`
--
ALTER TABLE student_notifications
  ADD PRIMARY KEY (ID),
  ADD KEY notification_id (notification_id),
  ADD KEY class_id (class_id);

--
-- Chỉ mục cho bảng `student_test_detail`
--
ALTER TABLE student_test_detail
  ADD PRIMARY KEY (student_id,test_code,question_id),
  ADD KEY fk4 (test_code),
  ADD KEY fk6 (question_id);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE subjects
  ADD PRIMARY KEY (subject_id);

--
-- Chỉ mục cho bảng `teachers`
--
ALTER TABLE teachers
  ADD PRIMARY KEY (teacher_id),
  ADD UNIQUE  (username),
  ADD UNIQUE (email),
  ADD KEY n2 (permission),
  ADD KEY teachers_gender_id (gender_id);

--
-- Chỉ mục cho bảng `teacher_notifications`
--
ALTER TABLE teacher_notifications
  ADD PRIMARY KEY (ID),
  ADD KEY notification_id (notification_id),
  ADD KEY teacher_id (teacher_id);

--
-- Chỉ mục cho bảng `tests`
--
ALTER TABLE tests
  ADD PRIMARY KEY (test_code),
  ADD KEY fk1(subject_id),
  ADD KEY fk2 (status_id),
  ADD KEY grade_id (grade_id);


--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE admins
  ALTER admin_id   serial;

--
-- AUTO_INCREMENT cho bảng `chats`
--
ALTER TABLE chats
  ALTER ID   serial;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE classes
  ALTER class_id  serial;

--
-- AUTO_INCREMENT cho bảng `genders`
--
ALTER TABLE genders
  ALTER gender_id serial;

--
-- AUTO_INCREMENT cho bảng `grades`
--
ALTER TABLE grades
  MODIFY grade_id   serial;

--
-- AUTO_INCREMENT cho bảng `levels`
--
ALTER TABLE levels
  ALTER level_id   serial;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE notifications
  ALTER notification_id serial;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE permissions
  ALTER permission  serial;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE questions
  ALTER question_id  NOT NULL serial;

--
-- AUTO_INCREMENT cho bảng `statuses`
--
ALTER TABLE statuses
  ALTER status_id  serial;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE students
  ALTER student_id   serial;

--
-- AUTO_INCREMENT cho bảng `student_notifications`
--
ALTER TABLE student_notifications
  ALTER ID int NOT NULL serial;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE subjects
  ALTER subject_id  SERIAL;

--
-- AUTO_INCREMENT cho bảng `teachers`
--
ALTER TABLE teachers
  ALTER teacher_id   serial;

--
-- AUTO_INCREMENT cho bảng `teacher_notifications`
--
ALTER TABLE teacher_notifications
  ALTER ID  serial;

--
-- AUTO_INCREMENT cho bảng `tests`
--
ALTER TABLE tests
  ALTER test_code  serial;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admins`
--
ALTER TABLE admins
  ADD CONSTRAINT admins_gender_id FOREIGN KEY (gender_id) REFERENCES genders (gender_id),
  ADD CONSTRAINT n4 FOREIGN KEY (permission) REFERENCES permissions (permission);

--
-- Các ràng buộc cho bảng `chats`
--
ALTER TABLE chats
  ADD CONSTRAINT chat_classes_ibfk_1 FOREIGN KEY (class_id) REFERENCES classes (class_id);

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE classes
  ADD CONSTRAINT classes_ibfk_1 FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id),
  ADD CONSTRAINT classes_ibfk_2 FOREIGN KEY (grade_id) REFERENCES grades (grade_id);

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE questions
  ADD CONSTRAINT k9 FOREIGN KEY (grade_id) REFERENCES grades (grade_id),
  ADD CONSTRAINT questions_ibfk_1 FOREIGN KEY (level_id) REFERENCES levels (level_id),
  ADD CONSTRAINT questions_ibfk_2 FOREIGN KEY (status_id) REFERENCES statuses (status_id),
  ADD CONSTRAINT subjects_key FOREIGN KEY (subject_id) REFERENCES subjects (subject_id);

--
-- Các ràng buộc cho bảng `quest_of_test`
--
ALTER TABLE quest_of_test
  ADD CONSTRAINT quest_of_test_ibfk_1 FOREIGN KEY (question_id) REFERENCES questions (question_id),
  ADD CONSTRAINT quest_of_test_ibfk_2 FOREIGN KEY (test_code) REFERENCES tests (test_code);

--
-- Các ràng buộc cho bảng `scores`
--
ALTER TABLE scores
  ADD CONSTRAINT scores_ibfk_1 FOREIGN KEY (student_id) REFERENCES students (student_id),
  ADD CONSTRAINT scores_ibfk_2 FOREIGN KEY (test_code) REFERENCES tests (test_code);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE students
  ADD CONSTRAINT n11 FOREIGN KEY (permission) REFERENCES permissions (permission),
  ADD CONSTRAINT n9 FOREIGN KEY (class_id) REFERENCES classes (class_id),
  ADD CONSTRAINT students_gender_id FOREIGN KEY (gender_id) REFERENCES genders (gender_id);

--
-- Các ràng buộc cho bảng `student_notifications`
--
ALTER TABLE student_notifications
  ADD CONSTRAINT student_notifications_ibfk_1 FOREIGN KEY (notification_id) REFERENCES notifications (notification_id),
  ADD CONSTRAINT student_notifications_ibfk_2 FOREIGN KEY (class_id) REFERENCES classes (class_id);

--
-- Các ràng buộc cho bảng `student_test_detail`
--
ALTER TABLE student_test_detail
  ADD CONSTRAINT fk4 FOREIGN KEY (test_code) REFERENCES tests (test_code),
  ADD CONSTRAINT fk6 FOREIGN KEY (question_id) REFERENCES questions (question_id),
  ADD CONSTRAINT fk9 FOREIGN KEY (student_id) REFERENCES students (student_id);

--
-- Các ràng buộc cho bảng `teachers`
--
ALTER TABLE teachers
  ADD CONSTRAINT n2 FOREIGN KEY (permission) REFERENCES permissions (permission),
  ADD CONSTRAINT teachers_gender_id FOREIGN KEY (gender_id) REFERENCES genders (gender_id);

--
-- Các ràng buộc cho bảng `teacher_notifications`
--
ALTER TABLE teacher_notifications
  ADD CONSTRAINT teacher_notifications_ibfk_1 FOREIGN KEY (notification_id) REFERENCES notifications (notification_id),
  ADD CONSTRAINT teacher_notifications_ibfk_2 FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id);

--
-- Các ràng buộc cho bảng `tests`
--
ALTER TABLE tests
  ADD CONSTRAINT fk1 FOREIGN KEY (subject_id) REFERENCES subjects (subject_id),
  ADD CONSTRAINT fk2 FOREIGN KEY (status_id) REFERENCES statuses (status_id),
  ADD CONSTRAINT tests_ibfk_1 FOREIGN KEY (grade_id) REFERENCES grades (grade_id);
  COMMIT;