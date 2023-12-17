-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 17, 2023 lúc 12:32 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Introduction to Programming', 'Learn the basics of programming.', '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 'Web Development Fundamentals', 'Explore the essentials of web development.', '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 'Data Science for Beginners', 'Introduction to data science concepts.', '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 'Graphic Design Basics', 'Learn the fundamentals of graphic design.', '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 'English Literature 101', 'An introductory course to English literature.', '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_user`
--

CREATE TABLE `course_user` (
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course_user`
--

INSERT INTO `course_user` (`course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 2, '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 3, '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 4, '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 5, '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Introduction to Programming Basics', '/lessons/intro_programming.pdf', '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 2, 'HTML Fundamentals', '/lessons/html_fundamentals.pdf', '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 3, 'Introduction to Data Science', '/lessons/intro_data_science.pdf', '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 4, 'Color Theory in Design', '/lessons/color_theory.pdf', '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 5, 'Shakespearean Literature', '/lessons/shakespeare.pdf', '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `materials`
--

INSERT INTO `materials` (`id`, `lesson_id`, `title`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Programming Basics Slides', '/materials/programming_basics_slides.pdf', '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 2, 'HTML Cheat Sheet', '/materials/html_cheat_sheet.pdf', '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 3, 'Data Science Workbook', '/materials/data_science_workbook.pdf', '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 4, 'Color Theory Examples', '/materials/color_theory_examples.pdf', '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 5, 'Shakespearean Sonnets', '/materials/shakespeare_sonnets.pdf', '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `options` text NOT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `question_id`, `options`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 1, 'A. Memory location; B. Constant value; C. Data type', 1, '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 2, 'A. HyperText Markup Language; B. High-Level Text Management Language; C. HyperTransfer Markup Language', 1, '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 3, 'A. Data analysis; B. Data preprocessing; C. Data visualization', 2, '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 4, 'A. It doesn; B. It adds complexity; C. It influences perception and user experience', 1, '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 5, 'A. Hamlet; B. Macbeth; C. Othello', 1, '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question`, `created_at`, `updated_at`) VALUES
(1, 1, 'What is a variable?', '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 2, 'What does HTML stand for?', '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 3, 'What is the purpose of data preprocessing?', '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 4, 'How does color impact design?', '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 5, 'Which play is known for the line \"To be or not to be\"?', '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quizzes`
--

INSERT INTO `quizzes` (`id`, `lesson_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'Programming Basics Quiz', '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 2, 'HTML Fundamentals Quiz', '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 3, 'Data Science Concepts Quiz', '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 4, 'Design Principles Quiz', '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 5, 'Shakespearean Literature Quiz', '2023-01-04 17:00:00', '2023-01-04 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john@example.com', 'password123', '2022-12-31 17:00:00', '2022-12-31 17:00:00'),
(2, 'Jane Smith', 'jane@example.com', 'pass456', '2023-01-01 17:00:00', '2023-01-01 17:00:00'),
(3, 'Alice Johnson', 'alice@example.com', 'secure789', '2023-01-02 17:00:00', '2023-01-02 17:00:00'),
(4, 'Bob Williams', 'bob@example.com', 'myPass123', '2023-01-03 17:00:00', '2023-01-03 17:00:00'),
(5, 'Eva Davis', 'eva@example.com', 'strongPass', '2023-01-04 17:00:00', '2023-01-04 17:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`course_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Chỉ mục cho bảng `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Chỉ mục cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Các ràng buộc cho bảng `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Các ràng buộc cho bảng `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Các ràng buộc cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
