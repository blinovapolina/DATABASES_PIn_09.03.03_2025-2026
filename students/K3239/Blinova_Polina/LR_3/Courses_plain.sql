--
-- PostgreSQL database dump
--

\restrict wjxB085Z7stWno8V3fg2zMwwmGpeZQTs74NIyvokTW2HC5tl75wq3ab5qAMUbT9

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-30 00:10:02 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16389)
-- Name: courses_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA courses_schema;


ALTER SCHEMA courses_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16417)
-- Name: assessment; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.assessment (
    assessment_id bigint CONSTRAINT "Assessment_assessment_id_not_null" NOT NULL,
    type text CONSTRAINT "Assessment_type_not_null" NOT NULL,
    min_score integer CONSTRAINT "Assessment_min_score_not_null" NOT NULL,
    max_score integer CONSTRAINT "Assessment_max_score_not_null" NOT NULL,
    address text CONSTRAINT "Assessment_address_not_null" NOT NULL,
    exam_date time with time zone CONSTRAINT "Assessment_exam_date_not_null" NOT NULL,
    CONSTRAINT chk_assessment_max_score CHECK ((max_score <= 100)),
    CONSTRAINT chk_assessment_min_score CHECK ((min_score >= 0)),
    CONSTRAINT chk_assessment_scores_range CHECK ((min_score <= max_score)),
    CONSTRAINT chk_assessment_type CHECK ((type = ANY (ARRAY['Экзамен'::text, 'Зачет'::text, 'Дифференцированный зачет'::text])))
);


ALTER TABLE courses_schema.assessment OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16416)
-- Name: Assessment_assessment_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Assessment_assessment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Assessment_assessment_id_seq" OWNER TO postgres;

--
-- TOC entry 4053 (class 0 OID 0)
-- Dependencies: 224
-- Name: Assessment_assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Assessment_assessment_id_seq" OWNED BY courses_schema.assessment.assessment_id;


--
-- TOC entry 243 (class 1259 OID 16567)
-- Name: completion_document; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.completion_document (
    completion_doc_id bigint CONSTRAINT "CompletionDocument_completion_doc_id_not_null" NOT NULL,
    document_type text CONSTRAINT "CompletionDocument_document_type_not_null" NOT NULL,
    issue_date date CONSTRAINT "CompletionDocument_issue_date_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "CompletionDocument_individual_id_not_null" NOT NULL,
    program_id bigint CONSTRAINT "CompletionDocument_program_id_not_null" NOT NULL,
    CONSTRAINT chk_cdoc_type_len CHECK ((length(document_type) <= 20)),
    CONSTRAINT chk_cdoc_type_values CHECK ((document_type = ANY (ARRAY['Сертификат'::text, 'Удостоверение'::text, 'Диплом'::text])))
);


ALTER TABLE courses_schema.completion_document OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16566)
-- Name: CompletionDocument_completion_doc_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."CompletionDocument_completion_doc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."CompletionDocument_completion_doc_id_seq" OWNER TO postgres;

--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 242
-- Name: CompletionDocument_completion_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."CompletionDocument_completion_doc_id_seq" OWNED BY courses_schema.completion_document.completion_doc_id;


--
-- TOC entry 237 (class 1259 OID 16524)
-- Name: contact; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.contact (
    contact_id bigint CONSTRAINT "Contact_contact_id_not_null" NOT NULL,
    email text CONSTRAINT "Contact_email_not_null" NOT NULL,
    phone text CONSTRAINT "Contact_phone_not_null" NOT NULL,
    is_current text CONSTRAINT "Contact_is_current_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "Contact_individual_id_not_null" NOT NULL,
    CONSTRAINT chk_contact_current_len CHECK ((length(is_current) <= 20)),
    CONSTRAINT chk_contact_email_len CHECK ((length(email) <= 50)),
    CONSTRAINT chk_contact_phone_len CHECK ((length(phone) <= 20))
);


ALTER TABLE courses_schema.contact OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16523)
-- Name: Contact_contact_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Contact_contact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Contact_contact_id_seq" OWNER TO postgres;

--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 236
-- Name: Contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Contact_contact_id_seq" OWNED BY courses_schema.contact.contact_id;


--
-- TOC entry 241 (class 1259 OID 16554)
-- Name: education_document; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.education_document (
    education_doc_id bigint CONSTRAINT "EducationDocument_education_doc_id_not_null" NOT NULL,
    document_type text CONSTRAINT "EducationDocument_document_type_not_null" NOT NULL,
    issue_date date CONSTRAINT "EducationDocument_issue_date_not_null" NOT NULL,
    teacher_id bigint CONSTRAINT "EducationDocument_teacher_id_not_null" NOT NULL,
    CONSTRAINT chk_edoc_type_len CHECK ((length(document_type) <= 20))
);


ALTER TABLE courses_schema.education_document OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16553)
-- Name: EducationDocument_education_doc_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."EducationDocument_education_doc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."EducationDocument_education_doc_id_seq" OWNER TO postgres;

--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 240
-- Name: EducationDocument_education_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."EducationDocument_education_doc_id_seq" OWNED BY courses_schema.education_document.education_doc_id;


--
-- TOC entry 229 (class 1259 OID 16454)
-- Name: education_program; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.education_program (
    program_id bigint CONSTRAINT "EducationProgram_program_id_not_null" NOT NULL,
    name text CONSTRAINT "EducationProgram_name_not_null" NOT NULL,
    program_type text CONSTRAINT "EducationProgram_program_type_not_null" NOT NULL,
    total_hours integer CONSTRAINT "EducationProgram_total_hours_not_null" NOT NULL,
    document_type text CONSTRAINT "EducationProgram_document_type_not_null" NOT NULL,
    CONSTRAINT chk_document_type CHECK ((document_type = ANY (ARRAY['Сертификат'::text, 'Удостоверение'::text, 'Диплом'::text]))),
    CONSTRAINT chk_program_hours CHECK ((total_hours > 0)),
    CONSTRAINT chk_program_name_len CHECK ((length(name) <= 100)),
    CONSTRAINT chk_program_type_len CHECK ((length(program_type) <= 100))
);


ALTER TABLE courses_schema.education_program OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16453)
-- Name: EducationProgram_program_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."EducationProgram_program_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."EducationProgram_program_id_seq" OWNER TO postgres;

--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 228
-- Name: EducationProgram_program_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."EducationProgram_program_id_seq" OWNED BY courses_schema.education_program.program_id;


--
-- TOC entry 233 (class 1259 OID 16489)
-- Name: group_db; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.group_db (
    group_id bigint CONSTRAINT "Group_group_id_not_null" NOT NULL,
    group_number integer CONSTRAINT "Group_group_number_not_null" NOT NULL,
    start_date timestamp with time zone CONSTRAINT "Group_start_date_not_null" NOT NULL,
    end_date timestamp with time zone CONSTRAINT "Group_end_date_not_null" NOT NULL,
    program_id bigint CONSTRAINT "Group_program_id_not_null" NOT NULL,
    CONSTRAINT chk_group_dates CHECK ((end_date >= start_date)),
    CONSTRAINT chk_group_number CHECK ((group_number < 10))
);


ALTER TABLE courses_schema.group_db OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16488)
-- Name: Group_group_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Group_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Group_group_id_seq" OWNER TO postgres;

--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 232
-- Name: Group_group_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Group_group_id_seq" OWNED BY courses_schema.group_db.group_id;


--
-- TOC entry 221 (class 1259 OID 16391)
-- Name: individual; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.individual (
    individual_id bigint CONSTRAINT "Individual_individual_id_not_null" NOT NULL,
    full_name text CONSTRAINT "Individual_full_name_not_null" NOT NULL,
    CONSTRAINT chk_individual_full_name_len CHECK ((length(full_name) <= 150))
);


ALTER TABLE courses_schema.individual OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: Individual_individual_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Individual_individual_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Individual_individual_id_seq" OWNER TO postgres;

--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 220
-- Name: Individual_individual_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Individual_individual_id_seq" OWNED BY courses_schema.individual.individual_id;


--
-- TOC entry 249 (class 1259 OID 16655)
-- Name: lesson; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.lesson (
    lesson_id bigint CONSTRAINT "Lesson_lesson_id_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "Lesson_individual_id_not_null" NOT NULL,
    group_id bigint CONSTRAINT "Lesson_group_id_not_null" NOT NULL,
    subject_id bigint CONSTRAINT "Lesson_subject_id_not_null" NOT NULL,
    teacher_id bigint CONSTRAINT "Lesson_teacher_id_not_null" NOT NULL,
    room_id bigint CONSTRAINT "Lesson_room_id_not_null" NOT NULL,
    lesson_datetime timestamp with time zone CONSTRAINT "Lesson_lesson_datetime_not_null" NOT NULL,
    pair_number integer CONSTRAINT "Lesson_pair_number_not_null" NOT NULL,
    semester text CONSTRAINT "Lesson_semester_not_null" NOT NULL,
    attendance_status text CONSTRAINT "Lesson_attendance_status_not_null" NOT NULL,
    grade integer,
    lesson_type text CONSTRAINT "Lesson_lesson_type_not_null" NOT NULL,
    CONSTRAINT chk_lesson_attendance_len CHECK ((length(attendance_status) <= 30)),
    CONSTRAINT chk_lesson_grade CHECK (((grade >= 0) AND (grade <= 100))),
    CONSTRAINT chk_lesson_pair CHECK (((pair_number >= 1) AND (pair_number <= 10))),
    CONSTRAINT chk_lesson_semester_len CHECK ((length(semester) <= 30)),
    CONSTRAINT chk_lesson_type CHECK ((lesson_type = ANY (ARRAY['Лекция'::text, 'Практика'::text, 'Лаборатория'::text, 'Консультация'::text, 'Экзамен'::text])))
);


ALTER TABLE courses_schema.lesson OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16654)
-- Name: Lesson_lesson_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Lesson_lesson_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Lesson_lesson_id_seq" OWNER TO postgres;

--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 248
-- Name: Lesson_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Lesson_lesson_id_seq" OWNED BY courses_schema.lesson.lesson_id;


--
-- TOC entry 235 (class 1259 OID 16502)
-- Name: passport; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.passport (
    passport_id bigint CONSTRAINT "Passport_passport_id_not_null" NOT NULL,
    series integer CONSTRAINT "Passport_series_not_null" NOT NULL,
    number integer CONSTRAINT "Passport_number_not_null" NOT NULL,
    issued_by text CONSTRAINT "Passport_issued_by_not_null" NOT NULL,
    birth_date date CONSTRAINT "Passport_birth_date_not_null" NOT NULL,
    place_of_birth text CONSTRAINT "Passport_place_of_birth_not_null" NOT NULL,
    issue_date date CONSTRAINT "Passport_issue_date_not_null" NOT NULL,
    expiry_date date CONSTRAINT "Passport_expiry_date_not_null" NOT NULL,
    is_current text CONSTRAINT "Passport_is_current_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "Passport_individual_id_not_null" NOT NULL,
    CONSTRAINT chk_is_current_len CHECK ((length(is_current) <= 20)),
    CONSTRAINT chk_passport_dates CHECK ((issue_date <= expiry_date)),
    CONSTRAINT chk_passport_number CHECK ((number > 0)),
    CONSTRAINT chk_passport_series CHECK ((series > 0))
);


ALTER TABLE courses_schema.passport OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16501)
-- Name: Passport_passport_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Passport_passport_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Passport_passport_id_seq" OWNER TO postgres;

--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 234
-- Name: Passport_passport_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Passport_passport_id_seq" OWNED BY courses_schema.passport.passport_id;


--
-- TOC entry 223 (class 1259 OID 16403)
-- Name: qualification; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.qualification (
    qualification_id bigint CONSTRAINT "Qualification_qualification_id_not_null" NOT NULL,
    name text CONSTRAINT "Qualification_name_not_null" NOT NULL
);


ALTER TABLE courses_schema.qualification OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16402)
-- Name: Qualification_qualification_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Qualification_qualification_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Qualification_qualification_id_seq" OWNER TO postgres;

--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 222
-- Name: Qualification_qualification_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Qualification_qualification_id_seq" OWNED BY courses_schema.qualification.qualification_id;


--
-- TOC entry 231 (class 1259 OID 16472)
-- Name: room; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.room (
    room_id bigint CONSTRAINT "Room_room_id_not_null" NOT NULL,
    room_number text CONSTRAINT "Room_room_number_not_null" NOT NULL,
    room_type text CONSTRAINT "Room_room_type_not_null" NOT NULL,
    address text CONSTRAINT "Room_address_not_null" NOT NULL,
    capacity integer CONSTRAINT "Room_capacity_not_null" NOT NULL
);


ALTER TABLE courses_schema.room OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16471)
-- Name: Room_room_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Room_room_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Room_room_id_seq" OWNER TO postgres;

--
-- TOC entry 4063 (class 0 OID 0)
-- Dependencies: 230
-- Name: Room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Room_room_id_seq" OWNED BY courses_schema.room.room_id;


--
-- TOC entry 227 (class 1259 OID 16438)
-- Name: subject; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.subject (
    subject_id bigint CONSTRAINT "Subject_subject_id_not_null" NOT NULL,
    name text CONSTRAINT "Subject_name_not_null" NOT NULL,
    hours integer CONSTRAINT "Subject_hours_not_null" NOT NULL,
    assessment_id bigint CONSTRAINT "Subject_assessment_id_not_null" NOT NULL,
    CONSTRAINT chk_subject_hours CHECK ((hours > 0)),
    CONSTRAINT chk_subject_name_len CHECK ((length(name) <= 100))
);


ALTER TABLE courses_schema.subject OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16437)
-- Name: Subject_subject_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Subject_subject_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Subject_subject_id_seq" OWNER TO postgres;

--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 226
-- Name: Subject_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Subject_subject_id_seq" OWNED BY courses_schema.subject.subject_id;


--
-- TOC entry 239 (class 1259 OID 16540)
-- Name: teacher; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.teacher (
    teacher_id bigint CONSTRAINT "Teacher_teacher_id_not_null" NOT NULL,
    salary numeric(10,2) CONSTRAINT "Teacher_salary_not_null" NOT NULL,
    employment_status text CONSTRAINT "Teacher_employment_status_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "Teacher_individual_id_not_null" NOT NULL,
    qualification_id bigint CONSTRAINT "Teacher_qualification_id_not_null" NOT NULL,
    CONSTRAINT chk_teacher_salary CHECK ((salary >= (0)::numeric)),
    CONSTRAINT chk_teacher_status_len CHECK ((length(employment_status) <= 20))
);


ALTER TABLE courses_schema.teacher OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16539)
-- Name: Teacher_teacher_id_seq; Type: SEQUENCE; Schema: courses_schema; Owner: postgres
--

CREATE SEQUENCE courses_schema."Teacher_teacher_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE courses_schema."Teacher_teacher_id_seq" OWNER TO postgres;

--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 238
-- Name: Teacher_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: courses_schema; Owner: postgres
--

ALTER SEQUENCE courses_schema."Teacher_teacher_id_seq" OWNED BY courses_schema.teacher.teacher_id;


--
-- TOC entry 247 (class 1259 OID 16635)
-- Name: assessment_result; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.assessment_result (
    result_id bigint CONSTRAINT "AssessmentResult_result_id_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "AssessmentResult_individual_id_not_null" NOT NULL,
    assessment_id bigint CONSTRAINT "AssessmentResult_assessment_id_not_null" NOT NULL,
    teacher_id bigint CONSTRAINT "AssessmentResult_teacher_id_not_null" NOT NULL,
    attempt_number integer CONSTRAINT "AssessmentResult_attempt_number_not_null" NOT NULL,
    exam_date timestamp with time zone CONSTRAINT "AssessmentResult_exam_date_not_null" NOT NULL,
    score integer,
    status text CONSTRAINT "AssessmentResult_status_not_null" NOT NULL,
    CONSTRAINT chk_ar_attempt CHECK ((attempt_number > 0)),
    CONSTRAINT chk_ar_score CHECK ((score > 0)),
    CONSTRAINT chk_ar_status_len CHECK ((length(status) <= 50))
);


ALTER TABLE courses_schema.assessment_result OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16607)
-- Name: group_enrollment; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.group_enrollment (
    enrollment_id bigint CONSTRAINT "GroupEnrollmen_enrollment_id_not_null" NOT NULL,
    individual_id bigint CONSTRAINT "GroupEnrollmen_individual_id_not_null" NOT NULL,
    group_id bigint CONSTRAINT "GroupEnrollmen_group_id_not_null" NOT NULL,
    academic_year text CONSTRAINT "GroupEnrollmen_academic_year_not_null" NOT NULL,
    CONSTRAINT chk_academic_year_len CHECK ((length(academic_year) <= 10))
);


ALTER TABLE courses_schema.group_enrollment OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16589)
-- Name: program_subject; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.program_subject (
    program_subject_id bigint CONSTRAINT "ProgramSubject_program_subject_id_not_null" NOT NULL,
    program_id bigint CONSTRAINT "ProgramSubject_program_id_not_null" NOT NULL,
    subject_id bigint CONSTRAINT "ProgramSubject_subject_id_not_null" NOT NULL,
    hours_in_program integer CONSTRAINT "ProgramSubject_hours_in_program_not_null" NOT NULL,
    semester integer CONSTRAINT "ProgramSubject_semester_not_null" NOT NULL,
    control_form text,
    CONSTRAINT chk_ps_hours CHECK ((hours_in_program > 0))
);


ALTER TABLE courses_schema.program_subject OWNER TO postgres;

--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE program_subject; Type: COMMENT; Schema: courses_schema; Owner: postgres
--

COMMENT ON TABLE courses_schema.program_subject IS 'Включение_в_программу';


--
-- TOC entry 246 (class 1259 OID 16621)
-- Name: teacher_competence; Type: TABLE; Schema: courses_schema; Owner: postgres
--

CREATE TABLE courses_schema.teacher_competence (
    competence_id bigint CONSTRAINT "TeacherCompetence_competence_id_not_null" NOT NULL,
    teacher_id bigint CONSTRAINT "TeacherCompetence_teacher_id_not_null" NOT NULL,
    subject_id bigint CONSTRAINT "TeacherCompetence_subject_id_not_null" NOT NULL,
    diploma_info text CONSTRAINT "TeacherCompetence_diploma_info_not_null" NOT NULL,
    CONSTRAINT chk_diploma_info_len CHECK ((length(diploma_info) <= 100))
);


ALTER TABLE courses_schema.teacher_competence OWNER TO postgres;

--
-- TOC entry 3749 (class 2604 OID 16420)
-- Name: assessment assessment_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment ALTER COLUMN assessment_id SET DEFAULT nextval('courses_schema."Assessment_assessment_id_seq"'::regclass);


--
-- TOC entry 3758 (class 2604 OID 16570)
-- Name: completion_document completion_doc_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.completion_document ALTER COLUMN completion_doc_id SET DEFAULT nextval('courses_schema."CompletionDocument_completion_doc_id_seq"'::regclass);


--
-- TOC entry 3755 (class 2604 OID 16527)
-- Name: contact contact_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.contact ALTER COLUMN contact_id SET DEFAULT nextval('courses_schema."Contact_contact_id_seq"'::regclass);


--
-- TOC entry 3757 (class 2604 OID 16557)
-- Name: education_document education_doc_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.education_document ALTER COLUMN education_doc_id SET DEFAULT nextval('courses_schema."EducationDocument_education_doc_id_seq"'::regclass);


--
-- TOC entry 3751 (class 2604 OID 16457)
-- Name: education_program program_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.education_program ALTER COLUMN program_id SET DEFAULT nextval('courses_schema."EducationProgram_program_id_seq"'::regclass);


--
-- TOC entry 3753 (class 2604 OID 16492)
-- Name: group_db group_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_db ALTER COLUMN group_id SET DEFAULT nextval('courses_schema."Group_group_id_seq"'::regclass);


--
-- TOC entry 3747 (class 2604 OID 16394)
-- Name: individual individual_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.individual ALTER COLUMN individual_id SET DEFAULT nextval('courses_schema."Individual_individual_id_seq"'::regclass);


--
-- TOC entry 3759 (class 2604 OID 16658)
-- Name: lesson lesson_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson ALTER COLUMN lesson_id SET DEFAULT nextval('courses_schema."Lesson_lesson_id_seq"'::regclass);


--
-- TOC entry 3754 (class 2604 OID 16505)
-- Name: passport passport_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.passport ALTER COLUMN passport_id SET DEFAULT nextval('courses_schema."Passport_passport_id_seq"'::regclass);


--
-- TOC entry 3748 (class 2604 OID 16406)
-- Name: qualification qualification_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.qualification ALTER COLUMN qualification_id SET DEFAULT nextval('courses_schema."Qualification_qualification_id_seq"'::regclass);


--
-- TOC entry 3752 (class 2604 OID 16475)
-- Name: room room_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.room ALTER COLUMN room_id SET DEFAULT nextval('courses_schema."Room_room_id_seq"'::regclass);


--
-- TOC entry 3750 (class 2604 OID 16441)
-- Name: subject subject_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.subject ALTER COLUMN subject_id SET DEFAULT nextval('courses_schema."Subject_subject_id_seq"'::regclass);


--
-- TOC entry 3756 (class 2604 OID 16543)
-- Name: teacher teacher_id; Type: DEFAULT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher ALTER COLUMN teacher_id SET DEFAULT nextval('courses_schema."Teacher_teacher_id_seq"'::regclass);


--
-- TOC entry 4023 (class 0 OID 16417)
-- Dependencies: 225
-- Data for Name: assessment; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.assessment VALUES (1, 'Экзамен', 0, 100, 'г. Санкт-Петербург, Кронверкский пр., д.49', '10:00:00+03');
INSERT INTO courses_schema.assessment VALUES (2, 'Зачет', 0, 60, 'г. Санкт-Петербург, Кронверкский пр., д.49', '12:00:00+03');
INSERT INTO courses_schema.assessment VALUES (3, 'Дифференцированный зачет', 0, 100, 'г. Санкт-Петербург, Кронверкский пр., д.49', '14:00:00+03');


--
-- TOC entry 4045 (class 0 OID 16635)
-- Dependencies: 247
-- Data for Name: assessment_result; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.assessment_result VALUES (1, 1, 1, 1, 1, '2025-12-20 10:00:00+03', 5, 'Сдано');
INSERT INTO courses_schema.assessment_result VALUES (2, 1, 1, 1, 2, '2025-12-22 10:00:00+03', 4, 'Сдано');


--
-- TOC entry 4041 (class 0 OID 16567)
-- Dependencies: 243
-- Data for Name: completion_document; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.completion_document VALUES (1, 'Диплом', '2026-07-01', 1, 1);
INSERT INTO courses_schema.completion_document VALUES (2, 'Удостоверение', '2026-04-01', 2, 2);


--
-- TOC entry 4035 (class 0 OID 16524)
-- Dependencies: 237
-- Data for Name: contact; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.contact VALUES (1, 'ivanov_spb@mail.ru', '+79111234567', 'Да', 1);
INSERT INTO courses_schema.contact VALUES (2, 'petrova_spb@mail.ru', '+79117654321', 'Да', 2);
INSERT INTO courses_schema.contact VALUES (3, 'smirnov_spb@mail.ru', '+79115554433', 'Да', 3);


--
-- TOC entry 4039 (class 0 OID 16554)
-- Dependencies: 241
-- Data for Name: education_document; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.education_document VALUES (1, 'Диплом', '2012-06-30', 1);
INSERT INTO courses_schema.education_document VALUES (2, 'Диплом', '2015-06-30', 2);


--
-- TOC entry 4027 (class 0 OID 16454)
-- Dependencies: 229
-- Data for Name: education_program; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.education_program VALUES (1, 'Data Science (ИТМО)', 'Профессиональная переподготовка', 520, 'Диплом');
INSERT INTO courses_schema.education_program VALUES (2, 'Веб-разработка (ИТМО)', 'Повышение квалификации', 260, 'Удостоверение');


--
-- TOC entry 4031 (class 0 OID 16489)
-- Dependencies: 233
-- Data for Name: group_db; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.group_db VALUES (1, 1, '2025-09-01 00:00:00+03', '2026-06-30 00:00:00+03', 1);
INSERT INTO courses_schema.group_db VALUES (2, 2, '2025-10-01 00:00:00+03', '2026-03-30 00:00:00+03', 2);


--
-- TOC entry 4043 (class 0 OID 16607)
-- Dependencies: 245
-- Data for Name: group_enrollment; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.group_enrollment VALUES (1, 1, 1, '2025/2026');
INSERT INTO courses_schema.group_enrollment VALUES (2, 2, 1, '2025/2026');
INSERT INTO courses_schema.group_enrollment VALUES (3, 5, 2, '2025/2026');


--
-- TOC entry 4019 (class 0 OID 16391)
-- Dependencies: 221
-- Data for Name: individual; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.individual VALUES (1, 'Иванов Кирилл Андреевич');
INSERT INTO courses_schema.individual VALUES (2, 'Петрова Дарья Максимовна');
INSERT INTO courses_schema.individual VALUES (3, 'Смирнов Никита Олегович');
INSERT INTO courses_schema.individual VALUES (4, 'Кузнецова Алина Сергеевна');
INSERT INTO courses_schema.individual VALUES (5, 'Васильев Артём Игоревич');
INSERT INTO courses_schema.individual VALUES (6, 'Попова Екатерина Дмитриевна');


--
-- TOC entry 4047 (class 0 OID 16655)
-- Dependencies: 249
-- Data for Name: lesson; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.lesson VALUES (1, 1, 1, 1, 1, 1, '2025-09-03 10:00:00+03', 1, 'Осень 2025', 'Присутствовал', 5, 'Лекция');
INSERT INTO courses_schema.lesson VALUES (2, 2, 1, 2, 1, 2, '2025-09-04 12:00:00+03', 2, 'Осень 2025', 'Присутствовал', 4, 'Лекция');


--
-- TOC entry 4033 (class 0 OID 16502)
-- Dependencies: 235
-- Data for Name: passport; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.passport VALUES (1, 4010, 123456, 'ГУ МВД по г. Санкт-Петербургу', '2000-04-12', 'г. Санкт-Петербург', '2020-05-01', '2030-05-01', 'Да', 1);
INSERT INTO courses_schema.passport VALUES (2, 4011, 654321, 'ГУ МВД по г. Санкт-Петербургу', '2001-07-20', 'г. Санкт-Петербург', '2021-08-15', '2031-08-15', 'Да', 2);
INSERT INTO courses_schema.passport VALUES (3, 4012, 111222, 'ГУ МВД по г. Москве', '1999-11-30', 'г. Москва', '2019-12-01', '2029-12-01', 'Да', 3);
INSERT INTO courses_schema.passport VALUES (4, 4013, 333444, 'ГУ МВД по г. Санкт-Петербургу', '2002-01-15', 'г. Санкт-Петербург', '2022-02-01', '2032-02-01', 'Да', 4);


--
-- TOC entry 4042 (class 0 OID 16589)
-- Dependencies: 244
-- Data for Name: program_subject; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.program_subject VALUES (1, 1, 1, 120, 1, 'Экзамен');
INSERT INTO courses_schema.program_subject VALUES (2, 1, 2, 180, 1, 'Экзамен');
INSERT INTO courses_schema.program_subject VALUES (3, 1, 3, 200, 2, 'Экзамен');
INSERT INTO courses_schema.program_subject VALUES (4, 2, 5, 140, 1, 'Зачет');


--
-- TOC entry 4021 (class 0 OID 16403)
-- Dependencies: 223
-- Data for Name: qualification; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.qualification VALUES (1, 'Кандидат технических наук');
INSERT INTO courses_schema.qualification VALUES (2, 'Доцент');
INSERT INTO courses_schema.qualification VALUES (3, 'Профессор');
INSERT INTO courses_schema.qualification VALUES (4, 'Старший преподаватель');


--
-- TOC entry 4029 (class 0 OID 16472)
-- Dependencies: 231
-- Data for Name: room; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.room VALUES (1, 'А-101', 'Лекционная', 'г. Санкт-Петербург, Кронверкский пр., д.49', 80);
INSERT INTO courses_schema.room VALUES (2, 'Б-202', 'Компьютерный класс', 'г. Санкт-Петербург, Кронверкский пр., д.49', 30);
INSERT INTO courses_schema.room VALUES (3, 'В-303', 'Лаборатория', 'г. Санкт-Петербург, ул. Ломоносова, д.9', 25);


--
-- TOC entry 4025 (class 0 OID 16438)
-- Dependencies: 227
-- Data for Name: subject; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.subject VALUES (1, 'Базы данных', 120, 1);
INSERT INTO courses_schema.subject VALUES (2, 'Python программирование', 180, 1);
INSERT INTO courses_schema.subject VALUES (3, 'Машинное обучение', 200, 1);
INSERT INTO courses_schema.subject VALUES (4, 'Компьютерные сети', 100, 2);
INSERT INTO courses_schema.subject VALUES (5, 'Веб-технологии', 140, 3);


--
-- TOC entry 4037 (class 0 OID 16540)
-- Dependencies: 239
-- Data for Name: teacher; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.teacher VALUES (1, 120000.00, 'Постоянный', 3, 3);
INSERT INTO courses_schema.teacher VALUES (2, 90000.00, 'Постоянный', 4, 2);
INSERT INTO courses_schema.teacher VALUES (3, 75000.00, 'Совместитель', 6, 1);


--
-- TOC entry 4044 (class 0 OID 16621)
-- Dependencies: 246
-- Data for Name: teacher_competence; Type: TABLE DATA; Schema: courses_schema; Owner: postgres
--

INSERT INTO courses_schema.teacher_competence VALUES (1, 1, 1, 'ИТМО, кафедра ИС');
INSERT INTO courses_schema.teacher_competence VALUES (2, 1, 3, 'ML специализация');
INSERT INTO courses_schema.teacher_competence VALUES (3, 2, 5, 'Frontend разработка');
INSERT INTO courses_schema.teacher_competence VALUES (4, 3, 4, 'Сети и телеком');


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 224
-- Name: Assessment_assessment_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Assessment_assessment_id_seq"', 1, false);


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 242
-- Name: CompletionDocument_completion_doc_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."CompletionDocument_completion_doc_id_seq"', 1, false);


--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 236
-- Name: Contact_contact_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Contact_contact_id_seq"', 1, false);


--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 240
-- Name: EducationDocument_education_doc_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."EducationDocument_education_doc_id_seq"', 1, false);


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 228
-- Name: EducationProgram_program_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."EducationProgram_program_id_seq"', 1, false);


--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 232
-- Name: Group_group_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Group_group_id_seq"', 1, false);


--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 220
-- Name: Individual_individual_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Individual_individual_id_seq"', 1, false);


--
-- TOC entry 4074 (class 0 OID 0)
-- Dependencies: 248
-- Name: Lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Lesson_lesson_id_seq"', 1, false);


--
-- TOC entry 4075 (class 0 OID 0)
-- Dependencies: 234
-- Name: Passport_passport_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Passport_passport_id_seq"', 1, false);


--
-- TOC entry 4076 (class 0 OID 0)
-- Dependencies: 222
-- Name: Qualification_qualification_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Qualification_qualification_id_seq"', 1, false);


--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 230
-- Name: Room_room_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Room_room_id_seq"', 1, false);


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 226
-- Name: Subject_subject_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Subject_subject_id_seq"', 1, false);


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 238
-- Name: Teacher_teacher_id_seq; Type: SEQUENCE SET; Schema: courses_schema; Owner: postgres
--

SELECT pg_catalog.setval('courses_schema."Teacher_teacher_id_seq"', 1, false);


--
-- TOC entry 3841 (class 2606 OID 16651)
-- Name: assessment_result AssessmentResult_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment_result
    ADD CONSTRAINT "AssessmentResult_pkey" PRIMARY KEY (result_id);


--
-- TOC entry 3807 (class 2606 OID 16436)
-- Name: assessment Assessment_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment
    ADD CONSTRAINT "Assessment_pkey" PRIMARY KEY (assessment_id);


--
-- TOC entry 3827 (class 2606 OID 16579)
-- Name: completion_document CompletionDocument_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.completion_document
    ADD CONSTRAINT "CompletionDocument_pkey" PRIMARY KEY (completion_doc_id);


--
-- TOC entry 3821 (class 2606 OID 16538)
-- Name: contact Contact_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.contact
    ADD CONSTRAINT "Contact_pkey" PRIMARY KEY (contact_id);


--
-- TOC entry 3825 (class 2606 OID 16565)
-- Name: education_document EducationDocument_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.education_document
    ADD CONSTRAINT "EducationDocument_pkey" PRIMARY KEY (education_doc_id);


--
-- TOC entry 3813 (class 2606 OID 16470)
-- Name: education_program EducationProgram_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.education_program
    ADD CONSTRAINT "EducationProgram_pkey" PRIMARY KEY (program_id);


--
-- TOC entry 3833 (class 2606 OID 16618)
-- Name: group_enrollment GroupEnrollmen_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_enrollment
    ADD CONSTRAINT "GroupEnrollmen_pkey" PRIMARY KEY (enrollment_id);


--
-- TOC entry 3817 (class 2606 OID 16500)
-- Name: group_db Group_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_db
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (group_id);


--
-- TOC entry 3801 (class 2606 OID 16401)
-- Name: individual Individual_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.individual
    ADD CONSTRAINT "Individual_pkey" PRIMARY KEY (individual_id);


--
-- TOC entry 3845 (class 2606 OID 16678)
-- Name: lesson Lesson_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY (lesson_id);


--
-- TOC entry 3819 (class 2606 OID 16522)
-- Name: passport Passport_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.passport
    ADD CONSTRAINT "Passport_pkey" PRIMARY KEY (passport_id);


--
-- TOC entry 3829 (class 2606 OID 16601)
-- Name: program_subject ProgramSubject_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.program_subject
    ADD CONSTRAINT "ProgramSubject_pkey" PRIMARY KEY (program_subject_id);


--
-- TOC entry 3803 (class 2606 OID 16412)
-- Name: qualification Qualification_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.qualification
    ADD CONSTRAINT "Qualification_pkey" PRIMARY KEY (qualification_id);


--
-- TOC entry 3815 (class 2606 OID 16484)
-- Name: room Room_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.room
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (room_id);


--
-- TOC entry 3809 (class 2606 OID 16450)
-- Name: subject Subject_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.subject
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (subject_id);


--
-- TOC entry 3837 (class 2606 OID 16632)
-- Name: teacher_competence TeacherCompetence_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher_competence
    ADD CONSTRAINT "TeacherCompetence_pkey" PRIMARY KEY (competence_id);


--
-- TOC entry 3823 (class 2606 OID 16552)
-- Name: teacher Teacher_pkey; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY (teacher_id);


--
-- TOC entry 3761 (class 2606 OID 16415)
-- Name: qualification chk_qualification_name_len; Type: CHECK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE courses_schema.qualification
    ADD CONSTRAINT chk_qualification_name_len CHECK ((length(name) <= 100)) NOT VALID;


--
-- TOC entry 3772 (class 2606 OID 16487)
-- Name: room chk_room_address_len; Type: CHECK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE courses_schema.room
    ADD CONSTRAINT chk_room_address_len CHECK ((length(address) <= 100)) NOT VALID;


--
-- TOC entry 3773 (class 2606 OID 16485)
-- Name: room chk_room_capacity; Type: CHECK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE courses_schema.room
    ADD CONSTRAINT chk_room_capacity CHECK ((capacity > 0)) NOT VALID;


--
-- TOC entry 3774 (class 2606 OID 16486)
-- Name: room chk_room_type_len; Type: CHECK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE courses_schema.room
    ADD CONSTRAINT chk_room_type_len CHECK ((length(room_type) <= 20)) NOT VALID;


--
-- TOC entry 3843 (class 2606 OID 16653)
-- Name: assessment_result uq_assessment_result; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment_result
    ADD CONSTRAINT uq_assessment_result UNIQUE (individual_id, assessment_id, attempt_number);


--
-- TOC entry 3835 (class 2606 OID 16620)
-- Name: group_enrollment uq_group_enrollment; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_enrollment
    ADD CONSTRAINT uq_group_enrollment UNIQUE (individual_id, group_id);


--
-- TOC entry 3847 (class 2606 OID 16680)
-- Name: lesson uq_lesson; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT uq_lesson UNIQUE (group_id, subject_id, lesson_datetime, pair_number);


--
-- TOC entry 3831 (class 2606 OID 16603)
-- Name: program_subject uq_program_subject; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.program_subject
    ADD CONSTRAINT uq_program_subject UNIQUE (program_id, subject_id);


--
-- TOC entry 3805 (class 2606 OID 16414)
-- Name: qualification uq_qualification_name; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.qualification
    ADD CONSTRAINT uq_qualification_name UNIQUE (name);


--
-- TOC entry 3811 (class 2606 OID 16452)
-- Name: subject uq_subject_name; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.subject
    ADD CONSTRAINT uq_subject_name UNIQUE (name);


--
-- TOC entry 3839 (class 2606 OID 16634)
-- Name: teacher_competence uq_teacher_competence; Type: CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher_competence
    ADD CONSTRAINT uq_teacher_competence UNIQUE (teacher_id, subject_id);


--
-- TOC entry 3863 (class 2606 OID 16762)
-- Name: assessment_result fk_ar_assessment; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment_result
    ADD CONSTRAINT fk_ar_assessment FOREIGN KEY (assessment_id) REFERENCES courses_schema.assessment(assessment_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3864 (class 2606 OID 16757)
-- Name: assessment_result fk_ar_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment_result
    ADD CONSTRAINT fk_ar_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3865 (class 2606 OID 16767)
-- Name: assessment_result fk_ar_teacher; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.assessment_result
    ADD CONSTRAINT fk_ar_teacher FOREIGN KEY (teacher_id) REFERENCES courses_schema.teacher(teacher_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3855 (class 2606 OID 16712)
-- Name: completion_document fk_cdoc_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.completion_document
    ADD CONSTRAINT fk_cdoc_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3856 (class 2606 OID 16717)
-- Name: completion_document fk_cdoc_program; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.completion_document
    ADD CONSTRAINT fk_cdoc_program FOREIGN KEY (program_id) REFERENCES courses_schema.education_program(program_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3851 (class 2606 OID 16702)
-- Name: contact fk_contact_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.contact
    ADD CONSTRAINT fk_contact_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3854 (class 2606 OID 16707)
-- Name: education_document fk_education_teacher; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.education_document
    ADD CONSTRAINT fk_education_teacher FOREIGN KEY (teacher_id) REFERENCES courses_schema.teacher(teacher_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3859 (class 2606 OID 16742)
-- Name: group_enrollment fk_ge_group; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_enrollment
    ADD CONSTRAINT fk_ge_group FOREIGN KEY (group_id) REFERENCES courses_schema.group_db(group_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3860 (class 2606 OID 16737)
-- Name: group_enrollment fk_ge_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_enrollment
    ADD CONSTRAINT fk_ge_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3849 (class 2606 OID 16722)
-- Name: group_db fk_group_program; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.group_db
    ADD CONSTRAINT fk_group_program FOREIGN KEY (program_id) REFERENCES courses_schema.education_program(program_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3866 (class 2606 OID 16777)
-- Name: lesson fk_lesson_group; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT fk_lesson_group FOREIGN KEY (group_id) REFERENCES courses_schema.group_db(group_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3867 (class 2606 OID 16772)
-- Name: lesson fk_lesson_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT fk_lesson_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3868 (class 2606 OID 16792)
-- Name: lesson fk_lesson_room; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT fk_lesson_room FOREIGN KEY (room_id) REFERENCES courses_schema.room(room_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3869 (class 2606 OID 16782)
-- Name: lesson fk_lesson_subject; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT fk_lesson_subject FOREIGN KEY (subject_id) REFERENCES courses_schema.subject(subject_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3870 (class 2606 OID 16787)
-- Name: lesson fk_lesson_teacher; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.lesson
    ADD CONSTRAINT fk_lesson_teacher FOREIGN KEY (teacher_id) REFERENCES courses_schema.teacher(teacher_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3850 (class 2606 OID 16697)
-- Name: passport fk_passport_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.passport
    ADD CONSTRAINT fk_passport_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3857 (class 2606 OID 16727)
-- Name: program_subject fk_ps_program; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.program_subject
    ADD CONSTRAINT fk_ps_program FOREIGN KEY (program_id) REFERENCES courses_schema.education_program(program_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3858 (class 2606 OID 16732)
-- Name: program_subject fk_ps_subject; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.program_subject
    ADD CONSTRAINT fk_ps_subject FOREIGN KEY (subject_id) REFERENCES courses_schema.subject(subject_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3848 (class 2606 OID 16681)
-- Name: subject fk_subject_assessment; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.subject
    ADD CONSTRAINT fk_subject_assessment FOREIGN KEY (assessment_id) REFERENCES courses_schema.assessment(assessment_id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3861 (class 2606 OID 16752)
-- Name: teacher_competence fk_tc_subject; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher_competence
    ADD CONSTRAINT fk_tc_subject FOREIGN KEY (subject_id) REFERENCES courses_schema.subject(subject_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3862 (class 2606 OID 16747)
-- Name: teacher_competence fk_tc_teacher; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher_competence
    ADD CONSTRAINT fk_tc_teacher FOREIGN KEY (teacher_id) REFERENCES courses_schema.teacher(teacher_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3852 (class 2606 OID 16687)
-- Name: teacher fk_teacher_individual; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher
    ADD CONSTRAINT fk_teacher_individual FOREIGN KEY (individual_id) REFERENCES courses_schema.individual(individual_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3853 (class 2606 OID 16692)
-- Name: teacher fk_teacher_qualification; Type: FK CONSTRAINT; Schema: courses_schema; Owner: postgres
--

ALTER TABLE ONLY courses_schema.teacher
    ADD CONSTRAINT fk_teacher_qualification FOREIGN KEY (qualification_id) REFERENCES courses_schema.qualification(qualification_id) ON DELETE RESTRICT NOT VALID;


-- Completed on 2026-03-30 00:10:02 MSK

--
-- PostgreSQL database dump complete
--

\unrestrict wjxB085Z7stWno8V3fg2zMwwmGpeZQTs74NIyvokTW2HC5tl75wq3ab5qAMUbT9

