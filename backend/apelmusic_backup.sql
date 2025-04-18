--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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
-- Name: apelmusic; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA apelmusic;


ALTER SCHEMA apelmusic OWNER TO postgres;

--
-- Name: nursecounseling; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA nursecounseling;


ALTER SCHEMA nursecounseling OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.categories (
    id_category integer NOT NULL,
    nama_category character varying(50) NOT NULL,
    image_category text,
    cover_category text,
    profesi_category character varying(50),
    deskripsi_category text
);


ALTER TABLE apelmusic.categories OWNER TO postgres;

--
-- Name: categories_id_category_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.categories_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.categories_id_category_seq OWNER TO postgres;

--
-- Name: categories_id_category_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.categories_id_category_seq OWNED BY apelmusic.categories.id_category;


--
-- Name: courses; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.courses (
    id_course integer NOT NULL,
    fk_id_category integer,
    nama_course character varying(255) NOT NULL,
    harga numeric NOT NULL,
    image_course text,
    favorit boolean DEFAULT false,
    deskripsi_course text
);


ALTER TABLE apelmusic.courses OWNER TO postgres;

--
-- Name: courses_id_course_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.courses_id_course_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.courses_id_course_seq OWNER TO postgres;

--
-- Name: courses_id_course_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.courses_id_course_seq OWNED BY apelmusic.courses.id_course;


--
-- Name: courseuser; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.courseuser (
    id_course_user integer NOT NULL,
    fk_id_course integer,
    fk_id_user integer,
    waktu date,
    checked boolean DEFAULT false,
    status character varying(50)
);


ALTER TABLE apelmusic.courseuser OWNER TO postgres;

--
-- Name: courseuser_id_course_user_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.courseuser_id_course_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.courseuser_id_course_user_seq OWNER TO postgres;

--
-- Name: courseuser_id_course_user_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.courseuser_id_course_user_seq OWNED BY apelmusic.courseuser.id_course_user;


--
-- Name: detailinvoice; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.detailinvoice (
    id_detail integer NOT NULL,
    fk_id_invoice integer NOT NULL,
    fk_id_course_user integer,
    harga integer NOT NULL,
    nama_course character varying(255),
    nama_category character varying(50),
    waktu character varying(100)
);


ALTER TABLE apelmusic.detailinvoice OWNER TO postgres;

--
-- Name: detailinvoice_id_detail_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.detailinvoice_id_detail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.detailinvoice_id_detail_seq OWNER TO postgres;

--
-- Name: detailinvoice_id_detail_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.detailinvoice_id_detail_seq OWNED BY apelmusic.detailinvoice.id_detail;


--
-- Name: invoice; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.invoice (
    id_invoice integer NOT NULL,
    fk_id_user integer,
    fk_id_payment_method integer,
    no_invoice integer,
    tgl_invoice character varying(100) NOT NULL,
    total_harga integer
);


ALTER TABLE apelmusic.invoice OWNER TO postgres;

--
-- Name: invoice_id_invoice_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.invoice_id_invoice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.invoice_id_invoice_seq OWNER TO postgres;

--
-- Name: invoice_id_invoice_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.invoice_id_invoice_seq OWNED BY apelmusic.invoice.id_invoice;


--
-- Name: paymentmethod; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.paymentmethod (
    id_payment_method integer NOT NULL,
    nama character varying(50) NOT NULL,
    logo text,
    status integer DEFAULT 1
);


ALTER TABLE apelmusic.paymentmethod OWNER TO postgres;

--
-- Name: paymentmethod_id_payment_method_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.paymentmethod_id_payment_method_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.paymentmethod_id_payment_method_seq OWNER TO postgres;

--
-- Name: paymentmethod_id_payment_method_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.paymentmethod_id_payment_method_seq OWNED BY apelmusic.paymentmethod.id_payment_method;


--
-- Name: token; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic.token (
    id_token integer NOT NULL,
    token text NOT NULL,
    expire_date timestamp without time zone,
    usage_type character varying(50),
    email character varying(100)
);


ALTER TABLE apelmusic.token OWNER TO postgres;

--
-- Name: token_id_token_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.token_id_token_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.token_id_token_seq OWNER TO postgres;

--
-- Name: token_id_token_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.token_id_token_seq OWNED BY apelmusic.token.id_token;


--
-- Name: user; Type: TABLE; Schema: apelmusic; Owner: postgres
--

CREATE TABLE apelmusic."user" (
    id_user integer NOT NULL,
    nama_user character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    role character varying(20),
    status boolean DEFAULT false,
    isreset integer DEFAULT 0,
    password_hash bytea,
    password_salt bytea
);


ALTER TABLE apelmusic."user" OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: apelmusic; Owner: postgres
--

CREATE SEQUENCE apelmusic.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE apelmusic.user_id_user_seq OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: apelmusic; Owner: postgres
--

ALTER SEQUENCE apelmusic.user_id_user_seq OWNED BY apelmusic."user".id_user;


--
-- Name: AspNetRoleClaims; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling."AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "RoleId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE nursecounseling."AspNetRoleClaims" OWNER TO postgres;

--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling."AspNetRoleClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling."AspNetRoleClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AspNetUserClaims; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling."AspNetUserClaims" (
    "Id" integer NOT NULL,
    "UserId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE nursecounseling."AspNetUserClaims" OWNER TO postgres;

--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling."AspNetUserClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling."AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AspNetUserLogins; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling."AspNetUserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE nursecounseling."AspNetUserLogins" OWNER TO postgres;

--
-- Name: AspNetUserRoles; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling."AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE nursecounseling."AspNetUserRoles" OWNER TO postgres;

--
-- Name: AspNetUserTokens; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling."AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


ALTER TABLE nursecounseling."AspNetUserTokens" OWNER TO postgres;

--
-- Name: CustomRoles; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling."CustomRoles" (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL
);


ALTER TABLE nursecounseling."CustomRoles" OWNER TO postgres;

--
-- Name: CustomRoles_id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling."CustomRoles" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling."CustomRoles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: department; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling.department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL
);


ALTER TABLE nursecounseling.department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling.department ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: level_reference; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling.level_reference (
    id integer NOT NULL,
    level character varying(10) NOT NULL,
    next_level character varying(10) NOT NULL,
    required_time_in_month integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL
);


ALTER TABLE nursecounseling.level_reference OWNER TO postgres;

--
-- Name: level_reference_id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling.level_reference ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling.level_reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: login_history; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling.login_history (
    "Id" integer NOT NULL,
    "LoginTime" timestamp without time zone NOT NULL,
    "LogoutTime" timestamp without time zone,
    "IpAddress" text NOT NULL,
    "DeviceInfo" text NOT NULL,
    "Status" text NOT NULL,
    "UserId" text NOT NULL
);


ALTER TABLE nursecounseling.login_history OWNER TO postgres;

--
-- Name: login_history_Id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling.login_history ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling."login_history_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling.refresh_tokens (
    "Id" integer NOT NULL,
    "Token" text NOT NULL,
    "ExpiryDate" timestamp without time zone NOT NULL,
    "IsRevoked" boolean NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "UserId" text NOT NULL
);


ALTER TABLE nursecounseling.refresh_tokens OWNER TO postgres;

--
-- Name: refresh_tokens_Id_seq; Type: SEQUENCE; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE nursecounseling.refresh_tokens ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME nursecounseling."refresh_tokens_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling.roles (
    "Id" text NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);


ALTER TABLE nursecounseling.roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: nursecounseling; Owner: postgres
--

CREATE TABLE nursecounseling.users (
    "Id" text NOT NULL,
    "FirstName" text,
    "LastName" text,
    "Phone" text,
    "ProfilePicture" bytea,
    "IsLogin" boolean NOT NULL,
    "CreatedAt" timestamp without time zone NOT NULL,
    "UpdatedAt" timestamp without time zone NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL
);


ALTER TABLE nursecounseling.users OWNER TO postgres;

--
-- Name: auditlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditlog (
    id bigint NOT NULL,
    action_type character varying(20) NOT NULL,
    table_name character varying(100) NOT NULL,
    record_id integer NOT NULL,
    old_value text NOT NULL,
    new_value text NOT NULL,
    ip_address character varying(100) NOT NULL,
    "timestamp" time without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.auditlog OWNER TO postgres;

--
-- Name: AuditLog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auditlog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AuditLog_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counseling_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counseling_result (
    id bigint NOT NULL,
    nurse_feedback text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    consultation_id bigint NOT NULL,
    nurse_id bigint
);


ALTER TABLE public.counseling_result OWNER TO postgres;

--
-- Name: Consultation_Result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.counseling_result ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Consultation_Result_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counseling_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counseling_type (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);


ALTER TABLE public.counseling_type OWNER TO postgres;

--
-- Name: Consultation_Type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.counseling_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Consultation_Type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: level_upgrade_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_upgrade_status (
    id bigint NOT NULL,
    status_name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.level_upgrade_status OWNER TO postgres;

--
-- Name: Level_Upgrade_Status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.level_upgrade_status ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Level_Upgrade_Status_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: loginhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loginhistory (
    id bigint NOT NULL,
    login_time timestamp with time zone NOT NULL,
    logout_time timestamp with time zone NOT NULL,
    ip_address character varying(100) NOT NULL,
    device_info character varying(100) NOT NULL,
    status character varying(100) NOT NULL,
    user_id bigint
);


ALTER TABLE public.loginhistory OWNER TO postgres;

--
-- Name: LoginHistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.loginhistory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."LoginHistory_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.management (
    id bigint NOT NULL,
    management_account_id character varying(50) NOT NULL,
    "position" character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    department_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.management OWNER TO postgres;

--
-- Name: Management_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.management ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Management_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse (
    id bigint NOT NULL,
    nurse_account_id character varying(50) NOT NULL,
    hire_date date NOT NULL,
    level_upgrade_date date,
    specialization character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    current_level_id bigint,
    department_id bigint,
    user_id bigint NOT NULL,
    years_of_service integer,
    current_level_start_date date
);


ALTER TABLE public.nurse OWNER TO postgres;

--
-- Name: Nurse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Nurse_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: level_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_history (
    id bigint NOT NULL,
    from_level_id bigint,
    to_level_id bigint,
    change_date date NOT NULL,
    years_of_service integer NOT NULL,
    nurse_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    status_id bigint,
    notes text
);


ALTER TABLE public.level_history OWNER TO postgres;

--
-- Name: core_levelhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.level_history ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_levelhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id bigint NOT NULL,
    title character varying(200),
    file_path character varying(100) NOT NULL,
    size bigint,
    size_readable character varying(20),
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT core_materials_size_check CHECK ((size >= 0))
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: core_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.materials ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: system_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_configuration (
    id bigint NOT NULL,
    config_key character varying(50) NOT NULL,
    config_value text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.system_configuration OWNER TO postgres;

--
-- Name: core_systemconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.system_configuration ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_systemconfiguration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counseling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counseling (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    scheduled_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    material_description text,
    counseling_type_id bigint,
    management_id bigint,
    status_id bigint
);


ALTER TABLE public.counseling OWNER TO postgres;

--
-- Name: counseling_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.counseling ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.counseling_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counseling_material_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counseling_material_files (
    id bigint NOT NULL,
    counseling_id bigint NOT NULL,
    materials_id bigint NOT NULL
);


ALTER TABLE public.counseling_material_files OWNER TO postgres;

--
-- Name: counseling_material_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.counseling_material_files ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.counseling_material_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counseling_nurses_id; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counseling_nurses_id (
    id bigint NOT NULL,
    counseling_id bigint NOT NULL,
    nurse_id bigint NOT NULL
);


ALTER TABLE public.counseling_nurses_id OWNER TO postgres;

--
-- Name: counseling_nurses_id_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.counseling_nurses_id ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.counseling_nurses_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: counseling_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counseling_status (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);


ALTER TABLE public.counseling_status OWNER TO postgres;

--
-- Name: counseling_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.counseling_status ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.counseling_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.department ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_celery_beat_clockedschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_clockedschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_celery_beat_crontabschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_celery_beat_intervalschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_celery_beat_periodictask ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_celery_beat_solarschedule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_celery_beat_solarschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: level_reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_reference (
    id bigint NOT NULL,
    level character varying(10) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    next_level character varying(10),
    required_time_in_month integer
);


ALTER TABLE public.level_reference OWNER TO postgres;

--
-- Name: level_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.level_reference ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.level_reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);


ALTER TABLE public.token_blacklist_blacklistedtoken OWNER TO postgres;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.token_blacklist_blacklistedtoken ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.token_blacklist_blacklistedtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint,
    jti character varying(255) NOT NULL
);


ALTER TABLE public.token_blacklist_outstandingtoken OWNER TO postgres;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.token_blacklist_outstandingtoken ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.token_blacklist_outstandingtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    email_verified boolean NOT NULL,
    phone character varying(16) NOT NULL,
    is_login boolean NOT NULL,
    reset_password_token character varying(100),
    reset_password_expire timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    role_id bigint,
    profile_picture bytea
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_groups OWNER TO postgres;

--
-- Name: users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_permissions OWNER TO postgres;

--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: categories id_category; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.categories ALTER COLUMN id_category SET DEFAULT nextval('apelmusic.categories_id_category_seq'::regclass);


--
-- Name: courses id_course; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.courses ALTER COLUMN id_course SET DEFAULT nextval('apelmusic.courses_id_course_seq'::regclass);


--
-- Name: courseuser id_course_user; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.courseuser ALTER COLUMN id_course_user SET DEFAULT nextval('apelmusic.courseuser_id_course_user_seq'::regclass);


--
-- Name: detailinvoice id_detail; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.detailinvoice ALTER COLUMN id_detail SET DEFAULT nextval('apelmusic.detailinvoice_id_detail_seq'::regclass);


--
-- Name: invoice id_invoice; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.invoice ALTER COLUMN id_invoice SET DEFAULT nextval('apelmusic.invoice_id_invoice_seq'::regclass);


--
-- Name: paymentmethod id_payment_method; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.paymentmethod ALTER COLUMN id_payment_method SET DEFAULT nextval('apelmusic.paymentmethod_id_payment_method_seq'::regclass);


--
-- Name: token id_token; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.token ALTER COLUMN id_token SET DEFAULT nextval('apelmusic.token_id_token_seq'::regclass);


--
-- Name: user id_user; Type: DEFAULT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic."user" ALTER COLUMN id_user SET DEFAULT nextval('apelmusic.user_id_user_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.categories (id_category, nama_category, image_category, cover_category, profesi_category, deskripsi_category) FROM stdin;
1	Drum	https://images.pexels.com/photos/65717/pexels-photo-65717.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1	https://images.pexels.com/photos/65717/pexels-photo-65717.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1	Drummer	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
2	Piano	https://images.pexels.com/photos/164935/pexels-photo-164935.jpeg?auto=compress&cs=tinysrgb&w=400	https://images.pexels.com/photos/164935/pexels-photo-164935.jpeg?auto=compress&cs=tinysrgb&w=400	Pianis	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
3	Gitar	https://images.pexels.com/photos/459797/pexels-photo-459797.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1	https://images.pexels.com/photos/459797/pexels-photo-459797.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1	Gitaris	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
4	Bass	https://images.pexels.com/photos/3807838/pexels-photo-3807838.jpeg?auto=compress&cs=tinysrgb&w=400	https://images.pexels.com/photos/3807838/pexels-photo-3807838.jpeg?auto=compress&cs=tinysrgb&w=400	Bassist	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
5	Biola	https://images.pexels.com/photos/3120109/pexels-photo-3120109.jpeg?auto=compress&cs=tinysrgb&w=400	https://images.pexels.com/photos/3120109/pexels-photo-3120109.jpeg?auto=compress&cs=tinysrgb&w=400	Violinis	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
6	Menyanyi	https://images.pexels.com/photos/164829/pexels-photo-164829.jpeg?auto=compress&cs=tinysrgb&w=400	https://images.pexels.com/photos/164829/pexels-photo-164829.jpeg?auto=compress&cs=tinysrgb&w=400	Singer	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
7	Flute	https://images.pexels.com/photos/2254140/pexels-photo-2254140.jpeg?auto=compress&cs=tinysrgb&w=400	https://images.pexels.com/photos/2254140/pexels-photo-2254140.jpeg?auto=compress&cs=tinysrgb&w=400	Flutis	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
8	Saxophone	https://images.pexels.com/photos/45243/saxophone-music-gold-gloss-45243.jpeg?auto=compress&cs=tinysrgb&w=400	https://images.pexels.com/photos/45243/saxophone-music-gold-gloss-45243.jpeg?auto=compress&cs=tinysrgb&w=400	Saksofonis	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.courses (id_course, fk_id_category, nama_course, harga, image_course, favorit, deskripsi_course) FROM stdin;
1	1	Kursus Drummer Special Coach (Eno Netral)	8500000	https://images.pexels.com/photos/995301/pexels-photo-995301.jpeg?auto=compress&cs=tinysrgb&w=400	t	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
2	1	Expert Level Drummer Lessons	5450000	https://images.pexels.com/photos/542553/pexels-photo-542553.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
3	1	From Zero to Professional Drummer (Complit Package)	13000000	https://images.pexels.com/photos/237464/pexels-photo-237464.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
4	1	Drummer for Kids (Level Basic/1)	2200000	https://images.pexels.com/photos/9643921/pexels-photo-9643921.jpeg?auto=compress&cs=tinysrgb&w=400	t	Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores culpa dolorum vel autem repellat quidem omnis repudiandae dolore ab dicta minima obcaecati id tenetur, voluptates repellendus mollitia minus! Sequi dicta itaque libero aliquid. Voluptas alias, quia autem amet dolores facere saepe magni adipisci at? Exercitationem sunt quos id nulla maxime reprehenderit, atque ipsam rerum repellat quae eligendi facilis, distinctio mollitia quis harum consequatur doloribus culpa laborum est quia, similique neque! Placeat, reprehenderit. Nisi ea aperiam adipisci! Porro, ducimus perspiciatis. Id, consectetur placeat molestiae dolores consequatur, sunt necessitatibus delectus, doloremque recusandae beatae cum ad ex! Est iure accusamus vitae. Dolore, a!
5	2	Kursus Piano:From Zero to Pro (Full Package)	11650000	https://images.pexels.com/photos/1246437/pexels-photo-1246437.jpeg?auto=compress&cs=tinysrgb&w=400	t	Lorem ipsum dolor sit amet consectetur adipisicing elit...
6	2	Memainkan Lagu Pop dengan Piano	2200000	https://images.pexels.com/photos/2378209/pexels-photo-2378209.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
7	2	Teknik dan Trik Piano untuk Menjadi Pemain Profesional	2200000	https://images.pexels.com/photos/1128440/pexels-photo-1128440.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
8	2	Cara Berkompois dengan Piano	2200000	https://images.pexels.com/photos/164790/pexels-photo-164790.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
9	3	[Beginner] Guitar class for kids	1600000	https://images.pexels.com/photos/290660/pexels-photo-290660.jpeg?auto=compress&cs=tinysrgb&w=400	t	Lorem ipsum dolor sit amet consectetur adipisicing elit...
10	3	Pemula Gitar: Belajar Dasar-dasar Gitar	1000000	https://images.pexels.com/photos/54133/pexels-photo-54133.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
32	8	Menciptakan Musik Sendiri dengan Saxophone	4000000	https://images.pexels.com/photos/2347916/pexels-photo-2347916.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
11	3	Lancar Main Gitar: Teknik dan Trik Bermain Gitar	1200000	https://images.pexels.com/photos/12544/pexels-photo-12544.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
12	3	Bermain Gitar untuk Menciptakan Musik Sendiri	2000000	https://images.pexels.com/photos/164697/pexels-photo-164697.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
13	4	Belajar Bass dari Nol	1890000	https://images.pexels.com/photos/243988/pexels-photo-243988.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
14	4	Teknik dan Trik Bass untuk Pemula	1200000	https://images.pexels.com/photos/811838/pexels-photo-811838.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
15	4	Menjadi Bassis Profesional: Cara Berkompois dengan Bass	1320000	https://images.pexels.com/photos/3536234/pexels-photo-3536234.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
16	4	Memainkan Genre Musik Berbeda dengan Bass	1000000	https://images.pexels.com/photos/3807093/pexels-photo-3807093.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
17	5	Biola Mid-Level Course	3000000	https://images.pexels.com/photos/210854/pexels-photo-210854.jpeg?auto=compress&cs=tinysrgb&w=400	t	Lorem ipsum dolor sit amet consectetur adipisicing elit...
18	5	Teknik dan Trik Bermain Biola	1200000	https://images.pexels.com/photos/462447/pexels-photo-462447.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
19	5	Memainkan Lagu-lagu Klasik dengan Biola	2300000	https://images.pexels.com/photos/963113/pexels-photo-963113.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
20	5	Menciptakan Musik Sendiri dengan Biola	4000000	https://images.pexels.com/photos/3120109/pexels-photo-3120109.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
21	6	Belajar Menyanyi dari Nol	2100000	https://images.pexels.com/photos/6270257/pexels-photo-6270257.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
22	6	Teknik dan Trik Menyanyi untuk Pemula	2200000	https://images.pexels.com/photos/6173807/pexels-photo-6173807.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
23	6	Menyanyi dengan Suara Merdu	3200000	https://images.pexels.com/photos/6270265/pexels-photo-6270265.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
24	6	Menciptakan Lagu Sendiri dengan Vokal	2100000	https://images.pexels.com/photos/167446/pexels-photo-167446.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
25	7	Belajar Bermain Flute untuk Pemula	3200000	https://images.pexels.com/photos/415627/pexels-photo-415627.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
26	7	Teknik dan Trik Bermain Flute	1200000	https://images.pexels.com/photos/258266/pexels-photo-258266.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
27	7	Memainkan Lagu-lagu Klasik dengan Flute	1100000	https://images.pexels.com/photos/3756043/pexels-photo-3756043.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
28	7	Menciptakan Musik Sendiri dengan Flute	2300000	https://images.pexels.com/photos/8192119/pexels-photo-8192119.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
29	8	Expert Level Saxophone	7350000	https://images.pexels.com/photos/733767/pexels-photo-733767.jpeg?auto=compress&cs=tinysrgb&w=400	t	Lorem ipsum dolor sit amet consectetur adipisicing elit...
30	8	Teknik dan Trik Bermain Saxophone	2200000	https://images.pexels.com/photos/359995/pexels-photo-359995.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
31	8	Memainkan Lagu-lagu Klasik dengan Saxophone	3000000	https://images.pexels.com/photos/1384605/pexels-photo-1384605.jpeg?auto=compress&cs=tinysrgb&w=400	f	Lorem ipsum dolor sit amet consectetur adipisicing elit...
\.


--
-- Data for Name: courseuser; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.courseuser (id_course_user, fk_id_course, fk_id_user, waktu, checked, status) FROM stdin;
1	1	1	2025-03-15	t	\N
2	5	1	2025-03-20	f	\N
3	17	1	2025-03-10	t	\N
4	4	2	2025-03-12	t	\N
5	9	2	2025-03-22	f	\N
6	29	2	2025-04-05	f	\N
7	3	3	2025-03-18	t	\N
8	10	3	2025-03-25	f	\N
9	23	3	2025-04-10	t	\N
14	4	10	2025-04-13	f	cart
15	3	10	2025-04-15	f	cart
16	17	10	2025-04-13	t	cart
\.


--
-- Data for Name: detailinvoice; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.detailinvoice (id_detail, fk_id_invoice, fk_id_course_user, harga, nama_course, nama_category, waktu) FROM stdin;
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.invoice (id_invoice, fk_id_user, fk_id_payment_method, no_invoice, tgl_invoice, total_harga) FROM stdin;
\.


--
-- Data for Name: paymentmethod; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.paymentmethod (id_payment_method, nama, logo, status) FROM stdin;
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic.token (id_token, token, expire_date, usage_type, email) FROM stdin;
1	80475c04-7ab9-4c1e-9d59-d8e1126bbe09	\N	register	firdauztri@gmail.com
2	bcaed82a-09fe-4c4f-8db9-30aae27ec54d	\N	register	firdauztri@gmail.com
3	32c7d796-f95d-4710-b199-5d2d95d3894a	\N	register	firdauztri@gmail.com
4	69625a11-a776-47f1-aaa0-edd1e4e879e0	\N	register	firdauztri@gmail.com
5	38689bbf-017b-4f5a-8ba9-e1aea9491058	\N	register	firdauztri@gmail.com
6	0236e186-d1b0-4b2e-afa1-28278f2e1a46	\N	register	firdauztri@gmail.com
7	98d687a6-e312-4307-9d50-2c0b4abf90f8	\N	register	firdauz.workspace@gmail.com
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: apelmusic; Owner: postgres
--

COPY apelmusic."user" (id_user, nama_user, email, role, status, isreset, password_hash, password_salt) FROM stdin;
1	Muhammad Hervian	mhervian0@gmail.com	admin	f	0	\N	\N
2	Firdauz Tri Anggoro	firdauz.anggoro@gmail.com	admin	f	0	\N	\N
3	Muhammad Rum	muhammadrum04@gmail.com	admin	f	0	\N	\N
10	Firdauz tri	firdauztri@gmail.com	peserta	t	0	\\x2d3d66447423d75f62423fa268a82347d3842bce575b4452fe2a2a60b95711c2b20e45961251a8b58afd71c02eb9fa18ba8cb051ad084b63f8e9deccf5f70529	\\x760b0f8d92931f8e54b37b0d3fa63116539408df2cf08c7e15b97d51fb4f0fe524f655b187f47bc7e127210ded94bd63d5cc604c1c19052bba2e252f23a6682398656e55554c330dc4324a47d1ae2a16f538bee4c5e0a697d987015ac72c3c25708cb175f35750b4e74b94a9a67783a409503852517c9b706162fe49d867034c
11	Admin	firdauz.workspace@gmail.com	peserta	t	0	\\x3c8d45d33277388e5159f3239dc49489973c2076ee0f99a33534dbd96ce68db1595f045e252f63beb0bed651d27e74bd2c2f7bc5117f1932fa6e3f6576cc484b	\\xb586b3251ec81161c0402223320e609921d6095fb04b57cff8ac2078735ebf222227e7b243344ade42678b80842f3225474e946562d645ae29e105aa227f8503cb15c35244b99cbafcb51005fe8720b6696b121226f332c1c9f68e9351c5dbe453fd70005732f144ed9e26a2c9950b89ce3288d383e6d0f6115c022009eaba9d
\.


--
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling."AspNetRoleClaims" ("Id", "RoleId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling."AspNetUserClaims" ("Id", "UserId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling."AspNetUserLogins" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
\.


--
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling."AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
\.


--
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling."AspNetUserTokens" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
\.


--
-- Data for Name: CustomRoles; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling."CustomRoles" (id, name, created_at, update_at) FROM stdin;
1	Admin	2025-04-02 18:51:25.775643	2025-04-02 18:51:25.775674
2	Management	2025-04-02 18:51:25.775702	2025-04-02 18:51:25.775702
3	Nurse	2025-04-02 18:51:25.775702	2025-04-02 18:51:25.775702
4	string	2025-04-03 10:33:50.684017	2025-04-03 10:33:50.684017
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling.department (id, name, created_at, update_at) FROM stdin;
1	ICU	2025-04-02 18:51:25.9423	2025-04-02 18:51:25.942387
\.


--
-- Data for Name: level_reference; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling.level_reference (id, level, next_level, required_time_in_month, created_at, update_at) FROM stdin;
1	1-A	1-B	12	2025-04-02 18:55:32.618821	2025-04-02 18:55:32.618852
2	1-B	2-A	24	2025-04-02 18:55:32.61888	2025-04-02 18:55:32.61888
3	2-A	2-B	36	2025-04-02 18:55:32.61888	2025-04-02 18:55:32.61888
4	2-B	3-A	48	2025-04-02 18:55:32.61888	2025-04-02 18:55:32.61888
5	3-A	3-B	60	2025-04-02 18:55:32.618881	2025-04-02 18:55:32.618881
\.


--
-- Data for Name: login_history; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling.login_history ("Id", "LoginTime", "LogoutTime", "IpAddress", "DeviceInfo", "Status", "UserId") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling.refresh_tokens ("Id", "Token", "ExpiryDate", "IsRevoked", "CreatedAt", "UserId") FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling.roles ("Id", "CreatedAt", "Name", "NormalizedName", "ConcurrencyStamp") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: nursecounseling; Owner: postgres
--

COPY nursecounseling.users ("Id", "FirstName", "LastName", "Phone", "ProfilePicture", "IsLogin", "CreatedAt", "UpdatedAt", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20250327172844_InitialCreate	9.0.3
20250401150516_initial-create	9.0.3
20250402184843_adding-reference	9.0.3
\.


--
-- Data for Name: auditlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditlog (id, action_type, table_name, record_id, old_value, new_value, ip_address, "timestamp", user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add blacklisted token	6	add_blacklistedtoken
22	Can change blacklisted token	6	change_blacklistedtoken
23	Can delete blacklisted token	6	delete_blacklistedtoken
24	Can view blacklisted token	6	view_blacklistedtoken
25	Can add outstanding token	7	add_outstandingtoken
26	Can change outstanding token	7	change_outstandingtoken
27	Can delete outstanding token	7	delete_outstandingtoken
28	Can view outstanding token	7	view_outstandingtoken
29	Can add consultations	8	add_consultations
30	Can change consultations	8	change_consultations
31	Can delete consultations	8	delete_consultations
32	Can view consultations	8	view_consultations
33	Can add consultation status	9	add_consultationstatus
34	Can change consultation status	9	change_consultationstatus
35	Can delete consultation status	9	delete_consultationstatus
36	Can view consultation status	9	view_consultationstatus
37	Can add consultation types	10	add_consultationtypes
38	Can change consultation types	10	change_consultationtypes
39	Can delete consultation types	10	delete_consultationtypes
40	Can view consultation types	10	view_consultationtypes
41	Can add department	11	add_department
42	Can change department	11	change_department
43	Can delete department	11	delete_department
44	Can view department	11	view_department
45	Can add level references	12	add_levelreferences
46	Can change level references	12	change_levelreferences
47	Can delete level references	12	delete_levelreferences
48	Can view level references	12	view_levelreferences
49	Can add level upgrade status	13	add_levelupgradestatus
50	Can change level upgrade status	13	change_levelupgradestatus
51	Can delete level upgrade status	13	delete_levelupgradestatus
52	Can view level upgrade status	13	view_levelupgradestatus
53	Can add roles	14	add_roles
54	Can change roles	14	change_roles
55	Can delete roles	14	delete_roles
56	Can view roles	14	view_roles
57	Can add system configuration	15	add_systemconfiguration
58	Can change system configuration	15	change_systemconfiguration
59	Can delete system configuration	15	delete_systemconfiguration
60	Can view system configuration	15	view_systemconfiguration
61	Can add user	16	add_user
62	Can change user	16	change_user
63	Can delete user	16	delete_user
64	Can view user	16	view_user
65	Can add audit log	17	add_auditlog
66	Can change audit log	17	change_auditlog
67	Can delete audit log	17	delete_auditlog
68	Can view audit log	17	view_auditlog
69	Can add consultation materials	18	add_consultationmaterials
70	Can change consultation materials	18	change_consultationmaterials
71	Can delete consultation materials	18	delete_consultationmaterials
72	Can view consultation materials	18	view_consultationmaterials
73	Can add login history	19	add_loginhistory
74	Can change login history	19	change_loginhistory
75	Can delete login history	19	delete_loginhistory
76	Can view login history	19	view_loginhistory
77	Can add management	20	add_management
78	Can change management	20	change_management
79	Can delete management	20	delete_management
80	Can view management	20	view_management
81	Can add notificaitons	21	add_notificaitons
82	Can change notificaitons	21	change_notificaitons
83	Can delete notificaitons	21	delete_notificaitons
84	Can view notificaitons	21	view_notificaitons
85	Can add nurse	22	add_nurse
86	Can change nurse	22	change_nurse
87	Can delete nurse	22	delete_nurse
88	Can view nurse	22	view_nurse
89	Can add material read status	23	add_materialreadstatus
90	Can change material read status	23	change_materialreadstatus
91	Can delete material read status	23	delete_materialreadstatus
92	Can view material read status	23	view_materialreadstatus
93	Can add level upgrade requests	24	add_levelupgraderequests
94	Can change level upgrade requests	24	change_levelupgraderequests
95	Can delete level upgrade requests	24	delete_levelupgraderequests
96	Can view level upgrade requests	24	view_levelupgraderequests
97	Can add consultation result	25	add_consultationresult
98	Can change consultation result	25	change_consultationresult
99	Can delete consultation result	25	delete_consultationresult
100	Can view consultation result	25	view_consultationresult
101	Can add level reference	12	add_levelreference
102	Can change level reference	12	change_levelreference
103	Can delete level reference	12	delete_levelreference
104	Can view level reference	12	view_levelreference
105	Can add level history	26	add_levelhistory
106	Can change level history	26	change_levelhistory
107	Can delete level history	26	delete_levelhistory
108	Can view level history	26	view_levelhistory
109	Can add materials	27	add_materials
110	Can change materials	27	change_materials
111	Can delete materials	27	delete_materials
112	Can view materials	27	view_materials
113	Can add counseling materials	18	add_counselingmaterials
114	Can change counseling materials	18	change_counselingmaterials
115	Can delete counseling materials	18	delete_counselingmaterials
116	Can view counseling materials	18	view_counselingmaterials
117	Can add counseling types	10	add_counselingtypes
118	Can change counseling types	10	change_counselingtypes
119	Can delete counseling types	10	delete_counselingtypes
120	Can view counseling types	10	view_counselingtypes
121	Can add counseling	28	add_counseling
122	Can change counseling	28	change_counseling
123	Can delete counseling	28	delete_counseling
124	Can view counseling	28	view_counseling
125	Can add counseling status	29	add_counselingstatus
126	Can change counseling status	29	change_counselingstatus
127	Can delete counseling status	29	delete_counselingstatus
128	Can view counseling status	29	view_counselingstatus
129	Can add counseling result	25	add_counselingresult
130	Can change counseling result	25	change_counselingresult
131	Can delete counseling result	25	delete_counselingresult
132	Can view counseling result	25	view_counselingresult
133	Can add crontab	30	add_crontabschedule
134	Can change crontab	30	change_crontabschedule
135	Can delete crontab	30	delete_crontabschedule
136	Can view crontab	30	view_crontabschedule
137	Can add interval	31	add_intervalschedule
138	Can change interval	31	change_intervalschedule
139	Can delete interval	31	delete_intervalschedule
140	Can view interval	31	view_intervalschedule
141	Can add periodic task	32	add_periodictask
142	Can change periodic task	32	change_periodictask
143	Can delete periodic task	32	delete_periodictask
144	Can view periodic task	32	view_periodictask
145	Can add periodic task track	33	add_periodictasks
146	Can change periodic task track	33	change_periodictasks
147	Can delete periodic task track	33	delete_periodictasks
148	Can view periodic task track	33	view_periodictasks
149	Can add solar event	34	add_solarschedule
150	Can change solar event	34	change_solarschedule
151	Can delete solar event	34	delete_solarschedule
152	Can view solar event	34	view_solarschedule
153	Can add clocked	35	add_clockedschedule
154	Can change clocked	35	change_clockedschedule
155	Can delete clocked	35	delete_clockedschedule
156	Can view clocked	35	view_clockedschedule
\.


--
-- Data for Name: counseling; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counseling (id, title, description, scheduled_date, created_at, updated_at, material_description, counseling_type_id, management_id, status_id) FROM stdin;
16	tet	setes	2025-02-23 17:24:06+07	2025-02-23 10:24:20.901429+07	2025-02-23 10:24:20.901429+07	eatae	7	2	3
24	eteate	tesdasdas	2025-02-24 22:30:47+07	2025-02-23 13:28:50.772337+07	2025-02-23 13:28:50.772337+07	sarwrwqdwq	6	2	1
25	test time	qwrqwrwqr	2025-02-25 12:00:00+07	2025-02-23 13:39:04.889538+07	2025-02-23 13:39:04.890539+07	tesdsad	6	2	1
18	teste	setsetes	2025-02-23 17:25:09+07	2025-02-23 10:25:59.289612+07	2025-02-23 15:17:28.279518+07	etest	6	2	1
19	testes	setest	2025-02-24 12:30:06+07	2025-02-23 10:41:36.349999+07	2025-02-23 15:23:31.683996+07	testse	6	2	1
26	test	asrawer	2025-02-23 15:23:31+07	2025-02-23 15:24:20.432695+07	2025-02-23 15:24:20.432695+07	aeteat	6	2	2
27	teasd	eatae	2025-02-23 15:24:59+07	2025-02-23 15:26:22.81832+07	2025-02-23 15:26:22.81832+07	aetea	6	2	1
30	counseling with first	3bulanan	2025-02-26 06:50:11+07	2025-02-24 23:20:32.815274+07	2025-02-24 23:20:32.815274+07		6	2	1
28	te	sad	2025-02-23 15:26:17+07	2025-02-23 15:28:14.872553+07	2025-02-25 00:39:08.157432+07	asfasf	6	2	1
29	testse	asdsad	2025-02-23 15:35:02+07	2025-02-23 15:37:03.214637+07	2025-02-25 00:42:07.71713+07	aeeafe	6	2	3
31	awrwqr	fafw	2025-02-22 00:11:27+07	2025-02-25 00:11:43.909909+07	2025-02-25 00:43:18.80987+07	afqfqw	6	2	3
23	test	desafas	2025-02-25 18:30:05+07	2025-02-23 13:27:52.458938+07	2025-02-25 03:09:43.971957+07		7	2	1
32	test counseling	test	2025-02-27 12:00:21+07	2025-02-25 03:09:10.876877+07	2025-02-25 03:10:13.352818+07	test	7	2	2
\.


--
-- Data for Name: counseling_material_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counseling_material_files (id, counseling_id, materials_id) FROM stdin;
50	23	80
51	24	81
52	24	82
54	26	84
55	29	85
56	30	86
57	31	87
58	32	88
\.


--
-- Data for Name: counseling_nurses_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counseling_nurses_id (id, counseling_id, nurse_id) FROM stdin;
40	16	10
56	23	4
59	28	3
61	28	8
62	28	9
63	28	10
64	28	12
65	29	8
66	29	5
68	30	2
69	30	4
70	31	2
71	31	4
72	32	2
73	32	4
\.


--
-- Data for Name: counseling_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counseling_result (id, nurse_feedback, created_at, updated_at, consultation_id, nurse_id) FROM stdin;
1	thanks	2025-02-25 00:31:05.479999+07	2025-02-25 00:31:05.479999+07	30	2
3	testting kimberly	2025-02-25 01:52:09.100668+07	2025-02-25 01:52:09.100668+07	31	4
2	thanks asd	2025-02-25 03:11:19.157384+07	2025-02-25 03:11:19.165387+07	31	2
\.


--
-- Data for Name: counseling_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counseling_status (id, name, description, created_at, update_at) FROM stdin;
1	Scheduled		2025-02-22 11:14:24.940975+07	2025-02-22 11:14:24.940975+07
2	In Progress		2025-02-22 11:14:42.571433+07	2025-02-22 11:14:42.571433+07
3	Completed		2025-02-22 11:14:46.795392+07	2025-02-22 11:14:46.795392+07
\.


--
-- Data for Name: counseling_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counseling_type (id, name, description, created_at, update_at) FROM stdin;
6	Regular Consultation	Routine professional development consultation	2025-01-26 14:11:19.462476+07	2025-01-26 14:11:19.462476+07
7	Violation Follow-up	Consultation to address professional conduct issues	2025-01-26 14:11:19.463494+07	2025-01-26 14:11:19.463494+07
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (id, name, created_at, update_at) FROM stdin;
15	Cardiology	2025-01-26 14:11:19.458488+07	2025-01-26 14:11:19.458488+07
16	Pediatrics	2025-01-26 14:11:19.458488+07	2025-01-26 14:11:19.458488+07
17	Emergency	2025-01-26 14:11:19.458488+07	2025-01-26 14:11:19.458488+07
18	Oncology	2025-01-26 14:11:19.459437+07	2025-01-26 14:11:19.459437+07
19	Neurology	2025-01-26 14:11:19.459437+07	2025-01-26 14:11:19.459437+07
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-01-29 01:14:33.93683+07	13	ON GOING	1	[{"added": {}}]	13	31
2	2025-01-29 01:14:41.727959+07	13	on going	2	[{"changed": {"fields": ["Status name"]}}]	13	31
3	2025-01-29 01:14:49.649598+07	13	On Going	2	[{"changed": {"fields": ["Status name"]}}]	13	31
4	2025-01-29 01:14:58.325047+07	13	Upcoming	2	[{"changed": {"fields": ["Status name"]}}]	13	31
5	2025-01-29 01:16:11.3343+07	20	1-A	1	[{"added": {}}]	12	31
6	2025-01-29 01:19:19.400293+07	1	LevelHistory object (1)	1	[{"added": {}}]	26	31
7	2025-01-29 01:35:54.036613+07	2	NURSE009 - Christopher Brown from 1-B to 2-A - Approved	1	[{"added": {}}]	26	31
8	2025-01-29 01:36:24.095227+07	3	NURSE009 - Christopher Brown from 2-A to 2-B - Approved	1	[{"added": {}}]	26	31
9	2025-01-29 01:38:47.487869+07	3	NURSE009 - Christopher Brown from 2-A to 2-B - Upcoming	2	[{"changed": {"fields": ["Status"]}}]	26	31
10	2025-01-29 01:45:01.544487+07	10	NURSE009 - Christopher Brown	2	[{"changed": {"fields": ["Years of service"]}}]	22	31
11	2025-01-29 15:27:16.089342+07	21	Material for Consultation 20	2	[{"changed": {"fields": ["File path"]}}]	18	31
132	2025-02-25 02:32:08.847201+07	34	admin12345 - Admin	1	[{"added": {}}]	16	33
133	2025-02-25 02:47:32.415362+07	34	admin12345 - Admin	2	[{"changed": {"fields": ["Last login", "Superuser status"]}}]	16	33
134	2025-02-25 02:51:58.011494+07	33	Admin123 - Admin	2	[{"changed": {"fields": ["Role"]}}]	16	33
135	2025-02-26 07:36:38.337465+07	1	every day	1	[{"added": {}}]	31	33
136	2025-02-26 07:37:59.892412+07	1	Check Nurse Level Upgrades: every day	1	[{"added": {}}]	32	33
137	2025-02-26 08:00:42.082252+07	45	test7 - Nurse	3		16	33
138	2025-02-26 08:03:58.430296+07	5	admin - Admin	3		16	33
139	2025-02-26 08:04:04.151479+07	44	test5 - Nurse	3		16	33
140	2025-02-26 08:04:08.639814+07	43	test4 - Nurse	3		16	33
141	2025-02-26 08:04:13.010302+07	42	test2 - Nurse	3		16	33
142	2025-02-26 08:04:17.231066+07	41	12345425 - Nurse	3		16	33
143	2025-02-26 08:04:21.219719+07	40	tseteasdasd - Nurse	3		16	33
144	2025-02-26 08:04:27.45777+07	39	tsete - Nurse	3		16	33
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
1	1	days
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
1	Check Nurse Level Upgrades	core.tasks.check_nurse_level_upgrades	[]	{}	\N	\N	\N	\N	t	\N	0	2025-02-26 07:37:59.88841+07		\N	1	\N	f	2025-02-26 00:00:00+07	\N	{}	\N	\N
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2025-02-26 07:37:59.889414+07
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	token_blacklist	blacklistedtoken
7	token_blacklist	outstandingtoken
8	core	consultations
9	core	consultationstatus
11	core	department
13	core	levelupgradestatus
14	core	roles
15	core	systemconfiguration
16	core	user
17	core	auditlog
19	core	loginhistory
20	core	management
21	core	notificaitons
22	core	nurse
23	core	materialreadstatus
24	core	levelupgraderequests
12	core	levelreference
26	core	levelhistory
27	core	materials
18	core	counselingmaterials
10	core	counselingtypes
28	core	counseling
29	core	counselingstatus
25	core	counselingresult
30	django_celery_beat	crontabschedule
31	django_celery_beat	intervalschedule
32	django_celery_beat	periodictask
33	django_celery_beat	periodictasks
34	django_celery_beat	solarschedule
35	django_celery_beat	clockedschedule
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-01-26 01:33:56.671093+07
2	contenttypes	0002_remove_content_type_name	2025-01-26 01:33:56.676096+07
3	auth	0001_initial	2025-01-26 01:33:56.701099+07
4	auth	0002_alter_permission_name_max_length	2025-01-26 01:33:56.705098+07
5	auth	0003_alter_user_email_max_length	2025-01-26 01:33:56.709103+07
6	auth	0004_alter_user_username_opts	2025-01-26 01:33:56.712621+07
7	auth	0005_alter_user_last_login_null	2025-01-26 01:33:56.716629+07
8	auth	0006_require_contenttypes_0002	2025-01-26 01:33:56.717621+07
9	auth	0007_alter_validators_add_error_messages	2025-01-26 01:33:56.721636+07
10	auth	0008_alter_user_username_max_length	2025-01-26 01:33:56.72562+07
11	auth	0009_alter_user_last_name_max_length	2025-01-26 01:33:56.729623+07
12	auth	0010_alter_group_name_max_length	2025-01-26 01:33:56.733622+07
13	auth	0011_update_proxy_permissions	2025-01-26 01:33:56.737621+07
14	auth	0012_alter_user_first_name_max_length	2025-01-26 01:33:56.742622+07
15	core	0001_initial	2025-01-26 01:33:56.928602+07
16	admin	0001_initial	2025-01-26 01:33:56.951602+07
17	admin	0002_logentry_remove_auto_add	2025-01-26 01:33:56.96061+07
18	admin	0003_logentry_add_action_flag_choices	2025-01-26 01:33:56.967601+07
19	sessions	0001_initial	2025-01-26 01:33:56.973602+07
20	token_blacklist	0001_initial	2025-01-26 01:33:57.01114+07
21	token_blacklist	0002_outstandingtoken_jti_hex	2025-01-26 01:33:57.020139+07
22	token_blacklist	0003_auto_20171017_2007	2025-01-26 01:33:57.038157+07
23	token_blacklist	0004_auto_20171017_2013	2025-01-26 01:33:57.051139+07
24	token_blacklist	0005_remove_outstandingtoken_jti	2025-01-26 01:33:57.062141+07
25	token_blacklist	0006_auto_20171017_2113	2025-01-26 01:33:57.073139+07
26	token_blacklist	0007_auto_20171017_2214	2025-01-26 01:33:57.106149+07
27	token_blacklist	0008_migrate_to_bigautofield	2025-01-26 01:33:57.147659+07
28	token_blacklist	0010_fix_migrate_to_bigautofield	2025-01-26 01:33:57.167664+07
29	token_blacklist	0011_linearizes_history	2025-01-26 01:33:57.16966+07
30	token_blacklist	0012_alter_outstandingtoken_user	2025-01-26 01:33:57.182658+07
31	core	0002_alter_auditlog_table_and_more	2025-01-26 12:28:02.076709+07
32	core	0003_rename_user_id_auditlog_user_and_more	2025-01-26 13:20:53.882544+07
33	core	0004_rename_user_id_nurse_user	2025-01-26 13:21:51.909396+07
34	core	0005_alter_consultations_table	2025-01-28 06:49:54.475772+07
35	core	0006_rename_user_id_management_user	2025-01-28 07:00:46.245301+07
36	core	0007_levelreferences_next_level	2025-01-28 12:26:14.451141+07
37	core	0008_alter_levelreferences_required_time	2025-01-28 13:28:53.566026+07
38	core	0009_rename_required_time_levelreferences_required_time_in_month	2025-01-28 13:28:53.573025+07
39	core	0010_rename_levelreferences_levelreference	2025-01-28 18:28:25.22+07
40	core	0011_alter_levelupgraderequests_request_date	2025-01-28 21:05:09.864287+07
41	core	0012_levelhistory	2025-01-28 22:48:56.052425+07
42	core	0013_alter_levelhistory_options_alter_levelhistory_table	2025-01-29 00:56:59.031128+07
43	core	0014_levelhistory_created_at_levelhistory_update_at	2025-01-29 00:59:42.483901+07
44	core	0015_levelhistory_status_alter_levelhistory_from_level_and_more	2025-01-29 01:13:30.937893+07
45	core	0016_alter_nurse_years_of_service	2025-01-29 02:09:33.904448+07
46	core	0017_materials_remove_consultationmaterials_file_path_and_more	2025-02-18 14:01:33.943815+07
47	core	0018_remove_consultationmaterials_file_and_more	2025-02-18 14:09:24.519267+07
48	core	0019_remove_consultationmaterials_title_and_more	2025-02-18 14:13:41.566184+07
49	core	0020_materials_size	2025-02-18 14:56:18.217154+07
50	core	0021_materials_size_readable	2025-02-18 20:43:04.045823+07
51	core	0022_alter_materials_title	2025-02-18 21:14:46.393817+07
52	core	0023_rename_consultation_consultationmaterials_counseling_and_more	2025-02-18 22:25:37.584238+07
53	core	0024_alter_consultationmaterials_table	2025-02-18 22:25:57.987452+07
54	core	0025_rename_consultationmaterials_counselingmaterials	2025-02-18 22:27:07.744874+07
55	core	0026_materials_created_at	2025-02-18 22:42:07.988119+07
56	core	0027_alter_materials_table	2025-02-18 22:43:24.970504+07
57	core	0028_alter_counselingmaterials_file_and_more	2025-02-22 10:48:36.435407+07
58	core	0029_alter_counselingtypes_table	2025-02-22 11:10:01.167982+07
59	core	0030_counselingstatus_alter_counseling_status_and_more	2025-02-22 11:13:35.034195+07
60	core	0031_rename_consultationresult_counselingresult_and_more	2025-02-22 11:15:53.313302+07
61	core	0032_rename_department_department_name	2025-02-23 21:00:24.377471+07
62	core	0033_rename_role_name_roles_name	2025-02-23 21:03:24.953175+07
63	core	0034_remove_nurse_profile_picture_user_profile_picture	2025-02-23 23:52:32.557037+07
64	core	0035_alter_nurse_level_upgrade_date	2025-02-24 00:26:13.363477+07
65	core	0036_delete_levelupgraderequests	2025-02-26 04:43:41.119165+07
66	core	0037_remove_materialreadstatus_consultation_materials_and_more	2025-02-26 04:43:41.189604+07
67	core	0038_nurse_current_level_start_date	2025-02-26 06:57:53.488672+07
68	django_celery_beat	0001_initial	2025-02-26 07:31:52.783613+07
69	django_celery_beat	0002_auto_20161118_0346	2025-02-26 07:31:52.792931+07
70	django_celery_beat	0003_auto_20161209_0049	2025-02-26 07:31:52.798296+07
71	django_celery_beat	0004_auto_20170221_0000	2025-02-26 07:31:52.801726+07
72	django_celery_beat	0005_add_solarschedule_events_choices	2025-02-26 07:31:52.804861+07
73	django_celery_beat	0006_auto_20180322_0932	2025-02-26 07:31:52.836944+07
74	django_celery_beat	0007_auto_20180521_0826	2025-02-26 07:31:52.850555+07
75	django_celery_beat	0008_auto_20180914_1922	2025-02-26 07:31:52.878059+07
76	django_celery_beat	0006_auto_20180210_1226	2025-02-26 07:31:52.898057+07
77	django_celery_beat	0006_periodictask_priority	2025-02-26 07:31:52.907056+07
78	django_celery_beat	0009_periodictask_headers	2025-02-26 07:31:52.916057+07
79	django_celery_beat	0010_auto_20190429_0326	2025-02-26 07:31:53.09336+07
80	django_celery_beat	0011_auto_20190508_0153	2025-02-26 07:31:53.106363+07
81	django_celery_beat	0012_periodictask_expire_seconds	2025-02-26 07:31:53.115353+07
82	django_celery_beat	0013_auto_20200609_0727	2025-02-26 07:31:53.12336+07
83	django_celery_beat	0014_remove_clockedschedule_enabled	2025-02-26 07:31:53.128357+07
84	django_celery_beat	0015_edit_solarschedule_events_choices	2025-02-26 07:31:53.131369+07
85	django_celery_beat	0016_alter_crontabschedule_timezone	2025-02-26 07:31:53.142355+07
86	django_celery_beat	0017_alter_crontabschedule_month_of_year	2025-02-26 07:31:53.149467+07
87	django_celery_beat	0018_improve_crontab_helptext	2025-02-26 07:31:53.156431+07
88	django_celery_beat	0019_alter_periodictasks_options	2025-02-26 07:31:53.159743+07
89	core	0039_levelhistory_notes	2025-02-26 07:50:10.635869+07
90	core	0040_alter_materials_file_path	2025-02-26 22:04:58.071683+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
y88j98kg3k1lp0hkwwu2kii19hpvl08b	.eJxVjEEOwiAQRe_C2hBggBaX7nsGMjBTqRqalHZlvLtt0oVu_3vvv0XEbS1xa7zEicRVgBaX3zFhfnI9CD2w3meZ57ouU5KHIk_a5DATv26n-3dQsJW9dp0GDdYYb3tybHXyjEZ5sCP4QNmmrEZtPPhECXmnzhCDCyGo3FEvPl_gRDei:1tcq0y:1hdeHUSo1aMk5AWoPOHF3BNIE3Vr1igKjUilCsDO3lQ	2025-02-12 01:08:44.719238+07
whmolor8r8v5r0ce07p6i047i4q2c8xr	.eJxVjEEOwiAQRe_C2pDC2AIu3fcMZJgZpGpKUtqV8e7apAvd_vfef6mI21ri1mSJE6uLAqtOv2NCesi8E77jfKua6rwuU9K7og_a9FhZntfD_Tso2Mq3dpAzUBbq2YPJ2HXimZINBsGhBTeIIfLW2CGE3DuEkH3gDoywM2dQ7w8fsTgO:1tjerj:QqlG__rU4XX6K7bJ2tKvZDpuF-3JGnKLqp1zVlRfs1A	2025-03-02 20:39:23.182617+07
ppl936nmqutaj5nk8c5rhx2ei9ar6y5l	.eJxVjEEOwiAQRe_C2pDC2AIu3fcMZJgZpGpKUtqV8e7apAvd_vfef6mI21ri1mSJE6uLAqtOv2NCesi8E77jfKua6rwuU9K7og_a9FhZntfD_Tso2Mq3dpAzUBbq2YPJ2HXimZINBsGhBTeIIfLW2CGE3DuEkH3gDoywM2dQ7w8fsTgO:1tjt6h:yQ3v5ZYQ-hQznoXGPe88EajsKNGMayWWO8CVds0uXFQ	2025-03-03 11:51:47.569564+07
4fcxy5w30kt1c6tri0lxyaffllbmv9lr	.eJxVjDsOwjAQBe_iGllmHW-8lPQ5g7X-4QCypTipEHeHSCmgfTPzXsLxtha39bS4OYqL0FqcfkfP4ZHqTuKd663J0Oq6zF7uijxol1OL6Xk93L-Dwr18a8YhAmamwYA1kQizMtnjiOcIiqwFSF4lIjYc8pAYcLRaMWWNilGL9wf3ZDeM:1tmeAP:OaANS_a8BBS6nmpG4chsLPBW6d0SH0HmPltdhaXyS6g	2025-03-11 02:31:01.765291+07
\.


--
-- Data for Name: level_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_history (id, from_level_id, to_level_id, change_date, years_of_service, nurse_id, created_at, update_at, status_id, notes) FROM stdin;
1	20	12	2025-01-29	12	10	2025-01-29 01:19:19.396294+07	2025-01-29 01:19:19.396294+07	11	\N
2	12	13	2025-01-29	12	10	2025-01-29 01:35:54.033227+07	2025-01-29 01:35:54.033227+07	11	\N
3	13	14	2025-01-29	12	10	2025-01-29 01:36:24.091126+07	2025-01-29 01:36:24.091126+07	13	\N
4	12	13	2025-02-24	395	4	2025-02-24 00:44:01.752135+07	2025-02-24 00:44:01.752135+07	14	\N
5	12	13	2025-02-26	29	11	2025-02-26 06:59:23.931192+07	2025-02-26 06:59:23.931192+07	14	\N
6	13	14	2025-02-26	39	14	2025-02-26 06:59:23.937703+07	2025-02-26 06:59:23.937703+07	14	\N
7	12	13	2025-02-26	29	16	2025-02-26 06:59:23.939991+07	2025-02-26 06:59:23.939991+07	14	\N
8	12	13	2025-02-26	19	5	2025-02-26 07:50:14.012115+07	2025-02-26 07:50:14.012115+07	14	\N
9	11	22	2025-02-26	22	8	2025-02-26 07:50:14.01951+07	2025-02-26 07:50:14.01951+07	14	\N
10	11	22	2025-02-26	41	9	2025-02-26 07:50:14.022511+07	2025-02-26 07:50:14.022511+07	14	\N
11	13	14	2025-02-26	19	10	2025-02-26 07:50:14.025511+07	2025-02-26 07:50:14.025511+07	14	\N
12	12	13	2025-02-26	29	11	2025-02-26 07:50:14.027511+07	2025-02-26 07:50:14.027511+07	14	\N
13	13	14	2025-02-26	13	12	2025-02-26 07:50:14.030511+07	2025-02-26 07:50:14.030511+07	14	\N
14	11	22	2025-02-26	44	13	2025-02-26 07:50:14.032511+07	2025-02-26 07:50:14.032511+07	14	\N
15	13	14	2025-02-26	40	14	2025-02-26 07:50:14.035969+07	2025-02-26 07:50:14.035969+07	14	\N
16	12	13	2025-02-26	29	16	2025-02-26 07:50:14.037968+07	2025-02-26 07:50:14.037968+07	14	\N
\.


--
-- Data for Name: level_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_reference (id, level, created_at, update_at, next_level, required_time_in_month) FROM stdin;
20	1-A	2025-01-29 01:16:02+07	2025-01-29 01:16:02+07	1-B	12
12	1-B	2025-01-26 14:11:19+07	2025-01-26 14:11:19+07	2-A	24
13	2-A	2025-01-26 14:11:19+07	2025-01-26 14:11:19+07	2-B	36
14	2-B	2025-01-26 14:11:19+07	2025-01-26 14:11:19+07	3-A	48
15	3-A	2025-01-26 14:11:19+07	2025-01-26 14:11:19+07	3-B	60
16	3-B	2025-01-26 14:11:19+07	2025-01-26 14:11:19+07	4-A	72
21	4-A	2025-02-12 15:38:23+07	2025-02-12 15:38:23+07	4-B	84
11	4-B	2025-01-28 17:02:05+07	2025-01-28 17:02:05+07	5-A	96
22	5-A	2025-02-16 13:47:03+07	2025-02-16 13:47:03+07	5-B	108
\.


--
-- Data for Name: level_upgrade_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_upgrade_status (id, status_name, created_at, updated_at) FROM stdin;
10	Pending	2025-01-26 14:11:19.464481+07	2025-01-26 14:11:19.464481+07
11	Approved	2025-01-26 14:11:19.465495+07	2025-01-26 14:11:19.465495+07
12	Rejected	2025-01-26 14:11:19.465495+07	2025-01-26 14:11:19.465495+07
13	Upcoming	2025-01-29 01:14:33.93583+07	2025-01-29 01:14:58.324045+07
14	Automatic	2025-02-24 00:43:51.840339+07	2025-02-24 00:43:51.840339+07
\.


--
-- Data for Name: loginhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loginhistory (id, login_time, logout_time, ip_address, device_info, status, user_id) FROM stdin;
\.


--
-- Data for Name: management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.management (id, management_account_id, "position", is_active, created_at, update_at, department_id, user_id) FROM stdin;
2	MGT001	Nurse Manager	t	2025-01-26 14:11:20.387741+07	2025-01-26 14:11:20.387741+07	18	6
3	MGT002	Senior Coordinator	t	2025-01-26 14:11:20.8349+07	2025-01-26 14:11:20.8349+07	17	7
4	MGT003	Senior Coordinator	t	2025-01-26 14:11:21.294912+07	2025-01-26 14:11:21.294912+07	16	8
6	MGT005	Department Head	t	2025-01-26 14:11:22.198156+07	2025-01-26 14:11:22.198156+07	15	10
8	MGT007	Senior Coordinator	t	2025-01-26 14:11:23.170399+07	2025-01-26 14:11:23.170399+07	16	12
9	MGT008	Department Head	t	2025-01-26 14:11:23.611956+07	2025-01-26 14:11:23.611956+07	15	13
10	MGT009	Department Head	t	2025-01-26 14:11:24.07603+07	2025-01-26 14:11:24.07603+07	19	14
11	MGT010	Department Head	t	2025-01-26 14:11:24.54665+07	2025-01-26 14:11:24.54764+07	15	15
5	MGT004	Nurse Manager	t	2025-01-26 14:11:21.735378+07	2025-01-26 14:11:21.735378+07	16	9
12	41421412	124124124	t	2025-02-25 08:19:36.897551+07	2025-02-25 08:19:36.897551+07	15	38
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, title, file_path, size, size_readable, created_at) FROM stdin;
20	ONSITE DANAMON.pdf	documnets/ONSITE_DANAMON.pdf	1179615	1.12 MB	2025-02-19 21:48:11.990439+07
41	Learning Report Advanced_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Learning_Report_Advanced_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro_UBWYc4S.pdf	249150	243.31 KB	2025-02-22 14:23:42.037699+07
23	PENGARUHPOLAHIDUPDENGANGASTRITISPADAREMAJA.pdf	documnets/PENGARUHPOLAHIDUPDENGANGASTRITISPADAREMAJA.pdf	298329	291.34 KB	2025-02-19 22:12:47.00224+07
24	Notebook firdauztri.url	documnets/Notebook_firdauztri.url	172	172.00 B	2025-02-19 22:49:29.676353+07
25	PENGARUHPOLAHIDUPDENGANGASTRITISPADAREMAJA.pdf	documnets/PENGARUHPOLAHIDUPDENGANGASTRITISPADAREMAJA_Mu5mb9R.pdf	298329	291.34 KB	2025-02-19 22:52:28.08773+07
26	ONSITE DANAMON.pdf	documnets/ONSITE_DANAMON_hWk5yiP.pdf	1179615	1.12 MB	2025-02-19 23:04:57.326856+07
27	ONSITE DANAMON.pdf	documnets/ONSITE_DANAMON_BiaDXCh.pdf	1179615	1.12 MB	2025-02-19 23:04:59.437511+07
28	BAB II - P1337420918006.pdf	documnets/BAB_II_-_P1337420918006.pdf	524855	512.55 KB	2025-02-19 23:04:59.451507+07
29	Clean.Code.A.Handbook.of.Agile.Software.Craftsmanship.pdf	documnets/Clean.Code.A.Handbook.of.Agile.Software.Craftsmanship.pdf	3782924	3.61 MB	2025-02-19 23:05:36.0379+07
30	taking-flight-tailwind-css.pdf	documnets/taking-flight-tailwind-css.pdf	2112906	2.02 MB	2025-02-19 23:05:36.076414+07
31	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_jcZAZe7.pdf	477167	465.98 KB	2025-02-19 23:12:00.304301+07
32	Certificate_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Certificate_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro.pdf	293724	286.84 KB	2025-02-19 23:12:38.789813+07
33	VirtualBox_Tutorial.pdf	documnets/VirtualBox_Tutorial_CcdaxQi.pdf	2109020	2.01 MB	2025-02-19 23:12:38.816825+07
34	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_WhFwjG1.pdf	477167	465.98 KB	2025-02-19 23:12:38.837332+07
35	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_1Kj074f.pdf	477167	465.98 KB	2025-02-19 23:43:11.090382+07
15	certificate-instructions.pdf	documnets/certificate-instructions.pdf	78813	76.97 KB	2025-02-19 13:26:59.226468+07
16	9e4e5b4f323ba49fd6202f10d8c119279da0b3a0_2.pdf	documnets/9e4e5b4f323ba49fd6202f10d8c119279da0b3a0_2.pdf	3546856	3.38 MB	2025-02-19 21:47:13.826879+07
17	e	documnets/Firdauz_X3bHj9G.pdf	86984	84.95 KB	2025-02-19 21:47:19.820263+07
18	Firdauz_2.pdf	documnets/Firdauz_2_oyq9AHI.pdf	89027	86.94 KB	2025-02-19 21:47:28.260956+07
19	ONSITE DANAMON 15 agust - 5 sept.pdf	documnets/ONSITE_DANAMON_15_agust_-_5_sept.pdf	953177	930.84 KB	2025-02-19 21:48:11.958992+07
36	Learning Report Advanced_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Learning_Report_Advanced_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro_CzKVCHD.pdf	249150	243.31 KB	2025-02-22 12:04:11.578888+07
37	cd425ca1e920f4407fcbddc81ef537d2.pdf	documnets/cd425ca1e920f4407fcbddc81ef537d2.pdf	139787	136.51 KB	2025-02-22 12:04:11.59386+07
38	Learning Report Advanced_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Learning_Report_Advanced_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro_IThnAnj.pdf	249150	243.31 KB	2025-02-22 13:00:35.152895+07
39	Learning Report Advanced_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Learning_Report_Advanced_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro_slB3p1z.pdf	249150	243.31 KB	2025-02-22 13:00:58.275609+07
40	Learning Report Advanced_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Learning_Report_Advanced_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro_1CXBHU6.pdf	249150	243.31 KB	2025-02-22 14:22:54.667572+07
42	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_k11lBew.pdf	477167	465.98 KB	2025-02-22 18:44:18.974989+07
43	Certificate_Fullstack Engineer Class_4_Firdauz Tri Anggoro.pdf	documnets/Certificate_Fullstack_Engineer_Class_4_Firdauz_Tri_Anggoro_5CbO5hC.pdf	293724	286.84 KB	2025-02-22 18:44:18.987989+07
44	JURNAL RIZKY HARTATI WULANDARI.pdf	documnets/JURNAL_RIZKY_HARTATI_WULANDARI.pdf	289790	283.00 KB	2025-02-23 00:00:06.111115+07
45	certificate-instructions.pdf	documnets/certificate-instructions_hmMtjKF.pdf	78813	76.97 KB	2025-02-23 00:35:06.295734+07
46	certificate-instructions.pdf	documnets/certificate-instructions_r3E7yg8.pdf	78813	76.97 KB	2025-02-23 00:48:03.554459+07
47	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_0L0Y4ed.pdf	477167	465.98 KB	2025-02-23 10:00:40.594281+07
48	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_vZFjUNm.pdf	477167	465.98 KB	2025-02-23 10:00:40.611364+07
49	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_WK2aISu.pdf	477167	465.98 KB	2025-02-23 10:00:40.621104+07
50	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_XbhP9Ur.pdf	477167	465.98 KB	2025-02-23 10:00:40.63063+07
51	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_JF8prvo.pdf	477167	465.98 KB	2025-02-23 10:04:10.159111+07
52	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_LY3wYHe.pdf	477167	465.98 KB	2025-02-23 10:04:15.74787+07
53	Nurhafizah+Musyafra.pdf	documnets/NurhafizahMusyafra_l3BuA6X.pdf	460256	449.47 KB	2025-02-23 10:04:17.163136+07
54	986-Article Text-2374-1-10-20211122.pdf	documnets/986-Article_Text-2374-1-10-20211122.pdf	563972	550.75 KB	2025-02-23 10:04:17.200452+07
55	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_Mhn6Lo3.pdf	477167	465.98 KB	2025-02-23 10:04:17.232573+07
56	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_Q0rKhno.pdf	477167	465.98 KB	2025-02-23 10:04:17.261634+07
57	Nurhafizah+Musyafra.pdf	documnets/NurhafizahMusyafra_QK0FhCh.pdf	460256	449.47 KB	2025-02-23 10:04:17.294629+07
58	986-Article Text-2374-1-10-20211122.pdf	documnets/986-Article_Text-2374-1-10-20211122_Ol4Sdj1.pdf	563972	550.75 KB	2025-02-23 10:04:17.326727+07
59	Firdauz_2.pdf	documnets/Firdauz_2_QjEXp8E.pdf	89027	86.94 KB	2025-02-23 10:09:48.391013+07
60	Firdauz.pdf	documnets/Firdauz_6Gr9hoN.pdf	86984	84.95 KB	2025-02-23 10:09:48.409105+07
61	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_EeoF1H2.pdf	477167	465.98 KB	2025-02-23 10:09:48.419627+07
62	Firdauz_2.pdf	documnets/Firdauz_2_3T4oDBH.pdf	89027	86.94 KB	2025-02-23 10:09:48.429132+07
63	Firdauz.pdf	documnets/Firdauz_hzEGYWT.pdf	86984	84.95 KB	2025-02-23 10:09:48.439122+07
64	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_GI8lBZP.pdf	477167	465.98 KB	2025-02-23 10:09:48.449665+07
65	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_7j6S055.pdf	477167	465.98 KB	2025-02-23 10:17:08.721916+07
66	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_o52qQVG.pdf	477167	465.98 KB	2025-02-23 10:17:08.735016+07
67	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_fJtyXdO.pdf	477167	465.98 KB	2025-02-23 10:19:59.0143+07
68	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_ZV8oeGn.pdf	477167	465.98 KB	2025-02-23 10:19:59.026014+07
74	4654-22632-2-PB_3.pdf	documnets/4654-22632-2-PB_3_zzbfOqe.pdf	477167	465.98 KB	2025-02-23 10:25:59.433908+07
77	986-Article Text-2374-1-10-20211122.pdf	documnets/986-Article_Text-2374-1-10-20211122_WQafQmw.pdf	563972	550.75 KB	2025-02-23 12:02:16.907806+07
78	986-Article Text-2374-1-10-20211122.pdf	documnets/986-Article_Text-2374-1-10-20211122_Opo6k5n.pdf	563972	550.75 KB	2025-02-23 12:02:16.921416+07
80	4654-22632-2-PB_2.pdf	documnets/4654-22632-2-PB_2_aAzkXKs.pdf	477167	465.98 KB	2025-02-23 13:27:52.507909+07
81	COVER FULL (FAUZIAH FITRI TAMBUNAN).pdf	documnets/COVER_FULL_FAUZIAH_FITRI_TAMBUNAN.pdf	389751	380.62 KB	2025-02-23 13:28:50.80614+07
82	COVER FULL (FAUZIAH FITRI TAMBUNAN).pdf	documnets/COVER_FULL_FAUZIAH_FITRI_TAMBUNAN_vihS6eg.pdf	389751	380.62 KB	2025-02-23 13:28:50.832136+07
83	986-Article Text-2374-1-10-20211122.pdf	documnets/986-Article_Text-2374-1-10-20211122_EhzVciq.pdf	563972	550.75 KB	2025-02-23 15:20:54.730359+07
84	Keperawatan (D3)_40902000083_fullpdf.pdf	documnets/Keperawatan_D3_40902000083_fullpdf.pdf	2382386	2.27 MB	2025-02-23 15:24:20.447527+07
85	Nurhafizah+Musyafra.pdf	documnets/NurhafizahMusyafra_Th8g3hr.pdf	460256	449.47 KB	2025-02-23 15:37:49.221822+07
86	Regional V_Surat_Monev_KTI_--_kad221433.pdf	documnets/Regional_V_Surat_Monev_KTI_--_kad221433.pdf	313535	306.19 KB	2025-02-24 23:20:32.846273+07
87	45806-Article Text-139536-1-10-20240229.pdf	documnets/45806-Article_Text-139536-1-10-20240229.pdf	307892	300.68 KB	2025-02-25 00:11:43.938423+07
88	Red-Team-Analyst-Course-Materials.pdf	documnets/Red-Team-Analyst-Course-Materials.pdf	5545929	5.29 MB	2025-02-25 03:09:10.915875+07
\.


--
-- Data for Name: nurse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse (id, nurse_account_id, hire_date, level_upgrade_date, specialization, is_active, created_at, update_at, current_level_id, department_id, user_id, years_of_service, current_level_start_date) FROM stdin;
16	NURSE015	2022-09-23	2028-02-26	Cardiac Care	t	2025-01-26 14:11:31.421835+07	2025-01-26 14:11:31.421835+07	13	15	30	858	2025-02-26
2	NURSE001	2025-02-28	2026-02-28	Emergency Response	t	2025-01-26 14:11:24.999803+07	2025-01-26 14:11:24.999803+07	20	18	16	10	2025-02-28
3	NURSE002	2023-03-08	2025-03-08	Emergency Response	t	2025-01-26 14:11:25.440842+07	2025-01-26 14:11:25.440842+07	12	18	17	23	2023-03-08
4	NURSE003	2023-12-30	2025-12-30	Emergency Response	t	2025-01-26 14:11:25.89857+07	2025-01-26 14:11:25.89857+07	12	15	18	13	2023-12-30
5	NURSE004	2023-07-04	2028-02-26	Emergency Response	t	2025-01-26 14:11:26.401475+07	2025-01-26 14:11:26.401475+07	13	17	19	574	2025-02-26
8	NURSE007	2023-04-13	2034-02-26	Emergency Response	t	2025-01-26 14:11:27.919352+07	2025-01-26 14:11:27.919352+07	22	15	22	656	2025-02-26
9	NURSE008	2021-08-30	2034-02-26	Oncology Support	t	2025-01-26 14:11:28.370182+07	2025-01-26 14:11:28.370182+07	22	15	23	1247	2025-02-26
10	NURSE009	2023-07-10	2029-02-26	Emergency Response	t	2025-01-26 14:11:28.818631+07	2025-01-26 14:11:28.818631+07	14	15	24	568	2025-02-26
11	NURSE010	2022-09-05	2028-02-26	Emergency Response	t	2025-01-26 14:11:29.273445+07	2025-01-26 14:11:29.273445+07	13	15	25	876	2025-02-26
12	NURSE011	2024-01-12	2029-02-26	Pediatric Care	t	2025-01-26 14:11:29.713187+07	2025-01-26 14:11:29.713187+07	14	19	26	382	2025-02-26
13	NURSE012	2021-06-24	2034-02-26	Emergency Response	t	2025-01-26 14:11:30.150911+07	2025-01-26 14:11:30.150911+07	22	19	27	1314	2025-02-26
14	NURSE013	2021-10-26	2029-02-26	Pediatric Care	t	2025-01-26 14:11:30.574859+07	2025-01-26 14:11:30.574859+07	14	18	28	1190	2025-02-26
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, created_at) FROM stdin;
8	Admin	2025-01-26 14:11:19.455893+07
9	Management	2025-01-26 14:11:19.456896+07
10	Nurse	2025-01-26 14:11:19.456896+07
\.


--
-- Data for Name: system_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_configuration (id, config_key, config_value, created_at, updated_at) FROM stdin;
5	CONSULTATION_FREQUENCY	3 times every 2 months	2025-01-26 14:11:19.465495+07	2025-01-26 14:11:19.465495+07
6	AUTO_LEVEL_UPGRADE	yearly	2025-01-26 14:11:19.465495+07	2025-01-26 14:11:19.465495+07
7	MAX_LOGIN_ATTEMPTS	5	2025-01-26 14:11:19.465495+07	2025-01-26 14:11:19.465495+07
8	PASSWORD_RESET_TIMEOUT	30	2025-01-26 14:11:19.465495+07	2025-01-26 14:11:19.465495+07
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
18	2025-01-28 04:46:58.797712+07	29
19	2025-01-28 04:48:41.294986+07	30
20	2025-01-28 05:02:40.290829+07	31
21	2025-01-28 05:02:46.066829+07	32
22	2025-01-28 22:31:03.929113+07	49
23	2025-01-29 01:05:14.028142+07	52
24	2025-01-29 17:53:49.983922+07	53
25	2025-01-29 18:00:04.398993+07	54
26	2025-01-29 18:00:39.070758+07	55
27	2025-01-29 18:07:43.783577+07	56
28	2025-01-29 18:09:06.601504+07	57
29	2025-02-02 21:29:26.763885+07	73
30	2025-02-09 22:34:14.801736+07	99
31	2025-02-09 22:43:30.662311+07	101
32	2025-02-09 22:54:10.854168+07	104
33	2025-02-09 22:54:25.971435+07	105
34	2025-02-11 00:12:47.077226+07	110
35	2025-02-16 03:24:23.160158+07	125
36	2025-02-16 04:09:52.12275+07	126
37	2025-02-16 04:26:42.091578+07	127
38	2025-02-16 04:33:34.447179+07	128
39	2025-02-16 04:40:16.209059+07	129
40	2025-02-16 04:47:59.102024+07	130
41	2025-02-16 06:47:04.258557+07	131
42	2025-02-16 06:48:23.246324+07	132
43	2025-02-16 06:51:29.170492+07	133
44	2025-02-16 06:59:48.990141+07	134
45	2025-02-16 07:01:33.24912+07	135
46	2025-02-16 07:03:01.891277+07	136
47	2025-02-16 07:08:26.562857+07	137
48	2025-02-16 11:56:06.725147+07	138
49	2025-02-16 12:07:56.332301+07	139
50	2025-02-16 12:37:33.585593+07	141
51	2025-02-16 13:02:57.269586+07	142
52	2025-02-16 13:10:30.847546+07	143
53	2025-02-16 13:25:14.313842+07	144
54	2025-02-16 13:41:30.705165+07	145
55	2025-02-16 13:47:20.778828+07	146
56	2025-02-16 15:18:52.688699+07	147
57	2025-02-16 15:39:24.773543+07	148
58	2025-02-16 20:36:50.482312+07	149
59	2025-02-18 11:21:13.360439+07	151
60	2025-02-19 23:33:39.540031+07	159
61	2025-02-20 21:59:33.083951+07	161
62	2025-02-23 18:33:17.468967+07	165
63	2025-02-23 19:49:45.159525+07	167
64	2025-02-23 19:53:35.258103+07	168
65	2025-02-23 20:01:22.831808+07	169
66	2025-02-23 20:02:01.495713+07	170
67	2025-02-23 20:03:28.582772+07	171
68	2025-02-23 21:20:10.743724+07	172
69	2025-02-24 00:54:22.770547+07	173
70	2025-02-24 07:27:57.337597+07	174
71	2025-02-24 07:35:06.228904+07	175
72	2025-02-24 23:02:43.634813+07	176
73	2025-02-24 23:04:23.635375+07	177
74	2025-02-24 23:18:03.437834+07	178
75	2025-02-24 23:18:44.027441+07	179
76	2025-02-24 23:18:56.679713+07	180
77	2025-02-24 23:19:04.828301+07	181
78	2025-02-24 23:22:23.610081+07	182
79	2025-02-24 23:22:34.774351+07	183
80	2025-02-24 23:54:12.017696+07	184
81	2025-02-25 00:21:21.794869+07	185
82	2025-02-25 00:34:50.164261+07	186
83	2025-02-25 00:42:23.975556+07	187
84	2025-02-25 00:42:41.549524+07	188
85	2025-02-25 00:43:22.055588+07	189
86	2025-02-25 01:24:32.657898+07	190
87	2025-02-25 01:50:17.272495+07	191
88	2025-02-25 01:52:31.560661+07	192
89	2025-02-25 02:10:19.078957+07	193
90	2025-02-25 02:11:06.392892+07	194
91	2025-02-25 02:11:19.499839+07	195
92	2025-02-25 02:17:56.580611+07	196
93	2025-02-25 02:26:50.925681+07	197
94	2025-02-25 02:59:06.245565+07	199
95	2025-02-25 03:02:04.84652+07	200
96	2025-02-25 03:07:19.364515+07	201
97	2025-02-25 03:10:53.27583+07	202
98	2025-02-25 03:11:34.912128+07	203
99	2025-02-25 03:11:49.892711+07	204
100	2025-02-25 03:12:00.600051+07	205
101	2025-02-26 05:02:41.81263+07	207
102	2025-02-26 05:03:38.078932+07	208
103	2025-02-26 05:04:10.328252+07	209
104	2025-02-26 06:25:55.72213+07	210
105	2025-02-26 06:36:11.605485+07	206
106	2025-02-26 06:36:54.380804+07	211
107	2025-02-26 06:38:10.206422+07	212
108	2025-02-26 06:38:31.674066+07	213
109	2025-02-26 06:44:45.199178+07	214
110	2025-02-26 06:45:02.829572+07	215
111	2025-02-26 07:39:31.14806+07	216
112	2025-02-26 07:58:09.396924+07	217
113	2025-02-26 07:58:38.28761+07	218
114	2025-02-26 08:00:12.131015+07	219
115	2025-02-26 22:14:24.147803+07	220
116	2025-02-28 20:38:25.952982+07	224
117	2025-02-28 20:48:35.342996+07	225
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEwMDgxNiwiaWF0IjoxNzM4MDE0NDE2LCJqdGkiOiJkMTI3ODJkMzc5NmI0NzZhYjI2YzM4Nzc3NGI4M2FiZCIsInVzZXJfaWQiOjE3fQ.tPJJyVgcQ4-L07S1efSNRFDjNeb0kzBOwNNpM2BsKmY	2025-01-28 04:46:56.333503+07	2025-01-29 04:46:56+07	17	d12782d3796b476ab26c387774b83abd
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEwMDkxOCwiaWF0IjoxNzM4MDE0NTE4LCJqdGkiOiI4ODU5MzI0NThkOGM0NWI1YjdjMTVhZjQwNWU4YTQ4NiIsInVzZXJfaWQiOjE3fQ.dbFQKG1mSC5w9sJrJEvQE2y9SicHWepZOQoJkxKQpgM	2025-01-28 04:48:38.728917+07	2025-01-29 04:48:38+07	17	885932458d8c45b5b7c15af405e8a486
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEwMDk1NiwiaWF0IjoxNzM4MDE0NTU2LCJqdGkiOiJiZDRmMTFlNjllNTI0ZWJkOWE5NDgxYTExMzk5YzVhZSIsInVzZXJfaWQiOjE3fQ.jmyrIosWFQNnEDY8_UL0lrY2MHhkwz6XUllVNnIOhe8	2025-01-28 04:49:16.866914+07	2025-01-29 04:49:16+07	17	bd4f11e69e524ebd9a9481a11399c5ae
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEwMTc2NCwiaWF0IjoxNzM4MDE1MzY0LCJqdGkiOiJiZmFiMzg3MGQxOTA0NDllODE3MGY2Mjg5NDU2YWFlOSIsInVzZXJfaWQiOjE3fQ._m7FulHpoi0FelY2yPP6lOIODNQSxsKURRjmlEjsnxE	2025-01-28 05:02:44.390715+07	2025-01-29 05:02:44+07	17	bfab3870d190449e8170f6289456aae9
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEwODQxMCwiaWF0IjoxNzM4MDIyMDEwLCJqdGkiOiJlN2VhZjljN2NiZjY0NGZhOGM5YTQ4ZmIzM2U3M2RlYiIsInVzZXJfaWQiOjI0fQ.jXKETVPjoGxK7-UrdTP3gifS9BEBk6WvCW891TpT-vI	2025-01-28 06:53:30.628401+07	2025-01-29 06:53:30+07	24	e7eaf9c7cbf644fa8c9a48fb33e73deb
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzNjAwMywiaWF0IjoxNzM4MDQ5NjAzLCJqdGkiOiIzZTMyMzMxMzViMGM0MDI0YjU4M2RkZDFjOWU5OTI1OSIsInVzZXJfaWQiOjE2fQ.LoDmRbJN16d2mQjZBxeLy09OJrwRZD6dcNW8bcqa4Es	2025-01-28 14:33:23.743659+07	2025-01-29 14:33:23+07	16	3e3233135b0c4024b583ddd1c9e99259
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzNjE2MywiaWF0IjoxNzM4MDQ5NzYzLCJqdGkiOiIzNTZkYmY0ODFmNzY0NWY1OWI3ZGY2ZDI5ZDMwYzM0ZCIsInVzZXJfaWQiOjI0fQ.-SdOjBzUCeGTGTmo4XQq03FSyZi_AqhEsOAqAKL1kQ8	2025-01-28 14:36:03.509384+07	2025-01-29 14:36:03+07	24	356dbf481f7645f59b7df6d29d30c34d
36	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzODUxMywiaWF0IjoxNzM4MDUyMTEzLCJqdGkiOiIyMjFjMTI2YmY3ZDA0NjU1YTUzNTVjNzZmNmRlMGQ0OCIsInVzZXJfaWQiOjI0fQ.a3gi_7645Ts9nuz09288ddA3DWQATs_DldXILZIlPNM	2025-01-28 15:15:13.610078+07	2025-01-29 15:15:13+07	24	221c126bf7d04655a5355c76f6de0d48
37	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzODgyMCwiaWF0IjoxNzM4MDUyNDIwLCJqdGkiOiI3OGE3Y2MxOTQzNGE0YWRkOTNjYTJkMjI5YjAxZmQ5NyIsInVzZXJfaWQiOjI0fQ.Tzy6FJ9JwVZd3eF-SDgsaATwGmBXZfNi6QHV5SYSxIE	2025-01-28 15:20:20.776859+07	2025-01-29 15:20:20+07	24	78a7cc19434a4add93ca2d229b01fd97
38	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzOTA0MiwiaWF0IjoxNzM4MDUyNjQyLCJqdGkiOiIyMmMwMTA2Y2FlYzk0ZjY3OGQwZTEwZDlmMDMwY2Y2NSIsInVzZXJfaWQiOjI0fQ.I9jFLFcfz-nuHerZDLNiVYdNwC2SfaxhTu1nq8anqN8	2025-01-28 15:24:02.558501+07	2025-01-29 15:24:02+07	24	22c0106caec94f678d0e10d9f030cf65
39	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzOTUyMiwiaWF0IjoxNzM4MDUzMTIyLCJqdGkiOiI2NTBiMjg5NWUyMmE0OWY1YjVmZDgwZTFiNzA3OWNlMSIsInVzZXJfaWQiOjI0fQ.hOtgAjgd7OXAHDCnprDjXZplDamXphJhyB03eYJP2F8	2025-01-28 15:32:02.411619+07	2025-01-29 15:32:02+07	24	650b2895e22a49f5b5fd80e1b7079ce1
40	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzOTYwNiwiaWF0IjoxNzM4MDUzMjA2LCJqdGkiOiJhM2JiYjE2OTY3MDM0YThjYjM4ZDU1MGFlNTRiOTJkOCIsInVzZXJfaWQiOjI0fQ.RXuZ91hwhRdExPuE6dnT0HE0br4TlkImt8VlmuaE-dY	2025-01-28 15:33:26.297465+07	2025-01-29 15:33:26+07	24	a3bbb16967034a8cb38d550ae54b92d8
41	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzOTcxNiwiaWF0IjoxNzM4MDUzMzE2LCJqdGkiOiI0YTJiZmFmNjExNjY0ZDMwYWRkMWJhZGJlNjZhZmM0NiIsInVzZXJfaWQiOjI0fQ.prGPbbjylGrch-82nflV_WJQGjtybfgWGsQ2SPpRGKs	2025-01-28 15:35:16.052464+07	2025-01-29 15:35:16+07	24	4a2bfaf611664d30add1badbe66afc46
42	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODEzOTg2MiwiaWF0IjoxNzM4MDUzNDYyLCJqdGkiOiIxYWM1MmVlNjI5OTI0NDM0YmExODA4ZWRiODkwZWE4YSIsInVzZXJfaWQiOjI0fQ.kO1mBRNpYECWCnQtmlB2GXBxeJAl8oEUC4F31WcDon4	2025-01-28 15:37:42.286449+07	2025-01-29 15:37:42+07	24	1ac52ee629924434ba1808edb890ea8a
43	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE0MjE0NywiaWF0IjoxNzM4MDU1NzQ3LCJqdGkiOiI0MGJkNTQ2YTZkZDE0NjAwYjM2ODYyM2Y4NDFhMGMzNSIsInVzZXJfaWQiOjE3fQ.Ps-aOHK0Tlik08ieUrIdIQ4rCgwagu1lsUp_IN_d5CQ	2025-01-28 16:15:47.647899+07	2025-01-29 16:15:47+07	17	40bd546a6dd14600b368623f841a0c35
44	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE0MjMyMSwiaWF0IjoxNzM4MDU1OTIxLCJqdGkiOiJiZGJjZDEwOTAwYmM0ODY2OTBlZGMyZWE0OGNhMGEzNiIsInVzZXJfaWQiOjI0fQ.lcIZakOL9xsADKhfCkM4ll9LQaUtbT4fnp_uch5W2TM	2025-01-28 16:18:41.954342+07	2025-01-29 16:18:41+07	24	bdbcd10900bc486690edc2ea48ca0a36
45	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE0MjQ0NCwiaWF0IjoxNzM4MDU2MDQ0LCJqdGkiOiI2NjI4ZTk4Y2UxZWM0MjQzOGRiMWUxMTMzNDhjZDhhMCIsInVzZXJfaWQiOjI0fQ.9lLNjeBmtgcj0Yi5TRgnonveFh2kTfuy4LWqU66sNY4	2025-01-28 16:20:44.134669+07	2025-01-29 16:20:44+07	24	6628e98ce1ec42438db1e113348cd8a0
46	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE0MjQ5NCwiaWF0IjoxNzM4MDU2MDk0LCJqdGkiOiI1NTU0NWU2Y2RhM2Q0NTBiYThkZTUyZjc0ODQxODgzMiIsInVzZXJfaWQiOjI0fQ.-TkpVUQiiMf2Wa7-THvWLyPVwKLbSYBlsaD99PNymLg	2025-01-28 16:21:34.345374+07	2025-01-29 16:21:34+07	24	55545e6cda3d450ba8de52f748418832
47	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE1MDQ2MSwiaWF0IjoxNzM4MDY0MDYxLCJqdGkiOiI4MmQ2ZmQ5OTY0ZDM0ZjJlYjhmNTczNjNhNjI5MTQzMSIsInVzZXJfaWQiOjI0fQ.f2c-03NdGoUwG4MhQshD_BsJ5IWPezSMJzLO4J0_B6M	2025-01-28 18:34:21.736347+07	2025-01-29 18:34:21+07	24	82d6fd9964d34f2eb8f57363a6291431
48	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE2NDE0NiwiaWF0IjoxNzM4MDc3NzQ2LCJqdGkiOiJjOWU1MTJlZmYzMjE0NjMxYWJkY2ZlNWY3YjZjNmNjZiIsInVzZXJfaWQiOjI0fQ.loUrAib3KC4v3LVFz5QEZUbxjXd1u-tInTlALnqoPLo	2025-01-28 22:22:26.202168+07	2025-01-29 22:22:26+07	24	c9e512eff3214631abdcfe5f7b6c6ccf
49	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE2NDQ4NiwiaWF0IjoxNzM4MDc4MDg2LCJqdGkiOiIxZWU4ZTBmYzlkNzI0MTA5YTgwYTNlNzMzMTU1OTI4NCIsInVzZXJfaWQiOjZ9.mMIPYr7diG6IO-VyASQwpNK3AvJXJS18dfdgDaYPNhA	2025-01-28 22:28:06.776774+07	2025-01-29 22:28:06+07	6	1ee8e0fc9d724109a80a3e7331559284
50	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE2NDc1MCwiaWF0IjoxNzM4MDc4MzUwLCJqdGkiOiI2NWQxODdiYTFkOTM0MTgxYmI4OGM0Y2M2ZWY2YWU1ZCIsInVzZXJfaWQiOjI0fQ.iBJLDBn6yHf-elouc_po8GfgLI_mb2wOmq3OAzfjzx0	2025-01-28 22:32:30.488269+07	2025-01-29 22:32:30+07	24	65d187ba1d934181bb88c4cc6ef6ae5d
51	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE2NDc5MywiaWF0IjoxNzM4MDc4MzkzLCJqdGkiOiIyNmZjZDA3NzU1NGE0ZWNkYjBmMDc0MDg0ZWYxZGVmNSIsInVzZXJfaWQiOjZ9.dvcftxBnYqZz9zBHjy9QqmQnzCqI71crhI8fiGiuFcc	2025-01-28 22:33:13.52918+07	2025-01-29 22:33:13+07	6	26fcd077554a4ecdb0f074084ef1def5
52	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODE3MjM2OSwiaWF0IjoxNzM4MDg1OTY5LCJqdGkiOiI4NjQ4NmU0ZDhjODU0YjU3OThjNzM3ZmRhZWJjMGRlZCIsInVzZXJfaWQiOjI0fQ.kMGez90n1O40AnlxQMSQpEbV9o3SA6JboiUbqCY7PJM	2025-01-29 00:39:29.047011+07	2025-01-30 00:39:29+07	24	86486e4d8c854b5798c737fdaebc0ded
53	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNDM2OSwiaWF0IjoxNzM4MTQ3OTY5LCJqdGkiOiI3NjYzZjY4OTQ3MjA0YzJhODllM2IzNzI2YWJkNGM3OCIsInVzZXJfaWQiOjI0fQ.w9FYsC1ekNDrAC-bhWb9WyY2_zDcAmWtH5TIQUk5evI	2025-01-29 17:52:49.660239+07	2025-01-30 17:52:49+07	24	7663f68947204c2a89e3b3726abd4c78
54	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNDQ4NiwiaWF0IjoxNzM4MTQ4MDg2LCJqdGkiOiIxNjEyMGQ4ODA2ZWY0M2Q0ODliOTUxZDU1YWMwYmZmYSIsInVzZXJfaWQiOjI0fQ.v4ZAzyGdWssvYLSOoIlFSoEIAE9tVJbYcuUT3GPMlHU	2025-01-29 17:54:46.589392+07	2025-01-30 17:54:46+07	24	16120d8806ef43d489b951d55ac0bffa
55	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNDgzNiwiaWF0IjoxNzM4MTQ4NDM2LCJqdGkiOiJjNGY5ODAzMDkwYmQ0NWJlYWIyZDVmMjc5YzhiNTNmNCIsInVzZXJfaWQiOjI0fQ.ESEiZF7XHYRDDffeUPKA0h9yXxHv6c_8LZrd1NaeUVw	2025-01-29 18:00:36.321082+07	2025-01-30 18:00:36+07	24	c4f9803090bd45beab2d5f279c8b53f4
56	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTAzMywiaWF0IjoxNzM4MTQ4NjMzLCJqdGkiOiJjODI1MGM0ZWQzOWI0MjlhOGJjMDg1N2IzY2Q5MWJhNSIsInVzZXJfaWQiOjI0fQ.M_2FIbzcB9BPHkQ_YrREINqxl748OoFox5UKntQQVP4	2025-01-29 18:03:53.913664+07	2025-01-30 18:03:53+07	24	c8250c4ed39b429a8bc0857b3cd91ba5
57	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTM0MCwiaWF0IjoxNzM4MTQ4OTQwLCJqdGkiOiIzZmY2ZDk0YjhjYzU0ZjEwYjc2MTg2NjAxYWQyMzhjYiIsInVzZXJfaWQiOjI0fQ.phays5_Ql-6G1BTSk_oGVKcEL1ps1fA243sAnkT6Hio	2025-01-29 18:09:00.061296+07	2025-01-30 18:09:00+07	24	3ff6d94b8cc54f10b76186601ad238cb
58	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTQ4MiwiaWF0IjoxNzM4MTQ5MDgyLCJqdGkiOiI3NDRkOTM4ZjAzMDI0YTBiOTUwNWRiOTg2ZjNkYTQ1ZSIsInVzZXJfaWQiOjI0fQ.D4UW6UhAOck7ls6vya5ygiSnn2VcVM2VL9jYEadLKjQ	2025-01-29 18:11:22.028454+07	2025-01-30 18:11:22+07	24	744d938f03024a0b9505db986f3da45e
59	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTU5NywiaWF0IjoxNzM4MTQ5MTk3LCJqdGkiOiJmODc1MWIwYzQwMDA0MTVkOWYzOGQ5MDI3N2QyYmRjMyIsInVzZXJfaWQiOjI0fQ.H0RHFOxaZ4_NT4p8ObquyoMoH2pSe9HzCb2SSTnLAuM	2025-01-29 18:13:17.055946+07	2025-01-30 18:13:17+07	24	f8751b0c4000415d9f38d90277d2bdc3
60	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTYxNiwiaWF0IjoxNzM4MTQ5MjE2LCJqdGkiOiJjYjYwYjIzNDhmZTA0NDVlOWUwY2I1N2IyMTBiZWI4YiIsInVzZXJfaWQiOjI0fQ.3rSMed2IcT1H4_81DiEFU55LuHXR-KTZyeVU__GCUUE	2025-01-29 18:13:36.442313+07	2025-01-30 18:13:36+07	24	cb60b2348fe0445e9e0cb57b210beb8b
61	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTY0NCwiaWF0IjoxNzM4MTQ5MjQ0LCJqdGkiOiJjMTgzYzllYTczMDY0NzI5YmRjOTgzOThmZDY5OWFkYiIsInVzZXJfaWQiOjI0fQ.0waugNu9aGW7y1X71ndwbeaUINkhU-EnQ98L7ZPYDws	2025-01-29 18:14:04.139235+07	2025-01-30 18:14:04+07	24	c183c9ea73064729bdc98398fd699adb
62	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzNTY3MSwiaWF0IjoxNzM4MTQ5MjcxLCJqdGkiOiI5ZmY5NDc1MjQ3ZjY0MjBmYmZiYzIzZjUyNGVhZWQwYyIsInVzZXJfaWQiOjI0fQ.Xxtij1pUBRDdZMCFw40TKTq7P6xT-Rn41Bgl15d-z_8	2025-01-29 18:14:31.813693+07	2025-01-30 18:14:31+07	24	9ff9475247f6420fbfbc23f524eaed0c
63	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODIzODIxMiwiaWF0IjoxNzM4MTUxODEyLCJqdGkiOiI2OWY1YjkyNmVmYzU0OTc5ODIyMzY2ZWZjYTU1MjRmOSIsInVzZXJfaWQiOjE2fQ.qcv0_ZfV08mLwmyySzYGvppJkKSsiuFnFV2D3DkzUJk	2025-01-29 18:56:52.284086+07	2025-01-30 18:56:52+07	16	69f5b926efc54979822366efca5524f9
64	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzIwNSwiaWF0IjoxNzM4MTYwODA1LCJqdGkiOiJhYzQzOTBjYzczNDk0OWY3OGJmOWVjOGI0NTRiYTg3ZSIsInVzZXJfaWQiOjI0fQ.uOTMAxAJp5sgsJGdiV5keuE9xTA8EU_pA2wf6W2FHfQ	2025-01-29 21:26:45.648041+07	2025-01-30 21:26:45+07	24	ac4390cc734949f78bf9ec8b454ba87e
65	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzIzNCwiaWF0IjoxNzM4MTYwODM0LCJqdGkiOiJhNmYzMDczODk1NzU0NmViYWJlMTllZTJjMGMwZWQ0NSIsInVzZXJfaWQiOjE2fQ.b2WfK10x475SccIn61_hJ23JkGyj6OOeH3wVENxq-JA	2025-01-29 21:27:14.346347+07	2025-01-30 21:27:14+07	16	a6f30738957546ebabe19ee2c0c0ed45
66	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzIzNywiaWF0IjoxNzM4MTYwODM3LCJqdGkiOiI3NDMxZGI5ZmNjMTA0OTc0Yjc2MDBmNzk2YjFjZTZlZiIsInVzZXJfaWQiOjE2fQ.vY58wvMVlmkVv7GIdzmFdAdv1o9ukrl0tB7saA0t2PE	2025-01-29 21:27:17.815584+07	2025-01-30 21:27:17+07	16	7431db9fcc104974b7600f796b1ce6ef
67	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzUxMCwiaWF0IjoxNzM4MTYxMTEwLCJqdGkiOiIyNjlmMjQ5ZTA0YzY0MWI1YmI5OTY3MGU5NTMwYWU2YSIsInVzZXJfaWQiOjE2fQ.8HyyeOXGe_Y7k0ePP6wgs64yYl7R_AzZAUOgTqovrIQ	2025-01-29 21:31:50.003376+07	2025-01-30 21:31:50+07	16	269f249e04c641b5bb99670e9530ae6a
68	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzUyMSwiaWF0IjoxNzM4MTYxMTIxLCJqdGkiOiI2YjcxYmM5YmZmNWY0OTA1YTYyYzVkNTQwYWUyNDZmMyIsInVzZXJfaWQiOjE2fQ.zCjo3Z_DmMRcJDBazXUB0ANxYSKr8b2rBivWv9SH4mM	2025-01-29 21:32:01.821346+07	2025-01-30 21:32:01+07	16	6b71bc9bff5f4905a62c5d540ae246f3
69	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzU4MSwiaWF0IjoxNzM4MTYxMTgxLCJqdGkiOiIzZWZkOTdjYTQyZjM0ZTBkOWQyNjliMWM5ZjRhMDE1NyIsInVzZXJfaWQiOjE2fQ.XgGjsas22mdmHCmgljEYjK_VKlICEsq3BNP1MDc1UsQ	2025-01-29 21:33:01.94439+07	2025-01-30 21:33:01+07	16	3efd97ca42f34e0d9d269b1c9f4a0157
70	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzU4NywiaWF0IjoxNzM4MTYxMTg3LCJqdGkiOiJlYjRiN2EzYTQ1MDA0MzNhODA3ODk1NGNhMzYzYWRmZiIsInVzZXJfaWQiOjE2fQ.u_bp7Q7uxHQ9ttDhIDA9EY3JF07kE_xFojX3IO32HmM	2025-01-29 21:33:07.85641+07	2025-01-30 21:33:07+07	16	eb4b7a3a4500433a8078954ca363adff
71	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzU5MCwiaWF0IjoxNzM4MTYxMTkwLCJqdGkiOiIwMTg2NDU5YTg2MDk0MDdjYmUwMTc1NTAzMDlmZWMyNSIsInVzZXJfaWQiOjE2fQ.PMRZRHsPQowwx6LOzPjaK8jR5g8aG9H8yqE8y2LI0Lc	2025-01-29 21:33:10.231401+07	2025-01-30 21:33:10+07	16	0186459a8609407cbe017550309fec25
72	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODI0NzYyNCwiaWF0IjoxNzM4MTYxMjI0LCJqdGkiOiI1NDZhMDNjYmZiZTc0ZGZkYjk3NGJlOGUwOTkxMWIzNiIsInVzZXJfaWQiOjE2fQ.a3xPpigBv94vXYDiwnYtxRBzf99uXZmv2F3jyhpEbu4	2025-01-29 21:33:44.251199+07	2025-01-30 21:33:44+07	16	546a03cbfbe74dfdb974be8e09911b36
73	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODU5MDgzMCwiaWF0IjoxNzM4NTA0NDMwLCJqdGkiOiJmNjBlNmU0MGQwN2U0NjhmYmZhYTFhM2Q5MTVmZjhjMyIsInVzZXJfaWQiOjE5fQ.fFMB-bzjr5RfVRd-crh4mRZwiBdO3RfIhhGph-tqQUU	2025-02-02 20:53:50.998475+07	2025-02-03 20:53:50+07	19	f60e6e40d07e468fbfaa1a3d915ff8c3
74	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODU5MzIxMiwiaWF0IjoxNzM4NTA2ODEyLCJqdGkiOiI4ZjE3YWVmMjBjOGM0NmQ4YjY4ODBhZDU1MTVjNzE0YyIsInVzZXJfaWQiOjZ9.2-7yuwJ0C-A2x2h5pO9BXVbu1eZpykk8RnyjS-x_BSQ	2025-02-02 21:33:32.61047+07	2025-02-03 21:33:32+07	6	8f17aef20c8c46d8b6880ad5515c714c
75	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODg0NzkzMywiaWF0IjoxNzM4NzYxNTMzLCJqdGkiOiI0YmZiM2I2ZTg3OWE0ZjUxYWEwNTI4OTBmZDY1Y2M1YyIsInVzZXJfaWQiOjE3fQ.NJFdGnhXhIuLczx8VmyeOVCdWTP3-Mfu-YTYHX6kw28	2025-02-05 20:18:53.32523+07	2025-02-06 20:18:53+07	17	4bfb3b6e879a4f51aa052890fd65cc5c
76	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczODg0ODIyMywiaWF0IjoxNzM4NzYxODIzLCJqdGkiOiI3Y2U1ZGU0Y2Y1OGM0MGI3OWM2ODMzMzJlNWMzNDRhYyIsInVzZXJfaWQiOjE2fQ.zBKgR5Jl1btpG7KmFUy6wZdRJMY2sIcshqFiiwEWv7s	2025-02-05 20:23:43.769605+07	2025-02-06 20:23:43+07	16	7ce5de4cf58c40b79c683332e5c344ac
77	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEwOTk5MSwiaWF0IjoxNzM5MDIzNTkxLCJqdGkiOiJmOGE0NzdiNjRmN2I0YTVjOTAzOGQ1YzBjNzIxNGNiNiIsInVzZXJfaWQiOjZ9.6ffBXMOmizUTi6LFtagYuFUZVmGsRjf2FvlIi7i6GTY	2025-02-08 21:06:31.141404+07	2025-02-09 21:06:31+07	6	f8a477b64f7b4a5c9038d5c0c7214cb6
78	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTExMDE0MCwiaWF0IjoxNzM5MDIzNzQwLCJqdGkiOiI3NDQ5ZmQzNzgzYjY0ZjI0OTJkNTM4MjJiMjNiNTcyYyIsInVzZXJfaWQiOjI0fQ.cx_PFjl6Cz00_bziOXtaSTjSvhCbGVgw1c68Gzs7tOc	2025-02-08 21:09:00.179231+07	2025-02-09 21:09:00+07	24	7449fd3783b64f2492d53822b23b572c
79	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTExODgyMSwiaWF0IjoxNzM5MDMyNDIxLCJqdGkiOiJhM2Q3NzRhMWQwNWI0OGY5OTRjOWRlODVlNzY0ZjQzNyIsInVzZXJfaWQiOjI0fQ.iDsEy-BrESn7t9t5wktXt_5Z479haLyS9m5z4vH6l1E	2025-02-08 23:33:41.693344+07	2025-02-09 23:33:41+07	24	a3d774a1d05b48f994c9de85e764f437
80	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMDgwMywiaWF0IjoxNzM5MDM0NDAzLCJqdGkiOiI0ZWVmY2RlYmZhOWY0M2NiODI1NGQ3MzE1NzcyY2RiYyIsInVzZXJfaWQiOjI0fQ.0IbqmLwngLt8NKlWS4mqpjtfgJ0ouoCrVYSPcTfDS4Y	2025-02-09 00:06:43.974416+07	2025-02-10 00:06:43+07	24	4eefcdebfa9f43cb8254d7315772cdbc
81	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMDg3OSwiaWF0IjoxNzM5MDM0NDc5LCJqdGkiOiJhZmFiZjMyNmQ3YjU0N2IwYjVjZDc1MWE1N2QyYjIxMiIsInVzZXJfaWQiOjI0fQ.V42DBH26fLOVEgWvTbncsbt8nvZFHZVti43IX_CL-B4	2025-02-09 00:07:59.880659+07	2025-02-10 00:07:59+07	24	afabf326d7b547b0b5cd751a57d2b212
82	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTAwNCwiaWF0IjoxNzM5MDM0NjA0LCJqdGkiOiJjMWY0ZDQ1MzU1MDk0MTc1ODcxZDczZTRhYzc0Y2Q0YSIsInVzZXJfaWQiOjI0fQ.eeclMOktJ8x0pAfmj2u0g4VmcmksPJe1t0ckCGy650Y	2025-02-09 00:10:04.056173+07	2025-02-10 00:10:04+07	24	c1f4d45355094175871d73e4ac74cd4a
83	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTE4NCwiaWF0IjoxNzM5MDM0Nzg0LCJqdGkiOiI3YzBhNTc2NmNmYWU0OTgyOTZiOTk3ZWM5NmI1M2VkYyIsInVzZXJfaWQiOjI0fQ.AIOHU0fdYOQomFD0p5Dry_NdniEd5_doAeRvX65zexc	2025-02-09 00:13:04.535776+07	2025-02-10 00:13:04+07	24	7c0a5766cfae498296b997ec96b53edc
84	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTI4NSwiaWF0IjoxNzM5MDM0ODg1LCJqdGkiOiJmZGU1ZTJkNjhhMDc0M2QyOGM4OTJkYTgzOWZmYWQ5OCIsInVzZXJfaWQiOjI0fQ.hCBQWpYPG1A6OojlsPKnolCQ64f1lnx1pvooCTYG58A	2025-02-09 00:14:45.318193+07	2025-02-10 00:14:45+07	24	fde5e2d68a0743d28c892da839ffad98
85	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTMxNCwiaWF0IjoxNzM5MDM0OTE0LCJqdGkiOiI4N2ZlMjIxNDJjNDE0NGNkOGNkZWEyZjNiOTJkOTlmZSIsInVzZXJfaWQiOjI0fQ.xtFTFVKQN7bm58rbLMAMgijj1raUfU3YIGOv3NENxKI	2025-02-09 00:15:14.622057+07	2025-02-10 00:15:14+07	24	87fe22142c4144cd8cdea2f3b92d99fe
86	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTM0NSwiaWF0IjoxNzM5MDM0OTQ1LCJqdGkiOiJjNWE3NGFkMGVmYjU0YTY4OGQwNjYzNDVmMzQ4Mjg3NSIsInVzZXJfaWQiOjI0fQ.3j5hJqxgcKU2Mb_vUwODIAaWz34jb3SmlHgk25y3SzY	2025-02-09 00:15:45.789869+07	2025-02-10 00:15:45+07	24	c5a74ad0efb54a688d066345f3482875
87	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTM5OCwiaWF0IjoxNzM5MDM0OTk4LCJqdGkiOiJlMGM2OWI1ZjA1OGE0MTlhYjYyOTVlMTg2MDJkM2VlYSIsInVzZXJfaWQiOjI0fQ.2-KU11ik4zo8ckTVbCwA6gaMctsgOzJ43SGO6V7Hp2s	2025-02-09 00:16:38.474621+07	2025-02-10 00:16:38+07	24	e0c69b5f058a419ab6295e18602d3eea
88	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTQ0MiwiaWF0IjoxNzM5MDM1MDQyLCJqdGkiOiIxOGFmMjE0NmYyZGI0OGE5ODRhOWM4MjJlNjk5MjVlZCIsInVzZXJfaWQiOjI0fQ.3aJEpJsISyoKLNEgZSRO0pygzTn7_MLARbE5cF-2VhE	2025-02-09 00:17:22.3678+07	2025-02-10 00:17:22+07	24	18af2146f2db48a984a9c822e69925ed
89	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTUyNiwiaWF0IjoxNzM5MDM1MTI2LCJqdGkiOiJmZWNiZWUwNDVhNDY0MjVhODA1ZjUxM2EwODc5MDljYSIsInVzZXJfaWQiOjI0fQ.oIFY221trg8bUUJx_huLjsdsWv7cdnWllCnSFfMY7Ow	2025-02-09 00:18:46.67487+07	2025-02-10 00:18:46+07	24	fecbee045a46425a805f513a087909ca
90	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMTYxMCwiaWF0IjoxNzM5MDM1MjEwLCJqdGkiOiI0NTQwZDVlZDQyN2M0OTkxOTRjNWNjZDNmYjQ3NmYzZCIsInVzZXJfaWQiOjI0fQ.QCqwtRghl-D1PvjJsi6M25176eMWlGcBmqex-FW1ibI	2025-02-09 00:20:10.284795+07	2025-02-10 00:20:10+07	24	4540d5ed427c499194c5ccd3fb476f3d
91	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMjA1MSwiaWF0IjoxNzM5MDM1NjUxLCJqdGkiOiJmODFjZWFjMTUzMWM0Y2JiOWVhNmI4N2UyMDE1MzdlNSIsInVzZXJfaWQiOjI0fQ.rsKw-3VasCu0-XDRU3FbHIYVdq1ThW0NrFTcBybpKdE	2025-02-09 00:27:31.857176+07	2025-02-10 00:27:31+07	24	f81ceac1531c4cbb9ea6b87e201537e5
92	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMzUwMCwiaWF0IjoxNzM5MDM3MTAwLCJqdGkiOiI0ZWZkNzhjODYwOTM0ZDZkOTJiNzQ4NDMwNTdlNGJiYSIsInVzZXJfaWQiOjI0fQ.SDHSwDkbNfJYXZ-P1nLnG5PcA5mzrLU96rtK14Rj-Y4	2025-02-09 00:51:40.53319+07	2025-02-10 00:51:40+07	24	4efd78c860934d6d92b74843057e4bba
93	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyMzU5NCwiaWF0IjoxNzM5MDM3MTk0LCJqdGkiOiJlY2NkMDUwMGZlNGY0NjYzOTU5YmQyOGNhMDk0Mzc0MyIsInVzZXJfaWQiOjI0fQ.lk_egtWkQqXgfa5tPtGctYVQ6-nTipQ7e9WrwGl6tlA	2025-02-09 00:53:14.246841+07	2025-02-10 00:53:14+07	24	eccd0500fe4f4663959bd28ca0943743
94	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTEyNTIzNSwiaWF0IjoxNzM5MDM4ODM1LCJqdGkiOiJmNDQ3ZTkyODkwMDA0OTNlYjk3N2FjMjQxNDZlOGMzOSIsInVzZXJfaWQiOjE2fQ.g3r8n-qZUWniqYlU-6AzR1LeeBvHNEJHOb-2L6p4DCM	2025-02-09 01:20:35.865481+07	2025-02-10 01:20:35+07	16	f447e9289000493eb977ac24146e8c39
95	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTE1NjY5NywiaWF0IjoxNzM5MDcwMjk3LCJqdGkiOiI2OGQ5OTZjNTU5ODE0NWNhYTlmMmY5YjI2ZmExMzFjNSIsInVzZXJfaWQiOjE2fQ.gGrFA406LU3ES50sZz4C4L1zOmkYHiGO5TfX_68CO-w	2025-02-09 10:04:57.670458+07	2025-02-10 10:04:57+07	16	68d996c5598145caa9f2f9b26fa131c5
96	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTE5OTg5NSwiaWF0IjoxNzM5MTEzNDk1LCJqdGkiOiI2N2RmNDg0ZDI0ZmU0YjZhODY2NzBhYjExZmNmOTM0ZSIsInVzZXJfaWQiOjE2fQ.9L2QlTWkZYacNywQgpfZub3PQT5ZkKurU-z-IPJ4bWY	2025-02-09 22:04:55.024422+07	2025-02-10 22:04:55+07	16	67df484d24fe4b6a86670ab11fcf934e
97	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMDc3NywiaWF0IjoxNzM5MTE0Mzc3LCJqdGkiOiI3ODNjMjk0ZTE1NDc0N2I0OTM5ZjQ2YjRlNDczMmRjMiIsInVzZXJfaWQiOjE2fQ.D5_Tp2rhXwAHHt78nd0jOJKZABUE602_S8CpPnFXfLM	2025-02-09 22:19:37.972301+07	2025-02-10 22:19:37+07	16	783c294e154747b4939f46b4e4732dc2
98	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMTAzMCwiaWF0IjoxNzM5MTE0NjMwLCJqdGkiOiJkNDcwMzJkMWMwYTE0MzRhOTJlYTdiNGMyZTI4ODRlYiIsInVzZXJfaWQiOjE2fQ.8Mv8U8ZlOOL1VD1vRIfYTHDypGRRebvEDTN4DO6_-G8	2025-02-09 22:23:50.677881+07	2025-02-10 22:23:50+07	16	d47032d1c0a1434a92ea7b4c2e2884eb
99	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMTU3NiwiaWF0IjoxNzM5MTE1MTc2LCJqdGkiOiIwOGNmOTk4MGY0MjM0ZmY1YjE1YjIxYWE0MTFhNTgwNiIsInVzZXJfaWQiOjE2fQ.vfw9E95UUvQ15opuzhzvQKCOqm7DC5m9urvWhTimz7E	2025-02-09 22:32:56.769824+07	2025-02-10 22:32:56+07	16	08cf9980f4234ff5b15b21aa411a5806
100	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMTY1NiwiaWF0IjoxNzM5MTE1MjU2LCJqdGkiOiIwYTEzOTY0NTNjYWY0OTdlOWZhMzQyM2UwMzkxNzNmNyIsInVzZXJfaWQiOjE2fQ.YTkRknc4k4T6QBuT5kqaSrniDgWOS_eq3H5_6_7Fp34	2025-02-09 22:34:16.735782+07	2025-02-10 22:34:16+07	16	0a1396453caf497e9fa3423e039173f7
101	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMTcxNCwiaWF0IjoxNzM5MTE1MzE0LCJqdGkiOiJhYzg4ZTFmMzQ2NmM0ZDEwYmJmMzVhY2IzMDY4MmUxYSIsInVzZXJfaWQiOjE2fQ.DIFmGvAQZuRIVJn_5U8vWSjvH4lXXpiaCO-HqOHvyi8	2025-02-09 22:35:14.94801+07	2025-02-10 22:35:14+07	16	ac88e1f3466c4d10bbf35acb30682e1a
102	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMjMyNywiaWF0IjoxNzM5MTE1OTI3LCJqdGkiOiIxNDA5MDdhZDdiOTg0MmMyYmY4MDQ0NWU0MjQ5MDE0OCIsInVzZXJfaWQiOjE2fQ.CBH2VM1ogbb4a63HjwxU8l99-HBKw4hbMUbVGWy85Eg	2025-02-09 22:45:27.018824+07	2025-02-10 22:45:27+07	16	140907ad7b9842c2bf80445e42490148
103	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMjUxMiwiaWF0IjoxNzM5MTE2MTEyLCJqdGkiOiI2NWVhMjJlYzg0MzA0YzUxOGQ4MTA5NTIzN2NmZjQyYiIsInVzZXJfaWQiOjE2fQ._N5poujM1gSVAV2xGdj4YiBXT9Kze3DYuLfyrxHqCgA	2025-02-09 22:48:32.293365+07	2025-02-10 22:48:32+07	16	65ea22ec84304c518d81095237cff42b
104	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMjY3NSwiaWF0IjoxNzM5MTE2Mjc1LCJqdGkiOiJjOWM5OTUyM2VmMDU0Y2Y0YmU2MGI0NmM5ZGY4NDdhYiIsInVzZXJfaWQiOjE2fQ.utFXIpjevrxxOvQchSfnIZ7D_G5dryWRdkAHmRrtoEY	2025-02-09 22:51:15.865555+07	2025-02-10 22:51:15+07	16	c9c99523ef054cf4be60b46c9df847ab
105	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIwMjg1MiwiaWF0IjoxNzM5MTE2NDUyLCJqdGkiOiJmZDViODkxNjAwZmE0MzEwYTM2ODBlZDZkNGQzZDNmMSIsInVzZXJfaWQiOjE2fQ.jyXF4eKIAdOX4rgrvutxn-Mj9EVIi618JdUH-W81njs	2025-02-09 22:54:12.775866+07	2025-02-10 22:54:12+07	16	fd5b891600fa4310a3680ed6d4d3d3f1
106	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIzMjc2MSwiaWF0IjoxNzM5MTQ2MzYxLCJqdGkiOiI1MDBmNmQ2ZDA4YTA0ODkyYTQ5MzEwNzcyN2UxMzE0MiIsInVzZXJfaWQiOjE2fQ.O9U9o36P4Mu6uGHzhXXzXkV1--6AhWMauY8u60e4vcg	2025-02-10 07:12:41.580869+07	2025-02-11 07:12:41+07	16	500f6d6d08a04892a493107727e13142
107	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIzMzE2MCwiaWF0IjoxNzM5MTQ2NzYwLCJqdGkiOiIwZGM2NDg3Yzc3Zjc0YjhlOTE0ODhiZjQ0YzY5NzJkZiIsInVzZXJfaWQiOjE2fQ.SlPXrnRYgxa-YSbcRly6OmKMiqhUgyGi0NNQTAc1QiY	2025-02-10 07:19:20.837217+07	2025-02-11 07:19:20+07	16	0dc6487c77f74b8e91488bf44c6972df
108	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTIzMzUwNywiaWF0IjoxNzM5MTQ3MTA3LCJqdGkiOiI1OWU0ZDEzNDA0ODA0YmIxYTIyYjViZTkyY2I0Mzc2MSIsInVzZXJfaWQiOjI3fQ.r93UEwQ0N0bVqByoHAfkX4IrqO9JmFHtdf3mAjJTw5E	2025-02-10 07:25:07.670485+07	2025-02-11 07:25:07+07	27	59e4d13404804bb1a22b5be92cb43761
109	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTI4NjM5MiwiaWF0IjoxNzM5MTk5OTkyLCJqdGkiOiJmZWEyZmE0NjE5ZTk0MzI4OGY4Mzg2N2VlNzc0YTZiYiIsInVzZXJfaWQiOjI0fQ.gUY6-k-8j84ZkvnyN_03i-x2VvNV6lrikbTqWbUoDQc	2025-02-10 22:06:32.809689+07	2025-02-11 22:06:32+07	24	fea2fa4619e943288f83867ee774a6bb
110	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTI5MzkwNywiaWF0IjoxNzM5MjA3NTA3LCJqdGkiOiIzNTg3MjI0ZTI2Njg0NjQ4OTFjMmI5ZmU5MDU3ZGNiMiIsInVzZXJfaWQiOjE2fQ.CMB2SoYEQJuIqXGibfAH3xP7UDYP9ruGsA0qM7P-Eyw	2025-02-11 00:11:47.544044+07	2025-02-12 00:11:47+07	16	3587224e2668464891c2b9fe9057dcb2
111	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTI5Mzk4NSwiaWF0IjoxNzM5MjA3NTg1LCJqdGkiOiJiZTg0ZDRjMjZkY2Q0ZTk0YTQ2ODM1OWJkZDA3MjkxMyIsInVzZXJfaWQiOjZ9.I3fxUL8Aa-p6NKVB2LB0Ig-AgkcXTF49nPAF43f1q4A	2025-02-11 00:13:05.311801+07	2025-02-12 00:13:05+07	6	be84d4c26dcd4e94a468359bdd072913
112	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTI5NDcwNSwiaWF0IjoxNzM5MjA4MzA1LCJqdGkiOiI4OTk3YTllZWNiYjA0ZDlhODYxZmE3MjRhNjYyNjIwYyIsInVzZXJfaWQiOjE2fQ.VbmJQTlwuFwBcAd6bEJQOqeOn35qUUJNW09Af5IWQao	2025-02-11 00:25:05.092917+07	2025-02-12 00:25:05+07	16	8997a9eecbb04d9a861fa724a662620c
113	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTQyMzg3NCwiaWF0IjoxNzM5MzM3NDc0LCJqdGkiOiJhN2UyOGY1NjgwNWU0ZmExOTVmMDE0OTQwNTU4Y2FjMSIsInVzZXJfaWQiOjZ9.TFxkrQTh2VuZ6dNtafeZhBP8st1szDNcQyhLzeT_e_g	2025-02-12 12:17:54.694901+07	2025-02-13 12:17:54+07	6	a7e28f56805e4fa195f014940558cac1
114	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTQzNTg1OSwiaWF0IjoxNzM5MzQ5NDU5LCJqdGkiOiIxM2I5OGU5YzRjNTc0OGQ5YTNlMzlkNTk4NGUwYTBmOSIsInVzZXJfaWQiOjZ9.tyAMnpckl_WOL8zHphTRDj4gWz0BZvkfCt2o2z7k3W0	2025-02-12 15:37:39.570212+07	2025-02-13 15:37:39+07	6	13b98e9c4c5748d9a3e39d5984e0a0f9
115	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTQzOTUzNCwiaWF0IjoxNzM5MzUzMTM0LCJqdGkiOiJiNDAwNzczMWU0MDI0MTdjOTA1ODJhYTFjZGVhMmRlMiIsInVzZXJfaWQiOjZ9.D31UnuaPdOGa34oz0N8rbPL0PeTZcpSINqFRS7RIvBY	2025-02-12 16:38:54.372224+07	2025-02-13 16:38:54+07	6	b4007731e402417c90582aa1cdea2de2
116	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTQ5MjIyNCwiaWF0IjoxNzM5NDA1ODI0LCJqdGkiOiIzN2VjNTBiMGJjZjQ0MjcxOTM4NDhjNWMyMTk1MzkyYiIsInVzZXJfaWQiOjd9.8DV3S9WeWMF1udX5bMdGZZc2L2F4qb41wBfU3bZyNq4	2025-02-13 07:17:04.349659+07	2025-02-14 07:17:04+07	7	37ec50b0bcf4427193848c5c2195392b
117	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU3ODUxNSwiaWF0IjoxNzM5NDkyMTE1LCJqdGkiOiJhNGIzNTlhNzI3Yzg0NDIxYTJjNzc4ODU3N2NhZTIyMiIsInVzZXJfaWQiOjZ9.3qpA76XgohoCT-x_x1gRP2vAwvfYnOBNBW2Uhu6GdG0	2025-02-14 07:15:15.813993+07	2025-02-15 07:15:15+07	6	a4b359a727c84421a2c7788577cae222
118	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU3ODc2NywiaWF0IjoxNzM5NDkyMzY3LCJqdGkiOiJmYmUyZjFhMjNmODc0N2Q0OGFiZjlhNDk4NWY0NjYyYiIsInVzZXJfaWQiOjZ9.k5D2Mq4qzjqteFEECb5NbUHyQWSMYvRp5RwvH-sPDMA	2025-02-14 07:19:27.862976+07	2025-02-15 07:19:27+07	6	fbe2f1a23f8747d48abf9a4985f4662b
119	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU3OTA2MiwiaWF0IjoxNzM5NDkyNjYyLCJqdGkiOiJjODUwNTMyODA2MzA0Y2IxYmY2MDIyNWNiOTQ5ZGU5ZCIsInVzZXJfaWQiOjZ9.zmQTdVwPWcZVZdq0SKnWuE5lBR8JVyVJWeKuV5UYOVY	2025-02-14 07:24:22.591121+07	2025-02-15 07:24:22+07	6	c850532806304cb1bf60225cb949de9d
120	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU3OTQ3NCwiaWF0IjoxNzM5NDkzMDc0LCJqdGkiOiIyOTY5N2U4ZmQ2Mzg0YjM0YmUxOGY1MjNkODQwN2E5YSIsInVzZXJfaWQiOjZ9.oihkYIXkuEIVl4OVWZ7nTLvYaIhJzaiMQBZN-4ZO_OU	2025-02-14 07:31:14.605109+07	2025-02-15 07:31:14+07	6	29697e8fd6384b34be18f523d8407a9a
121	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU3OTkxMSwiaWF0IjoxNzM5NDkzNTExLCJqdGkiOiIzYjBjNGViOTRiZWI0ZjAwYmE2MDI0MTI3ZmNhZmYyMCIsInVzZXJfaWQiOjd9.H7n8Mb8jnldarBeSD6g5Sn0wve8zB8q6wK1I2tNomdo	2025-02-14 07:38:31.620018+07	2025-02-15 07:38:31+07	7	3b0c4eb94beb4f00ba6024127fcaff20
122	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU4MDMxMCwiaWF0IjoxNzM5NDkzOTEwLCJqdGkiOiJiNjIyOWU1NTVjN2I0ZTZhYjc2NTA2MjUwYTY4MGRkZiIsInVzZXJfaWQiOjZ9.z4v_TazSQr4WM6KFvPzjSZjomDSFNRF7R4ZGnLZ2f_w	2025-02-14 07:45:10.492563+07	2025-02-15 07:45:10+07	6	b6229e555c7b4e6ab76506250a680ddf
123	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTU4MDc0OSwiaWF0IjoxNzM5NDk0MzQ5LCJqdGkiOiJmNDQ5MTdkY2IzM2M0ODhjOTliODk5NzgzNWMyZWIyMyIsInVzZXJfaWQiOjZ9.LWMNAujYP0Kat9EAu0omkMcEb-nwHzgtb5ELuJIds20	2025-02-14 07:52:29.944319+07	2025-02-15 07:52:29+07	6	f44917dcb33c488c99b8997835c2eb23
124	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTczNDkxMiwiaWF0IjoxNzM5NjQ4NTEyLCJqdGkiOiIyYWM4ZmU0OWE4MmI0NTg2OGE0YjljMWM5MzU5NWRiYSIsInVzZXJfaWQiOjZ9.sRb_n4wyT9lOhhPRDRkYRa4bY7uO2nUPcNKAJn5PJV0	2025-02-16 02:41:52.688833+07	2025-02-17 02:41:52+07	6	2ac8fe49a82b45868a4b9c1c93595dba
125	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTczNjk2MywiaWF0IjoxNzM5NjUwNTYzLCJqdGkiOiI4OTJiNmY3M2JhY2Q0NzlkYjViZWI0ZTg5YzI5MWNhYSIsInVzZXJfaWQiOjh9.nW-SFz_aBcfVyak9K4IaMwuuvho-yEGQ1I9OvsGZHRo	2025-02-16 03:16:03.974107+07	2025-02-17 03:16:03+07	8	892b6f73bacd479db5beb4e89c291caa
126	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTczNzQ5NCwiaWF0IjoxNzM5NjUxMDk0LCJqdGkiOiIwYzkzYWI3ZjJlZTA0MmUyYTE4MTEzYWVkNWYwMDg0ZCIsInVzZXJfaWQiOjEyfQ._BFoIxUDirOSDBzDJcHOdVe3AnjTFzcS5Oly5d1dt0s	2025-02-16 03:24:54.202315+07	2025-02-17 03:24:54+07	12	0c93ab7f2ee042e2a18113aed5f0084d
127	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc0MDY1OSwiaWF0IjoxNzM5NjU0MjU5LCJqdGkiOiIxZDU1MjA1ZWVjYjI0YmU5OWU3ZTc4NDFiNzk4NzI3MiIsInVzZXJfaWQiOjZ9.gA4idw5TF3wiVcaKO70lC6anMl1i4r7WHCTr5XqVBN0	2025-02-16 04:17:39.51322+07	2025-02-17 04:17:39+07	6	1d55205eecb24be99e7e7841b7987272
128	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY1NjA2OCwiaWF0IjoxNzM5NjU1MTY4LCJqdGkiOiI0YWNjNjVmNjE5MDk0MDI0ODEwOTM5YzZiMGUwZGViYiIsInVzZXJfaWQiOjZ9.dvNodI4uOrE4iI0S0XHLALduLEFElc_DJaKTXWZNgDU	2025-02-16 04:32:48.369662+07	2025-02-16 04:47:48+07	6	4acc65f619094024810939c6b0e0debb
129	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY1NjEyMywiaWF0IjoxNzM5NjU1MjIzLCJqdGkiOiIwYTdkM2MxODZiNjc0OTVkOTJkYjdmZGVjNjc1MDllMyIsInVzZXJfaWQiOjZ9.Gb7wULWn2sNv_WOjdpgSOSiJHDbqymexdaUDYc_a7X0	2025-02-16 04:33:43.525266+07	2025-02-16 04:48:43+07	6	0a7d3c186b67495d92db7fdec67509e3
130	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY1NjY4NywiaWF0IjoxNzM5NjU1Nzg3LCJqdGkiOiI0ZjNkNmEyMTYwMjM0MWEwODM1OGQ3ZWFhMmRkM2UyMiIsInVzZXJfaWQiOjZ9.x24furJ-FAWz9Ngaudm8plhdTKaws-RrQ-GajYt9CoU	2025-02-16 04:43:07.449944+07	2025-02-16 04:58:07+07	6	4f3d6a21602341a08358d7eaa2dd3e22
131	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2Mzk4OCwiaWF0IjoxNzM5NjYzMDg4LCJqdGkiOiI4Yjc1YjQ1YThhMDg0NWNkYmI4YmE2ODA0OTA0MTRkYiIsInVzZXJfaWQiOjZ9.MrK2D7HpF_jK2Pg7B0IbVptEgdCiWYyJ6Ik9DJNIIgc	2025-02-16 06:44:48.800729+07	2025-02-16 06:59:48+07	6	8b75b45a8a0845cdbb8ba680490414db
132	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2NDEzMiwiaWF0IjoxNzM5NjYzMjMyLCJqdGkiOiJmYzY3MDIyYzNhNDM0Yzg0YThkYzMxMmUxNzczNGVhMCIsInVzZXJfaWQiOjZ9.fAVROcSaNtzYA7p8XzxEayHGC5_PAHaZ2wvAQz_Eo2g	2025-02-16 06:47:12.302561+07	2025-02-16 07:02:12+07	6	fc67022c3a434c84a8dc312e17734ea0
133	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2NDI1NCwiaWF0IjoxNzM5NjYzMzU0LCJqdGkiOiI4ODRhYmYzZDRjOWE0ZjQzYThhOTcwYmYxMjk0ZTRjOSIsInVzZXJfaWQiOjZ9.xYutSKEr7Z6KOyLsIASN66PvktD8-JYFcr8v62aGhHs	2025-02-16 06:49:14.091359+07	2025-02-16 07:04:14+07	6	884abf3d4c9a4f43a8a970bf1294e4c9
134	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2NDQ5NiwiaWF0IjoxNzM5NjYzNTk2LCJqdGkiOiIwMjM2NWE2M2U1OGU0N2E2OGIxMTE5MTM3ZDE5MTYxMCIsInVzZXJfaWQiOjZ9.p2hrxpfRulZcQe30ZOGsDPb_tTFvS4_qHJoXXHMMrqg	2025-02-16 06:53:16.669608+07	2025-02-16 07:08:16+07	6	02365a63e58e47a68b1119137d191610
135	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2NDg4OCwiaWF0IjoxNzM5NjYzOTg4LCJqdGkiOiJhNDFhZDc2YWYzZTU0MWE5YTdhMjA3MWIyNzFjMjczZCIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoibWFuYWdlbWVudDEiLCJyb2xlIjoiTWFuYWdlbWVudCJ9.ADl_7v3Rh0x6OTBUDn-WYVE3NtXKFaWKL4fG6c32FOs	\N	2025-02-16 07:14:48+07	\N	a41ad76af3e541a9a7a2071b271c273d
136	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2NDk5MywiaWF0IjoxNzM5NjY0MDkzLCJqdGkiOiI3MGFkZmRmZjQyN2Y0Mzg5YmZjM2IzNDkwMTgxZjhmYyIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoibWFuYWdlbWVudDEiLCJyb2xlIjoiTWFuYWdlbWVudCJ9.QOjrGkimMpJNghloTg37v7nxzA72OgKY4GeXTfkwyac	\N	2025-02-16 07:16:33+07	\N	70adfdff427f4389bfc3b3490181f8fc
137	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTY2NTA4MSwiaWF0IjoxNzM5NjY0MTgxLCJqdGkiOiJjMjUyMWRlMWI2NjQ0NDk3ODA3ZjQ1YzFkNjkyZjE5ZCIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoibWFuYWdlbWVudDEiLCJyb2xlIjoiTWFuYWdlbWVudCJ9.y6TUiJ4SJpJWDL0J0FWPTWGjI3v1aqquy0vmY855lf8	\N	2025-02-16 07:18:01+07	\N	c2521de1b6644497807f45c1d692f19d
138	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc2Nzg1NCwiaWF0IjoxNzM5NjgxNDU0LCJqdGkiOiI2M2YxNjk3MTk3YmU0MmNkOTRmNzkxNTY3NTIyNjk5OSIsInVzZXJfaWQiOjZ9.oSCG3Jo1qH4mJ_33NG2nhSs4-sz8qbJiq-dL9TEXp20	2025-02-16 11:50:54.279342+07	2025-02-17 11:50:54+07	6	63f1697197be42cd94f7915675226999
139	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc2ODE4MCwiaWF0IjoxNzM5NjgxNzgwLCJqdGkiOiJmNDcwZTA3NWU1OTI0OTIzOTY2NDc3OTRkY2RiYzA0YyIsInVzZXJfaWQiOjZ9.sTh07I8Mj2PGb0qqMGyuM2cmhDnAV_O2svqnXYQGv5Q	2025-02-16 11:56:20.746461+07	2025-02-17 11:56:20+07	6	f470e075e592492396647794dcdbc04c
140	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc2OTEyMiwiaWF0IjoxNzM5NjgyNzIyLCJqdGkiOiI2NjlmNjE1ZTEwMTA0OTFmOTliOGM4ZWFjZDhkOWZhZCIsInVzZXJfaWQiOjZ9.pJZ5P4vO7ZIKEAPmU-KjxbUbSmcMcpc_UGYWEbmdB54	2025-02-16 12:12:02.775674+07	2025-02-17 12:12:02+07	6	669f615e1010491f99b8c8eacd8d9fad
141	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc2OTEyMywiaWF0IjoxNzM5NjgyNzIzLCJqdGkiOiI3YmNhNjI4OTQwMDg0ZjVjOTZjMGMzNDVmZmI4ZGJhNiIsInVzZXJfaWQiOjZ9.kMH72hQlClFJJNt1VU3kdmHJuLPJs7kTgE79jao8sXE	2025-02-16 12:12:03.328413+07	2025-02-17 12:12:03+07	6	7bca628940084f5c96c0c345ffb8dba6
142	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc3MTUyOSwiaWF0IjoxNzM5Njg1MTI5LCJqdGkiOiIwNTY4MzYxZTk0MzA0OTcxYjliZTkzODI4NjliYmFlZCIsInVzZXJfaWQiOjZ9.Bt7T8qDmLG2Pjdqa711YjS1WCYyfL4RS-Zx_Shq9Fa8	2025-02-16 12:52:09.601321+07	2025-02-17 12:52:09+07	6	0568361e94304971b9be9382869bbaed
143	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc3MjI3NCwiaWF0IjoxNzM5Njg1ODc0LCJqdGkiOiI5NDU5NTdhZmFlZDE0YmVlODAwNTQ1YzQ2N2M1NWU5OSIsInVzZXJfaWQiOjZ9.pOA8OLhMwSZC8gITRr5oDQNGOoxeFKAyDCy2Br1kLB0	2025-02-16 13:04:34.365842+07	2025-02-17 13:04:34+07	6	945957afaed14bee800545c467c55e99
144	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc3MjgwMCwiaWF0IjoxNzM5Njg2NDAwLCJqdGkiOiI5NmE2OGQ0NjMxODA0NmE2Yjk3NjlhOTVkYmE2ZDYwMiIsInVzZXJfaWQiOjZ9.ZmwBzggO8FnTvc-b3PQJ4-13er5XgSnkIUpZ6SPlZI0	2025-02-16 13:13:20.094047+07	2025-02-17 13:13:20+07	6	96a68d46318046a6b9769a95dba6d602
145	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc3NDA3MywiaWF0IjoxNzM5Njg3NjczLCJqdGkiOiI1ZTFkNGM1OGVhM2Y0MWViYmE5NjhiNmY4MDgyMjBhMCIsInVzZXJfaWQiOjZ9.1qHu_ukFe9lmsxYlTuCrN90r9OWNjvVAPIEL7KyRMO8	2025-02-16 13:34:33.096771+07	2025-02-17 13:34:33+07	6	5e1d4c58ea3f41ebba968b6f808220a0
146	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc3NDUyOCwiaWF0IjoxNzM5Njg4MTI4LCJqdGkiOiI3ZDllZDM5YzgyZjE0OTliYTE1MGYzMzA4ZDY3YWRiNCIsInVzZXJfaWQiOjZ9.-Qv1aVmauY5E1hS2c4kiC4rTCO4FNI-4PxCdFs28JWc	2025-02-16 13:42:08.918364+07	2025-02-17 13:42:08+07	6	7d9ed39c82f1499ba150f3308d67adb4
147	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc3NzI4OCwiaWF0IjoxNzM5NjkwODg4LCJqdGkiOiJmMTEyNzU1ZTY3MWI0NDhhOGU5ZjMwZDFkNTNhYTVhOSIsInVzZXJfaWQiOjZ9.o9hHqRZ86W6VVa0uzBIcYHGcRmU32eKtt9tXTZLU4_E	2025-02-16 14:28:08.655633+07	2025-02-17 14:28:08+07	6	f112755e671b448a8e9f30d1d53aa5a9
148	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc4MDUwMCwiaWF0IjoxNzM5Njk0MTAwLCJqdGkiOiI0Y2MyNzNmMmFkNDg0YzAyOTYwNmNlZWQwM2Y5N2U2NiIsInVzZXJfaWQiOjZ9.7XNqfi0j0YnTBfqBlxqvVtmAfG3e9HawLafRur31q7E	2025-02-16 15:21:40.597454+07	2025-02-17 15:21:40+07	6	4cc273f2ad484c029606ceed03f97e66
149	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTc4MTYxMiwiaWF0IjoxNzM5Njk1MjEyLCJqdGkiOiJmMTgxZjY0NWU4YWE0ZDQ4YTk4ZThiNjVkYjc5M2NlMyIsInVzZXJfaWQiOjZ9.-rXdoWgdeXBiPcWzRurKDEXGr6JwG2LMdiHHXf-kNeE	2025-02-16 15:40:12.922246+07	2025-02-17 15:40:12+07	6	f181f645e8aa4d48a98e8b65db793ce3
150	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTg1NzI4OSwiaWF0IjoxNzM5NzcwODg5LCJqdGkiOiI0OGU3ZDgwZjMzMTM0MzI2YjdmODNiY2FmMjZjYWZkYiIsInVzZXJfaWQiOjZ9.HRgxbThfE7DapmnpIoEveykEb0al7UfWR5054R_lgD4	2025-02-17 12:41:29.124968+07	2025-02-18 12:41:29+07	6	48e7d80f33134326b7f83bcaf26cafdb
151	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTkzODE3MiwiaWF0IjoxNzM5ODUxNzcyLCJqdGkiOiJhMWMzNWM2YjJmZDI0MzRhYWY0NjAyYjBhZGI4NzRiYiIsInVzZXJfaWQiOjZ9.QbjnWfYeSITOHA_SzHMCcWDJYfrt9REWbbe8Ru0JKG4	2025-02-18 11:09:32.978526+07	2025-02-19 11:09:32+07	6	a1c35c6b2fd2434aaf4602b0adb874bb
152	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTkzODg3NiwiaWF0IjoxNzM5ODUyNDc2LCJqdGkiOiJjZGM4ZTFkZWY2ZWI0NTgwYjBhYWQxNDNmMWI4ODBmOCIsInVzZXJfaWQiOjZ9.7wZPL9ObXIU3jb4DVVUUV00XLmMCtb3ZOXjgFJ3PSAE	2025-02-18 11:21:16.109366+07	2025-02-19 11:21:16+07	6	cdc8e1def6eb4580b0aad143f1b880f8
153	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTk0OTQ0NSwiaWF0IjoxNzM5ODYzMDQ1LCJqdGkiOiJmZGQ2Njg2ODVhNWY0Nzg4ODg0MjEwNDViNWZiZWEyOSIsInVzZXJfaWQiOjZ9.wQYK_cJmUDKDh9q6sxQsh6PpxfTQMbkU20g4Nq8WX_Q	2025-02-18 14:17:25.505726+07	2025-02-19 14:17:25+07	6	fdd668685a5f478888421045b5fbea29
154	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDAxOTA1OCwiaWF0IjoxNzM5OTMyNjU4LCJqdGkiOiI4ZDBkZTkwNGJlZTI0OTg3YTgyMjVhM2U0NTZlMzkxZiIsInVzZXJfaWQiOjZ9.oxYsSNYNI4AEj_3vtUX25bK8rOiVG9iCTP5uEqvTWpU	2025-02-19 09:37:38.797706+07	2025-02-20 09:37:38+07	6	8d0de904bee24987a8225a3e456e391f
155	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDAxOTIxMiwiaWF0IjoxNzM5OTMyODEyLCJqdGkiOiI5M2VmNWE1M2Q1MmI0NWEzYTExZGQxNjE5ZjlhY2RhZCIsInVzZXJfaWQiOjZ9.3R3DdFCvRlUK-kKJCb_zftL-f_B-zk6e-cP1a5OZ4qE	2025-02-19 09:40:12.922534+07	2025-02-20 09:40:12+07	6	93ef5a53d52b45a3a11dd1619f9acdad
156	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDAxOTM3MSwiaWF0IjoxNzM5OTMyOTcxLCJqdGkiOiJiNjdkMjU2MDE5OTg0ZWI5YTA0NDJmY2EyNzU2Y2Q1NSIsInVzZXJfaWQiOjZ9.J2ORPkcwIk9zszKl4fWYUmOD9F-OMgHp6m_8K0sMrlM	2025-02-19 09:42:51.477771+07	2025-02-20 09:42:51+07	6	b67d256019984eb9a0442fca2756cd55
157	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDAyNzMzMCwiaWF0IjoxNzM5OTQwOTMwLCJqdGkiOiJjMTBhOTAzNmFhMjI0NzczODkxMjcwOWFjMzg1OWYzYyIsInVzZXJfaWQiOjZ9.KW1V_73oLQaod1Vr8vX_MRft8XigASLchhvNOSvUJBU	2025-02-19 11:55:30.038331+07	2025-02-20 11:55:30+07	6	c10a9036aa2247738912709ac3859f3c
158	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDAyNzQ0OSwiaWF0IjoxNzM5OTQxMDQ5LCJqdGkiOiI5ZTY1ZDdkODlkM2Y0YTI3OThhNDc5NGU0YjNkZDlkOSIsInVzZXJfaWQiOjZ9.l_SkmQclAcJPY5-aKyrjcdM8OIYqPPTmfGSKf1p4BR0	2025-02-19 11:57:29.120044+07	2025-02-20 11:57:29+07	6	9e65d7d89d3f4a2798a4794e4b3dd9d9
159	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDAzNzcyMSwiaWF0IjoxNzM5OTUxMzIxLCJqdGkiOiIzN2Q2NmJlN2MzZDE0NTRiODAzMzllZmJhNzNkZGUyZiIsInVzZXJfaWQiOjZ9.KEoH3FFnQ-RV7v2wQH3UxZFeRup95LNVGS0va5MibQ0	2025-02-19 14:48:41.313409+07	2025-02-20 14:48:41+07	6	37d66be7c3d1454b80339efba73dde2f
160	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDA2MjgxMSwiaWF0IjoxNzM5OTc2NDExLCJqdGkiOiJkM2NlMDVmMDM1NTI0ZmEzYWE3MmIxZWYxNDFmMDU3MiIsInVzZXJfaWQiOjZ9.hf0Ei2MqTP-2HMmK66pJdUy4_g0P2qEdGZDessKtctc	2025-02-19 21:46:51.884702+07	2025-02-20 21:46:51+07	6	d3ce05f035524fa3aa72b1ef141f0572
161	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDA2OTQzMSwiaWF0IjoxNzM5OTgzMDMxLCJqdGkiOiJkM2YxMjE4NTAyYzg0YTUzOGJlYTRiZjc5ZWZiNThmMyIsInVzZXJfaWQiOjZ9.pcC5zStTRadU8CRAmhmjmiOUuFuVlih-btlI0wSVpgs	2025-02-19 23:37:11.678494+07	2025-02-20 23:37:11+07	6	d3f1218502c84a538bea4bf79efb58f3
162	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDE0OTk3NSwiaWF0IjoxNzQwMDYzNTc1LCJqdGkiOiI3NmFiNjNiZjlkMjE0ZWM5YWVhMGU1OTg4MmUxYTkyZSIsInVzZXJfaWQiOjZ9.K_KQWwOlkaauP9iYuvkMra-gj_amh9U-ywaV8pw2TGc	2025-02-20 21:59:35.169983+07	2025-02-21 21:59:35+07	6	76ab63bf9d214ec9aea0e59882e1a92e
163	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDI4MzQ4NiwiaWF0IjoxNzQwMTk3MDg2LCJqdGkiOiI0YmVlNTM2YzZjZGI0OGFmYjA0YWIyYmE3NDNmNjE1MSIsInVzZXJfaWQiOjZ9.ZSQ6D4jAbSkRSNE7OK_P0PARXpwoZ4I20FWhBjrv2g0	2025-02-22 11:04:46.265127+07	2025-02-23 11:04:46+07	6	4bee536c6cdb48afb04ab2ba743f6151
164	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDMwODExNywiaWF0IjoxNzQwMjIxNzE3LCJqdGkiOiJmNWY0NDAzMDMyODk0NzU3OGQxOTdlNzU4ZmIzNTdlMCIsInVzZXJfaWQiOjZ9.XYu-3D5d6UJLyclO5JK4cz61AM7gcspNcCl-wBVsV-o	2025-02-22 17:55:17.059611+07	2025-02-23 17:55:17+07	6	f5f44030328947578d197e758fb357e0
165	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDM5NTUyNSwiaWF0IjoxNzQwMzA5MTI1LCJqdGkiOiJiNWM5MDA4YjJhYWM0OWMyOGRiMWEzNWQzM2RlY2E3NSIsInVzZXJfaWQiOjZ9.KxfzR0IlBs4KfjnuY1wbOvm_d-zVrosdqDyq3q11cyQ	2025-02-23 18:12:05.099724+07	2025-02-24 18:12:05+07	6	b5c9008b2aac49c28db1a35d33deca75
166	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDM5NjgzOCwiaWF0IjoxNzQwMzEwNDM4LCJqdGkiOiJjZjExNDVjYWI5NTY0NTEyODY5ZDRlYzE3N2IyMGQzMSIsInVzZXJfaWQiOjZ9.cXTRXa_UP7J4v2QmaJRWo07bn7zD2ZxeZ3AJ2y-gPRM	2025-02-23 18:33:58.784275+07	2025-02-24 18:33:58+07	6	cf1145cab9564512869d4ec177b20d31
167	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwMTM4MywiaWF0IjoxNzQwMzE0OTgzLCJqdGkiOiI2NzY5NjdiZDU4NzM0MWYxOTIwYWY4ZjdkMzU4ZDRiNiIsInVzZXJfaWQiOjZ9.93gkpxrJye3r3ihNuoes7GxC27f03Fbwe75vX3cO-48	2025-02-23 19:49:43.158642+07	2025-02-24 19:49:43+07	6	676967bd587341f1920af8f7d358d4b6
168	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwMTU2OSwiaWF0IjoxNzQwMzE1MTY5LCJqdGkiOiJjNGY4OWZjMDMzYjQ0NDk5ODI0YzY2NjA0Yjc3MGQxMyIsInVzZXJfaWQiOjZ9.EuM6robzMecbhbMr8KSV6Omk2JP6T-BrPbThZ6pcM3s	2025-02-23 19:52:49.62217+07	2025-02-24 19:52:49+07	6	c4f89fc033b44499824c66604b770d13
169	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwMjA4MCwiaWF0IjoxNzQwMzE1NjgwLCJqdGkiOiJhNWY4ZmUxZGMxYmE0MTQ0YjZmMTM0YTY4ZTRiMTEwZSIsInVzZXJfaWQiOjZ9.aJJsVGqMLKy3TNU7Qt_fgG85NKhkqtxz8__nxem6OUU	2025-02-23 20:01:20.816377+07	2025-02-24 20:01:20+07	6	a5f8fe1dc1ba4144b6f134a68e4b110e
170	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwMjA4NCwiaWF0IjoxNzQwMzE1Njg0LCJqdGkiOiJlYmMxMWZhOTkyMjI0M2QyOWRkM2E5NDNlOWMzMDU4YiIsInVzZXJfaWQiOjZ9.74wgfbdGltXjgycEpqwPflqaYkLIAWshDut4F86kfL8	2025-02-23 20:01:24.536133+07	2025-02-24 20:01:24+07	6	ebc11fa9922243d29dd3a943e9c3058b
171	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwMjIwNiwiaWF0IjoxNzQwMzE1ODA2LCJqdGkiOiJkNzFhZGU3NDE2Njk0YzVmOTI1YTliZmJlMThhYzJjZCIsInVzZXJfaWQiOjZ9.OG-Q6Lb96VjoPoP5WhK5_nZI2VO4fyaVdVRToUSugHA	2025-02-23 20:03:26.508508+07	2025-02-24 20:03:26+07	6	d71ade7416694c5f925a9bfbe18ac2cd
172	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwMzkxOCwiaWF0IjoxNzQwMzE3NTE4LCJqdGkiOiIwY2Y1ZWVkNWZhZmM0MDZjODNlNDcwOTE4YzMwM2NlMCIsInVzZXJfaWQiOjE2fQ.AiPCwQhoY0NWh04h51acwSEspjud1Pfrmy2N_1lKLrs	2025-02-23 20:31:58.904247+07	2025-02-24 20:31:58+07	16	0cf5eed5fafc406c83e470918c303ce0
173	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQwNjg0OCwiaWF0IjoxNzQwMzIwNDQ4LCJqdGkiOiI5OTI2ZDM4ZmZjNzY0YmZmYmNhYmY3NmU1ODE3YTU5ZCIsInVzZXJfaWQiOjE2fQ.tqP_WesxDcGq7EPJydYheesI60EBIK14e7NWwmZfRoc	2025-02-23 21:20:48.8773+07	2025-02-24 21:20:48+07	16	9926d38ffc764bffbcabf76e5817a59d
174	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQxOTY2NSwiaWF0IjoxNzQwMzMzMjY1LCJqdGkiOiJlODM0NDIzNmI5MDk0NjY3YmJjYzRjNzJkNzVjYmY4MCIsInVzZXJfaWQiOjZ9.KA8VTW-7tH_CGYFyRj_UUxO0iNsBKSJdUqXwEztlhsw	2025-02-24 00:54:25.696726+07	2025-02-25 00:54:25+07	6	e8344236b9094667bbcc4c72d75cbf80
175	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQ0MzY5NiwiaWF0IjoxNzQwMzU3Mjk2LCJqdGkiOiJhMmFhZDE1M2FiZmU0MjcyYWRiZTMxMmM2ODE0NzBiMyIsInVzZXJfaWQiOjZ9.M05v3tLQJi13cxvSLCg7VUBOGt-N1kwOf_OG9_J_Gd4	2025-02-24 07:34:56.941963+07	2025-02-25 07:34:56+07	6	a2aad153abfe4272adbe312c681470b3
176	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQ0MzcwOSwiaWF0IjoxNzQwMzU3MzA5LCJqdGkiOiIwZGM0MmU0YzkwZTQ0ODU0YWMyMGY3ZmQ3YzQzODYwYyIsInVzZXJfaWQiOjE2fQ.Y2urYrD012OyR41t_DRIq_4vIWcwIlwEyB-NRXB3Aio	2025-02-24 07:35:09.269814+07	2025-02-25 07:35:09+07	16	0dc42e4c90e44854ac20f7fd7c43860c
177	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQ5OTM2NiwiaWF0IjoxNzQwNDEyOTY2LCJqdGkiOiIzNjFjNWExNTliMTU0NDQ3YjVkYmU4ODJmMmRiMWM4MiIsInVzZXJfaWQiOjZ9.IJ8oMAmpyPxQnOR_Il59az652dRbu4K9cQbugNQWMec	2025-02-24 23:02:46.719844+07	2025-02-25 23:02:46+07	6	361c5a159b154447b5dbe882f2db1c82
178	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDQ5OTQ3NiwiaWF0IjoxNzQwNDEzMDc2LCJqdGkiOiI1M2MzZThhMDZiMDA0ZjI1OTg0YTMzMDNhOWVmZmJmZCIsInVzZXJfaWQiOjZ9.azQMOnu_N0uii2YbQOBr-k9tsj20dxFZvfuW1ZpjbHw	2025-02-24 23:04:36.857279+07	2025-02-25 23:04:36+07	6	53c3e8a06b004f25984a3303a9effbfd
179	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMDI4NSwiaWF0IjoxNzQwNDEzODg1LCJqdGkiOiI5NmM1YjQyOWRhYzM0YjM0YTdkNWFkZDIzY2FlNmM2YyIsInVzZXJfaWQiOjZ9.AdYQ9GtGPdO6BAfwmYa5D3MamjSuZARBXLLji2YRB3M	2025-02-24 23:18:05.060865+07	2025-02-25 23:18:05+07	6	96c5b429dac34b34a7d5add23cae6c6c
180	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMDMyOSwiaWF0IjoxNzQwNDEzOTI5LCJqdGkiOiJjY2E4N2ViNWNiZjI0YmFmOTc0MTI5ZGNhMzY3ZGI5NSIsInVzZXJfaWQiOjE2fQ.SFttz4yuVf_rAxxvXxt2y635eNIqoJEsHpbIVOAsOZM	2025-02-24 23:18:49.184562+07	2025-02-25 23:18:49+07	16	cca87eb5cbf24baf974129dca367db95
181	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMDMzOCwiaWF0IjoxNzQwNDEzOTM4LCJqdGkiOiI3ZWE3ODliNjIzNWY0YmExYjA3OTM1NTI3OTM4MTQ1MiIsInVzZXJfaWQiOjE2fQ.2K8N-nrvwnyb4R33a232-IefZsZwwuTnVBICuSoLICs	2025-02-24 23:18:58.068513+07	2025-02-25 23:18:58+07	16	7ea789b6235f4ba1b079355279381452
182	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMDM0NywiaWF0IjoxNzQwNDEzOTQ3LCJqdGkiOiJhYjZiYmMzNTAxMzk0ZjJiYTliN2QyOWI5ZDI3N2VkZiIsInVzZXJfaWQiOjZ9.ETgXOqI0DQ19mhzVgI_V-iAXdrHMPkXfuINSm-W9-hk	2025-02-24 23:19:07.508354+07	2025-02-25 23:19:07+07	6	ab6bbc3501394f2ba9b7d29b9d277edf
183	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMDQ1NiwiaWF0IjoxNzQwNDE0MDU2LCJqdGkiOiI0ZDQyNTJkNDY0MTQ0NjI1YmRlMTZhZDY0MGJhMTA1ZCIsInVzZXJfaWQiOjE2fQ.mtzuhDs7W6FjgNNX0LQCgzRHJaqTDhpF_QBSlVBum1k	2025-02-24 23:20:56.277927+07	2025-02-25 23:20:56+07	16	4d4252d464144625bde16ad640ba105d
184	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMDU1NywiaWF0IjoxNzQwNDE0MTU3LCJqdGkiOiJkNTQzNmExODZkNzk0NGJiODViNjg4ODdiYjVhOGVlYiIsInVzZXJfaWQiOjE2fQ.gpig4sRdG_uRdJpujxcj5t-GZJenUGWhEL1I3mm6ezE	2025-02-24 23:22:37.259921+07	2025-02-25 23:22:37+07	16	d5436a186d7944bb85b68887bb5a8eeb
185	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwMjQ1NSwiaWF0IjoxNzQwNDE2MDU1LCJqdGkiOiJiMjkwZjQzNTAzNGU0MjgxOWYzM2QwZTFlYzM1NmU1NiIsInVzZXJfaWQiOjZ9.p4MKpNnjr8mx9T6AzZKfjfiwt1qjKu8tnBPwsOI7bJk	2025-02-24 23:54:15.048312+07	2025-02-25 23:54:15+07	6	b290f435034e42819f33d0e1ec356e56
186	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwNDA4NCwiaWF0IjoxNzQwNDE3Njg0LCJqdGkiOiIwM2ZiY2ZlMjJmN2I0YzAzYTU0MjkzYzJkMzQyYzc2NCIsInVzZXJfaWQiOjE2fQ.BkQZ4Iirer7ptSUc9ZdypRDpLImLNaLPOksBe3B3K9Q	2025-02-25 00:21:24.408601+07	2025-02-26 00:21:24+07	16	03fbcfe22f7b4c03a54293c2d342c764
187	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwNDg5MiwiaWF0IjoxNzQwNDE4NDkyLCJqdGkiOiI0ODk1NTg5ODcxNjY0MmNkOGJkYzEzOTFkNzIzMWIyZCIsInVzZXJfaWQiOjZ9.ajwNMQj1fNptxpiySswS-sp0SO6_nZ0M4zMrsLJL-SU	2025-02-25 00:34:52.456134+07	2025-02-26 00:34:52+07	6	48955898716642cd8bdc1391d7231b2d
188	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwNTM0NiwiaWF0IjoxNzQwNDE4OTQ2LCJqdGkiOiI2ZGJiNDkyMmM3N2E0YmVkOTVmYmYyYjI1NDAyMmU0ZSIsInVzZXJfaWQiOjE2fQ.EuJiS6ZqTm8Ssfa6U-uIZ-aIJrVVarMgSVw8t0BjC0E	2025-02-25 00:42:26.863751+07	2025-02-26 00:42:26+07	16	6dbb4922c77a4bed95fbf2b254022e4e
189	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwNTM2MywiaWF0IjoxNzQwNDE4OTYzLCJqdGkiOiI2M2Q1ZTdmNjYyYWI0MTJlYjY5OTRkZGJmYzUyZTFlNyIsInVzZXJfaWQiOjZ9.PNGoAkMwEbS9hs_4tbklGzIUIP5RZ35lQxtkAHeeLgs	2025-02-25 00:42:43.722978+07	2025-02-26 00:42:43+07	6	63d5e7f662ab412eb6994ddbfc52e1e7
190	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwNTQwNCwiaWF0IjoxNzQwNDE5MDA0LCJqdGkiOiJlNzY0MzQzOWY2M2E0MjgyOGE5ODgzYzE3MTk5MDZkNiIsInVzZXJfaWQiOjE2fQ.pVS1-JMlcaXIMLzMzVTHlp0TLdAIuVfLbQgUxKlpbHA	2025-02-25 00:43:24.318223+07	2025-02-26 00:43:24+07	16	e7643439f63a42828a9883c1719906d6
191	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwNzg3NSwiaWF0IjoxNzQwNDIxNDc1LCJqdGkiOiJhYThiOTA3Y2VkNDM0M2YyODRjNWFkYjczYTc5NTQ2MCIsInVzZXJfaWQiOjZ9.3Meb0xovsv8LEkH0Kmr05aA0B-_FVJ9B3kIVwSeMhfg	2025-02-25 01:24:35.526269+07	2025-02-26 01:24:35+07	6	aa8b907ced4343f284c5adb73a795460
192	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwOTQyNCwiaWF0IjoxNzQwNDIzMDI0LCJqdGkiOiJlNjM5NDM3M2U4NWU0ZTFkOWM3MzM5OTFmOTBlMzU2ZCIsInVzZXJfaWQiOjE4fQ.7ikrztb28h3q12A13zbhhurz-6bpwfEnSFYVgP3bjEw	2025-02-25 01:50:24.666317+07	2025-02-26 01:50:24+07	18	e6394373e85e4e1d9c733991f90e356d
193	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUwOTU1NCwiaWF0IjoxNzQwNDIzMTU0LCJqdGkiOiI0MmVmYjRiMzU1ZTc0Y2Y5OGZlZjZjNmQ4NGJlYTg5MyIsInVzZXJfaWQiOjZ9.ONd32PmGWW12Gn8fe6-SaxWeZH4mYDdJtXtujMb9QBs	2025-02-25 01:52:34.977531+07	2025-02-26 01:52:34+07	6	42efb4b355e74cf98fef6c6d84bea893
194	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMDYyMiwiaWF0IjoxNzQwNDI0MjIyLCJqdGkiOiI5MTJjZGQ4MTU5NDg0MGQzYWM1M2MzMjE4MGE0N2IxZiIsInVzZXJfaWQiOjE2fQ.ic8KjklzLFYMhw_uKtVHCEgj5ABj0BHzCNqqrZd8IMU	2025-02-25 02:10:22.005604+07	2025-02-26 02:10:22+07	16	912cdd81594840d3ac53c32180a47b1f
195	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMDY2OSwiaWF0IjoxNzQwNDI0MjY5LCJqdGkiOiJlNGM3YWRmMmIyYmM0YTg2OGY1YjM0MzBjODUzYmI1NiIsInVzZXJfaWQiOjE4fQ.LYo4Vz-2MT2HlzyAHNv7LSFvgWf0HXABpwZvtjG79wY	2025-02-25 02:11:09.107057+07	2025-02-26 02:11:09+07	18	e4c7adf2b2bc4a868f5b3430c853bb56
196	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMDY4MiwiaWF0IjoxNzQwNDI0MjgyLCJqdGkiOiJkZmIwMzRiMjExYTU0NzM4YTViNWJkNTYzMDJjMDlkYSIsInVzZXJfaWQiOjE2fQ.NRerHR4oRZy639g9U1TolYdTly13gzHyXbhhtWz9xj4	2025-02-25 02:11:22.359193+07	2025-02-26 02:11:22+07	16	dfb034b211a54738a5b5bd56302c09da
197	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMTA3OSwiaWF0IjoxNzQwNDI0Njc5LCJqdGkiOiIwNDJhMjg1Yjc0MTQ0ZmRmODdkMDkyN2JkZWYwNDQ4ZiIsInVzZXJfaWQiOjZ9.MO5ACBo1GNJtTuYSQEL5CDCJZHx6oQHeoKmCFkSDWvI	2025-02-25 02:17:59.161537+07	2025-02-26 02:17:59+07	6	042a285b74144fdf87d0927bdef0448f
198	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMzEyNiwiaWF0IjoxNzQwNDI2NzI2LCJqdGkiOiJiNDVkYmZlNDc2YmU0MjZmYmFhZTA2ZTk3YTRjYjZiNCIsInVzZXJfaWQiOjMzfQ.ompSBDukJuU2oonHLRnxmLzBHbZhuZxhKzZNxKneXDk	2025-02-25 02:52:06.969681+07	2025-02-26 02:52:06+07	33	b45dbfe476be426fbaae06e97a4cb6b4
199	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMzE5MiwiaWF0IjoxNzQwNDI2NzkyLCJqdGkiOiJkY2FhODI5NGI4NWU0MTNiOTExNzlhMmNjY2M2OWU3ZiIsInVzZXJfaWQiOjMzfQ.S69XCc72Uv6lbpkNqEGkkdu00FftfgiyLRUjVC9lrso	2025-02-25 02:53:12.682672+07	2025-02-26 02:53:12+07	33	dcaa8294b85e413b91179a2cccc69e7f
200	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMzYwOCwiaWF0IjoxNzQwNDI3MjA4LCJqdGkiOiI3Zjg2OGRmODU4NDY0MzVhYTY3MTk0OTRiNDA3YTlkMiIsInVzZXJfaWQiOjMzfQ.7dqk1aWlC_uYvU7Pl9cCYQI3VsdSqUhjDyFw-U9qiNo	2025-02-25 03:00:08.725603+07	2025-02-26 03:00:08+07	33	7f868df85846435aa6719494b407a9d2
201	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxMzcyNywiaWF0IjoxNzQwNDI3MzI3LCJqdGkiOiIyNTk3MmE3MDNkMWI0ODhmOTJhMTM2OWQzMjE3MWEyYSIsInVzZXJfaWQiOjMzfQ.uSOhlUTRaabzWHnbpfYSK43E-niZL7T55dP6aqTSDkc	2025-02-25 03:02:07.88223+07	2025-02-26 03:02:07+07	33	25972a703d1b488f92a1369d32171a2a
202	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxNDA3NCwiaWF0IjoxNzQwNDI3Njc0LCJqdGkiOiJiYTIwZTMwMzYyZjY0ZWE2YjYyMWQzYTcwMjMxNWYxYSIsInVzZXJfaWQiOjZ9.ev__2rnTsUVOnMc4cJ-_KpoORKKFRL1NAOsRdjCJuOE	2025-02-25 03:07:54.239023+07	2025-02-26 03:07:54+07	6	ba20e30362f64ea6b621d3a702315f1a
203	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxNDI1NiwiaWF0IjoxNzQwNDI3ODU2LCJqdGkiOiIyNTQ0MjM5OWZhYjc0MmY5OTcxZjI5N2U1YWU0ZmRiZSIsInVzZXJfaWQiOjE2fQ.-TS80fpBle58hhjbPxhiBLnCwUprOULeei6FYZkyFBs	2025-02-25 03:10:56.259995+07	2025-02-26 03:10:56+07	16	25442399fab742f9971f297e5ae4fdbe
204	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxNDI5OCwiaWF0IjoxNzQwNDI3ODk4LCJqdGkiOiIxZTA0NTZmOGEzODA0ZGY1YjFjNTNiNmUwZmJhYTYzMSIsInVzZXJfaWQiOjZ9._r9mFn1GPra8VGFOb6rIshZtKh-77KllHhGQRbs8yno	2025-02-25 03:11:38.812871+07	2025-02-26 03:11:38+07	6	1e0456f8a3804df5b1c53b6e0fbaa631
205	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUxNDMxMywiaWF0IjoxNzQwNDI3OTEzLCJqdGkiOiJlMTRkZDQyMWE2NDA0YmZmYmYwNzRkYmQyODc0YzU2MSIsInVzZXJfaWQiOjMzfQ.rOepQQ9Vc9azH2kp4cLEEaZWqtKYkAJS54cjy0x6Esc	2025-02-25 03:11:53.634885+07	2025-02-26 03:11:53+07	33	e14dd421a6404bffbf074dbd2874c561
206	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDUyOTM4NCwiaWF0IjoxNzQwNDQyOTg0LCJqdGkiOiJlYTEzZDg4ZTVlOWI0OWU4YmU0MTk5NzM0MWZhZDg0ZCIsInVzZXJfaWQiOjMzfQ.qvQykH-pbDXm1EvVvN2N9E1rQ0AzCZjLsD8ckLYhaao	2025-02-25 07:23:04.396537+07	2025-02-26 07:23:04+07	33	ea13d88e5e9b49e8be41997341fad84d
208	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYwNzM2NCwiaWF0IjoxNzQwNTIwOTY0LCJqdGkiOiI1MDUyMTVjOGY0NzU0MDcwOWU2YjFlMjQzOTJjMzQ5NSIsInVzZXJfaWQiOjE2fQ.crIYjexxOpqHDbdW-calJtNGwSnHCAw8GNqtxelsljw	2025-02-26 05:02:44.197251+07	2025-02-27 05:02:44+07	16	505215c8f47540709e6b1e24392c3495
209	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYwNzQyMiwiaWF0IjoxNzQwNTIxMDIyLCJqdGkiOiI5NjM1MmJlZDU0Y2U0MGNlYjcwMTc4MDdhNWFkYTU3MyIsInVzZXJfaWQiOjZ9.7k82zKWzwZB1c5CPzaJMfZYeelH7xlZSdorJ7XEwU0I	2025-02-26 05:03:42.660704+07	2025-02-27 05:03:42+07	6	96352bed54ce40ceb7017807a5ada573
210	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMjMyOSwiaWF0IjoxNzQwNTI1OTI5LCJqdGkiOiIyYzg2NDJhNzljNzc0ZGE1ODAyNTYyMTY5Y2UwOWZkNCIsInVzZXJfaWQiOjE2fQ.GT0JSLMS5jR7t8rkzeYOuYz2LxDLELHDQ5dej7pyRiQ	2025-02-26 06:25:29.029263+07	2025-02-27 06:25:29+07	16	2c8642a79c774da5802562169ce09fd4
211	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMjk4MCwiaWF0IjoxNzQwNTI2NTgwLCJqdGkiOiJkMjM5MGE2OWE4ODQ0OTY0YmRhZGVkOWNiMmU0ZTEwNiIsInVzZXJfaWQiOjZ9.wsglvjCxSkN7IlblgHbi0ww_d5ytLHG7wqlxzJ0YKFM	2025-02-26 06:36:20.597896+07	2025-02-27 06:36:20+07	6	d2390a69a8844964bdaded9cb2e4e106
212	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMzAxOCwiaWF0IjoxNzQwNTI2NjE4LCJqdGkiOiIxYzMyYjIzMjlkNTQ0NmE0OGQyMmYyZmI3OGI4MWRjNCIsInVzZXJfaWQiOjE2fQ.bAFOxHmSwyCiFzcuDifMMEB18Grw808Rmph9ZGK6QJQ	2025-02-26 06:36:58.547892+07	2025-02-27 06:36:58+07	16	1c32b2329d5446a48d22f2fb78b81dc4
213	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMzA5NCwiaWF0IjoxNzQwNTI2Njk0LCJqdGkiOiJhNjY3Yjc5YzNjMjU0NTY2OTBkNDVmZmUxNjY2NWY1ZiIsInVzZXJfaWQiOjZ9.NJ7uf8rvh2hsV3P--0atG1ZnDugrQVmv_NeKO6XOUnY	2025-02-26 06:38:14.833133+07	2025-02-27 06:38:14+07	6	a667b79c3c25456690d45ffe16665f5f
214	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMzQzMCwiaWF0IjoxNzQwNTI3MDMwLCJqdGkiOiJlMTUzYTYzN2MzZWU0YjI5YTgxMmMxMjdlYjhkODU5MSIsInVzZXJfaWQiOjMzfQ._G9EyAcr7jcP_H6jwo7s9Gq1vMLU35lC1FmrRJKQRcs	2025-02-26 06:43:50.662207+07	2025-02-27 06:43:50+07	33	e153a637c3ee4b29a812c127eb8d8591
215	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMzQ4OCwiaWF0IjoxNzQwNTI3MDg4LCJqdGkiOiIxYTRhOWIwZjE4ZGE0YTc3YWU5OWEzNzE0MzkzY2NkNCIsInVzZXJfaWQiOjE2fQ.9TLBQiQroce3Hs4MAC5TJ-x14lK_Cg6s1vfkItSSO6o	2025-02-26 06:44:48.037965+07	2025-02-27 06:44:48+07	16	1a4a9b0f18da4a77ae99a3714393ccd4
216	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxMzUwNiwiaWF0IjoxNzQwNTI3MTA2LCJqdGkiOiJlODliODFhOTE3MzU0MDM0OWFjNjkzNjQxMmM0NDdjOCIsInVzZXJfaWQiOjE4fQ.DWINVeHLiEWFtCd5V7ITedp_N-vAB_jku2XrrVZnr8s	2025-02-26 06:45:06.778277+07	2025-02-27 06:45:06+07	18	e89b81a9173540349ac6936412c447c8
217	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxNjc3NCwiaWF0IjoxNzQwNTMwMzc0LCJqdGkiOiIzYWFlMzQwMWJjZDU0YmE1OTcwN2FkNTU5MjJlM2QxYSIsInVzZXJfaWQiOjZ9.v0kfVtHWFOQdzQTpGnuWDiFMC1Y3X3I_MTVc-o5UAd4	2025-02-26 07:39:34.184746+07	2025-02-27 07:39:34+07	6	3aae3401bcd54ba59707ad55922e3d1a
218	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxNzg5MiwiaWF0IjoxNzQwNTMxNDkyLCJqdGkiOiJlMmJlNDQxNzY2ZDc0YzcxOTg5YzIzNGZlYzM4ZDJiNSIsInVzZXJfaWQiOjE2fQ.85fUHCA-PqNzQO91Gs3dXcUrkPSoFvLXQgzW_WWDUbo	2025-02-26 07:58:12.63856+07	2025-02-27 07:58:12+07	16	e2be441766d74c71989c234fec38d2b5
219	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYxNzkyMCwiaWF0IjoxNzQwNTMxNTIwLCJqdGkiOiJlOTBkMTQ4NjYxOGY0ZWFiYTBjY2Y4MGU2OTJhZWRiYyIsInVzZXJfaWQiOjZ9.BZ34GEZRempma7_AsMQlCvW5U6zfBtB7E79Hlo1_jPU	2025-02-26 07:58:40.990818+07	2025-02-27 07:58:40+07	6	e90d1486618f4eaba0ccf80e692aedbc
207	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDYwNzE5MiwiaWF0IjoxNzQwNTIwNzkyLCJqdGkiOiJiZjIxODJlNmQyNDU0ZWEwODA1MGFhODg2YTM1NGJiOSIsInVzZXJfaWQiOjQ1fQ.89tVgSonI4HoQxVhpkqC_Upe4IzJQYvCdOkTAuxRxpw	2025-02-26 04:59:52.606429+07	2025-02-27 04:59:52+07	\N	bf2182e6d2454ea08050aa886a354bb9
220	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDY2ODczNiwiaWF0IjoxNzQwNTgyMzM2LCJqdGkiOiI1Yzc3OTI2N2FlM2E0NmNlODRhMjhmMWVjOGE0NDdmYSIsInVzZXJfaWQiOjZ9.ZOQv_jgXg8MO2PTL29EZh150UcitfJMIvwKzYoshUCU	2025-02-26 22:05:36.793871+07	2025-02-27 22:05:36+07	6	5c779267ae3a46ce84a28f1ec8a447fa
221	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDY2OTI3NCwiaWF0IjoxNzQwNTgyODc0LCJqdGkiOiJjYWEwMjkyMDIwMDE0ZGVhYTlhMWRkMzJmYThiNThhMiIsInVzZXJfaWQiOjZ9.O89ibobXffYDrDRNlihCLEcsUVlnSnT-oSmnlDtyqCk	2025-02-26 22:14:34.763286+07	2025-02-27 22:14:34+07	6	caa0292020014deaa9a1dd32fa8b58a2
222	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDY2OTYxNywiaWF0IjoxNzQwNTgzMjE3LCJqdGkiOiIzMDMyMzdjNjE2YWY0MWNmYjQyMDY1YTY2NDIxMGY0OSIsInVzZXJfaWQiOjMzfQ.BgPkUjTgif6YqiSQ2fz1ZC0tEsE2n4B0y9D0Ru0BcgQ	2025-02-26 22:20:17.306557+07	2025-02-27 22:20:17+07	33	303237c616af41cfb42065a664210f49
223	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDY2OTYzNiwiaWF0IjoxNzQwNTgzMjM2LCJqdGkiOiJlYjQzYjNkZDkzZDU0YjYzOGI2MGI4OGQxZjRhNjUwNCIsInVzZXJfaWQiOjZ9.rxegG6S5qFLDyr_iFW1d3fGK7vZq3yDG13vMk4_P0p0	2025-02-26 22:20:36.690538+07	2025-02-27 22:20:36+07	6	eb43b3dd93d54b638b60b88d1f4a6504
224	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDgzNjMwMywiaWF0IjoxNzQwNzQ5OTAzLCJqdGkiOiJhYWM0NGVhYmEyYzY0MTlkOGRkNjlkMTIyZTc4YjA0YSIsInVzZXJfaWQiOjE2fQ.C32n1ir5nvHgjHyf7OBGMqUiUhz6KRGSYacwmE7yBQA	2025-02-28 20:38:23.398348+07	2025-03-01 20:38:23+07	16	aac44eaba2c6419d8dd69d122e78b04a
225	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDgzNjc5NCwiaWF0IjoxNzQwNzUwMzk0LCJqdGkiOiJhMTBiNzNkZWUxZjg0ODBmYmNhYjVjMDBiZjE5N2YzMSIsInVzZXJfaWQiOjMzfQ.lx5u0CUp7lh6jH1mIvLsc1vqBCH-10aNtCAxAf7EmiY	2025-02-28 20:46:34.166401+07	2025-03-01 20:46:34+07	33	a10b73dee1f8480fbcab5c00bf197f31
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, email_verified, phone, is_login, reset_password_token, reset_password_expire, created_at, updated_at, role_id, profile_picture) FROM stdin;
18	pbkdf2_sha256$870000$shjxS5VmDYLNLw0zC2N7JV$tfvYok3Zdrvtzl7RdAb2zgPdrIqyTKtiolGq390P0Dc=	\N	f	nurse3	Kimberly	Watson	f	t	2025-01-26 14:11:25.442375+07	nurse3@hospital.com	t		f	\N	\N	2025-01-26 14:11:25.896556+07	2025-02-26 07:39:31.129062+07	10	\N
12	pbkdf2_sha256$870000$yM25KxJR7sgw4TvStKjy28$tg8ok5JoQJrpEl3hRgmRCCwbVB8Ls/H1PxtdsgDnsng=	\N	f	management7	Ashlee	Snyder	f	t	2025-01-26 14:11:22.699497+07	management7@hospital.com	t		f	\N	\N	2025-01-26 14:11:23.1694+07	2025-02-16 03:46:59.943671+07	9	\N
7	pbkdf2_sha256$870000$QRUmWDZKEYvc1J3y08gzSH$XumxYIaqcprKmI/qIM1/o7K0snhXpXTZ1cDZHGGlriw=	\N	f	management2	Melinda	Hernandez	f	t	2025-01-26 14:11:20.387741+07	management2@hospital.com	t		f	\N	\N	2025-01-26 14:11:20.831569+07	2025-02-14 07:38:31.625066+07	9	\N
22	pbkdf2_sha256$870000$wGZYchtI0OnxC2aQRolXTf$jQFI6vqh2qHC1a4O/pbHXS0bj99acrpDfEW3J1KFfkA=	\N	f	nurse7	Jennifer	Coleman	f	t	2025-01-26 14:11:27.364024+07	nurse7@hospital.com	t		f	\N	\N	2025-01-26 14:11:27.917349+07	2025-01-27 10:05:49.012682+07	10	\N
19	pbkdf2_sha256$870000$nCWM85DNjY2ccski0k8oUv$/GZ5GGr0+++BoplsX0fEMUtdOhp8NHlXJNCBChcdBJg=	\N	f	nurse4	Eugene	Moore	f	t	2025-01-26 14:11:25.89956+07	nurse4@hospital.com	t		f	\N	\N	2025-01-26 14:11:26.399479+07	2025-02-02 21:30:05.786185+07	10	\N
28	pbkdf2_sha256$870000$fEO0xscOddpBUw3ygGmkQu$s0JPMmr81urpi2YG4Z5FMyodoDbHML4qI3gXZ3WB5kk=	\N	f	nurse13	Ashley	Roberts	f	t	2025-01-26 14:11:30.151876+07	nurse13@hospital.com	t		f	\N	\N	2025-01-26 14:11:30.572794+07	2025-01-27 10:05:51.80667+07	10	\N
9	pbkdf2_sha256$870000$VSVTqCxoJVW1qJSAD4YJIp$l2cYPMeOgGgrzn+i+12pd4YKTA1OjFu86WKvrCa9EC8=	\N	f	management4	Sandra	Marshall	f	t	2025-01-26 14:11:21.295925+07	management4@hospital.com	t	12345678	f	\N	\N	2025-01-26 14:11:21.733364+07	2025-02-26 06:10:35.389584+07	9	\N
24	pbkdf2_sha256$870000$FmjmIePCTWzL10ifL0czyh$NFh9nnqhq/DBpUZNn8JKztaeJOTypUCbNZS8ZTlOLxA=	\N	f	nurse9	Christopher	Brown	f	t	2025-01-26 14:11:28.3717+07	nurse9@hospital.com	t		f	\N	\N	2025-01-26 14:11:28.816633+07	2025-02-12 11:55:55.875812+07	10	\N
17	pbkdf2_sha256$870000$L6NhID3kFbFhEpaYNykNhm$XWgCkuLUGxtOWlYfW+1XCzygN4x0V+utTcbRo1LFLOI=	\N	f	nurse2	Megan	Nolan	f	t	2025-01-26 14:11:25.000809+07	nurse2@hospital.com	t		f	\N	\N	2025-01-26 14:11:25.438853+07	2025-02-05 20:18:53.320224+07	10	\N
31	pbkdf2_sha256$870000$pR2bShCRdHUte95NSvaP9n$DNkTUtMize3btWLOtOx/Z3CCK3AAru2Wlj9Htv7f0ro=	2025-01-29 01:08:44.717706+07	t	adminsuper			t	t	2025-01-29 01:08:11.700548+07	adminsuper@gm.com	f		f	\N	\N	2025-01-29 01:08:12.145942+07	2025-01-29 01:08:12.145942+07	\N	\N
13	pbkdf2_sha256$870000$OxpLsCSoJ7UN2le2KXFO25$RwrBg4hHft/5Mil0Dly48MsH2GxdRAhF5dnJkxZ7lXg=	\N	f	management8	Veronica	Torres	f	t	2025-01-26 14:11:23.172433+07	management8@hospital.com	t		f	\N	\N	2025-01-26 14:11:23.610438+07	2025-01-27 10:05:56.428171+07	9	\N
23	pbkdf2_sha256$870000$rQnaBxdSPdGxBN2cbuzp6F$h2k408ZZ5qxxTzvytPtXJWe13rUXlN6Xy3Gm/goC86Q=	\N	f	nurse8	Shelly	Williams	f	t	2025-01-26 14:11:27.920339+07	nurse8@hospital.com	t		f	\N	\N	2025-01-26 14:11:28.368174+07	2025-01-27 10:05:49.471121+07	10	\N
25	pbkdf2_sha256$870000$PymtrpmVEB8zNOagrP5J7W$BzpZ9kwgjVyvHFMVJJbV+Vq9A4vXwj9gOmpG8elGhEU=	\N	f	nurse10	Hannah	Andersen	f	t	2025-01-26 14:11:28.819631+07	nurse10@hospital.com	t		f	\N	\N	2025-01-26 14:11:29.271921+07	2025-01-27 10:05:50.430561+07	10	\N
10	pbkdf2_sha256$870000$OK9QAieLzaCKwOWGBErbjF$N6DnAKTqxmXwmx1qIkIuicpp47WujDyB75nhjEmH3G0=	\N	f	management5	Christina	Hanson	f	t	2025-01-26 14:11:21.737369+07	management5@hospital.com	t		f	\N	\N	2025-01-26 14:11:22.196491+07	2025-01-27 10:05:55.073187+07	9	\N
26	pbkdf2_sha256$870000$qUrNMLctFUMbMwQVQJAOOG$l3u96CzH5FyknENGrGJN1Z+sDRMVQnW20JlJo4fbWwI=	\N	f	nurse11	Michael	Conrad	f	t	2025-01-26 14:11:29.274448+07	nurse11@hospital.com	t		f	\N	\N	2025-01-26 14:11:29.711469+07	2025-01-27 10:05:50.881509+07	10	\N
37		\N	f	anything	test	tester	f	t	2025-02-25 08:18:52.778414+07	anything@gmail.com	f		f	\N	\N	2025-02-25 08:18:52.779414+07	2025-02-25 08:18:52.779414+07	9	\N
6	pbkdf2_sha256$870000$Rfvgd86fJ1qZsRxfA5M4DL$fPtaogm5Io1qI4bw824RuHTJ0okAzWk7OHaztsEFa1I=	\N	f	management1	Derek	Carlson	f	t	2025-01-26 14:11:19.917107+07	management1@hospital.com	t	0129471421	t	\N	\N	2025-01-26 14:11:20.385794+07	2025-02-26 22:20:36.695531+07	9	\\xffd8ffe000104a46494600010100000100010000ffdb008400060606060706070808070a0b0a0b0a0f0e0c0c0e0f1610111011101622151915151915221e241e1c1e241e362a26262a363e3432343e4c44444c5f5a5f7c7ca701060606060706070808070a0b0a0b0a0f0e0c0c0e0f1610111011101622151915151915221e241e1c1e241e362a26262a363e3432343e4c44444c5f5a5f7c7ca7ffc20011080517036503012200021101031101ffc40032000101010101010101000000000000000000010203050406070101010101010100000000000000000000000102030405ffda000c03010002100310000002e0387d7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009cceb3e3e3ae5e93c7e779fb99f0e5cfbaf0e27bbaf074bee3c5eb37eabcfef9e9f533674a000000000000000000000000000000000000000000000000000000000000000010b27c171f77c7e7e7a793b728df0a8640250010b643490e9f47c89bf5fe9f03b63d3ed3e6fa39faa850000000000000000000000000000000000000000000000000000000000041c3e7f3b7e6e9ce3af8ac10001650b4cb70c288002a0a835f57c89af77a785e9f3f77d431dc00000000000000000000000000000000000000000000000000000001ccd7978f9faf850df98944b008582ada8435702a04a22c80160b72ad6b14f4beef03eee7ebf492f3f600000000000000000000000000000000000000000000000000000304f25c3b7810d79c8800045162a9a9733ad9be33ac4c351254b900522c00a96adcd3d0f43c1f4f9fb7ec1cfd40000000000000000000000000000000000000000000000000083cdebe6f4f24874f1a5804008a2cb43a4b9d7d1d73e9f937f7f49bf32fa995f2f9fadc93cccfa7c6f2f85d7178e45cd4a4a80152d5df3d2fb5dbc6f5f8fd1d0cf50000000000000000000000000000000000000000000000009f2f6f1b5c262cedf3c402094b9a0aa37ebe77f1fdbf67d1cfbfc7f677d473d6c99b699c751f3f2fb62f97f07e8b95bf95f9ff41f0eb3e5bbf0df9ea548b002a5adfd7f16e6fddbf17dbc3e903400000000000000000000000000000000000000000000097e267e2e58bdfe6425c8408500a3a4f666f7f44fb79769ddb4cdd0cb45cda228cb433350e3e77adccfcefc3edf9ba79ed67a79aa68c82a5ab6535eef81e9f3f57da39fb4000000000000000000000000000000000000000000002785e8f91d3c5b1d3cb258040002cfb17ecfaf1e8f1f46fbcda34a4509a8452c511449624cef270f17def9d7f33f27abe7ef9f21be5ac8016cb57af2c4d7e8ae37c3ea800000000000000000000000000000000000000000009791e4fccbdbe4ee26a41000006fd9e1e973edd7eccef3ad6f3a2d94a00228022892c599d6499d43cff0ff0053e4a7e7e76e3db80200d66d5961ebfd5e77a3c3e9d13a0000000000000000000000000000000000000000004f83eff235c7e3b35d7e75973410000fabe7f733bede84e9cfab729ad4ab6a8002000a9449a8673a86562679f5c9f9ef27f61f97d63e61d390005b2d77f67c0f7f97ba8c7a4000000000000000000000000000000000000000002781edf81bf2359d74f1a5941000d1f6fe8be3f4f9775ba973bbbaceb54cdd0c37093a44ccdc5cb43375ab39cea384ef9978ceb9394e9cccf93eb738fc5beaf97af00b006b3a31fa2fcf7b78f57d039fb4000000000000000000000000000000000000000010f93c7f4fccebf3daceb5c12c09401f67c7efe75eaf5e7ac75e9792bb5f33167aaf1b67b3d3c6ef1e9be7e8bd6e29506a3296f3caf59f27cf67a59f261ea63cefa0fa312cb8c6b39be6fe7ff59f98df3e637cc05949eaf95f7e7b7a89797d1000000000000000000000000000000000000000012c3c9f8be8f9fb7cb6b3ab88416500d7ea3c3fd3e3a5e9d35379b516218cf5c9c5da1379a74d6346af3d8c6f273961cf97d14e3ae94bbc8d490cf2ef93e3f0bf4be79f961d782582ca3e9f9ba4d7bd65e3f5400000000000000000000000000000000000000004b0f039d9dbe4b59b62582ca01eefbde7fa3cbb74672ba7cfc57ea9f1f24f41f0743d1bf0f63b675cd7a74e1d8da92677c899925d39fcf5df1e77c773fa0bf9dfa4f63a78df54d7a2e1da271eb83f1bcbd0f3faf04b2c59410fd1de5d787d7000000000000000000000000000000000000000018de0fcf0eff216512c2a51db97a735fa0efcfa73eb393e59ac7c5d3d5de3c5f2bf45e2eb9fcbd1ab3f42f67cdc74deb877cedf47c7f4c7d1736cbc3a7031797697e6c6bd1de7f33e67b7e0ef975fa7e1f40f7bc3fd3f999dcfb7ccfaf9f5faa73ea78be0feb3f27be495be72ca2587b5f57c5f6f1fa8136000000000000000000000000000000000000000e7d327e75677f90b2896140fd1fe7bf5f8e9f4ea6b1d39fcbf6e17e1cfdd4f8bcef7dacfe77ecf57272c774bf37d5332cfa38f53b6b9db1cb7ce3975e7a5f97af759f2f9dedeacf07edf57279b3d2c675f26fe8a635b872fc97ebbf3f71e4b59ebc65944b0f4fd1f2fd4e5f4833d40000000000000000000000000000000000000012c3c0e7f47cfdbe52cb72960b29f77ea7c0fd173edab2e749b186e126b3599a8665b2e27419d29aa2633a8b26a869665aa49a1874466da666f072f37d4f9cfc8e3af2ede7965203eef5bc8f5f97d00cf70000000000000000000000000000000000000004a3c8f8bd1f3bafcd0d72b2c1653f4deafcbf572ef75372969958b9cef2673aa66e8640486ee6999726ee69b35660d2c590b699d519c6f063975e69f94f93d0f3faf0962c03eef5bc9f5b97d00cf700000000000000000000000000000000000000003e0f2bd9f1ba78037e701db8fd91fabedcbaf3efad674ba4a33b2e26e465a565aca630e52eee3a16ad671d39c37c87d3be7d2c255942d524d64ce3788c63784fce797eaf97d78e45c81f7fabe5fa9cbe8867b00000000000000000000000000000000000000001cff003ffa3f037e4e63a78c07dff07a32fea378df3edad674b759abb66a258aa2678ebe253a755ceeed33ad68e38fa391c397d3ce57d5f2744fa2e374d674689633ac4671ac467361f9ef27d5f2baf182e40f4fd1f87eee3f4c2740000000000000000000000000000000000000000278fec79fae3e60ebf3807a5e6fa72fe9b78df3edab9abbb9d1ab04962a2470f9febe075edce59d5e3fa2bf56b8d4ebc1ccdbcffb56350df4cd8d6b1aada2c99b9973cf589332e4fcef99e8f9dd784160a7b5f4e37c3eb0280000000000000000000000000000000000000000f9be989f9c6f1dbe4853d2f37ef97f55bc6f9f6b655d5cd357144665ace8b8d2ce37ac5c72fa7471bd2272cfd03867bc5e5d94b086f9d378d2cb8b9339d66339de0fcbfc3f4fcdd7ce14ebcbed9bf5acbc7ea000000000000000000000000000000000000000000251e57c1ee787d7e786b83e9f9b47edba72e9cbbeaacaa1604cdcada8815350698874722f5bc769b99a4216e2c522eee6a5cd8673bc99c6fe3b3f2b83af001ebf93efe3d3d073f7000000000000000000000000000000000000000000013c3f73e3d71f2075f9c07ebbedf1bd8e7dba5cee6822ca3337933271aecf9716fdb8f96afd13897bdf9e9f43e6a7d13e71f4be5927d6f97b33decd4352accea24ceb267c6f5ff33ac79c3a7203e9f6be1fbb97d1a33d800000000000000000000000000000000000000000004a3c2e1ed78bd7e686b97a7fa5fc57ec31d3e9df2de77bb9b2db9a5cea1cbe7faf35f9cfb7efe177c73f559d3e07d786f36539e7b8e33e8cd717d09cfe3f575d1cb5acea4a412c2635cce3f90f6fc1e9c83586b3e84dfa3b978fd400000000000000000000000000000000000000000000002795eb66e3f3ae9cfafcb7bfe0765fd8f4f9fb73edd59b2eae29b92925959c741f3e7eccdd7cb7ae1acaa58b4c67bed3e6edd631049ab05646a4c8e1bf16cf2b81d7801af7be4fbf97bc33e8000000000000000000000000000000000000000000000000f3fcbfd1f85d3c5c46fcbee7b5f8bfd4e3a7df79ef3bd5cd976949359165b2eb3a541610b734d49119d424a8b10264b873397e5beaf87a710d65bc7497deabc7eb000000000000000000000000000000000000000000000000013cdf4b8dc784b3b7cb7d3f30fd877fcafe8f9f6fa75cb59bd2f3d2ee14aa8d66aeb21252ad2655126b2656132c8cb997c6ebe16f9c1be603b71f533d3d04bcbe980000000000000000000000000000000000000000000000000961e3fcbfa1f23a787e459bf33edf891fafedf94fd163afd7796e6bb5e7b35bc6d554cb50cda596d4cac2637ce266f318607993c3df3437cc01e84d72f60e5f4689d00000000000000000000000000000000000000000000000000479771bf4fc6fdcf6f9de77e67f71f36f1f827d5f3613a731fa3f43f19e9677fa3ebf276cf4efd387497a5cd34940165119273d728727cf674f1fe5f877cc35800dfe80fce779c65fd0efcaf5797d309b0000000000000000000000000000000000000000000000004bc8f93cbd5edf2ff49fa0e3f474c46d679ff8dfe83f2c7e027dff000e2c06fdaf091fb4dfe37d49bfd1f4f3beacf4fa2f1b2f5bc8759ca1bce39274e5e4f8fac7afe3736b9850f64f37dcfd0f7d4f977db1a7e4fc4fd67e4f16fbbe0f4c76fd038f6e5f44000000000000000000000000000000000000000000000049e65c7d7e4e274f03f41f9ffdb6f97a5b9771549370f9ff0025fb3e47f3a9edf8b8b0400fafe41ecfdbf994bfac7e4cbfa8f9bc01e9fc1cd720006bf547c9fa9d6b724d0c63ae2be4fc0ff46fc265f18cddfb3e1dcf5fd15f87ede5f4286800000000000000000000000000000000000000001071f9fcbd79baf13a7882ceff00bffc7fec7537a9aaa0146754f97f2dfb2e67f357e97f399b854400000000a4fa7e9fda59f1fa9a690004e7d3073fc67ed3f167992cc501f7fc09afd1df13d9e5f474274000000000000000000000000000000000000007237e571e1d3c21bf300b29ed7ebbf27faedcb734b42800a82783efc3f99cfd77e4b372b2000001a27b9e8fe875397602512ca40654e7f87fdc7e10f8a598a000fa3e74bfa1df81ecf3fa1d867b00000000000000000000000000000000008599f26f3fb3cbc3a78035cc001653d4fdbff36fe8fa9aab5482ca004869298f1bdce67f37c7edff001b9bc84003eb3e7fdaf5f4752dcdaa9612882a28ce77827f3dfddfe04e6b316000149d303ddedf9ef5797bfec467d1400000000000000000000000000000138a76cf9bf1efcfd781bf125590000140fdafe2bf4567eb259a4585b058004485c4f1abd7d71fba3c9f83f4dce3f03f07f47f9a5fce7eb3bfc9a9f46f97436c6c08b2c18e839d4ab8d64f2bf17fa2fceca959656005290007a1e87e7ee3d3fa1be4fdf8f5774b3a000000000000000000000004071f3ef3f53e5f2e6fcddfe737e615202288a2005007d9f264fe9ce1f46a49a5291161337c9afbbf15f14cdf7bdefc17ecb53eafafe0f56ae98cb58e70d79fe834f1fd5f9b1a7a4f9fe8c36cd2dcea25063439cbcabf13f019a5912512c14160000287d3f7f90cf6fd03c4fbb1eafb99d67b800000000000000004e47579df16bcfea7c3f2b7e6a975c52c0512c0000080141493593f6decfe63f4fa8495a902bcf3e1fc87abf0e6f09df318fa3864fd97b7fcef86a7efbe0fc6a3f5f9fc925fd7f4fc65b3f67f1fe6755fa3fabf2b93fa45f2bd42acad5e7a3508cf91ebfe48fcfd9736824d649650a052282002dce8954bf7f9f274f7af83f7f3f5fa0c6f3e8000000000009c8ebc7cff00937e5fabe54df92a2e4a26a040a020148b00228148524b0f6ff69f83fdcea2e754b8e06b974b5f0fc1eec3f35e47ee3ce8fc8e6cc500522856ea6f5835c66e35fbefc27a1b9fb4df2d1acec44a4fe79fb0fc265ab352c34665195852829160961501616e740199a86bd0f353a7e835e0fa3cfd9f6a5cf7000023e6971f563cff008b5c7eef872df9162e142502aa421a8a422c0a00a4a88b48d64950853d5fdbfe0bf4767b9cbf17fb1d2f3fa3159ead133d2470f97eee15f9cfcf7ee7f33979833565052f496b1cefd117f5bdfe9dcfceebd4e7a6bd5f2bb47dda88b648fc8783df866da1402989d062e696e696290000d19b054a33a84a8251d7d1f219ebfa1be0fd58f57aaf93bcedd1135f9e477f91600029280b4890a06f55c9d2186e12c86ae06a2c4cea0b3662001603fa17f3efdb6a7ac2960a06750f97e2f53cdafc97c7fbbfc565c6c66de9cfa56b975e274fdd795ebd9d78e3aea6f57a1c3e7f430bf17a1f07d277f8fedf1b2fc4d9737541425b0ca810db14d66d32d530dc32e90ce34220d33a228ca892d3200348596105254156a504b09acf48934a950022c8334d398de652ad12e44a20007eb7f27efd9fabd72eba00b2804f97ebe479de5fb574fe7efabe7e5674cea9f57cbfb0b37aebdf4e7df749a20a31750f8bf15fa6fc7452e6d0002894573874886d81ab81d263426865b84cee18a05a49448a494429144281401400b025195446a116995195116934d545c91449640005f4bcded5fbeeff0037d3b8ab02929139f4e35f3eb39d3f3de4fa9e562de1db8c7ddfb8fccfeaaccee2ba1622c0292c3f27f9ff00bfe0cdb6229495002819dc32d64a9a228934333633668850a22893430b08a24a0a3366aa50016525940040b03508a11906e256ea5ce44a202c08205053f73e9785ef6e0a04013e7fa3e5ae589bd3f1bcb1ae76f0fa3e73f4ff00a3fc57ed3525e5d2bb5972b28cac2fcff47975f8ae719b7510a0960b06885216ad739b44b9874928519aa60a154b016126b3114451019d6754028128010551206a5c88d18d682da5e682508096002544b2829fa2fd47e37f5fb9d92c282513e6fa7e5af8bcaf43f20b379d65af9fbf035fb3fc57aa9facfa787d1b6e99284944fcefe8bf1678d65cda0509668914a940162aa0b374e37521722a0502ca01653208a894203352a940290d66c1650099d738ddaab2ecc75e792c04a21492c008a202588a0fbbf6ff00cf7f7ba9f6dceaa88033f17d5f257e73c5fa7e6cdd6b1a2f0efc09acd8fde7dbf9afd36e75b9d40125863f9ffed3f0866e759ab280000294b11a85402ca6b32941cc91aa501602c094494019446f9f5e55ab3445858a4582c16a0c6e18e9cf46f3a09a84584a002580823464002c45fd8fe3bf4ba9fa6d6365102570f3beff0002bf38acd6b3a1c3bf025963eefdeff35fe83a9f650b73a267583f3ff94f67c6955612c2802850059602802684689cf588d02acaa42a51149288b0268e62359de6ad9a33544a24b0a02890333523a5e7d292c2148b0022c00804a20022fb5e2fdd5fbaedc3bd85909735f2fe67f4bf93af3866ce98e86387d1f39045fd67e4fd8b3f6e29ace89cfaf9a7e278592d1140292cb493400a85026a0585326758e91128a945128011612825cc056b3a18d6365291609a80a4584518d073ebcf66e4a640045858a402584a08a105de29fd0bebf1fd8d42b299df3af93f1dfb0fc557196e6b79d99f9fe8e06045ebc69fd375e6fa5a96ac67f3bfa2fc65789659548582e682aa5cd28140b014b9a1cf598bbcda9668842ca12895492c202e37828340c6f9eca83440a128024a20267593a10ab92a0004008b0a4254290b653f51fa4fc6febece96589cfaf0af8ff0dfb3fc6d0b2dde370e1f471382c8594fd57e97f15fb5d4d59631fcf3f71fcfed8ac80a94b22a809401652c5259a2599329b8a296522c0b02c004b092e4a688a25b825835415494136320935092c2e77933be5d44b935288b92a00004a22c0050fb7f75fceffa0d9f4d947cff0047cc78ff0096fd2fe6d62a35a82e3783e69acc2ca7d1fd1ff98ff46b3eb07e7bf23ed788b6cd0cdb002c52504a160b284d19da179ef90e92965c96858000858a49ae65ca1ad4d11054126b26961ab9d0b3466a02926a133ac9629cf52474b2500584a02160009602821afdbfe23f5567e8758d8f97eaf90f07f3fee788b2c46ac8681f2e7a622594bfb7fc47ea6cfd4637f11f87f945ab0a960280144a13509650ba31a0c65a8b6ca6750ab92a50512e4d4533cb59166cb5080b2c35cba60d594d4514164a2c85c74313592509cfa60deb1b24d41000022c2e742000b02fb5e27d87ef7af0ef65f8bedf84fce78deb794a02545de7470e5db0736913dff03d7afdd7e7bf43f8b4f128b6591658514b05216ca4582c1abae459be2379d8b29901216a8b297360b21cf245e92d4cdc941b5826b2677cfa1a4d001284a637cf65cd844a5c6a9cbaf1e86812510a019b46682580a203529fbefbbc2f72cd7c3f77c27e5fccf47e25e6b09348bd79ece38ebcccdba397d7f3d3fa37e07f61f84a9a96058965254aace88a25b02c16685cd271d0dd0a82583373a282cb480635cccd9a8de6ab2a2b236c8d494c74e5d0dad233aa8d412a396b34e98de48b050c677cced02e6c2ca22c2a519a21480582d94f7ff55f87fdb59dbe1fbbe03f27f36b9ae6a41ab4adc7cf8efc8cf4e63afcff004f03d0f39400a25948b0148a042cd41b822f231d73b2a6c935819d606f34d450949289cfa7326b3a8d6752a14ca8ab028e7598fa5cfa55810501cc91da0666a152933bc13af1e825a6545209a82292c1014006ff00a17f3afdc59eb7c3f779c7e22e352ee4b56916cd0e5f47338ba433cbaf239db4950aa8956a4a2284a1509a9a2e5470de4dd836a26759267781a9a14250668c63788baceea4a25020d2434c899d6637dfe5fa2b79b0952ab36319d60e9bcd19a2e5492c22e0ea9488280b0100128950551fa8fcbfb07ecfc9f57c2d4fcaea5cd6a2b6c8d5cd3b6348e337cc7cfdfe636a005002c05805006b3a316e0e7d33b05340c45266c2ea50511010c4b22ea5a4b4940a33343328ccb21db8f53a128b08b0ce35937d39742e6c33a948099d526b8f52e7501420b9a2288b028251f47cf0fe93f9cf6ff29a9e7d6e5c2e62dcdab734ef79f439f2e988e3cf42a82500b14494288a26a68b9a271de0d6949bc7419b9220990dd816522c18e9cccd9a8d2aa5a12c00910b1092c86f14fa11a596420671be66baf1e86e5c92c1411a873bae6754a402c1410a6682a0942a1faefc9fafe0a7d7d39cb7b4e5a2cb095a1d31b263b718f935cfa84a141289445164a250e9cba995e673de3a1485ad131ac8ceb066cd1a4a1616518ceb11759e944d0012841cc094496401df5cf7573a84b04e5d7917a73d9d2299a86b344b9a39f4c8df1ec33746628944d40cea09410505e5ba76150a690451d35cbac38f6f94e3d31d080590aa228594cb50943b71d42f0e9835bc5114ade08099df325cecd0359522e4ce3598d74e7d296e42c00a832b4ccdc39ac880df5e3da8b04531cfaf326f1a8ea299a1ace8ccd6428e7ab83aa519d64b148001642804358df33e8ab501505961bde3a17e2fb7cd8e9a42c0a816525080a0bbe5dce660e7bc74042834432099b9154d01734b8d60cc237bc6ea825ce89288d08b0a94c63a60908bd78f5ae90128cf3e983223b6b1aa40dc9a267592a063705c742c53160b1480b9a0d649a5338e993a74e3d82e6ac5094bd39f433f17d3c2372814800254294583a63a722f1e9c8d690b01acec66e44a339d64b734d58281cfa7225963a55a20a412e4d303a2e4b6418de0ccb21bc68ec6b4ccb099de23023a6f9f4a92c2dcf42677924d42a5396f5c8eb64359d60b02c5228251284b91dfe7ea749a952ca4586ba73d9f2b9f58580b0000288a275e5d8e5664c6b1d0960b02d9a18d4254339a26f14d542ca272e9ce1acecd6a288041653283a401492c3337933623beb9f4ab9d66a67798e4b22f5e5d69350cef1b2e75080d4073e9039762c6ce4b0542948949422c33be7b3ba5a4a094d637c63876c7421480b0250a94941bd722f1df336b05816526ac233a12c339b0594b650b0ce359875e7d0a4a4b0b288b9228d5b02c165267783988df5e1deac533350e59d662f4e7bae9026b34d4b026880543969ccee43a73d64252c520042a5333583e8bcfa16156e764f9bebf863aea524d4250000b9a16741864c6b1b2c02e4b14d5cc26b1b25839ac1acd3402c319d662f4c74a25359d531350ce750aa3a6752a2a00ce6e4c2c87d1f3f6ad2c228e58ebce1ace8ea8a960d94c0352c101cbac26b8f726a0cd010a01a3242f3de0df7f97b9a14e9cfa19f8fe9f9e3b0064d40b3582a0aa26ee470e9ccd80a24b4cdce8b9d60d450b83205835549350e72c8d6f1baa94d5cd0b0c350a0aceaa5a22e492c8e7359875e5b3bc96a031cfa7325963e88b59cea1d22096002a029c9ae6776745cef24940004a85cd867af1d9dd2d6ae747ccc6e36b90d42582c000741864e7acec5835904525946750552677832b0594d582e6e4c88d6b3aa145940228209ae7d0da2b32a258318ebcc9acea3b25a8a31cfb722258ed79f5a99b93573a12e4b50a8269073ed93976e3d0d6b348b926a02c2542c0e6b98faae37a2b11f3f6e5d88a22e4b50015075e7a31c7af237a82a5210ab05ce88ce82c2675924a16685067593296365aa946b34b10b2c0a39f4e7d44d42352a0272ebca2588ef71aaa533cba60c5235db877a9358166c93592dc688a0b00318edc4ef9cf4358089a24a0942c33cfa60ebdfe7ee3877f94bbcf419d42c0b28950a537cba713173a37014200829a30cec1498de092c8b66ab502675826b3a8d6b36aa526f1a19de05cd34c06f1b2c0b0120bcba73208ed71ba5949cf783248bdf876ab9de4cef1b2ca334228805066d38f6c43a6a644d64350590ab09cfaf337f470ec4f93e8e26f79a5960582c16583b6219e5ae66ea84d12c11a84a82863536420ceb249645b9dd504c6f9c359d1a155296e7431bc9280174125a48126b24ca401be9cba56a299cef061643a73e95d25c98de7a09610050944512a93877e47473ec5c6f24299a85583345d73e8631371bb2d44d12c12b4666f4670c98b9e8502866822914019d4a596199722591759d5596131acc359d1759b4b2962926a134a6546e20804171ae621005ebcba5680cea1ce6b2359a7681358a69550449428002933a871edc877de049d390b60d4108358a71ebcfb452558a4d48504e93238ef03616504a25100059615296412209645d4b56518cd90d67454b5a669529416e686469008084c590000e9cf674b9b4cea1ce6f24b29d359a4b91d105412ca136641161acd8639f6e475df0ee5c5a494010844c17af3e82810282e7633be473b9e81616514c9651085945cdc9ab289ac12582586ae74596189642cd0d66d2a9285a835299415297360cdc991166a100d67475b9b4219cef2481d37cf645c9b4a4513504a85b2928496131d21c7b72b1dee551bc1529019e7d7997a73e85814021adf3d138eb99ae9914020a10a44a2c0ceb26ee697372481285b9d0961984359d14b4d674221a32564560754858133602c2595042ca75d6354519c6f0481aebcba933ac9bb1515101505b05c85881472cf4e71db5c7b56b9eb6738a1619ce867a71e85d41a9289765e5ac1cecd8b0505812c0b05808166b06e512586416054a26a1810de69495a661b9905445015a14119844a1604001d745284c06605e81721ba19000a0808160284e413b11ad15ce8480073ea168203b071e60d84a1408006682028481b04c84001a0301045001615741720001fffc40002ffda000c03010002000300000021041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041041399ddc1f1cb61410410410410410410410410410410410410410410410410410410410410410431d1060270a30d24d6ef8604104104104104104104104104104104104104104104104104104104104116ea58d34b1faf9e300351e004104104104104104104104104104104104104104104104104104104119100853e990101830db29ac85f24104104104104104104104104104104104104104104104104104114804a88a7bc8996169fea82f8867c041041041041041041041041041041041041041041041041041166e5489a6280542e6d892b62aef88c0c04104104104104104104104104104104104104104104104107ed4488c59060399da1c4b0a35bbef9ceab04104104104104104104104104104104104104104104105792ca845ba40126772c7383bd07fbbe235941041041041041041041041041041041041041041041041369d2a01eb1a3e3fd7dbee9f9d94be7be814a4104104104104104104104104104104104104104104148b33288efb5963fc33f33f319622d73efac1760410410410410410410410410410410410410410410795243beb986651b21bf2fe5826af767cbeeb5f41041041041041041041041041041041041041041041996e06fbb85ac220b6dd4fb1862c249a2d8aae10410410410410410410410410410410410410410411500a27be0df0ad1870047136b953c203dc6282a49041041041041041041041041041041041041041055842bbef91d26d65d4104fecd2db151f4a1befaba410410410410410410410410410410410410410414421befb6cc190ae970144a6ce0f52b2a63fda8f02041041041041041041041041041041041041041052a16d8ed01895b9cfb59fe35f61181b2d87baa148010410410410410410410410410410410410410414a00101be282734dbeb0417733f1d65b573f8a852804104104104104104104104104104104104104105528003e68e4f75650bceb389c44f7f3ee798383c2c1041041041041041041041041041041041041041442500f26efbfb26767aeab6081e2eaa228558cf09041041041041041041041041041041041041041041394f2b2546580c0d52ad57ca508100036198f3c20104104104104104104104104104104104104104105a53cab5e3cee6ed8c4dc7d48ae2a397ffa538f0a041041041041041041041041041041041041041041e14d2b0dc745832ed3d8bbcc102e00a0bb91b38a81041041041041041041041041041041041041041053fd8ea301887ee9d4aaebd8300a617d9f6ddcf2904104104104104104104104104104104104104104146522cbb259bb37d1c37ca58f2bf072f625cb27041041041041041041041041041041041041041041041e0052261f7ef314351a4d63364fa9b789f1cf010410410410410410410410410410410410410410410413580ad0ef48042a7d3c989e25971fa53cf2b041041041041041041041041041041041041041041041070fe6ed27da43e6314e3fa51beb86db8f3a041041041041041041041041041041041041041041041041051b2b4624b697a0b6e047162a68af12ee41041041041041041041041041041041041041041041041041e3420e8da43db13521e86c10d4333cbc90410410410410410410410410410410410410410410410410551bc6e36418228c6ac4da67bdf1ce4704104104104104104104104104104104104104104104104104176a3ba60a110b49dfa8161bcf3cfa2a010410410410410410410410410410410410410410410410414adf81dda22356012823719301a6f1f3c081041041041041041041041041041041041041041041041416a25b45250b0ca3577c84c31e15fc45f2f9c1041041041041041041041041041041041041041045dc2f37cc7779aeac2853cf04e3747d053e54f2d281041041041041041041041041041041041041042f00528a5b1d1d41440900f3c701efb0592f573cf2eb4104104104104104104104104104104104115f3fcb1ca0d2c9b4d7690f4b3cf21b7b7f9877062f3ce318cd0410410410410410410410410410412e12d0f3cf041515f7ff007bd7ea16811c97d5cf3df00b4f083007a2241041041041041041041041372aa1f84c30f387aeef3af7e5c64e4739ec4c5ae17faf3662cd1c31cd5bc4104104104104104104a8ce3f249678e03cf3ad11671946dba16d7a91f94fd36d7feaaeb3e78a3ba0a3c572410410410413a9dcfda61be3bad8ac1aeb474d16a985f3ce38012c8917125fab2696cb2a967b2b82e801c9041071d6fba28906acf9e0a80808aae3b60c1221bbf2c186dad7aa84708e3aaeaeb8a2b6886abe99abf21419defba98c496c0cd08302c82f9e7a53ae40cf91b0cc32ddb29aae899289a7ae7866aee8eeaac9a214c0eea682023a634112e8e792892fbe9fa8a8b26f7ad35fb0bb0bad78afb2aa65aac8a99fe8668269aeb268033cf2ea168baeb8d18c107bef90922623bb4d381c6ecf33cf86ea659e69e48ef9a286882ea6c9e0b8804aae986920f0ca8c018a0cfba4b2617b6fc6e919b024771649a258a996a2a5ae88a5b0a2439ecbeb2e89a08ee9893070ca1401cd12a92d0a85146e5942d09e1eefb9e8aa6cb0fcd283ae386c1ca3cca2080f921a639ed8ccfc04df6db7022e58334d36bc8a82ee8b37f46eb8229a86707da74e06434628510d3e53a9ba0a6090d10635bc1c4d63c00e656fedbea188eb3ec93d6f9e58c645ab0a6d2267b4908638928fba4aebae3f2e3a280ed7079a6d404a868b7b6f2be93c9ebb6513e7ba01846411d3182be938d2c93008cabe2a6daeaa083c2bcc55a69d6460cb28ce345acb6f1e293c600a6780339074a00c88404418a30e3cf8e33e9aa5aa328e2e80f34df7406413c3ab9f1e2a9b4bb5a4059228c15da7963411e00893493cb1c4009bc892db69a6314f1c6a4335611441d33057f82b8e528dc1f986b6059f55968c0491ca1c22463411afbe8be1ba79608c61e1ba9a1570d14e3c961fea1aa9baa0524c412e3dc7146b6502a0022098112124a8ce9ee92f88dae980b2691f0d055134d77a28768c6aa602623d5e5b130107b0c5d3800c3baeb69b2f3cf0e99eaa228a0a23bab1a20b8f3a55a5da020fc912bb26861294aa00863134185451c63e99a1bc5aaf0089e11a6300b2d92d8c1fc3df2d9f5f2081c7b3e52b5d65b2438e24c54b15b24a1cc26b922b2c2e810c16db6396f18bbec8e12863f0f3041f4ff7f0c64364b649ec648b1c61f74b4833e6a6c021a6496310b3c38e5ac3a428298e4be232f268edd759e11b5fa493c9b6630725f5905d1208049aeca0f9608e5bc6b2c3aa96fa6ab623e0a29bae10e8e5f7d4b6c4b68394700b8cf7d20536dd6d304faa58ea229a2c2e4b67be8825bc0066849869b649819ea832cf1f3957010808a26719859677c97b30312f8a1b87b64aa02af8ac8c614f3e3a27004964aa1a9487ee35d3ac5a00704d0e7a8849c79af7f1c500ca698021609658c9b6eb26a2abcc8e6b28ba28e5b652a19b9cf1ff00fd023c104104049045df3ac996ce8ea8a91019ee1c69a292cbe6b8708796692a8a4b298ec9a2ab2d3debd4e61840cc2b1410fd2cb004e3af8e78c12e3a8b221a648e9a6d9eab0f2a482fb2bbaab45825cf0ebcc59b0d302008f1057ceb2ae33e7baab2e24bba7aa9ba0ba016ebe22c6943a2936a92f9ea8408ebebaffcc8108032823049bcbdc0306b8288218cd2efbe8b67a68bc5a62aaa1c292f9478e59a48ef0f28b0eb3cbc1ac209115edbcb0d6c04eae48228ac043b6d90eb27bc3946babb4b06eb24ae0b26867a4f36ae21cb798b8ce140471e77e34045828bafbe9b49328be61a986cbe72811ef821a213a48a19afaa69cba2fcbef652c314915ccfef78e062e79af8af80c1498e88ce86abafbaa228b0406ab421e3b6fa60b2da4183fe3bfaea49988c7bff009da432aa2496296a3843601a6862aedb2eb280870478a6a0f2ed8e3b608a51a09ee9f1f0990e174e39e3f141b6aae48ee98d989b4baaaa29befba7a669401a08e1a8c9eca278ee964166a31eb526a255c34c648c6922a28be81e6363223badb608288279afa6b803929a2802482fbe6a6a9479a4ef0ddeaa06b9eb4ece061ba1920b2084d8c59eaac0929ba09ec8e18803418e8144a6d365aefbad8c197bc70ece93cc74fe2366befaa0b278e916eb22aa70e78a38e5becbe30098efb0e067820b2a92786f324936c753c39fcee688fb20961aebbe79851c2a0eaccbe9920ba192f1201218ee9c7a6fb29aa2a23a699248f8e4b0eecb7843a62b67ae3be28ef2039e23e6aa7a643c892412e00406886722e8c9babaa79a89e30a9f357c0dbec692e192e8248e196db401482089050ce9e300782f8201c08209cf220befa2f9e08273e8bcfdf8230e28420827be8a28be89cf3c79c00279c7bef80fffc40002ffda000c030100020003000000100c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c335af37022e333830c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c115fbe80b3eff7f7fa63070c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30f7927eff3f8d3a2dd6c6fcc0c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c31736c9d3af896cebc59c039d2ef2830c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c31a570670062c1ff7c6036b944808960c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c31ed9b46047882cc361132cf99efb9570a0c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30f5aede0a6346a5b0ebcbc2aab7fd6c9d3230c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30d33bff00a671262cbd1882bba1287365da6120c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c38627341a0d5450e5f5a2041f76452a2b656ca830c30c30c30c30c30c30c30c30c30c30c30c30c30c353b2ee330034fc7ad78c12ff0063c5937421a9d150c30c30c30c30c30c30c30c30c30c30c30c30c30c30fcea3c824ab9774383b7dc2e91b659913903a8d030c30c30c30c30c30c30c30c30c30c30c30c30c30c3228b7a080683ae011024ef3dc726a12d2230c880c30c30c30c30c30c30c30c30c30c30c30c30c30c31e5a0a202eef726c4bdeeb85d082dd6bf530837fcb0c30c30c30c30c30c30c30c30c30c30c30c30c30d7768b2c023c0fbe71cb5de8abe3cdc79fe614e39ac30c30c30c30c30c30c30c30c30c30c30c30c30c35deb18a0dea596f24c419cede3dde6723de173a9c00c30c30c30c30c30c30c30c30c30c30c30c30c30c0f382187c9ae6dcd2a87e7341f931e9f303100be0c30c30c30c30c30c30c30c30c30c30c30c30c30c3175fa6431b9e2ffc056a6409398f3693088aa02ca00c30c30c30c30c30c30c30c30c30c30c30c30c30d7d7a5bc337d2a52aa99377a5f778733565e442a8a030c30c30c30c30c30c30c30c30c30c30c30c30c34d5f96995c9ba3d093366b975bfe6516062b4e400b0c30c30c30c30c30c30c30c30c30c30c30c30c30c34bca932a9349ebd95e4ade956cae7ada8a700002c30c30c30c30c30c30c30c30c30c30c30c30c30c30d1e0045a9647d4a2940bbba1478dd54dffaf040080c30c30c30c30c30c30c30c30c30c30c30c30c30c3a68214e14e6f0caea9127a9b7963f11b7db54002c30c30c30c30c30c30c30c30c30c30c30c30c30c30c40e4588525d7e12d9641c22fd4ace59e922601e30c30c30c30c30c30c30c30c30c30c30c30c30c30c34d0d159f68d1082e7d64000ad4a98109390040c0c30c30c30c30c30c30c30c30c30c30c30c30c30c30c3a7ca1de221619b047884a541be0132dc3020bc30c30c30c30c30c30c30c30c30c30c30c30c30c30c30d35e4d97abb8e5a4658c7ff00ea156cc8fa000a80c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30f32cce03e8d8214a915d55a2c1e5b0051230c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30e0408f5f1f66e960158dd1e541740e1bec30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c3b889609def35bd9bc3bdc887990c10c8b0c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30d7a48d8f64d52de7082fb580620208ed0c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c3787820d25b02cba33948727b80481f8830c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c3511b2bb46d3fbc34c71b88cff243882322030c30c30c30c30c30c30c30c30c30c30c30c30c30c30c36d148946434c6b0d6b022f30c3e8dc62f204b830c30c30c30c30c30c30c30c30c30c30c30c30c30c7bde533bd1f8db44c94a000b802394049200a0028030c30c30c30c30c30c30c30c30c30c30c30c30c48fca0a48fd6a42cff002cbc02a9b19fb56eb8c98001f3030c30c30c30c30c30c30c30c30c30c30c31ccfa8420f8b0539fdfe7c5261eab7647cf0c92648014f21a4f0c30c30c30c30c30c30c30c30c30c336c092b00512fef9e9479fe8d61019e99847c6c980660513cdbb252c30c30c30c30c30c30c30c33f6b59242eb2210014ec1dfbc54f0b5ef339c8c87fe5f02509c38bbe78914c20c30c30c30c30c30cc9f9e9f640978aacf9909d5dbbee3d06f1c8156fedba67add44deb1271745e6c4bd2830c30c30c322a1cccef0533fb9e4cb0d2a2771d27c24b0036305c83ed5ce1175cd474f1c5251b5d5628030c30faf609fbdd1f6d7ff5d54022a8789f7b16a39eeb2d3952436262a1218cfe593cf241e45d45959c9610310d63bcf92d7f4534d77f1dbbb8032f4db47fb1fad807def63dd6adef5e3e6b6cbce37752e3c79ff30c5fe7e47253ceb773df98239db0089d247bc4ff002c5f1c169739632d7bff00e474cffd36f65e9a87a5d27dd853773cd1f609abb2ca1671ddad2463946ea575ed1a71b6d7920f9eb9e7bf5f6ffb85020b33cbad5c753cba41f6d669cc5acb359f55ec06a1a4cf8ce0be6ea7f0b653f9f3bef2f7a776db0f37fd9719b71cfb15a4574577d4e9d4b9e77c565bccb0579926b416d879732623fc78eb686eade512c72c794574c3e70e6f6d855a61bcf727892a96035f57fcc410c283ef47ee50f380dbfcbfd3d2a334f3166b07d74594d04d591f4d565145f7b0cef028a6e4d37fd7f794faf9e142c894d16bf7ef9c180c531c267fe1941f14a4500d1717f942db67363d28eb60b83795c89f65858eff0056b68622dd38c3a59d05358c6d9cbf3d8613046b08e15dfadf0dfd7564fda27865a1245579ca4df33e140eb711798c76f1244b0dc5dff1234f58c18a31feb0cf3db0ff000f76358c80962970b53611c293136fb62e022d89f77c1f30c1426934335e450504e14c7319f87fef3bd1343ac7c431cadd2db4876a2a08f8c7a96bc92f92dbf04726e3986dd13ec399e6db51c34ba732f7fe3367dc375d26aa8f6df0c7ed22181d71ec3b3ddb96f24c63e1b8d2ddc2ef1fb2cd5231e43df505fde9ce3a5b259dc830f3baab25ba850a054f7bfefa1c87fdc8c6100206848bbfb3e01185cca70ebaed5dbbc39c504d969cf8828cae0828e75bbf5f1d11794a2bc3defaf04969b18de4f98b6847039ecefebb2bd51fc92d53c172ba24b3ea8cfd743c577976b1b651f75a7b2b3dfe1cdefa6e5c6bf9d31e6f3cd6efa7c3474f5346bbcf8fc92cea2ea0cb493f26bde38ed79d7e83125279a325c4188fc3b3f6e88ffc0b41b1f9d12c5e4b6fba7d3e9d22a9e11a0a0fe1a712cb3cb664db6dbe7dbce74dc1731cb089da34410b673008b9f77c36f18612c7b415047b441f40d3e16616e93b8a42ea2bba2f1a45f4dfd28e1ffb1497fe7acf1624f9ff00c4b9efde5779a40d2803c0a1141851b7f06ec26ba0f787d7544379660a164bb041c5504e49ef1b2ee7826e75c327a77082c514b2afc5d5186a5597b6eba8009ff04ba55b22b2540ff0b941b4daa82be07e9b40b6647bfbec9158d34220703445a5d5479a60a2b3cb3ee991502752242207d6105241cfa09a7b84d3e547f54ef069b6995cf18838eb326d2519d40be44fe60cf5394019e607fca801876c1f70da6194139a73e957434aa73f869338e0cd1a979a7d44523e4a0f35d758e9758d6fe3e4027bcda1b6107b9ffbba5dd6d85febbbff00304f145904a0cc27745e4905839a41063bac9459a09178e1886cbaf559e73cb2ca4d32e9b7a0be1de3dc7234d4c22850855fb6d4eed1662ce15ed367567906db24c213205e25fb061c96da2c178d2597d33bd7fdb6e9e2523877bbd11656b862442c9d9c2806907db5c12115c02b3ef07cc5582a83c6aaeb88d3eb6f1d6987715b682d6f3c59752e04e34a375e2015569ce392c25512219bd633872369b0e8acda28b9ce1f71af017e783b651dbcdec1c1cd2802dd454f5149e2b89000cfcc4369c7ac15c703c9b85d37220cbe496fbdd705df6d178d0d8e3dc0abcb200e02e1b69c5c7cbfb020f9004efcfb0eb0baa96f19cf53321ef3ebcbe0af8d5450924bc3f46fb450bd65e5c4359414ad9caa1059461d4c7bc3fb279b3bc50e2c672bcdaffe69888ed5da04d2a6d79aaa34237e58065661871360ebb260022c19ee3f823be916f06ba373c8d3f5bbe2bcbfc0ae4f24933ef4f2052dc71b68c7df7c688b3e83c700a8462fdcf082f9ac3c7b77d2727a92cae68a91322de4890c649864a050685fd541945f65c64d2ad16432665be3f7e6acb88f389d3254dee096bbb8da4b4429b4853124128e34d37af69669b7138d0a0620502e0b1d988c1be30683cabfcebb3d5805b68a64c6caccf571ca99c16509c7da6546d35c55317830a29c9bea80f8a0208def02f207bef9c7bf0a37a28befe008187ff0085cfe37a180303c842fbd76271e03ef1cf1cf1e040fffc400331100010205030205040201040300000000010002031011203121304104123240516171132250813342521463729180a1b1ffda0008010201013f00ff00c2a009c02537a58eefeb4f943a17f2f010e83fdcff00d2ff00423fcca3d07a4447a18830e6a774f19b9613f1f8e8709f10fda3f6a1f44c6f8bee29ad6b74000d874363c51cd0544e846587f453d8e61a3850fe2a07485d4744d07a268000006d564f635e28e00a8dd2b99573756fe1c024800281d28651cfd5dffcb6bb7d474a0d5f0c6bc8fc2ea4d02e9fa710854eae32adae7019462fb21102fa8107032a2a484bab81988d1ff21f84e920622387c091970b9939e0273892aa3d57737d420426ba883c2addd441fa6fd07da71f82e9a0fd4754f844c996500a2c76b34e53a3b895dce3ccb59024728457050e384d7036051182230b4a7b0b1c5a78fc03185ef0d1ca84c0c680384519041478e218a0ca24b8d4aa5e428318b48408734116f590f40f1c7e03a487405e79c21808d911e18c2539c5ee24a1b5d345feb6c4687348f51e7c02480394c686b5ad1c5dd445ef7506021b6d71690543787b41984ec28eded8cff9f3dd337ba30f6d537211c59d445ed6f68c9dda2e9a276bbb4e0d870bab1488d3ea3cf746df1b93729d37100129e4bdc5ca8834aec5dabb576aed5da8317622c2bb4aa2c150dddcd06ceb07dac3e87cf74a29047b94dca72128e7ec2106a002145a2d112ab3055569ea8f6faa722174ae342d282282ea9b584ef6a1f3d08521307b26e514251dd575155772ee2bb8aa95540a05155555dc555555531fdae050450514558f1ede7868004d4e4113a273aa499b58e2be9b82d11424e9b6139c8c12060a208c891505ddd0da7d91411445091e87ce0c89045051dddb0cc8a80c61c9d551a08e13a9a5145820d48474d0a064f29b850218c908101daaafde28a396734473a4ba3755ae6d914522bfe7ce0c8904505d53b02450a84d8afe5c4a319e46512e3c945055453536a392bbdffe653a23e9a38d51ee26a4aa1442e99d48bf28a08aea4523bbceb0d58d3ec1045051cd621f6b8bbd1526640d246b634d1c0ae01425d57f31f81e7601ac167c48a09c6ae27dedd552ea220aa95ad90cd6134fb4faafe63f03cef486b0be099b8d1aeb28a8a969909d119c0fe16cfaafe63f03cef467c626ff0003919040da02a145a466c0a89c8a0a07f0b671cd633fcef4cea461ef389fc6e46daa12f82aa539c4d2ab433057723383fc4d9b8d5ce3ea7ceb4f6b9a7d0a06a0193fc0e46c250b2a119955b02668c6fc4a2bbb61bcfb79fe95fdd0a9c891c14ecda04a9b026c15709f56ea3037d4f9fe99fd912870671451e51b059a4c891b2036b107b4fa97f7453e834fc0408bf519ee3328edc146c089242c72bee2a8ef442be92253b16f4eca36beb288f0c61723f808510c3783ff00681040213dbdcd21114360416855240ccd8c617b80434004ba98bdceed181f82e922d4761e3128ecfec11d8aaaaad814187d8da9c993b469f8fc1c17f6456991150a2c22c3a62ea6c4083873a719e190dc7f43f09d347ee0187322010a2c123518d932a283070e74e2440c69715162ba21a9c703f070e1ba23a83f6574d01acc04e86d704e69064f821da8461b85c64d86e76028704375399869760273410410a2c3fa6f2dff00afc10049002830c3181a33ca60ed68127b0387ba7348322014e820e13a1382a198638e0264003572000c0935a5c681082d19d568145147951e0fd468a6461105a482287f010e13e21d069eaa1416431ea7d5421577c4ea9cd0f09ec2d361634f0be933d1086c1c20009b585c5001a34559476e0ca3416c41e87d53d8e63a8e1e7a0f4c5d473f41e8800d140282505b46d664aad112d70a14f8646c321f25578130a36ad08c9ec6bc51c14582e8675c707cd8049000a9507a60dfb9da99850fc0246744402289cc233fa368154c65054a26aa884e2f84233734381045428d01d0cd72df330a13a29d31c950e0b218d06beb6050dda517086a8ca9554217885084f610674270a1b29f28854b028b8b480450a8dd3b9952dd5be5802e3402a99d23ceae3409ad0d0001743347216fca6b4bbd9456d10603c27431c39426531947d11044c3a8b438434514eb7c4e91ae24b4d13e0c4664547a8f250e04489a8141ea533a360f11aa0d6b7468036304206552b5c22e0d4e7971502254769515f40072a849400aa61a1184e6878d51041ed72a220c868644d49d989d3437eb829fd2c4663ee1ba0126805533a488ed5df684ce9a1b38a9f7402280b848a60a854aaa10854e8dfd94f86e075c22d40f6b814f8cd71ad0a314aef726c470d13633c27c488724109a7b87ba07828b56a0a7380619943622418713235f5513a57b756ea36402e3402a542e909d5e69ec990d8c146890082cde2454215089010693ec10000a012890b425a8ce880585524d026c121bee88afc840d32be145381bd120b220fb828bd33d9ab7516fd18bfe0543e91e7579a050e131828d0858562d36b5d46d02840104f28144a0502a342fecd904054ad02d4950a1f6fca6e89ecafdc3217e9689c6ae3e4224086fc8a1f54fe91e3c26a9d0e2372c3b04a01525a4e86e807522c04a1a8a1516116fc4989c7850a1d054a01175107ea9ed075c145c4020f94a2169429caa8550aa168aabb8aa92b16c23478446b634a203850a20d484dd32a1b039c49c05545caa65dc5463e1175555565a2a4b4d80254b68a8a8a92a2c5cd34211b199413e9dc7e53d41146d7d65540c8289e2dba6d3717f332552ab17855fb4191931134d5653d423562e119844d7746c0da03699e0466c519d46808613d4324511c23208e0f96e6f72a6e42c14e9b0689c6aeac9e9b82130d5a9d209f8f2cef5bcea134f08edc23f727c823a366f4dca61c8939353cf95a551c218b8c86db0d1c13f326e4289e19b904d3aa09c989c6a76cee0c5c64df4476827e049990a2e04dd26e6472b0dbcf911cdd45ca3c1db0b2c1287e251722651410c23947c211f2827cdfcc9b8583b50f56908a859513c561ca09b85ca7646d9404e9695c4ce45e65876dc23aa7283929fe2361126a68ab8226f1b244ca163b8d970e50355cecb4d085132a0e4a7f88d842a26a6e1c76cec933fdc8a18d8384d3c6d0d13fc2d2a0f28e4dd84f14a0fdec9964ec143373791b27420ede61fc283fd91cd8448e11353b44a1b0e42e3a3ade6464426fa6d43e4283fdaf76171b59368b0a17393317526720c86c30d1c13453ea5eee06d1405a2d1694533361b4840ecf2891d8ebf2eb05a24246e285e53736142dc190d82efb2978d9285a2c726db491909b90b48a840ec91a5cec268df163b29b79126e26ec269bb0642f373f8da16942664dc5ee1a49933842e281d8371f16f940cdd84360c9b999554242cc1956f06d1cec817140cdc9b9b6a2c2242672862e286a3605874086c1db765376d98994dbce86bb1cd8e3a01b22d1313394dda299ccde9b9bc8a84dbca133abb60eb69919099ca6ed3b29b99b9091b8e86a360198c93b0dbcc848c86d3d372267121890b48a84d46ec19129b8bca16f3232122821b4ec2133890c6c3bd503a5c504fc2178b848c848a6e76dd89702464dd91a1a2369413b210b8942e189145093936ed2d7193702653765c81a8b82cb8deddb1276537321652c251930e93726ecd10d1d76026dc50b8e2d127653769c66c99425cec38729a6a2d76136e19dc12394dd938911a49b99990d9210d0daec218b49405e6d136db55dd32504e90cda369c134d45846885a3d76c4ce24d555dcbb8aa39515265047178b05cec26e6d19284dd84302de67cc8a12e13b131a944042425fffc4004411000103020304070602070509000000000100020304110520311012215106304041506171132232528191142333427292a1b1c1162560637334435462708082d1e1ffda0008010301013f00ff00b2a7bd8c177bc347326ca6c6b0d8b59c38f26f14fe93d28f82090fad82774a4f7528fabd7f6a24ff00856fef2674a7e6a5fb3947d26a377c7148dfb150e2f874dc1b3b41e4ee081045c104786d5d7d2d1b2f33ec7b9a3892aafa495325db03446de7ab94b5134aede924738f326eaf9b794159530106295cdf42a8fa4ae166d54771f3b541510d4461f1481cdf0ac531f6425d15359cfd0bfb82966925797bdc5ce3a939ad96ea9aaa7a6903e290b4ac371d86ab7639acc97f81f077b9ac69739c0340b92562d8e3e7de86025b1f79ef72be7babe5ba0560f8e11bb054bb868d7f2f5f0525ad697388000b92b17c5df54f31c66d083c07cde673c713e5759a10c39f6f8b8a750d43746dd7e1a5ef6a731cd3623302b01c54bad4b33bfd371fe5e098f62a08752c27fd477f444e6869e598d98d2553d03d8d02e1a9b4ac6eaf5ece3d37c29291b20e042a8c32620d802a4a59a3f898e1f4ccd7104106c42c1f111594e038fe6b059de7e7e058e629f848bd8c4efce78fdd1cd13739a9695d31bb8d99cd3246c2c0c8da1a13a691dfac55c9d8091a14249068f285438f0780429e8a9e604b3dd75b87253c1240f2d70f43902a4aa969666cb19b381fa1f22a96a63aaa78e68cf070fb1e5e015552ca5a79267e8c0aa2a24a99e49a43773ce6a5a632bae7e108598d002273b5e42a8609a22d3f43c939a5a483a8c81746aaf7269295c783fde6fa8f00e93569748ca569e0db39fea740bbb2c3199240d098d6c4c002b93d4836e0abe0ff00783eb902a799d0544333756381408734386845c76e7bdb1c6f7b8d9ad6927d02a99df513cb33b57b89cd49008d9bc75289b9eac80e69695346637b9a768474583cdedb0da6777866e9ff00c7876ec7e7f65864a2f62f218361c94706fbf7ddf0b5137eb0aac8b7e3df1f1375f4c8174625dea39a3f924bfd1c3b774aa6ff006687d5c7f90cad6973801de98d0c63583bb66f05beb796f705beb796f273d0910916f0575652b372473791da174564b5454c7f3303bf74ff00f7b7748e4dfc4de3e46347f5cb48dbc97e4361251ba07691b004422367140a6b82af8c7baf1e9b42c025f678a45c9e1cdedd8a49ed310aa77f9847db865a465a3bf3d9ba8302dd0ac1595914110b75060560b75594b187c65b928a4f655b4cfe52b4ff001edd2bb7e57bb9b89c805cd931bba00e4805645cd083da571413b4d8d56564f998cd4a13309f8826d8e8acacaa19bb33c79df683620a8dfbf1b1ff003341fbf6c93846ff00d9396959bd28f2e2ac9ace6aa9cf6b4ee828ef3a326f72a3def78f154d39e01f73e6bbc270e2514c09c388556f218377bd39ae746d23ea835c186ea91af3a5ecb7411c8a2d2157b2c58efa64c31fbf87523bfca68fb0b76c78bb1e398211162725137838ec6bac8b93a361d180210b3e54035a38001025d64752884d09ddc892ed518d9f204d6301e2c0420e16b06d82de57558cde849e5c72602edec2a9fcb787f13db6b19eceaea19f2c8e1fc7253377616f9e60de7b4a1b08575c3964780e691cc270b1dbd1d3fdd8cfdb776dc6d9b98a550e6e07ee2fb4260b35a39043659595b61d96c965619661691e3cf6f4747f75b3f6dddb7a4b1eee23bdf3c6d3fd36c62f230798410d80ec2514012adb7751d731555fa77fd36f47c5b0a87cdcefe7db7a55170a597d5a76c1fa567aa086cb6c3aa6b6eae005745cd41c0e8534f04e1c761d360451553fa67fd36e0ccdcc2e94736dfee6fdb7a410fb4c3243dec735c3f96d83f4ccf5410dbddb1a7822e37b2376ea110d29ad6b74088737891c15efb0ab71d851551fa67faeda78bd953c31fc8c68fb0edb3c42682588e8f616fdd3d8e63dcc70b16920fd36426d233d50db619381d56f5b805640d90ddef44e62a43791fea7661d0fb7aea68f9c82fe8389edfd22a5f635e6403dd946f7d7bf634d9c0f9a6e810c84ababdd00b74a70b2e2ae50395e6cd27c91e27674629f7eae498e91b2c3d5ddbf1ea3fc4d0b9cd177c5ef0f4efdb03b7a269f2432714d89ce4da74210bd87aafc385f87f24604e696943255bf7623e7c36e014bec30f6388f7a43be7d0e9e018cd01a3ab76e8fca7fbccffd6ca37f02d43202a17b1ba34027551cb19b5d813451b86a423053df83c2f6700fd757800e6a67c7dc004f76f3b86996b24bbc34776cc3e91d57571423427de3c80d5001ad0d02c00b0f00c468595d4ae88f076ac7722a48df148f8de2ce69208f30a27ee3c140dc023214090993109932f6be68cbe69d38e6a490b8e595e2361714492493b3a3f871a680cf20fcc94701c9be05d25a0f6728ab668f367fed6ca49ae3709e234432840ab944944e6aa9bda3ac3e11b200d33441da17807d2eac00b7816294df8aa09e302eeddbb7d471d809690428266cadff00986b9420361cd5753ab187d4edc2691d555d0b40f75ae0e79f21e098e611f8773ea62737d9b9dc5ba104f2d8d739a4106c54152d9058f076504a2af96a6aad7630f1ef3b68a8e5ac9db0c76b91724e802c3b0d86822dd67179f8dfde7c0ebebe0a184c926ba35a352556d7d456ca6495dfb2dee6ed06ca1ab2383fee83daed0a190ed73dade24a9aacbb83380e79219a58246c91b8b5cd3c08586d6b6b691928e0ed1e39387813dec8d8e7bc80d68249589573eb6a9f292777460e4333247b342a3ab1a38264ad76856f2b8574e781a952d60d1a9f23dfa9db7db83e28682670702627fc43979851c91cb1b648dc1cd70b823c02bb11a6a166f4aef78e8c1a9588e2d555ce21c7763ee60d3ebb0e7048d0a6d44a3bd7e2e4f246aa53de9cf73b524e71b30cc5a6a07dbe2889f7987f9854b57055c42585f71dfcc1e47b76298fc74fbd0d359f277bbf55aa596499ee7c8f2e71d49d9dfd8c6bb692b2a29251242f20f78ee2391586e29057c64b7dd91bf133b5be4646c73dee0d681c4958b63cfa8061a6bb63ef7685d93bcf6319209e58256cb138b5cd3c0ac2f1886b9bb8eb3261ab79f98ed3886274f42cbbcdde7e160d4aafc52aab9f791d660d1834194ebd8db9637be37b5ec710e69b8216178ec3521b1ce4325d01ee77669258a26ef49235a39936559d25a68c16d3b4c8ef9b46a9e796795d248e2e738f12731ea01eac699e87a4551031b1cac1234686f67595262d455760c9375df2bb81ec5598bd0d212d7bcb9ff2b789555d26a87dc41188c733c4a9aa279dfbd2c8e71e64f5f6e2adc725d0cc3a80485478e56d280ddef68cf95ca931fa19ecd79f64e3f369f740870041041d08eb2492389bbd23dad6f326caaba45470dc420caefb3555e395f5371ed3d9b3e56705727b05b65b8ab6cb2b05bb97bfaca2c52b28cfe5c976fc8788545d21a49ecd9bf29fe7f0a05ae01cd2083a11d449247130be4786b46a49b2aee9246cbb295a1c7e73a2a8aca8a97ef4b2171ec17d9740f50720eba8f12aba377e549eef7b4f1055063d4b53664a445279e87d0e5389500d6aa2fde559d24a68816d3b4c8ee67835566215558ede99f7e4dee1d8492af901cc4a26e1036ec7478cd6d25835fbccf95dc42a6e92d24961331d19e7a850d6524c2f1cec77d50b117055cf637776606f909d806c0b5ec7742493b9e738d9757d97ea1c8651b49d83237c20e99c6c3987870da75f0f3ae51b4e51e14ed7a9391bdb8758e4368da761c83c28e886d0329f0f1b475035f0cef3b5b9bbf637b35bab1d5bb51b0a198ebb069d5047c05c86c1a663e1ced10450d331d3ac3e0635450d3314cf0e3af5050f041d53bb972ec47c11c3821dddbefd9fb90cfdfe203bfc38752738f1039c673fe1a1d8cf880ffa7dc3b18f0f1d79ea0f879ea4f64e1e043c5cf881ca7c48a1fe25ee476847a83a0ea0f54320d9ffc400481000010203060305050604040600070100010002031011041220213141053051132261718132405052912342606272b1143334a1062482c115435392d1f01635446373a0e1f1ffda0008010100013f02ff00f477bedf982ed21fce3eabb467cc15f6fcc3f123a2c36eae09d6c863404a36d7ec0046d118fdf57de7ef1c5788d0aed627cee42d5146f542d8edda9b6a8477a20e0743f86dcf6b7529f6d1f7427478aed5dee01c46e996988ddeaa1da98ed72fc2e5c1a2a4a8b6cd988b9c753eeac8cf668542b4b1fae47f0a458ec87e6a24573ce67de60da5ccc8e898f6bc65f8463dab667d5135e6539ec7969c8a85680ec8ebf838b83454951ed05f97ddf70aaaf341a28368d9da75fc18f7b582a5458c5e6a7e9cc1455f0f730a05a2ee474fdbf053e23582a5458a5eea9f8105678f4ee9d3f0439c1a2a545885eeaf3c0545755c5715d54e782acd1aa2e9d7f03da62de3746811e70966834aba42a2a223dc1a482141897dbe3bfe05b447fb8df5479c21b8a1074c93602105bb95d9b576397b25761a7d9146033e521180c23da4eb30a6a9d657ec8c278d950f4e6c18a58eaa6904547e03b4c7ecc507b451cb9a0127250e00f329b01fe499651ba6c060d906346ca93a230d9f2a3021fca8d95bb129f66779a8967ea13e01d916913af2015023dc750fb27f014588d86dbc55e2f717947990e1be21a34283656b3c4a0df04d8483472a89f0c151605344f87d54484472c66085648d7d974ea3f00daa3768fcb40b414e64284f88ea354286d86da04d0990f9ce65546829c28a2b40351cb63cc38a1c81a8f8fdb22dd65d1ab9375475e5b18e7baeb5438618da04d154c65101cea2736aad10884f6a70ba6633c6ed02b1c4bd0eefcbf1e2a344ed221726e8799021766cf13aa636aa1c3a7b89511b50ad10ae951595180e3b2beec61e397c7adb12ec3bbf34b6e5d9a157be7d1342850e8821ee3451a1df0a2b0b5d4515b43cad0a69bcd07afc76d512fc53e197321b0bdd4098ca0014186821ee655a605e155119a8e53b556375608f0f8e467dc86e74872ecf0ae333d4a810b743dd8ab5d9e9de0a2b33af25db2b03bdb6fc72dceee35be321af2acd0af1bc740a143bc5014f78736f056a8170d364450f20e8ac6ea461e3f1cb6bab169d24ddf92c697b800acf0740344d6d053dea34211194568865aee46c542376230f8fc7223af4471f190df9364875f32a1430d6aa2a4e8a9caa4e8a8a8a98b8859ef36f8e40934d5a0f87c6a33aec379f098e40152ac50aeb2a809d1018860a4e93a2a054545445193a842b5c1eca3118c4acc6b019f1ab69a41f3331c8b1c2ed22a63693aabcafaed9bd42edd9d508ac3a10abc9acaaaf85da33a857c7545e7a2ed17688b9555571085da42bdbb790755613f66478fc6ade72609edc8e1d0eec2bdd50997003328da1ce3dc6129c2d4ee8bf8779d494db3d374187550dced9c4a6bc9579570d555129d10f54e887e545f1ba510745a77b4f44c31eb9307d6887f11ff4c7d506bb70a9e537ee146676715cdc65580f79e3c3e356e3f6b4e8394d179c028228d68080418ae355c67ca265a15d5755d90c46451155d903aa108210c2ba301683aa2c4f6f9ae210b47fa632ac8691dbf1ab49ac77f2ac10efc6f250999203914549890ad79b5914e0ad906f4178f0e4423488c3e3f1a886b11e7c795c321fd9977529a301206a576cddb35da9f9576a7e50bb5ead4083a60071133aa31479aed0f820f7f5fecafbc745db53509af6bb43329e14765c8cf6f8e3087c60a3cab1b2ec260f042554e88765e29f1d8cd57f1d0ab40d257f1909363b1c7272afa14d8bf322641370144c894e7d74d145b5b218cb3fd93b88b83b2feda23c45d41ed5541b5c77b4b855c9b6e61f681050298f3228ae24ca5a2bd79104d6133cbe30ff0061de5cab3b2fc568f150c652aa7bd458ed66a535d6ab59a33badeaadb67102137be4b8aa3ebddad7c135af73806824f826c4787d5c4eb9a7408d0855a6fb7fba64563b24d27428a694d9944aae7288fa0cd4282e8a7bf5bbd17141f6c21b726b427d9e2b21438ae1dd7d6efa23658a2ccdb47dc2ea2e1914b2d6cfcd9156bb1c28a09a50afb7b33a9b283183935d3e2b0fbad774e4590fd837e3113d87f91e570d875797744c939c9f79760c73af4477905660c0da3745c5a1e50ddd1323c6b3c4bf09d434a281688d02308b0cf79358f8d10d4e6e39a0da340f0516043755c4d35a1f1505cef61faea11f64a626a1271457de47345b57827d9d942a05c621dc8a1fb391bfa6c17da5dbb534e8b8640312d20ecd4f346a8af86756821358caf72adf04d0e0838cad70efc178f0e4584fd91fd5f1889fcb7f91e570e874820f54d938220a30eabb3783927be239971fde07aafe01d5fbd4f242c512bdea5142b2f6712fb07957347b676b18aecbabdcbb0a3efde2484744cd64d3948a2b747442cd4dce6bb377fd42a3322c465d71bc3c53b87f4377fbaff87547b4e5043acecbac6d11ed1fad5082ae20d2375764e56a65cb4441e38ec1a3fe304541e4b5b79c0282cbad03016abaa8ae05755d5742a2a48a684109191427441a8542b815d6aa2a2a4cae2b0e8f63fae3b07b4ff2f8cc51488ff3e458197ad03c130658a98692a2a6133186f155951526515c4197aceef0cd532c561fe63bf4fc66d4291dfc8e16cd5de2861a63a73a8a98ca2a2b6f348eaa94a8e871587f9a7f4fc66ddfcdf4e470d652cedf1e65398394645395a45db4c51f991d70d87f9a7f4fc66de3361e459db761b0787bb56424674c251915c445db51f108e1b0ff0031dfa7e336f1dc69f1c7045e8d0c7e6099218693a602ab84cc21cb322b8aff00399fa51c361fe63bf4fc66d82b04f863b08adaa1a6f39e55e42430141c9bcb322b8aff00321f92386c1ed3fcbe33145e86f1e18f877f54df228735efa224b95d40484c84e544c71081af28c8ae2dedc3f5470d8064f3f1a88dbaf70f1c5c37fa9ff4a1cb29eea0449253420d545755d57516c9c15240a079267c57f990fc91c3611f647f57c6ad8da46f3c5c2ffa83fa50e41559c54354d12aaaa055e5da2282211126cc4ca28a322b8a7f3dbfa51d70d9452037e356f1930e2e17fd41fd28731c2aa9429aa23de1bdd19a169b6b5ddf8608f0c94388d78c955555539c027dae20fe5c2af8950a2f68dad287a2726a1c838389ff0053fe9475c2c175ad1e1f1ab536f41778678b867f55fe9439a5aae91a21545a1cbb12d356a0e9dceaae85523408349d50c3b287da50dfeb3332ade7fcdbf0c16de8ac1e3f1c88dbaf2de987871ff370f1d33e61015d13a2a722b88ab59ada637eac3626d6293d07c72dcca383bae1b21bb69827f321ceba2a0fbbb8a79bcf71ea70d89b4855ea7e3969877e11c2c34734f429a6a3dc6aaf2aaaaaaaf3ed8fb9678a7f2e2636eb1ade83e3b6887d9c4236db0d8df7ecf08fe5fd90e55555555e0bb40bb40bb40afb55e62ed0745da782be15f579555794571689484d6753fb61b2b2fc51e19fc7ad90ef32f7cb8784beb01cde8e4392ec82be8c557d5705557c556555795e57ca11107028721cb8944bf68a7ca2986c4ca30bbafc7e3c2ece211b6d8385c5bb68bbf30410e438553a1d6aa2592912b53aea8437d3da548c35a273de3eeaedbf2aedcf4285a02edd95d764638a573fa2edabf74abe4ecaae5589d023da7828502339f9c429ac4319515e18d738ec9ef2f7b9c77381ad2e200dd35a1ad03a7c7ed307b4665a8c0c71639ae1b150a207b1af1b8439242890ef054216a24e80d2bf86155d895d8aec4d57639557634dd5deed299a39faab954c65d1c9715c4e3d18218fbd86c30f32ff00a7e01b641ba6f8d0eb838546ac330f719a07965a8b68a98775b7a22a88313594e4929ee02b55688bdac673fe981ad2e20050d818c0d1f805cd0e0415159d9bcb6702318315af09ae0e008d0a0798618570aba7a2a2a1574aba55c2bb354e492895c4ad146f64353ae1b1c0ba2f9d4e9f80edb0aa03c6dae0e1969cbb13b7b28143943051515165cbaa25468cd84c2e3b28911d11e5c7538182f380ea50c87e0322a28a343ece216cdae731c1cdd42b34711a1076fba07deeb2255b6d3db3e83d918617f319fabf02db999b5de982cd687407d469b850e235ed0e6e8503ef355544ab7dae9f64cf5c501b7a2b078fe05b432fc270c364b5980687d8298f04020e48198c75e7144ab65b3b3eeb7dafd96b8ac50a82f9df4fc0d6a8371f51ec9c365b63a06473626446bda1cd39155e4d39c4ab65b3b2eeb7dafd91249a9c567b31886a7d9405053f0316870a10a3c102206c3cc9fba88c167b5448072cdbb85063322b2f34aac8190e619932255b2d9d9f719ed7ec8924d4e2b2d9dae17dde9f822d16bfbb0feab83d93bbfc43b53ecab55860c7cdcdcfa856bb145b39eadeb821457c275e61a2b35ba1c5c8f75f2aa064396645128956ab7fdd847fd5c88319d08f86e135c1cd0e1f81ad569af71872dcab0d9bf89b4b19b6a535a00000a0128f0191585ae192b559dd022969f4c367e23121d03fbcdfeea1456456de63aa10320796512895162b21b6f3dd4569b73e2e4deeb71318f88ebac6927a0565e0c00bd68ffb14785d9467c3e865628b475c3be9f816d91eef71beb2e050690e245ea6827456ab2c38ecbae0ad3678967885ae1e470b223e19ab1c41567e28d3946c8f5098f6b855a6a155072ae2aaaaaa2539d41526815a38934650bbc7aeca2458915d57bab860c08d18d21b0b959f80939c789fe96a836681671484c0dfdd15c6a1522c389f30fda40906a1428ad88da8fc07162086c2e29ce2e24950d8e88f6b1ba92a0416c184c86dd861b459a1c765d7b6aad96189667e9566c71438d1611ee3c85078b1d22b7d4285698513d8783e083d5e57955555e5795e4f88d68ab9c00f1568e2ad194115fcc545b4468bedbc9c5c3b863a3fdac41f67fba8509ac14028265718857acb5f90d670e23a1baad5063362b6a3d7f00c7b4b61e5ab9448af887bc65c0ece0b9f18ed904314486c7b4b5cda82adfc35f049730559fb72196db4b3fe657cd338b1fbf0fe89bc4acc7ef91e617f1b67ff00aed5fc6d9ffeb353b88d947fcc4fe2b087b2d715138a4777b0037fba7c58910d5ef271f0ce157e91638cbeeb506e02ad10bb485119d5a569363dcc35695063b628f1e9f1e2e0d152547b61764cc875c1c2615cb143f1cf1909cd0765c4787f675890c65b8f746b5ce20345495c3b84887df8c2afe9d10184a2adf0fb3b6476fe6fdf00241a8567b587f75fafc7234764219ebd1458cf8873fa60b3c131a3c3863729a035a00db905a9f0c11985c47861875890877371d3dcacf668b687dd863ccf4561e1d0eccdeaeddc80c4515c5ffaf89e98a05acb7bafd3aa06bf19b45ac37bacd7aa24935270f07feb47e928729d0eab8870839be08f308b48e7d82c0fb5bff20d4ab3d96140606b1b4e4145716febe2fa6381687423f97a26b838547c5890054ab45a8bfbadf671f036d6d4efd0a8872f89f0b11c7690bdbfdd781e6f0ee12f8fdf8c28ce9d54384c86d0d68a0e499714feba37220477423e1b84d735c2a0fc5224564315728b1df175d3a723813a968883f22032e6f15e17db031a17b7b8eabc0f29ad2e200152b8770710e9123e6ef97a737881bd6c8e7f372614574275428515b11b51f128d6b6b326e6539ee71ab8d793c2225cb743fcd9738ab7f0c65a055993f6ff00c27b5cc716b8508db910e1be23c3182a4ae1bc319656de76710ff6e69dca8e6b1a21fcdca86f743707050a2b6236a3e1ee7068a951ed2e8990c9bcb63aeb9aee8542735f0daf1a11590e4d6655bf87b2d8de914687aa8b0a242796446d08c566b1c7b49ee0cbe6d958386c2b2b6babf73cd2ad112e4088efca9fed1e5b1ee63aa141b5b5f93b23f0d7bdac152a34774577874e6f037f696103e47539cf7b182ae726442ffbb928b65b346fe6416bbcd3f8270f77fcb2df22a37f875bff002a37fdcad3c3ad766f6e1e5f30cc4b8670bfe23ed62ff281ff00b931a1ba36e81a0e921c9ae0e30fb9627789e759ed74eec43ea9af6bb420fc25f1e1335727db5e7d9144e739da9af3bfc3d1a9122c2f9b30a9cbc8664d17681c3bb4a75569871444bf5242b33da6189970444677403c5378558844ed0c2abbfb2a65a009f1fb234883d4287121c4f65e0cabc823071d8ddf870ba67cf04850ed8f6fb59a876886fd0fc11ce6b7529f6d60f6734fb4447efee3c3e37636c80ffcdfbf26aa8ad36b8164877a21f21b956ce2369b5d6f3a8cf902e116cffe9dc7f47fe1127a265c1e09b78ef92b8265fd335df2ad506244399c94181d9baad26a9916b9395103c8227c4e2f696e8c76ad3e9ee50ed3119e2143b54276f43f00891d90fcfa27db229d3245c4ea70e7d39f648ddad960c4eacc6500b88f1687666dc874745fd94488f88e2e7b892537a7540969046a159edadb459aff00de1ed050dc22529aa0d000024e7516bed23d577b74e09cda6cbb4a7dd506383be48840cab8e23ee437bfa34944d49277f7464688cd0a876c69f6c5135cd70a835f7aaa7dae1374cd3ed715de1eefc0225eb0d3e4790ab84a01715e2cd841d0609efee7e5c0eeaac918c28be0ec8ae19de88e77ca3f745cd68a934f3513895861eb686fa668f18b15faf6869fa57fc7ac7f2445ff001fb257f93117ff001059683ece221c7ec5f2c4fa2771ab011f7fe8a0f13b3675711e6144e2b6467b1577f65c378bb63bdd0a2519f27fe11087238c45ecac4ffcfddf776bdec3dd3450ed83efe5e283838541f767c786cd5c9f6ef91a9f11eff68fbcff00871ffd433c8aacab2aa03aab5c78b74885ff00728d6707c0f55d9187ed22dae8bb32b6a190b65a5becc42df24f8911fedbc9f33c8aaeeb939b73305709e202d50ae3ff009add7c7c5698cae3f1ef468707e5153ebeee3593223d87ba543b68fbf926b9ae1507dca25a21c3d4e6a25a9efd321ef9c0625db75df9db45784b45de2b268cca7b8bbc95145b2b5ebf8623270a851f841f6a01ff00494fede13aebda41f14493af2a883555ad4e355062448511af61a10ac76b876b837c6bb8e85692a60af556e8ddbdae3441a1765ee5bebc96bdccd0d142b68fbff541c1c2a0f3a246643f68a8b6b73bd9c87be19707ff00e6107d5550aabbd53a281a2a93aca8aea2c0552eab758db6a87ffdc6fb28f242d139f264373ce4176655862c7b345bccd0fb43aa63db19979b828aab8b5a041b1bfabfba263ce5b7b98c4c8af87a150ad8c77b591e5bded60ab8a8b6dd99f544926a79bd39949f59f056936f678029adea9ce6b06683afa709008054544e08e4b8a586f56d10c7eb1fefc8a2684e32b25922daa2dc67a9e899c3e0c183719ea7aa8b67a150e18501e611cb459385e0aaaaab2e3f16f5a590fe46fef83c00ce74e65308451a62871e243d0e5d143b64376b914083a1c3fc5c2f15fc641f14fb6b8fb2289ce2e35279dd0f2a8a992c82a8ce92d8f5c1c36d62cb6a6c477b3ba8dfe20b3347d930b8aff88c78d6e831221caf69b2852ba80c0427b2a8d5ab8858fb17df68ee3bfb6208271a4acb658d69897218f3f0562b1c3b241b8dccfde7754e29f0ef2eca8a8a1c430cf8205af6d44f456a8c635a22c43f79d802ce55d05152b9de570d2bb7329e180f25b11edcc14cb73c7b42a9b6c8275c9768c3f782ad513ee3434d3110a9a66bb95f057bc33578a2eca9413cd1c7677de6b1dd5a391451599274364563a1bc6455aec716ccfa3b4d9d88271cd4182f8d11b0d8332ac76565920dc1afde3d517aa972015d46127368a1c47433926b9b10542baadf1bb1b1c67fe5a7d7174183755d32c95e2ef04036bed51a83734d6d551666aa9d30e5ee178fb8decb245ee26a51895a77453a057fc3257ba8c95eceb7517570515d3d152672af972386beb62b39fcbfb724a8bdc7554684cb4d9dcc3fff008a34274288e63b5182a9c7bb2e0f65ec61f6eef69e3bbe48c455aa68402127b2a8b28a1841dd571e73458695f69c31d2b808c1577557dd9f8aaeba2bde1beeaf9c82a8a372dd17fd2992bcdab7bba2caa5525bfbdd15150abaa8a8a8a8ae95459755e8be8abe2ab3d8f27833eb63a7caf29ba72633010a0021c4782e2765becbfbb7f6c00289e4ac365ede2e7ec3755de28353188054c05a1528adb14c38350686aad56c8f6a23b47d69a722994aa55e3d154fcaaa3a2a8556f55ddeaa8a855df0577c30d15d774f7bbde2af7e757ff32bdf9d5efccabf9957f3aafe655f132bd8a89c6a49e4f037e71d9e4543e4bf450c7da7a27b0156c83d8da6243f1c95d2a9e2853aaa5e78cf5506ccdb3c30c1ebe29ac4d62a7238cc4bb0a9e13a63a6aa8a92cd66abe0b2e8b2e8bbab2f997fad77be7579fe0bbdf285ead0abe255e27153e081b52324e3991cae12fbb6d67e604287af25e99edfa4b8c4068b4b625ff6c69e482354570fb1bad71ae87529994599aa21c9e3913bf7795528caee3a2a0952544553df423c9a49a06753b2fbbebcbb3bfb38f09fd1c143f6b931133da0b75c5df5b5347cac93b497f87c7db463f9263905711897ed079755a932a730eb3a235f75cf08470678292bb97ec9c685c39b62897e0c07f568e4c4286a14519ab53cbed718fe6fda47497f87bd9b4ffa644a6f22d2ebb0221f0519d7a2bcf8f32be6aa3a2d0eaa9c9a7c03790999d254a56bad11d00e77087d6c6cfcae23931534ab4bc321ba21d9b555bce27a993b445708b5ff000f1fbdec3f274894ce47158972cc79f7bd553c44b65496b83790c1d3deb7c402a2a1440611f555e7f047f723b3c414dd07222a2b8cdafbacb3b7cde9ab747493775c22d5fc45968ef6e1e5e8bef26f238f44a31adf70069a2ad75fd91f39515259c823a73b255a7b87495657660679ec8d28053c51ccfb87067d2d2e1f33143f679118a8b144286f79fba1447b9ee739c732821aa25141709b47616d6fcafee9447793791c6a2dfb453dcef0273af92bae19d3ca54c0795454c19228737344acd5d9d2abb83d0fd513953dcb873ee5b209f1a7d5423a8c6545cd7158becc2f574b6413b059237f116585177a67e61331c475d639de0ad6ebf687fd1114f73069a2d868b7a208b72e7d246439ed394db773ae655f397f655aebee6c75d735dd0d54275483d71bd395a6276b1e23fa996482760e031bf9d03fd41371f118972cc5135af33a727ae5b2082719fa61cb92e479a244207de787bef59601f0a7d10c4f56c89d9c08aefcb21209d838746ec6d909db5687d50c7c762521b5beed9d1be52ff6559379eed647dc1b375753cda72383beb67737e577ee9ba0c4f5c5df4801bf33f004fc3608ddbd9613fab73f4c7c6a2dfb4d3a72769e5c919efb89b8ed2dbdc8a0a9ee3dda6b43d391b73782bfeda237e66feca1fb384a7ae2eeefc16f99c013b0ff0087e3561c585f29afd713cdd693d02b43fb48af778cb3c39e0a72725469fed2da40232df91a621229b3df91b4f7450965baf5afba70f8972d904f534faa85be129eb8a9ff00374e8c185c11c1c122dcb681f3b48c5c4a2f67638a7d1135f74d33bb50ba506d274f7969c9f4c06b4543d2450989d39051425544fe5a7ba34dd21dd0d54170750f5185c9eb883ab6c8be14131228e08113b28b0dff002b814d35683878f44fb286cea7dc29845e61d3d6559096e79bd24759b90985a728a09c285090bdb7d3dd02e1afbd64807c29f4c2fd13d4735b4463f9ce008a3878545ed6c308f4cbe980ae3916f5aeefca39f5c340725576fe6a89d3d90c1ae112df00467bf2ccf64344744264537f74e0912b02233a3abf5434c0f510aaebe3802213861ff0ec5eec785eb81c680956d7f696888ef1c7b4f2430530b431da9a15eb2de6744279cf2957497491914153c64795eb2f5c03796e84bbb4f74e0aff00f32f6fccc4cd30445697521c43f94a183693b7c3c0e25cb701f336982df13b3b344289a9967ee44b5dde155d119091d42df9da9953ca65579dbad93934cb21af3698f87beedb209fcdfba878222e2069678dfa70891c3657f676982fe8f1838f45a410cebc8d25b72b319a34bd9652720b2411d7d25fb63a48cb7554309427590ac8add75c3b898d67535f71126bae969e99a84eadd77518222e27fd2c5f4c5b27688e1b244ed2cd05fd5827c722dfb481ee1e13d577c7773a67491905e72aafeeba2eb2f3c3aa08e1cf00c0394e99425def4c7ea872c2e1cfbd63807f2d3e9822ae2a7fcbf9b84c4f5451c3c0e25eb081f2b8893cdd6b8ab644bf698be74fa72c4fd2594c50d4159efb49c84b75b2d16c861d566bd247296c848954c030567e93ae1e8aa9c9a654597fe3dcf82beb677b3e57fee9ba4e32e2dfca6fff00925a601aa3a689d87fc38fcad0cf232b745ece038f8555667066ab804eaa92a2a7741a10419d5059f491d82a60dce11d64e96f32ab8379d254e4e533307c3947178e0e0912969733e66fec9938cb8b690bf519672cd648234d11c3fe1e752d711bd592e3b1a906e7cc698ebc8cf00bc3bde3aa75dad47af9add3b44d9fd51fda54d3005b6d2217fee686853a425597a603b60ca7e9332aec8c87fb2a49c334d9568b2eb5c74e5d8a27656a82efcd9a66b38baae2dfcc823c0e21274e92e0eebbc42178d5568171b8958d0d9d057ebee7a6b769ff00f24138e69b2dd0f2c90f68c8ceb2da5e52a6b3031093b4e56d2f245517de904ea5168645137b6a78fb9d9df7e1417f5689c4d5716fea183a43c416c9c8484b87baedb6cdfac279eeab73fb5b5c73f9a9f4965d399be0001ae74a0aabf79a3af5f35fec9c72c155d5365597d243c9555267212186f60d90555596588a19a32da42a8f949b2cf646bd3dcb84c5bf626fe42421289aae27fd67fa022153000a8744e549007a2a66a13ae4686ee8f053ed2dec633fe4aa1cbdb1e6dbae5d504e39a010592f34749133f59d654327484b2e46e8729b8365bc9c84b35feaaa38b2e4e72e0713bd1e1f855334945d571035b644f499a4db272c95537344553f55fc59fe0a3b2b9bdc309c1b61cb06595566d0e6fac8e43cf0e49d873ce7e8b35ba251d641567eb88a0ab84a345b2286abd6624660d65dcceb8f6e5f0a8972db0ff377543944d54775eb4c73f9ca2119532592f55e08b7354545a15aa89e6ba4caff0069e7836c159eb514cf655cc132794d99f3f4592aeb318b75eb80728a6a0a9868aa9c9b83732c914ef24d965baf4c270e93d7031f71ed76e0d54335a1eb289aaad493d5c55729147341573d56dbad11d1119aa65559f5d944d109672a7373d28ba1076a516eabbad65e4bd164b319a18ab22ab2380cfa2a6028c9a646884ab32aa8692dd1d44b296abd933df455f71e1b17b4b1c077853e928eebad887a0299ec890c1f44365419f764eeabebd50aa8bb04dc19ce8be984a0b390f69a48c96f4ad504f282fa2a200e5d5135cca23f7c1b4880ab3d5513b9a64cd565547a2facfcd6c8c823ac8e1704d32cf6dd533a7b8f028b585161fcaeafd50d15bdd4b35a0fe429ba0c1b207c640ac951688954510d5e791bd3939e4b2bae04660ad4a3502404cf9c8eb3c97961d25b4c738199c064c55c267baaaa2ca83afb8f058976d977e76d135716752c91d0d0794ebaf8a06b2dd550f347fb27ebe8b65a6e86aa8b3e66d2a2f5a513aede3493dd5dd0c192aff642464298c998965cc6e827e08ace464354692d10c2e40add6e719c54457595962f656982fe8e971877f9623abd0d063cd0f3544e19d56fe89d9353565caae2f672cf367f795775baa2e884dda7f696c8c82149e6b25d119896783d701c0c380a1ac8c8213eb848909667d10e75656589dad96144eac0b89c6bcd0dfce868aeaeb886cab9a70a8d3d6513609b8f3c39c8229b74ba874df346a3baedb25e09c66555674ffdd96e9da899c7baf54679e93de7ebc864baceb2320ba672dd6e25e381c9b2da931213ae1ae0e0b16f585ccf91c55a1f79e7cccaf2bc3259157725a2aa12d822b64ff6d05e93a2a2a4e92d6792e8a8decce956959946b49012ce473cd516a4e2a60dd566262b3d9797206b8ccc1c1be17042672a21cfe0d1fb3896867cd0ebf44733802a955957c164855381bd44ef0aa199431565ae745eb3cbcd652ffd2a26bb51c2b279da759342c8e80d578cca38b293a604b691439633c2700424574c4ed53564865bacc6ab696bbe0a721af2c3781cff00f288c46aa82402cd1a7aa8bdd626aa62d329e52ceecbce4da8c88736a3559aac82f290428bc42db0d67e227e68c821ee0dc069b48cdb2321a2dd785701d10d6791033d069836c1b63213bee2ace98420aaa39d101a23872ae1df00049c93a9721e79d3354a271a0a202a70f7bac8eb4d2466311464246933829c86f25b83796733229b2cb7440d8d71d25e931faa75cdb832c59a35cab451cd62212e93dd565be365f1de04659792caf54695acab54d1aacd672c9537cf01f298c39a331208cb3e41c0157052464dd706ed9d67a229b2e8aa371433ce92f4c54559b90d16bc86556da2ad5d59d49c7be271ba1cca835029271c90429b99fd2674282d919e9acb6c06615567cb38472448a3feea824504759b82072555de1965ea8d41d29ce779a6e98365b2d704575d867aa6e0230e58335aeea1665dafb3aa73afd3f4c89aaa4bc51900b328ed2f44719919854e59c4311c15cd556cb65eaa9960d511509a693a12dd41a60d394744d96c25d30040ab41ee84d12db10559813d030fe5d8aa276482ae1c979acaa8e1123aacf1e5ee216784cc1c03a480e8b2e931b49c134e52faa70deb5fed20baad31d6754dd16dc88c7bf4434915532fa2d25b2df0c2f6d99d3359569d0c89a9404f29059e8be884cf94f2966b696930822862388e00b3ca59cccc15b4c7b52d740b491c03232a2a329d0ca9876e43259f5c55a2ccbaa861c909ef2f299c983bc090e5a271cb540213df01a50aa2cd648cc564245198919e6394708c192331213d0cb69fa4a9d53d30d5672716ed873953c65bcca3aa6acf152a9fec94d9159cabc9a655ce9d5388bc69e88f923acceb3eb339d264f8aacb7c46610464701e499b7094662657aaf34769d16eb647c10342a92beea52ed70997acf29940e1f09c63951356587aaae36dda446939d2b55914f39218b2425bcf3c6246634e50c666d999146624699487b2862a2f34e1d130cb3d4551110f788c00cf2c1a22324344d465e8a92aa8bed26a34c2023ae0aadd30572f0d3aa7bc10d14a6598aa08e6550e0136d7d2435991802a1919198da742a98a988a33084b591aa336e01a95be23a2aa232956433cafb479af5aacb09c6d28e0ce5ab936594cceb2ae4663b9d9bb593cd10974c4344745a232f55598c2643959720e06e1336e06fb4abd7914c914ce932dcaa1c4e0fdf16f3050559b75513269410d16ca952b4c145e0b496c80d2b5a22eee5c34347648239954c657fe139653cc4f2e4facc60282a0eb80e0381b85d36e0dd6fb2f5dd7a4ce523234a4ab5121774703e8bcb16b8db81aa31ee7aa6cfd27555c41adec8bab9dea271a929da20279f5c1aac914701c0393960ca46431191466d54c0700d114556592acb3d17a4b29bb54d33776741dda62cb06c8f9c9ba600a37b544d5d659e2a2d1668a7d1a4815ef05f54734279caabc1042aaab7c0717ae10bae006811c1e921328cccdab6e409ba8beeaad17ae328c8688a63ee1d023d6864293cf4c6dd50967271ab8a0b2c35c50cd4d35aaa9cbf64e34144274559d65ad6427b27720cf6c545bca9229b2ae1336a1c86e981a7bab34461db01081a1992e76deabcd579250425e889ee94354298b4c194af7d9b4e55048fac8e6654f0c1f49d34540b35b0e5f5c59610ab2d36937199b759991466c5e73035592779f2764503948120e49cd235a60ae23269ca710f75350592da59cab8324d34735dd0a886af779a71c90c5960e9e49dc90b79511e46d2f45eb8060a6032084f2919b667c93779653d96559e537040d0cdb79c3dba00b3ce7f591acf64650ca3aacd4639a6ad57aacd12b25e4b25eaaab75e4bd986ead467d1649c73431532597596523a890966b2e41909d391593790663014663543698d564a9a7fed5668cfcb0528b245333ca5415472d095e13cd7a4facd9aaa2c93bda427e12d9796caa65eab641af209a699a88fbce2538d32c196232eab79678c603218aab3c431d5198d30147035190f682d16679642d0a14a4806f535c396583293415447206431e7808ecc104037d92399404bc7939adf97b601cd1c8336cab2385b3dc4b2f591c355b607669a5142ed7bc324fbbb4fc157052926f8aaa8993536470653a480bcea78273af5dcbeed1132a62aae9315ce9218698ce3da43dc9b2a4ce06a2bd5155e410ba602b4433a2a9556dda5d0b29095259a29d59554539a6a004f2c15915ec5d2370bd51d5059f286f2133c93c8284f295101cc6f25b3284ccf299d154acf49b934e72bc4669c73cc7f69fa4f2914dd17a271a94dd10cf0955a190a5734d00be8869e48995085aaa4b49530143aa3a208727391e7539a155678c4ca1ecacb75acab84a1808c8c9a657de76ad1663ce59cf259af44cdd3b296d2fda5b20b3a4b51234baca6ab64505b2d391e1209da2ae0380734730e3184cc2131a20aa3009658b608a69a1934b8660a734eb4d25aacb014354f26ed10d50f2c79c81a39a5575f34e395279c8aaaf4e41c079051f7538c4ca3844dbbcb3a9465bcab2f5c03c114449b9890693b85e0ab3f59e8a2ec9b3aaaaae0e881fb355cd1430d56a25d5555666bba32a63180fbe0e4891d537791ad73c55c265b229a73996ddfbdacb69d664a62e9c865439aecf22a27b67bc8e987359f28e02b5f75aa388f207242ca9215bcb398c1e43019e68c9b989345753a6d3ae26ceab59d33451375af6679d0c8c82cd7a60d679e0a648eb80d7ddeb88f202180e00b6121ed60f29648564255c264d34337dc14bb8dc9ba61aaa480a8f2faa79a9cfa226431eaaab3c02b9fbd555557dc32c07009e842af23655c1bcaa8c9a6b26967dfaf84f2c0534f200ba75c88d969b225090c7be1eb21ae03ee7555f72123884ce0a2cd672132bd309934e7389439b1a69e33c919142656d30d0e34f044934f044a0b4c55c7b4c72f3e45705153dc84b24448cc20b7cca74f455cb0d32952b804cc9a64da8c8059d73c7d166b3d301ee886ef0554e35415329199de54cab8299cc487247b9ff00ffc4002c100002020103030304030101010100000000011121311041516171812091f0a1b1c1d130e1f1506040a0ffda0008010100013f21ff00f0ed2b91a728f27f823fd744b8f709ff00d1e271fa481dfda19865da8798df2c92495a281650bc8978f78dabdc85a237d8cbb770ae50d74ffcdab95a14af3b332c70a86f491926f24935af9d3b32689310e8e1beb651dbf4134f1ff967449219823ab1ccb1e93ea8f577d6f49247ff0041e0a0ff00ca09c59e232bd07ebf1ac57a36f57714898cb2707f8270fe38ff00c84904bbbfea31adfa67d32676d11d06991fc33ac9a022db1f7ffe39d21244a24ae1c8dcff000c925962138dc625a47f06c2ce746f60b493ba3877139ffc5bdbff00b36b1b701b9cfa6bd49b9fb0d04cfa73ad11fc2cd141e49a76bff13337b2e466f12e06ff008969c7a24927f96c91a0aafbe1f1ff0088717521f99f65c0dff372901c861b12d0d413e8923d699076209f4c755ff87bf7f231a7f897a1776591c06df06e96e3a2a7dc61a3435e99a8fe04420ed61899f661ff00858a59dff81fd690f45adba23287b5281cec49827e13f620e32c741f68566ffc211128751a824ee70867d86b6d36f4b51e99d600be5096c94fff0007e073a751a19bfe58124b168a9f6430b6faca1292d3ea308a4784250421a8d6cf61bda3f80cdb3fb0c92a124333aad8c6a3d4862b229bd7e1ff00e09afc2b964bdb1a5ff0ad6d33f02ebee0bc243990860823484410410448c27b43da42dd2f91cca55d354f6781a87ebf00a2e2fd7ff81a26e3fd8e9f77f0bd605777b21217dfa8d6212b425d08208235820823468526c3d4d0f68cae08c1dd6a9ec35e958136ac42799f0c421ac353ff007eccfd024a8d2cff008d4916fe82b2f19eac7b1084105904690410468c82342d60692bc8b75035a9ebb137b119f4264e0b748bc67ecffbcc926de10fdab6ec51fcd7f27bc4df829210b68484411e88208f4bd498a06e1a300ad13ab4a4f7dfd135a6cd743a76effbd0099fb3454ba3fe1e98984ebc8e6e85a26c45c082f1fcadad18fc3b0b673c8f4c8b1587aaf4cee2c9746cc5a3d89ffdda1e28d3f02fe14af33e1111e160861b5a8a34f623f87b68f47a5a454248a98ac69a6d7ad6eb928fb043f935ff0073a1cabbe892d0ce7f86e394ff00448e4a84a1085fc0bd1e7d0c63f22279264343970fad674c07d09ffdc8f952f6d663fe0a72caeac7a9bc2149084210bf83c0bd6f5629a9aa64eee0c627fc1f7483f06bfee767634fb1a3f5ee844ab0942d48409090bf920820823482068687e6a7b31ea72a9ff04d074557fee758db4c7f84f6a5fa0424854d09096a468d0ac8d208209704094aad2f41881a1a18d1535ac8d438f5e5a75ed1ff00dae82b6b8beffc11684c956f512168122082110b441088d10245885d0847914521a0cb09a245793c3a6717e57af21d3676e28f6ffb549c0b5c3f82296cb229125a2c0906a24fe87fd91029fa4ceef225e9aceb5a3a1209c0e3d3a1d447fb671a88725b3563ada20cbb81c865507fabd68cc4bc6fbffed795b7aafe02e4e7ed43124ddfb1364247d2a7422548b750d0d9afe5c7e463a8794ba0b3706eb6c892dd30dfec499fd89842749247b065bc8aff0043672ee32e93a93bfc124d9beafec87da84f266bea3f33ae63171be8d0eb01ae2c6844a4c3ca38cd3aedebc8eed97b7fda95353b2f5bd3eee086785087a4b924c896b084b73673a348e00d06f3337c8926528625c0c2627ace87084d3bc042e16453617731620433184629f4388634935d1b98f5d5fc0ef84d7fdaf308f6d765eb4c8d55c42c08d144a249247e9168424adbad18fb8c7a25a604c91b109eba245b16c5d978f5b3a78bff006bac0faec87ea8fe49112d1b244f2a5dce13fa0e9bdcff005049bcbaab17d9320744e8ab5a48c6fa684e8ca8e14b743b6fa9c020f21fb20e6fbab2c66f42447429fd4f03434fa8d293e7fec3426cb37af03f4e59eed3ce9919e8df7665cadf22b97f6b240eb61b8ae54904bb86a04a9e2036fdc4886c7918621d0da12347d1a172f91c234791bf1ce01a62688f15031442da31de07497d202e657d08576b9fd93a2c4df0a7fc125e9ffb0d0cebfe2eab8890438100bdb3bccbcf02d47c6702af2b7536fd87032e924bfa092ee99c09ee71bc119d43c43d85be931ab4db02ee21f498b1172befd06e6a9b573e442418344776f2721bd4a72ddca1589d49041e73a1b59dccfb89d34e19412d9029aeb28fe093a32bebff00755b7a22853c587dc4a18ed8709e36f836ee2a510c703b361ac4abde509d3ee448166da9c8fecc5b76df410d10c3154056d3624c111eea1c1d8c30b43789d3b9711efb0e4c64fb8f86ae27aa1592937814d292c8d05ca954f30446adb6c55ce10f37d4a7b8a4a03dd68494cc47a792cbc186d7ae4570dff63e4b8fe2ea6644ad190e87f2272c8a49daf2352152a11ddf0e6c88924ae15ffa5a4e96a0ff006257d89389118b284912a58e9e9b164a8c4d8e3696bc7029de0ea640d352a5c8fca91737724248b5f30a0845e4de58f7307e5894714c84cf3a251c338f91af43d1abea9ffd889729a1e7f81c8f770293eca058d1a1020949f61add115a1d82126044314448ec6c4dc694648d4604fe072b6d21a361a10129035a6005843f03c7a9a9e8ff00b300e1ff00827fb2c907a1041523464687a185484b02286d1a1208820825a3b84d97c16121046853dbb78376755abfc9cffd9f209f7fe06bf1fd90b5a2208d11a3d5b10820822c43ad511a40b52111a2234e020867846bdc94bdc5ec3f4fd5bfeca42be57f83cdcc5a2d2081ad18c810db4823d0f45a9a8f44eb04083d0850dcbdeccde9fad7dffecf8335ebc910ec8be821085e86320820819b0d9227a3245a919afa8cd3dbc8ac832208208d47a671c2ff00067e9f9dd7fecf6347d7d7305d4b56b44102092d20686313a2a5a269234e9ec2994c7aa20431e87a52df8b33f1e9f95d7feccab927ebf236fe860842f441040d10468c8469bb1a605a9aa18d0443c8c5a24439df4b18c7a1e85bba8798ede94b7a3fecf545ff008318e8b45a27abc8910310b91a48a7922121081ad042438217a1317716f43918f433067d18dbdbd3e6497fdae93b7a97ea18884217a24428190893d12455d082e81f0e991bb2655c92e088188910b4451f2c6c6c732c618f03d1d7f736f6f4c0de7fed269f04fd5f55368842168915a133246c9c09a2490f5141c13857b5e9c85d51988d285a27b0dae7430c36a7a7e6cfc5e9eed97eff00f6bca5af4a3eabe827a27a48dfa210ec0ca072bf611b9ff5094378dd0b418412d8eac5de8225b9cc3a128413244cf23631e86318d28b851a5bbfa11d1545ff006baabec7a9f0ebd0b442131327492755337a1b7a145a3958995a87c0d8d926e843b12a0594bc890b54c91b728cec2a4d4df018de87a604fd185f4f4f5057fedb49a69e18d75bbd3075935f417a1689148f236364889d288168c23a22496c31e8a84493aa64e86c631ea9175af6f4fc859ffb90bac21f8f4f6d2bdf42168bd0c62d274918cad64925124e8fd49e9918f4631094f0a4ea88fdfd339f32ff00b9055956bc7a7a3a3f6201f2217a9eafd12363d426168493a37084f55a3d58cee092f35e94a702d4707fdde565f67a7b7e4fe8d0bd1040d6af42235ee3f464f5a4e0d0749902047426210b47abd1dc2fc7a5d17678ff00bd1e99fb3d3f04e4610bd3040e0d456c49ee44944f413e05d46ea6897c327c33c8662394883112d5eac684cacbaf79bfa667df5d97fde6934d319de5d9e892775179581c6f5bd03d1136a7743272df24916e3e519a8cb6ca20655a8bb1b46624c3c6f6ba3a9891cfdb0c225d24e5c210798ab10911147d85bfd94fbc341b8f7932ecf61a929b663e87a318c242b6fc198273f7f46429a10a5e123feff9a6bf5e8ca529af060e54c613249f431ad0440c5546a0922543f2ff00060e9b65149f24fb6ff981ba6bb95141679aa4dfb1d07cb20d99d49a4dbc0966f65a133408d05a493abd09a5767d97a657552aeeff00c0d2ff0060fd0967961d9e82626489e93e869128dd054737d0fdc92e45ba3638fc4961b8c6235ad6491bd040cd092963f6a6fd8bd08aadb846c28bff000282a535635b6cebb6bb553b5ca1f5ca135a09e924fa9113a060cd3d613aa0448450cdc42193a4ea71cdddedf4d0f4782ffc1bba09d9e89a6ddbb38d0624916ac7ea410204081486c7aad27491e81c7d27bf4333e7a3a2e211212c251ff8343194a79389b6edabc4864a62d71c3c3d29d109fa9691e89fe16c9186f4ee7bebabe7d2d0fe8ffc2f89cbd09f737990f3a5529e8264924fa50b46474d111e87ab63630f42e932e2ff008f533ba3dbff000bcb195e3d39eccb5c75448c994a7a099236a88f41cfa6348a18c63636369c59eeb21b6cdb72de5faa5d574ecffc335cae0e8f8f4becc3b5c761401a2988262627a21691a2082082357818c6c6c6c8881b95ec18992de5faaccae5cf6108454942ff00c33a24d3d897bda2da189b4d34d653f46f80ed13a52dd6ebb8827acc2f4323d11a30d8de837a36d89ef7b7f61c98db797ea8db2a69fb12492497fe1dc9b777fd48193b7dbc92fec33254d594bf9f426c97dfb8ad3d703c3ec48b4098da2fe0638d8fa846da8deffa0dce7d73d56c0fc29aaffc335df4037261fd5427b21092e0844e21b225a7197e57a7f5ce08887d45df413d391697ace8d8d8da9c2827dfb127370eefbfa96187844b253db583c776873adf5e34731d56eeff00c2b126b6add345b757e29689686e97c3e06868f717a7af6242283a553f02122cdd3942136892492491861e8d0c49196e913ebea702611bafa6526e8abcb22a3791fb8e3cd1eeeec5a16a789f7d0b4c869ca14dd7bae1ff00e0fc102e58ceadb1244ac97915c28fac25a40d0c8a20cd2cc7fea35e99876915896bcfec2b9f6c3f639048243bf4bea1861ef9c9a0949af078431f13b7b7aa11a5b16ffd4594d184a91034212eaad3e0e9eb2cbbae4dc06ce3ff00034eec71dc904bd365a2dffcf7913d10342d0642631ffd5febeb4da69a70c8f8645b585bf27f666fe5361371f64ff5ce47d9367e98c591d572fa9341f573ebf29eefd58a4928a58440d0d082b8c834d9a794f54788ce38b9ff00bc744925b9253fb864ce75c121cdfc8b4812d2345634d193fec93ff91ed7012b6c8f5f6b35fdc8684b481ad1911e62cbeaf42531a6b744051b5ecffee486cd812e7adb62f47590bb6e2e6849097610bd3048382910e6772147ff000dfefb09d496a53e557e04af4bd4fa3fb47bfa5e26b7b3721089a729ff00d9906cefd887e61be5fa5a344a12f5c488464885f67c0c1a7959fe7dc2be12105517cb23d4f4643cf6fecf5a626e777e822be53c3ffacc4c84b72669e5cfad8ca58fb994d0c5eb91b4c78542ab45ca7043463f8e0689cdbdc568d6b0bf82743b47d5afb7f0721705b9c9ff00d4999d9723eb44a93f818937fcb42a8cff000c0fb0844854569a6d0d35fc4eacc7092dc8fcb3ad852f44fa1b18ed1b89ea85fc32c7bae49f37bae3fe94f777d91362dd7f85331d23f793b10212d63d4d1219316dbf2f90d02f436cafe07296a1242c46b5bdba111e98d5e8c98647b08eb537dc7fc2d26d7d49f3dd71ff003dfdf09129fb8fe36acca9af03e64d347dc6d3c09a48bd33a131c11b9591b1aafd3e963586727ea8dd3cb61fd8aeaa456e4a17a993a219644ddb3176f563e7f8901f0d117f8b7ff3585f09170a5c7f2a5a793f31a544e897a9a442328be483a5f9ec389eddc3215ba4b29660fbeff2369b7a7c27e512cded7447e72c0dfb08e4b4e16a1219108f53434d0b46479328b5a43c9dbf8d0a4f13f7117b63ff0092b1c0df0ad958aeb76c692f6ea3edfca866e20bc4456b22f441290ef71c0e116f3046b76654b69f61e5997d111abee844a5b9b796fa58d9a864b2a7c5fa9370482c2e0fa343f02a988cc6c36d650bd768e1171a3e49d3db3f3abfe0af4344d387c94d4fd4d8d7c3ff00889256bb9568dfd913e9c570abff00866474953ed4191c8c592082081a22d6553f07d218501d604363ba0c37344ca436ddc16e29ee424ab1d0948a5c045d3e109785b210a51c918825d761c3023f83789334427843fc67af4d10a5117ec3323d13139b5ffdebadcf01b4d7ea339637cbd1eb4ee5fcafa09b4e50980b537dcb7b1025a4923412f41999b0595de33a35b6e4cdf040faa1929f0d10ac2af89ff62b4c8e05314842d4bb37843a5494fa094a8a36244e873ca613ca5e0451d87c08ca144e89f431ab629f7ea10fce9a5f91706c781a827d38f4a12e34b441c5fc6c42293cac10869d3ffa9a252dc227134fa60a94e3d0cb66de846f7ffc12affb4b1c8ce92448ef08c324a4f15e3a1752dbd612930ec5bbaa3ee2264f07b86d4139682826fc303f3be14930e852f34bf642f10f827447ec3994787ec738668b554dd4bf891accfe1287d49c99bf3115a1a50d0993ab3a103dd9279ce9b1d3728823d50252411c913a60be0f06c78273287d24bd8c0a8935caff00e6ab54f0ad8eb5e463496bd77d589696a535fcb5c19d326f8c69b17a2593c24412c62b26af7781ab95f7ddc6d55a5b35698866da86516a374c4e1a6894bcce235967cb1fad4e84b22b1ecb71ec4aca63a221b09ca1ae04c9131d8a4218f31a21914fa19b31103d3720447820ac0f55878d1513d0a7a425bd50f0cbf2ba0ed2f722149aff00e2a2ec9649e5e10dfa77d72704ca69bdbf95adb4711a214dbbf90d34948db6d9492702504caf27e89f4ab8fecea42970ac9ed56ecf032be7f865115b20f65bf85084c373af4250f2edca6255294f0b61318c09c9686a936d09296c4fe000a9129db77ec5e8eb3be8f445126d46608a3f2677363a0dcb393ee3ad5753763c0fb68ea5ec31096f80a8934f7fe645b9c6e4fafca267d506e635cd138a8fe654e7aea49f9b0355819ad2133b72a525fd11265a5e971308ad0f1131581cf9e8c469b4d434ed7f0a90acd88da7476534297d1091b194107442eba53db7f227026426380a145ff57bbaa4e615dc4c8981e50e6c6b45911cc0ef4ec64e7b9647d8cd1b942370f0e48985ab1d27e3d8835f8c269dafe28614863a63a860636f9fe1795d862d1c4374f42d5cfa533a48e4dc729a6adf5bf7ec25585c6d0a6175ec466f69a5a71a8b0c4a893e08965b3ea310b457ed1a2d2d625d84e48153cb96178ce114c5b2894f0b3af4750e191abab3b85a7163b8ea51b88dd3ea36df4bd2cd8ed274dc7ceae996a81beb15498f63b086230923831d75cde8caeee182097e309650d74f4b4eede0a267b20a889cbc93e4dff0c36f47b193615383d53e84cf0a49586a053dc89db0eaf832e910acc3d0851b8351e18e3dcf48554e449704e8a4a1a1fa1b5a108950cde955d5c7a91e88d0312e7bcb3c272c9d12df23f4220514fb450e8572f72364626b928716d95b371a1f81097f463034396bfd2893787862fb8a298ae262eac6d36d8a67f067d44b7d14f26d05ab2a7b11c9158a365a48c9d2e591ccb7ae4ac9cebb9cfa1fcb45027e86664fbc494a8fb8912534f436fe47832c4849b9a7e04fa516e43d3c112439c0c4dd6e4664b6bd870ce9f512297fa10e07b4bb6488885f37d56e5b167e358d5369d085f873dd691e9818944ee110ff00640e97c587e85625446fb12644de1f084dbf2e70a486c0a4418a630cc707942efb034393a8ef4d54f192f4e44b9484a877f81e67714a94b9e48f41b363a0da4e12843fb46ef3ec31c52aca7d06cdac2e49c371852dada4c88c5b7dcb4b4923e8c595f382a37b3b272f836dcf3d8da0486ed74371914411abf44be44bc3fe481e903a4284112553d46b4a6a65a548992427413ee346e3c24654384a552356f044d2e10fbbcf3d382f92344cd527a6cb1ac1d15ce5f9d5fa7c10f7409ff02d12e118a76a53e5c89eacf7ebaa15072d97a21bb3138fee28bf5c4210851ec468928354530fac688582e894270e8fa1cc7d0e7a8f9129c68460756b621a4d3c14a5285c1541c6e6b2c74484fbb336a35d8437ada4ef772fb895c09364b49521fe085ed1a4bda497625f4d877ce9861792e0f95e89782bcfa61f02fe26489489e0cb42581b55382648912ec753457229e1bb9d63dc4e03ea2e14e344942e676f0373f6f53289be23dec795fe17b183c4c9d55bfdf522e46c542f399d7d0fe81af461108d581048860343edcb38e33a4433249c5e3e82cfe0710dc7d474b95fa163effd895c0b86e870f5609e14b24c4a269b0524b06e47c636b72249a725b90d427f6ec2230287d06cee33d0eb0e08d3730469c0c89f42fe14c820529c8e5b7d8872f625cbd87d4f625cc9f3f6336e5ec3eb7b0d39095c1258844b7aa43151be1a3bd9a57afc653f61e9af42f4acb163b840e57723ec2f61d89bb15fe8c6ad7ec3814ae497616362db9723dec2051205e96651877ef5a4568999396629edf3c1b19f23fb2a1b2a2a4f39441d0c415de7ea4a0bfc090ef1def03c22c45d584ef49c126671d10ec32e14f803aff50d8fcbb6449e04b15f8219147d4f4ae7d085d98bd51a46e7059b0deab0411a411ea4b472c99ddc0ca553f638d1fae2bb7d0647fe135317eb1299e042e3022a56131ad3ec644352c5ef89d8468290411e964f17297b688f636eff003c9d74d89ba4282889fb7d0449f14531b29813d1cc908a23a107b165109733a6054c5895cb939114223ef9159732fea64dde635f3ac3ebe058f547511e3589d2083a96ae48ad36f42e5a318112ee4c22552cc6e7279f54ebd50df5fe21a86f786e1fb88e3d5ef66f924acbb8c7be3a2f7631d21c5eb68be0731ddfbb2141e349f9c8b0dfd781ce38d1abc8945667626577f9e44c962ac8909cadb69323473505a484f027f190ee4532bc1199688b1d90fb0f271545ba8a714b44dfd3393713a743e79e4697fa666597a3db3ad2ddf8111a2d274bd659182dfb8d3d166964630674eed1e8a162449a3752e3a85265d3b761f6d1e91ea5b8fc9dc85de3f81998ccea8626ee4e9debec214d129fd462a9b79d530bd7cf355e4f143db4fc69fb3cff00478f1f3f2398ee46285b9f931b8996e89ac2636a559a8d940d6c1f6d85c9f8e7e751af884e04e8b6cae19f393a7be929f1f2c8e9fb12b7bae82ec7c457fbf3dc5dfe751a6b3f5f72c8cffa3ae8c79190451192b81691a2c8bd3263481e26459ce90252d87dc86c48909056e14bec3e51a6b7f71939dd7b1def48f46de946c7c28cc8bd6c5a646e0c18b827679637e4dc840a14ed8ba4f663d72f5fbb9fb22f3acfce4da50dc7838563e7922588a3f1f43a47cf9c913ee2e4a5b3cb33f247526b99fa8d4b63e7038592c4da6473317d8a3689f9f32287f692afb5967e7b133c1cfcea4f3f3b89f479f7b3721c63e221ae83a9a8fe888a208c0e4b1c4e579167455e88ea6cfd086b0474c1b489f033b8b2c91b2d8917709929271970205ab894e7b0dafafdca8c69db5a19b7a9137100d2ee9eb660ce45b3b2fc0b42ac0b7463d866d7286cd4d9ebb1990b5fc1d6185f910be6c21a98ee4349fb4e93f391f3b1b3fa9d24844537f17e85dbe7ce4998eb9ebfb17c63aecd573f71a2350fc08ac493e9c0e23ab1a3fb7c81ba16f827ab26c2b8c664de1623a15fe95167cff44a1dd7cdc8239a37e3fa2f3581d3ec3e08c69225fe24df4e83fe1bc0b13248f2c3dbdc70c16e8eb72409edd68bf8465a1e35aed8f0874d670648ea3e82d2bf8164eba9f4b1e7d66428c01491d76448d1f2df7399ef0e8b331a196371f54c1079188bd6d4ed52ff00021315a83f3a23e77d39d273457cf947cf9fd99f27f9f3fa1ca6cdba212b4ef96364d1fe371a8e449eecc13dbf453a32d4ae84bea4ae86106d67bfcf965ffabee370bb0e16ff003a8f4535b7f44552f076440fb04ae88391729f02684c822f551b90b24ce44b4596aa48e3449b16f25336442636e04d45ec8b65a71913cbf43da4b76df56cfc90cdf03a2d9070450e7056b5e8dcb6b3f885c0bd4d086932d4bf950e05b392eff2760f4974d3c09dd10fac3017aba7cc3ddcc7d831a19c40ea99cb177b22ec86cdccd89421733fd0fafcfd165bdf3f5fd90d29f13f3f0621ec76d873f982b93604eb753f729b31552abdc88b31c63b89eff33c0a9bc75c27ef6c4dce2c709a2c4c4a77eae49da0e6547e2086911d97e098af72232d7f86c3d91962e4e07d06c58ef52c9d4d89a10c950a89527d8842ec35a2284b2a0912b3fd1963811388586c36964271b1ec3a99cc9b092b27264e0d8c9257a51b8cdf149e1c8b46e967dc42f4bd69ea971d952372d067b18349f81e757b4c7f387a17a592de5fdac95d59d160891955d3e7823f62c7cb1a7ee3e451b69f60bf3f3e32f3cfcf24ef1fdfb7e078c63e781cd7c825cf6f04a23f7d49db26212de338dba10cc5af9d91952a9cbff6cb849f5225b126bc0a8dfae93f38214ecbf02e8830f0632a0db836afa198a2f325e9250231644220e07c8ef4a830f1a781272c6f722207a3881fd8585d4ea87385ec4a2e3a689948889d63d8936ce953e85d71ce96bdafc4f59cb130d1ddd0f0bb194c1f5165945d761e88b7ede3d05d568c63d4bcafb902e44a78ec77dfe7928595d3e783682f45f363bf63bec2dba6c747f3e75264fbe3e7f47f9d8529c09dc60c3f3f3224db8ea6f21cb579257b282a2f679fe8b36f917e04de4b54e8e76308f9d888e9fd158f88b4a316395b47e0ce7e418c5517d0827a9397ec41d06e4c846c48b1ad4edaac8f9a2382ce8343742288b52e095c4a1e1aa98226ccaa92e2232475f1a28ac1dc6e929c6bbe9b28c33afa620baf87c07977417a18d6ce8a0bdac6bea29fd1be0efc9850fd1ca685dd47aad18ccaeaba513f57a4556c2bd87bf5fa98c47ecc7d1d0d8e2d0d85bff9074fa1bbacfcf924ae7e7e44f1c21d474d858dfec24f9dc548aea26fd89254aeebaa1bc7cf9e0660b7faf6361d30a124702f31d4ace23e84f343f1fa22b6f9fa13f9c197b7ea0d8b8c1394cb97b9e4e04edd0e74acee4372a704321dc220710a085c11d0c0e47a322da15315a46f3821e0b91b1a83b1e58e726c8bbfb8ac94f43f0463495b1b1bfa91049dd41e505e8c06c99a6cefb68fb19d894b4b8b8223f44c8f0af6f498967863f61ed7762c5b07f3afecdbb1bf6f1fe1324fb8ca37176289ca22a898f9f207e3b60be73b7cfc94da73f3f26ff3e7b0f1f3e2379bfb0dc276e0b519b51e33be67f64b93c46f3f9fd113fa37b7d8d89b846dc2fd0abe18f2b63c9c7c8312a46b29d518714be7e07ed05c945c09ed8ec4ec4ce05f18dd37c2a2514fbe89a3a4144369b9428e348c9824a8c1d1a6e3c18bb974250948db6197663104e7938b36b629e3693a6c5f439a3c10f929ac69be8f63ceb7a2c33bcafc0c51f22f4626e254f8166dbe9ef2298fc6e54f3d4cbd176ffa2bd2ce6f6a1e4649b14b6bdc5f5633af028c4139fb1d633cfcb2b146ea89d1ed3f3f44446db8a527b0be7cfd8d5a79fcfec4fe8fe7c46cfa3ed1fa21c4477da04ed3272f89a29c90a9e60a71fecfec6985c793814f51ba7dfe7d0dfe50d618e4f31e44be3d8b4b307d3fa1c76319a1fb0bd913098596a26f08be4aae9ce07a3e82772337c884e3473c4e846361f01993674e88e0e606459051022737ef91a1e44d412586c9e255defc928f060ecb05f26371714e48b1fb23b8d351b7f061db1a929a13c119e16d7917a317a327cbe80fbb27b91de4bcaea7ebe9352fe818b5186a579d168c8d7e61bc884e2c4f03f9b47e8da89b3254cecb91cacec7d0559309fc83f1f3c1090bbb1383cfcfc9fe7cfe8c2edf3c114f81d899a956c625093c0fd8fe793334425f6e06ab6fc09d90fc896d18dfe7063fbf9b1156e0e2d41b65e4e4643f9f91b503e98fb10e5a73d86e1c425d85f418db6c97ed127d48b2ce91492709110478372e5105f2293a9316f0731034c6b05212555d17df408c2b91c0ce9ab2f8923fc29cd7636ea423026e5de9f9f4e75ad6886e91d069bca3d62ffce9aea5c3ea4142a9251c7917d089c9da4c216a8a4c464cc4bd368e4503a656c46f8faffa6d707536b26d919d8ab8c91fd94c1086a3cfd7f625fea7f3e8573ee74770d89129e714ec3e8f1f3eec6ac89604bbf51d644633d6474be42ff0f2388afa91043f61bf9f5b2e0db1ee742f7f9e449ccfb48fa0c6ddd0b62544bd8b4b7b9393a8fa89192458a44f1d84619d49e87615e3728c77b68a44e82bd83b9816f624db571d89d83eab25c95c094e27a0eb81691f53d85db232dd8ec87b22d1b9b9dde0ec2924ccc6eca3ca7a3110bc22cdb97dc6e63811c4e67060afea317de18a970f7f4c8e3c34be442d10c30937aadb2ccbbfd7f82b923ebf3c9ca977dcdefb169f5297c7cf076757d0ca1611b75e093f7fa793f2cadafe7d45377f3f256e27e431b24896d26d93adcda32be7cb1b978fb8950a79811cfacfcfd89e0caed892b9a29fdfbffa636f0ff3f9128fa75f717c3f9e589f18dbe7dcd8af9f24cafd9f13f3c9f93d86f86338779d127bb44a461a16e4e9364ae0865d4a3071b88444ae45bde46ba91d4bf68e5eeb91d081129c3215a1dee853276f6136fc8d22e3a0e91e34be35f1ee41d345a45897bb23e551e2c7f45a8e963fe860b49d9b30a8e1cee269357e4cd3e83f45e34efcb4432d9ca8241bcb6dbf22aea40dfe7c4765fd16d425d8bc7f73fb1adccee3c70ced85f3c15546ef4fa742ae04a9a8fe8af97fe9138dc6e26b668c1073578510632f9f82a9fcff00485225acc1379f6302b2bb57cb12d84cc6df3e3254a5bfccfe450bf442e579fcfdc7c47cea2b531efbfccb365d79152a33b4f72faff9f246b8cfd49ea6c7b08bb9e09bdfc868b1f02926caa8913e84634cee36a3a6d235b431a6d7047d86a0747e4e684be91aa50b2934723ec4dd3d87742671d04d34af6216ea4916066793797ce8b1920a10c459b63582f070ed7ec326bd39575af7a20e0891443bf728c785bf832d87e87ccef3dc4e6188659c1217737afd6888bf8ce77373e9f24dbe7c47ba34df383b0a6bb90a37c08485d5f7de7f653f93fe8dc7194e57cf71d9a30db6f3d07df1f3e31bfb15363e8c7b57cb33cfb6f27c5f61e3325aa97f1b9e3c7eff00225330a7f326c957cfd957f77b9f5fc91385f8307bbfb938bd8479bf23a5629a48f70b838f991d45af691a97a6f2c22a5ea9189ca6365db23728a37170f92dce93e4790a8d8b8bdc6809a12869bfad9233889e854dd9bb45e27468af3a706d35a3d84569660ec2c8d69b2f256262614d79f4de3c1fa90fa10ae8de8868b9ccf5ee70fb9c0a2f8b33f44b477b80865809a49c1b9127c5f362d6c6ddfe7915b18fb6df3b15f3e511d707391f1b1b35f41bbc2f9f7293b73d84ddc326f30895fe7cb1464e2496c367d72ef02958dbc0d1d96c3b731e0485bccf625f0551ec26b6cc7cfec4d98c8a2b709b8cbaec5c26c4ecb7e7e6e4a97f0ffd1ccde7ee253e09f2deeccb8fb96cee9eec6b95efd87b3963d92f2295bc0e2f0743fa8d2988250d65e998129c0edc8cf1b0a24b8d2529b3a113382d3ae0ddd8e13c88e24cb4e071266623136a70d25c489d0e88976a0e3444b5302d97a51f72f6d23623d8d873f43833fb23a36bf645ab58d9ae18aa315c8e6730656c94f7dc71d44a87749957a16b7c74d11349a50685ec6084d7cf8cceff009ff4c7cf9ec3ec623b7cec47836a5ee438dc9f9c7ce4c997ddf3b92f30bf64c1fc43c7d08e2e49d0a61c4ddb2b2b7a3a1e70bb47e884345b2250939124bece7e703cdb5351d88b2fa9dfde4cbb460e2da1756bcbf947e48cca97f738479e47c2606a5cfd5f92ee53f249a2cdcee1053bd9c25b1a2c8e637272cf3aae5b182a2cee1628989a3aa20a1b271d07728d84a70b8d2c4cbdacb46ddca4abeee0ea8dcb59e4792391ba5a511e4e04a53b3b8dbe0ba3c1efd86710a85f6ebb1694d721abe8fb32a0541657234f7152f22a69542dbf0279d508c8b7d35712dec24ee6dcc9f4127edd04a42ec63f673f4dbfc27b05f1f307d0a39e3252ba7723a7e4af7cfcdc936f7bcb3751b364aab3f5315614fd88732ffcfd0e96d5e3dbfb329461b1834d5eddbe6e5f54dfd455126fb74328972296daf6e0e8462197447dc4e53472d7cee26e9353cc8f1731060e1c92f6772416fbe990a5afc1094df8391d621e45831a1531fb053b146f91a5744f237d3c0da98a8ec42547ce86eb1e074e1fd4c84b2b643e9c181864d77149aca362da8ff4ea8d95e8a391e89adf87a7414ab4fa6bb8de64ade456f648f8c6cbd3d5ad8d4f53d911f72d6377b093352fea397073acefd4a2d7b8b9bb91ad51f10e1e9369947b6d9ecfa98f9833f92be58a2a7e7b172d94c110ed69b5e0512fb8b108cfcf924a888f6fc8e4bbfd44e3b13d085352e7c14762456b16c9da56beab2f2fd40e932f9f3a88d8a2beff00afc1ec96fe0533182dbe7235f67024a52703f63dc4bac0a9ba2713298d1c57d09795a7391dcc8dc70bd870da4b0213711183298ec3a16ba89c2763753c8db13ee1618a28d8cd8ca32b2493238aa26e09c072d8a61fd88389b5b09a5c1280fee24c8cb4f70d899640ddc7d869e3a0925bfdfc0ef2ba122b6f71d3ecc4e31444b5382ba8a373ab83a1883c69824781393a917d0b8e92f64d0d742d338f6b9c831ee55cf832a84ab3fd9270a069b5933cf91a770e868791445ae8bf41c862e7b3b18bca322bf3f3c8bee289b7b911ef7b40bedb9365397a6f33f93ea4f76d8a5d2dfebf3829db9ee2daba0d71d88518b15e1df28cb7b04faae24ea52d7229d302429ab16553ebd44d3cafb578fc097ee5fcf241b25cf5e9bb222646951426b62aa7195251474135fb1352e91f41cd781c4c3792e56e34fc381e456f41ef3b0e70647d513ec65d06a442ad0b112763a9972b65be8b0d8a364c8e46db6e981d4589adc3534d9294a761d23849604f3b0ca3a126443b911486c381b966c150a1fdd1d7821cf431fa2b6e2c8508ba2aecd864ed3a4adf06452881275c19ef93afbfe8236338d297fa3292ea3fc9b628da1268b5ba32a1dac2f73712c3fa0f223216e4aa76bde8aeb9215b543e942322d9b8cf9f2372edde3e7e871f4154f1f3d8b9ce087294d67fb310ef92271ec7290b1dc845e4ec6dfe3e40df8636f9e9435dd384da1b49728dbecd84ddfc7e05a6557d3f024de055c7f82531522659ac7fbfa2d26aa54b88305d8cce62884c727e0a8c0a6f63d824f2dccfb927338e9c9c60c40ed3d466cb1aa5b753b2916f6229b21e04992de46ec89e04d7684d8640ed836c59cef67b696db2136c8c3a21a7bf24d9f911dece4c089cd0dc6799d89fe898c149438322e09a9b2a6685d0e0e6286d4ba3a992a3223061f61dee743615ed3c101ddafdd18ad338d7e8792468daaea3971c722dfb902a6a1314cb26cce1fb89961913b18983638ee4485faa65834bf6926e5e5b21bc59d1253ef23921a4fa6e737026935707fa42f7126f1b897997c9eeba9367dcc6f1b1b761cdfb71e0fc16b8fca14e89ed154e85986f3e09cac7f9f372768631e164ae7a7cfd10ca1b8576c85cbeff0018fef6914f2437f6267dc55d06e57063e5a36a49b375a7cf81c3e2f8244f35e06f368a510748f697e0a33a32330b0327c9238a19880f1b112a4982ab24ab2722634ddd68d381ec8c4cbbb1a84c6aa9e44e55f04433fa0e3b16f03d90b238772142706799cd0ca29ee3aa7ec6e4328ec3934b037393c4192330773b9c908b15348ee445f03cae9945c5784bf41cadd2ac13dc820823a9c26dd212bcf446e9895f61f5f83ea3ecc92376a7b956ce4b261bf927ee6567bf53126d7c7683d91e208c7622e6363dcecec6f5f20421b4f7161d3691e6d63026d2aad859324e82106526d49d4adbb1bfcf71edfabe5e8b1842ceff0091bc553e3e7b0f2be83394a5529f7dd90f61be1c92b6126d98589a58176dc9de288b43aee3e5031d6d22e841b6c33b13d5a4885a6434a4c5046771a2778364a2448fd1228c1bb4b3c04f1d0cb98f71d6de456a734e8729a95630f1d074c80947922ed0924ddae23932850b2c5ca2b75f51443fd16f727616d21a2fe82739526e54b1a65f27831c508bd526f26f46c67ee3b2157b51914b82d0e0abe205667b911fc10927cb822e5c2f04b6c0f06e9a1cb0853421ca65ad8862d04d2f4fb93bf3655cd8d5d8b4f3fa0b6ec2b858460b16672ff3228c7254649fc05cbfd1318ec39f0b7f9829fd6c34d6c5e6623e824970ea6558b26d44a8a5c2425d53baff0019642c1c915dac5cca1129b6d95e04d9ce14574149b29c932877139d8974ee5d44912d293ca44db64d4bc99453ec8a9dec71398a1db46e6ed1e5597a3b208e471c93a1ae0ff42cad51b53285883d84956382c51fe06bc09b8381cd3dc4e64dd0e3b09a5ee7609d83c093bcc7dc726534db783d8dee7494a2b0c6352446d472339159322ce3b88749f06f599c1109294391c24fd82e3e1535e4d8cbdc52ddc73963a33244ce509d5b62365bb1144d60c336f99236aeef2426ada5dc08d5cd8540e766e2c9fee3facb236adcb61f8fc18e690ad4bf1070fe771395dc9befe7fd2a3cc77255d2363e491167e0c356d42f9d872a2e3f04894a1270eb81b70f94b7328dc7873f3dc704fabbff00a5b5b127169d238dc28add1434911d9dee4a9a6cbeff0028c14706131352fa897714a4c94d2bf02ea3b89151ec3a6d7f921bf0234b1a2624a2c693937b2fb0526e90d7ac271674867090e33f529026bfb2ee4ce6093c8cff00a12458486c1cafb1b227a930a6c9932d227247945c21617d747255977c15925b431efb0d5d1461adc8ea5c4c609e17fa6078325916a7fa4d8eb0afa1f962b9a91237821cf2547e109c25dc56d7d0b2239cdc8e8613c8d399ed06c6badc85756703bdc4c15564cb30e877d8c7471b7ca3657e049977f92287f2649f6921d6fcc8f1616e375fd0e26f305ca958dc4e5441d5ec2e118f6ea36e658f093291a4a82274c473ccfc92f85fe8820b28ff0047ea9fd05182f2e07446ee162c61bee36ed7084ec4af2d66056e936929622b25953116a22bb1d4e687ec21d48a11b38c115f52da1288230c63264c31b5a9a04c1453651421627c90a96f929312a9b118599113c4d327917144b8591c2ce4db146e2a370d8267712750fc230375d0ca636dee7b40a39ec4b9cb2de3b96d0dba1e7a92e128c69d59bbcc0a45dcb1a7b173da50b9ed53ef4438e8763de1c98495bee2e88ea50ec4a59dd4aa2c576de2325975e304b7852a86e0faac895cf81ca527dcaa604a164dd1d2ca954add7c62f9bffa6665ff0067cee781935b1d86d257f3a74367fe448babfa91f43c1d3e874088512911fac17255f92cf9f9e4dd9d12dbcd8be311a514a98ce4bc5fecb55a855d0b9856616cc861278ea267d85f5fc1384b05b4fa1565c17c1593ec379d21ba91ee656e246d81b73fd13827d0de8a9c8aa7b8e1a94bb9d56d9304c7b12e05be51968ce2fd866a139c913df05b49c3c0b22434cba6869f3b0a8212b2159390b71ef5424d4c0f0a08ee435f8160b82bc136395fa2b54d2d9de9d34df243533b8a17d74a6aa6454f629649e050859c994bec28698429384b1e0d894a371935568fc0d2d1881bbafb09e7b53a3718da3e510bdc59fb0d5e73f523e4fc91e1c8a65cf6fe86dcf15025bf525dd4331b8ae3345c79f25f860cd79feffb2f39e46b35826d4c92392170b0dae04db96ee77ebc0e7c9e245c8a2782b911671c3f64565c3a3efee414751c5edd0c227b0a71b142e76256f8975236f0d47dcb82dd8fc10dac32ca445e990dd2dcec17dc79643ec54ba1e9cfa7284dc2b63c1d1919d0988e074d0958f182284353cb8d8437cec3b9ad8d9db231a25cc1322f614997091694350268be04e36a14cd3c1598d1be2469e70399698d33a0f030fc0b093915134eccf6c31383b68116f610a871c3f237c7b9528b99a81f6913e286549fb8861f4b98a1d3dc9e27103994381362889245a37226a322e3fbff004b731be4f7e34a9b51fd0d28dbec2c7681b9f1c6c36ba5fa17667673bde8f7c327951dc6936c29c3536ee2c4f8ee37ba77f9f827228ac7312e17b09d579125d0994a23dbea4a56b308663bc0b2daea0e87fe13c10e0466f3f722244f9fb8e0433caa1a4b77543cd6a8dc63fc1bc522114c31a6b3ee41dcf690a89a836f49294589d12d22b746c6dfd080f262d11a70dcb599e470cdc6c36a711d078e861926d6618cf2b2386ba743243d95fa30766f7e362a302232c8948899172452c3e45f4140da51b8af05fecd9bd134d4a3aad9f7dcbeb7311359aaa81b4e4894d6350bed1b903826931387181d4760924f850a50aa1157909ccc703bc8238a563856acc7cf927142ccb8fd13d31e098bfe884b87d7c9117b1135825ca51256cdd4ef2572b3c9d27c0d73f5ccb28be67f22486dd0ff0044ce67f9f925b5457f23fa42a9097526543b212e3e753650e2b096ebee21e4dce5a4f7660749e9fe0a317d075106cfb1e04e22176929c0d4f2c913e5896eb91a696088e447713850799ea2915276c8df46a18afe73a650ecc3818f56b817616029c60d9d321c0ec7c1c9764e1909291a4b0471762e592f25435566f43c1926348b087382470f0db4b922845b22a86656d1fa22ed121c4440d1f8365f2470efec79567e0da7e7ca2fac6f0ec70c7b398815e1b9ea42e973dcc8f13c0e326e7a13939c8d2663c16c0b2a05926a66094a6a3a704ac14b9c0d2ddcdc3cb5dcc96f737cd778376d1f9292de361db873c4572359fb99c6381b55e470ef6f7220bb0e6a6fae4f6b3064a8b51265f5130e89b5bb79f9fa1119edcfe3fa1d90f0276d2fdfb8daaf22d9fe20470cab1d3038b8ac7dbafdc76be382386fc1be46f8822e09710d1d0722996fea436ea4af660a48e442237d8afc8d0a937e873d49e626e288953925087e8c028e6ca1de781b6d44909ec5787ad189199c7821b1c287c129c994b91ce6096e06e625e93c313751f41ed3816090a672b7ee3396465c60df254d8db8f252c32085183163ca239a47347991f35502532298ba6791691919dec5f71284f6b24ab714511fe8e6e1e7a93c217242c94fdf26ef8c138bb320a2c694ce3064f9273f244a6d225abf02be9f81cae7b0a36db1fb13733c3230a76f905f005ee2e3f65a55bfd486e7a0dc9e24988c62e0730dbd9a94609c1a6d8185ef03496f0fa6dec706fea856d10e98e896dc14aba6e326d6c281be43f1036d3c171c0b16f71d6c4084f22781a49e644a939c985104f3b9dddbc98e88a3a18949d265c6703be427997ee4a6f8d8cb1be08e867f86a171039ae0b1c42b44a6c77acd6c4be84a6a0c1ccf415a65c0e71cf261c978fb1132b791e76812c5d09c3345d8710f7ee4708bca33e58ba15b9e49ea45fe09c4a8ea723382b7c99763ef8214296e0adfea434d7db828e9135e1082054bb09e60bc706e95115d4b565f0381d2155edc982e26f9262e9c74d87bdb944c7286762caadf22a6c8521b729b98d989e63fc2ea382daaf9d45d16782f73e6e7dcde888294d7f455bcf7213051c98dbe781e5cbc92d71fd0ac6b15ae394cb36db971993974edfe0dced4c45b92d3b75eb7f91cd435ee51a2c8c4d7263606d52eda1b13c936eb24c9291d42d8c2a5ee4c58fdc4df234ef6b1d5a0fbcfef4ddaa052f9f6d3964396853d32410431fa7117b49734435a05d245cb91ea4b9df1e4c3730b7c0a9d7676287078ddee37332475138a29ac90e2dd0a1e05b7fb1a7e0692a6e6657f426b026b072a44255590ded3c0b11075607f24fb9102523b752cea322059ee327f3046244dc7615abee278428ca26b02efde0a5da828e6e564c1beb864e970f8e8572592d3cf732ebebb237e913d0827dde782d84fd4ade61f033677fd989e205e53c0962ecd9fd4a58a622acb1891a56e924edb0e0de92711cee4440a423649f92e4ae8252c524a24d43a8ec4c6fc75c18db0cf764dc2cc6d087710dbe9c8e3ae990de49494216d8827746537b7bb293c0dabde0a172d9b39626a7a0cfa1d5cc0dcb6bea4f47e3441047a584928c0e51c10aa592b086313205fb0b0ee64b56294dd49cca1e2eb9a12c9789a1779c0e7e82c4126a886a7a645054ae564989e16ca1f916e67229ba2a362daa46227ee76695236372cb658da5c90de3237c110c97ed255e6771ef02499ec2c95539e058fa92e6de6e84fa98299f0b61f884e45ba36502ae24c5c149a447cc9b0db6a397f3b90a1597dcba926fc93308ef2cedd8ee86d5d0adcecfe86f8a5b91519117149a5f1c8ed43b911873e630febf72c991134f6b1a82624d4973f41637126a94c736d3745952bf08c37123bec2c64662848764e26078c51938b2d8a63f3e47a4d6e48db408e21b59e04e8780db72475179d388c8d31a7427a1a1892391aa2d90a2cb6d82781b517d45c58d7243a10f92a62face84af6d32894f165d4660826d316f6cb5f1265c8e561fe8aa99136da1743714342e1878745b88646f272f72e1d0e93024e3c1912a9928f1b916ad52dc73095d91164feba9c3bf61358dcf27e3725473c16526f91462d4f3381c8ea36c7c635722612b21b5335f7edc8b1199270b91ad96e525952be40d65bfbe084ace287194f6223a09a4e53653788dc75bac514997ba5bb9152c5bc7514a19f9f512f3ec6e23f285c212df10252fa1184941552bb897bdbf2512f0285b87b2459425b144ef7065ac6eb637704bcc79832d539222708db4c2c0f0935d8e5618d5242223728de89aea2b1eab22b685311d07c21270c72f23e07a2c8dc7039cac40dc915b607061f235dfb8b9794f051d2172885c98993a113245ab25c1641db60b6195bc7438e7a942bfc0dac8edc726f7b13e04e0597f531308bf88a895f42a30e897518945c51b34d3176a2b9ea4f2fa8a158e489cc40a96285de638e0f6805beb2637da485ba51c2335ced6c922d707b64b87227247027c176ee4a49d8e794913dbc0a1ba128541adbbee2b85b90bb465d92272e114f615ed9f239ba0a0b3b60888af8c985619aa8fc1133d0b15a978da210d4d2dcbe50b1089378c1ee1aab9d3839f61179db932dd7611c1d5aa33d5677d0a6d0af16e46b78df25a89a437181e3ee63693b9090b2b431fa1e8e05d6891f71c47a0bbc0db60d267a0ee1b99477817b9d7b9256948ade44adf102cdb3aa17d843392435c8efb0f6e8b02e222b0d76238583bf71ef545484e263254c8a65599831326c5bb4426d590e6527d05a3ab64a16c2c74e47b8feb438eb24e5a4de65751724a60ea14b2a5b966225c50dbdd9f9e4955f7156f0915c7e05cdd0d78fa182a9b8d094349575136a54aee7b19cc0b7c593195b8e63e1b64acbeab912a5d3b646834b7aa16fc8913bdd67f64ae070d538e4ca98144e596e5d7d47fe076de0652a6783b50f7c1d6512741d34159ce7a9dafe6c5a4ea247a29c8a9651b923696d8e844e371c64dcc0ad5e9dc8dc687e9a840dc5b1bac0f079f4146c46fec4e2e58d4fae44a539dc46eafb09eefc4867b31aff02945915937dc2e25094c6d9d8a60d2713036f8ccb0e8c8ee1e0e2df825313295cdf103cb52992dbee2ea39886e44cad937277d48dc351e0595d453d8dd49ba42873dfc0b3951f526e042cc45da5129fa41676fb7e0751315c131842218c592964dce6e6a10a53648b1250ab8b391397882d12d96fda8691e14cac8a329281d71ed6e4e5cfd484f3bf9135db3b12a2d59910aa9539ec3f6467a7e8c137c8b3fb1e2131d4723050937c92f3ec24ca3b1364bc985e06e1c0f54261c15a2504c50de32d926c6375642724b8d2872b2c78cfa4ee684e03a4dc8d34d6094871331e6448dbd16c863ec55d151c60d99223b93b8c4fe592d90a5b5442a1af61fb638cc9078825835c174e48aae72609416a0bc95d46d4c0a28d93b0af2a869b7278922da49608ac1434a4b303c5f1d86d85544918cf6377665d90d4350ba8925bf4dd12dee9250d72a0ae511718e0a9e639a317e4fb0e5f4c157d77267725e1272a14c7044e49d094ce2762db49297b0d69d2af288b73d6c7e16e34bb3ea7817103710fe88c3642cc7513c540f2226704a150b2543a28770c81e2b49294c92dc4a593f222e3ad1426f3ae1814986fa6f6e890c195ae19b8e7632c8821235aa70c7aea4f466ceef61b50a91c86943d49c08ee64b29b4e772d11c984afc1c3a8a164b995b186a113e85e2278e04cd25b361218d4699cb3d0c35311d54a1b5104e71702da4ce111cc9f302ca3e862083c8e613ec6539295b1b30c8b9edc8eea06e57c71b1f10b1864c79134d327812b6361e1cfb212c5fd1d0f1b8bdd33e09c6fb906d4aa9e48a6967e5ff66d95f37fec4d93369918bae836ae1516da5f714d2dbb991b81c254f1245706f0edf53949c723b6e976157e64deda635996a1ae773893b23f0249ece37256d30b1d8b25b8e56dfd8e25e19b01f42d4bb696ed32309b81ed74ce37aab7346c911690e4ba70c7c90c81e056e745656b1b89abd489ade485471638a5e8964daea8dd8e393b05b35b24952e0ffb30a6c6ea593c186051ec1be249ca6a8dd8ca8c13dbec43853ecc5251a5d245317ce19d9950b83e8254c9c630429c0b98eb913d87bb164ada59d1d19722972a494e7b10ae7a573261e18b3104ec9ea7b1959ec50b645ebb7b1c2975c0d3a59df881dadbc7cb152ea4bf77ee2754bf7145e65bc6e4b6b392311181aef0e877109ce10e5d244257494bf0416c6654ac21b426b235421a62bc9bf65dc9a7f5825464959c93ba95d3632e83a9586abe86c65fa7d8ca555d0b63c3f6395925cd3d268491b0891cc8f9d13c9d03c99447237428c8e16e6c64f12291235089702922888b27ab89cf714d121da484ba6ccb5be58e1386f6361bf2377fa1e57668971639b9f285329ce094e3ec4933b64931c7014a1e0511436e851724b9932229c439154e4eccd9f259d7925a16e8a375b0ab81c723ad97b9098a9a137dd0dd36253797882270de190ba812e3ed461cc8d305842462c813bcf8ff0009dd6e36edcb7e473315424efa7924a1b64e609c932a4a6ad10e7dc8945289ee929df2e815378c3033c0b1bafd771daa0504a68b946fd06a255f9249f523c31a4656977772971f81a59b73636a4ae77c0cb97f51b3eda4730608446d81b69f24f6d68961c092cb4df622b1e099c14920b81c75d140e1827038d208bd1846b99387a3e51a929d10c243c0a32cf79b1d4c8553c13b8aee5281b574cf104b85b25d28999b76270c583a15d0b268886927875222443ac973b92ee4cac08a5f1277e49da251b251b8a29448d4cd2e8a4b96ae4ecb50656a0c3a7793dcc8b08f8c71723723ea27f6749f6c78375217353c186e7ea234bafcafe86f3f72157e472a9aee2be730740ece44e7297363d17076d38d9da44bbe3be0653a1d67b51c09aaf71b7b560ec652526f70265b3eb624052860f02c2b437880c49075188b27a10944a634ad9c34b3276a65b84c78478a2aff0064742251842ec6263489642817104a5df61cce97acad1165b1c7038a8f465629dc6ea3a93823bb6c94793ad8b695798196aa112df0fa8ddee3847ec6e82d8f39f643da87d250a7d4494710cb92b87427ec171c987b8aeca8fe8ae5e0c651181d7db0285ec451dc8474930c9bacad11c92c8f81f5146982c99a2492fafed9264d72cb92e99e08c38af627ad0d439cfd072bc1372edd84db4f4ed92637ec426cc5b7986ad291ad720324abfd1662f0be858e0504ad782210e9e24d9c931c19916d8920f13e455112d740ce158ed4a248ec3f90348b8f62e7034e344165ab38fa8f2c7a29c89b88e44d0df1422dd96b225bcec5b6be826dc320bae81cc8d5884ba247637a1eb841106c6ee4cb452b56b148dc91b93562549f2d849a531ac16e3574c6225e494977a703707239534426704673c8acd1662ca5d723ca5f82e92fb084e62e15ec47c63722f725b75465b44b4dfc8da898144c36c598d896b0f23ce0e247abdd1d624e32410a58dd94ad5d8451625292c4f96274d4b4ba934e9de2c751f81c28bec912ecdf8a12ac5be7f5c0a36dbd86b9fbe9cec44717887f51b520b245d3dc4bc97c4a08a787fb37246a5a8744679230d86cf06e269b76d2384134513659f4db91b11ec2a6b034a5dd1c323b14604e2f45a9ea748252881b54376de899d361b4c64b8142a23e84f459d3637763623ba4c9ab27454f4b62889128cb57ac965d86d623c9e46a9b92f91e89dc91cb06c1b0514ee895ba7da4c1e7a473a1abebdca4ee635b3811b8d0db0cb77c88e45d0c7d14b9217035646efb909aa8ec2c564c742717e44fb3ae0c609e936726edfe4969d4f471c0aea7631747b1748827e6c4a9ebd052da996406a702bdfa8b628863c42bfb8a5e3104accc15c8973ee65d29e3f629597108e85e50a594369a149abfc7b0ce1de1094f93ecee850a2390f228ab71bb7dc5f4d884a4952923afb12ebc09e59fc476123de521ec12b3e19179df2754384741b8f45d4850a85317810e3ae8f44a2b779e458a44b5d487148dc3d99dc5a7f6d1fdc97c8782e9423b8a6cd831087e86e2a0529c3b22a8e5741d6c3d6a93439c09a986279184c926549ad8db0c95d4ec67f03ca8e306f70ca2709d165b110c79eb4ec49308cfc0f2d40ade8e8b06c7cb16236e070dd7e85c9438c1b5a1d3c7426a10eaa76d1d0679278153b0963ce49b0ea17f82ddf4c7f84fbc16b1effa3a43e554949da28a17de4aba762ca5f631b3ec4377027ee493c22c397bbc12a4870a9646517b889b14416862489b4ab9e476b791b3ae37816e24a46ded123e761d59e474e1f81bc6ac4bae05a262159be45ed7e8a8e4288b9fd88db22c491d862a4350e2057774764c7a2eb23829b0de47925c8e7d0c882b64b6e86a371ab1a1ad76b92207cd648971b1802839de6867b690e628efee4ffbd874135304c2fa531a59511ee3b3a44e5a21d4cc8b56719c078a617615174e83da889aa1e213a22334748317181b635bcb8db4bda2c93825ee544ffa109d5302c8458b6b887f3dc98abec4cb98973b8faac93c4b222547e4710a9dceb0553ace0732f749fb895a7f6553bcf72d61ca1ee42c35f51c1284b624ec35c2eee49539638e59e448ded921b1991a6e7af03a4772aa6c4a6c6e688558c8cf3a6c212e82531a1e3442c5ad14aaf262d316c4b91b70d6c489732716260cc2b481ee21a64752503d4499b2206d223d909ac246db6c35b930d8ac362972244e5d874fc0b2a371ec77146f813849627a17c9518fa0d4e14243275518c954da2a499a6a69f71bd65d095d87689cd6e4acc171b0a79312a14751e458e9d046211dff0004de2fd88af967d635cc7bd8e1951f5ff592949dc94e20527122da5771221be8378945619125723a66d31cbe848f69f442e88c8cac317730b7fd90da8437818e3f435bb129476766e52a859a5e0e6996b39fc11c0f3e867c231448a8c8d93f412d2a46db63ee5c189db4c9b41cf01494f4750397a3b426e046c5c6a68687b7238b8665165881b71e8b43f06c9f4c8cd9850def81a5bb33a7b58f6725331ee3d81a4b085889fe888512a54c10ada38150e5325edf522b024548863f642752367c0b7726683ce0a32faa15ff004426b1b59d842f2f7d149925075a24457d45c52f24b695fd8ed2e5d3e49853249957ec2b36a6237a144391470993fe068baf51a5251070a4e5c4314aacd8d725b4bdc869c27c1234914544ce89a973c792666b7f03871438250d36cc91b375b8e17ec43afd9be3ec513b4a51f71383b83b19b68988c97b1377e811cda1c1e3dcc2673626e20972f25a72456773b4e948450595364742c98636333d61124342c58b38327e86019449592e5b8155cd987aa1b7cc9b9092d83cbec5b6c9147170563ee1b96aee31c149d2b1445d1927dced9fc8a34396c2e25e68922e7ba42a673973c8a691fe88e627b1310611e0a4b014630356a17d04b8394b663c0c7810850ffd1e43cb40b5b1c4df7bc1b49c7d46ee3f45597224f3dc25efc1387ba2dcfdc42567d842a4a2dca1b7d70e677820347910b028abf02ca2132236309d6d2613af23e88a9a45ac9c4f1c110e1d512a4fa0a524d1846cb83f64c66cddeb3225f05f04ca706dd752bd3a9877a2da8e81d36e867247263a68b05d11d48830bb9f61c0c8294d7a181c1e4b30ec4e9e822c989a4d40cb663774fd70352e122ab2cc4ee452303b6d8d2210bafb97b6c893645e61d91b71d476aeba0ea6e555bd24ba33b413132afb90e50dd6208495c6e47425c3ea4447dc7291e6852c525dcbc6b6164d9825a6df8f9038854296b03a8cae0e1b5bf227becfe876717c1199af238ce3e86d29bc0b7b92d3f62714f67e10e1ef1872a4c4085fbb37c6e46096f2c83683d8986b7bbe08b7b8b2937502e992adcb91acae0bbd93d7c086b04c3540e07a602ee6fd34c9c74381e0dd9c8cd90b55c1dca27a8db4660cb5c32735a2d2e8cc07e86c0f3c707b9888713e0c65b8d903ede50d28898b22ac8ae48a8e9b14ccd60b84cc175c1899365285c917432f2fee24723dd145b54ba11392a14b22c365ec7bfb8aa6489c1078972fa0f323a94e02ae46954e58abc8b3c47e4b78c2c19c67e846d0a98a5cdbe5ac9967c3143970625a436ef5c40d6fd0448dd9c631dc9cd58c18703d28e51b93c4416f726f737de791b37c986c7611d3c153c09269d29f04c0f6fab2e79f63864d58e5c4646dbb27ae885d46cae4c1dea8ce110e05285d04d0ddc744ecf4c3204a498438db22eba6c6c40d8fd04a2f6ea4a70b1a77f4a6264bcb1956849b94aebe8391f44773346374776957c93923c0d42a3ea3eefc98992a1b5912543c8d361920ee5b20c8739913b3844f2845921658bc84e7a91cbdf26cfb0d098cdb12ba7b604f8844c888191ef6552df2427b09647829ba6d3f71eff725b12d658ca3a8d26af65f52ab82a1a6542c929b937d4a8c7b50bc191e09a3c0949bf415dd3518f73ce94dc46c39c7dc4635996cc3cea843c64576fd158361f0fc084b945b0b052c763e860421cb123e0690f464b3626b03f4643b9a36165607bc8c7e86143381299285444bcc3f636195d0a5281272884d9b214a3ea41ad3a245b475252c84a31381e04a228315604c41f79b435e25b8541da6c4a65b638498cec374d4e7a2315c916844e6f820da67c14970e49967724927564eca33562a7923c130d59927f5e4e61d94b7b9352e3992ee84d66be31a9c4a3c8a4a9dee40d98814093f6e44dcaa1c36e766488dc99662a896e22897681788d084c188b5e2c6f7c291caee21e7442d568d50854252703522ec446e6c25583c13784cb4b27d46ed964e898fd399214849ec3c8e98fd19abb1ae0929cd8ea3915d5a37155f738725173659ee6d6d1f28eb73c1d5286e9d4a13f61ac38a24e8743048b1723eb81a7155263da590c69a842624f84230f302c9ee3ec8d8a6942a879194a6ff0041a15e4dc510c09299eb5bff00a4b88ae489edf39316c90bdeb05117f63886a086ce8542de50c9b2ccdb70d7431bb991a5e8b764c512bb68d921d12b7b1bba7e3470959b628da42642ae5ee643c31b109e303763763d911e84761a9b2148f542ce993a0f836104dab139dca9c8eb7d2d0f464941fa50d5914f27250da8cfa191813b9dd9789673181b308aa7c0dff4ce494432a09b34989270c9aca14ae207312cf363b836c8b0f40f1e4896172fa09c4e9225d5f52ee3d869da08a5ac92e7f225c8dad9f71947f4528f2880d862218faf44e6c798125c18e7dc7119211aa143bb14d1cecfacd40ec8a1296303170192b65028094321995f72544d3eaec364a28fa18a1a5b3df04f062e454a57f666589bf25070dde95a237150de828dc44d11c11a3da89705f06ea04db71c8e56e54e8e0ce981edff000e845b09087aa19a443e10e63f05518de30c72635e10ce555198af084f2825c741346703ccf51215df926fc99c88e65b03c8a8d3b412a7c6e732756f05a6f27d2c9467ea3bee4bc34946c3bbc8e70749f03b2c53932b2b534258952fa8b1b997f5104b3b6e2a558b3987d4f3f4129b25b6973b464b970d395e769210af034b3aa4a305356494230222dc13106a8741312a16e437b32da2917efa61829b1d27d079bd175d2132d49592f91e3d042cd99d859d1c91810e244e6c5594372f63913bc69621c8fd72132791e78190c7a2c8f96708c86421b4d889d4522593cb221ab14ce9842b8e8386b8812c70c70f2dbbc905a2a08adc890964036891a730dd4e48c9c1ec813b12e58f04703aec9e8957b8ee46389e0c8da5ec3ca78ec398bccf62d5ee65b891757f43efbb42cd6e6caa050a65ad88b8d9ef7b3dd0de5a2a8bc17250b81659ee4c246f3f81bdaf25d9b2268542cc4c4bd3245e628994db292a7ec4b06c43d51b9cd1b0f5464aa3c0b91c38b32e0828517c0d093d3a946ee4c58dfc2569143b18c77aed3898d3361c0906b1d894b61b2c89d8ddc73524771bff0042781de7612bd0f0bf44b8282e8c5c5e0b4d29ad6e66f1337d45d4796f24cd37234e67fb2b67a3d1b935e64b448fe3762cda1621467dcd859289f239e752e7a4156b91ae848846148bc1761dd04bdf74397bf91652814cabf278dc8c90ae0ac2177fc109b4bf23a2ac6a7413aa3138134e5e079646c4b5484318f3ae442e4e9562591a5a263a64c930ac6af443703c1237a1fa846c4b6758f5b8d5826d6e490509c9387b996555bb1313136394422ba8204776426bc51d2f236dab7047366630476c9caa07a42c4b838fd162d32a5f77d0da5ee3cd214acbe3a1788a23a0e38360ce562c2cd9bbacf91a5229535a24ac8bb64a2cac92e444e0d227e08943e34ab5b4104f03edb90d1d0ddcc494c8c86d96749da069a59f04ce1149c89abb165d1db7286aea0703f423623a0dd7ab816452b71bad1f04af43959240e87c9b0c7a218fd0854123737924c7ab9b0f71dc5b32ceec8511f20df73c9ee29ea4a13436bba4b5332e5609991f51c049bc13b55ae141b7917709f5113558ee3139467b9b52fa8e2f631182f646e3623953226a7126ed8a1f4627b609dd3dc6940d933b32fa0d60666251bda6ba0d2f22df7a1aacef81ab796389dd2214e46f10d28e097630da32883373dc5794460cfe8ca283e223dcdb392f2b4bd10ce83d5688ba25f04f2493be896b0378d58f54863f42252b4cb040f03d5c4dc48f33b8dcf26ea17b0dd7dc4e61489a4996470dc4b2927fe0d394fb9377113826eb3dce5921d06e3143dcdb68e4f1dc5a9d2015381b594a07c257144fea2a81b850251cb57c0f442a17cb3211d7ea523f246cc89fc91ac31d5a69da51981624a7ca7323a24c85093261cb2f38d18ec6d56436f61c193848a7843a9d1e3c9b6459de05571ee65652286c52513e88b50e23544924e8924816857a50fd4fd3de4b17028225509ae4623b60809d4973714704486d439a9438ec49472a95183b9b8f644ab8191473d8cb4de4ecbb43644de2e1aec384672394946e86b8d90f337666604ea50f26ddb245262d57621a179a2b822d458dd4fb14671f73e086c48ec6f2980a2ac4b868506f7b08dca10f191c9364c0d2488e4748fb06e311b513b8cc04e8b43bda06ee85992f48424ba2204a647e99148d320a17d04a538218b3040e373fffc4002c1001000202020201040202030101010100010011213141516171811091a1b1c1d120f050e1f1603040a0ffda0008010100013f10ff00fc3adc4b609f91a07d24175385527d18072232ff00fa2d8cf576fd897427c628c21f9eb50172dac3f483b5fe588e79df988b867c1e1a988a9772e1c56691fa952833cb659d92b827b412d2395e818fc41ebdcabffe6e97bf2e5f44b0b6ff00be089b457253f11572cbf2cb44d5d7e60828738f31bb26f8b82b86496add26264c5ee3a1797a852d5d1dc2812c89564f2c15565f3710c8f08d4501ec9fcdb9b3396f3f7400508e44ff00e58803dab5333a0ab3f0476f5e56e592d705ea0d8e667b2a52f19b8e389e929bd351e332cbe6983b25b752b16aa19e6596cbca08dfe2a1e5fc43cd25d12973b9f128587d0b87d32fff009316d388f1ee3e76f4683d12c94ac0fd78fa353350e9a661b7a994aa30cb340c9e1b6224b0ee5cb795ce2e585c2ef4cc5cbcc56dca25be220e18115fb57b4cbed6f92f3ffc8201568232afe3b3c4df1158fd2c972d06ea5ccae9cea6482c3506def764a0fea3e69a891c1ea3714a9c625d092c789e25b52f39661c4b4478823e98514ce4e2187269e3ff008e11c35ab194dac0c35ee2257e96c5d426633552fe91c1ce5f258325b8f3111841691a7a22956dcbc20b1e04ccb832f654b8c2920c6830b986b3994036db52e77a7e84001111d3ff00c5d04c3472ba2374a1cf88b0ab3d7d2d98ea12e3116e63e80ba9645abada3a80152c1e288b8cd4bc314bdc65db2fd2deae7991e99fa90bbbc7d0789752c58edf1c90b297a5dc002089627ff12cff00705e2362068f20ea22dcc425917fc2e5c01bdf52ee3759627378df132b1f53d3e8f597f47ead3d0ca473f4f1f4c90f72c566195d4b427c90517f72f4f883ff00c3d3e82e5638d700e888be239fa2ff0085d4b7e8154fd332b31d2fed95e02e074965513a2caa6317221170afa02a908cd12a5737f428dc552b8944b74daf64030ab3ff00e1858636773c407b545cc68ff1e22fd037e5875f4690eea52901b694ea0cd58f12bae1db89615130b2536519b83ad6e1168945932592d25e61f4064eec6556e5e2669cc49e218ccf988a0753190d8b70dba31793ff00856c89d0f1e32d5073ccbc4b657f872457f41f5ba046019312dd867cca6e8704b758f1125c1430ab3ee262cf2053701cd54b52663c44872e90eb332a1558daded579565a2de598c263af12f620b4a98e2328874ebb9c83e48b2fc4487a8208350ac57c42f70aaee20ee158ff00f0756b6747a4300db257b5e66beafd48b808c0e59a80c2974d1094a2634128d8e8e2d2f35caf39b8bd33ef299a07c12b7f8a0aaa659b2286c1f152dd72f425ae0f564cf52a8cdc38d239122ac85c35181541c71282b4bf4e370028b38ec63d7c964b9b9765631f4262d55b11c3c30016dfedfa6089ff00c0a19ac7270046f693f05ff04446f1c4c7d3897f52301b73d12f773884d6af2f03cc26d79384c3a0380a858638510acd3c4087540114f2411ee3b59134c9e880e2223ee4724866ab3037329a86e0be98e67c42dfb7da3d1735f5e208ddc17ef5700cd5e56c6a50613479d47ff80502d839562f3798c1aef7f43f47ea43e80fa696073e8807a8dab2bb63a016dcb14b8c0424fa752566557108b454613896f11309ed5511590fcc788170a984613d10cc6155fe1ea20e71d477065d3606e6b21894be6601bbb96094041cee236f600f87fe7dcaa583e0ee191d197d1164398fd5fa04c5b9854219068b78073126564b9ee606031d7133f47c9352cc7c4056ae041edf784d6704b773ca334e895d128196a23bfc46d5497cc45f11ea0eb12a4d94e9105ec554309f118ca91e0ff4450848573f4b883510a0aa22b16669f0cbb7b6af6f5ff3cadd02af4112165a8f4353cc287f6c699788fd587d1b842d40cae2a390d6106e1500d5f104b4b572a83cb03f3e600e6e544951ceb33c252310ea60aa23fea4d1e7d91350e2a8f11d2a35b48da94033d04b202ea37398049a540d7137cf10d306d1e3507730b0bb5f79555afcc6a5ff00ceab9a6a7d77f4b86b76fde2f514e2547e9c40fa32c556176b940a0301b57cc3557d003371cf73edf05ccf9949577f4a84ab99944719b96e6d2e01ce0f71c9bb95ae26cabc36a0da1c8d265006bcc1aaafc2c19b8cb9a73f51ce2144a5773005b2ecaa6c1f5348427c97ff003b9e2ff1bb7e8d95c80264c5cbfe01fe1ecfb8036c0bbd7503924e97f1284f5435b2798c8b6e54e276546a159cfd0254f30ba80a6d8e3529cff513c7cc3c9f73133140e23b8b3f6446ec6981d7d1d7f83b0784289b6721c86590e5dfd9ff0039da0a7b3045555942f334dcb4178a8463f4e21f5a4a8a7b4388a3c0189552b10ad06bc42cf6cc27b263a257a94f5fe0a97e25c6eb6a8af7170671e634ef11b2d0ab7702568cf9889520a9a61fe0c23a0f4cc8e20a4f093323c0fe9ff9caa1cb2f5f47ea62b22c43e8e5fa6fe95146e625d07f04db057a86eec4a5e7e83939fa4952bcfd09b89e266e3da37abfa31bacc6e334aaab9eff000c4cf3f7832c18c8545485d336343f5eff00c0c730db6f427427e36ffe72d4b81f9397e9baea15cce1031fe1afa6cb955f472ca038ecb071aa2170a204f0c102043e811c6e65224c7d33c311dc3a3171673119dc7926446346625335bcaf9a171cf03e9c7d361f438cb04e277a978386beae1ff34cf3563d5fd31f808b1dfd0fa3789ae2541edab5ea3e6499e64308b738a0fa86509042afe2505e6a63b32cbd58cadc1b9cd77c4ae77bee5ba59a815b12171eee13c73e22df3eaa22ea2b74e4d9095fa22310d30ba3d9193e83fc0d3389e46100ed7de0bff9aedca5edc11fa61ea44c663b7e87d2f3f460f961a0ef31a21012b18faa653074426a127382eea29788038e771107dece23879eb88d54531039ccd8f500ae9d65838183d98bfb46ea065ab208d47c31cd071095ecd9287bf105c9530f244f70cfb043c31cbcba5f0cbfa2e7ea357e63a0d428ba5971bcabf957fcd3affb4bfaedf2ccd7d49e6175f47a377338203450004288f62e609cc016e3aed9879b4c83f980691f8dc6f02bbb57de607d288ff870cb778851e269b862f330308438399609761c71700dfc6331860b2f8acfde692a2cf09bf4739d12a29638c2ca9762c1c3c9e18665ff00a354305bf22579ccca44cb5e2ff865f8d27874c7e009c7244c37632b2de5f7cffc79845983efcf2edf61ff0035ee0afa9c3db3bff2483f03dbe3012a23436bcbc046f643d6f8888e8cdb56fcd462155b19e0082c232af33cf1640036158dd3b4908dc1b2fd818597e0a9a7ab8cb079244af168151a3bb004ddc31e1620f9f4ca6acb8db38f17e2366c9c952ae00f32b607c4cc002f393f62e665147032d7ce194cbb2c02bd00215f0aad167322b0a55ed4c22292fccfee2a1dad6d6fe89584adbd27b2e51814e11b4b8f9bd729c32a2d855178652195dbb593e988f3187d339a7803f7abf9ff009962f1c1f75bfa8fe6677f43e9d7d2b62cfee65aeb48866885b87f13e7997b232ef9f8b842daf3b652993b07f37318d61e2333a629d5eeccc7612eb4d171442038fed02ac0e6bb8c231a1b966e50cbb5c0c14711457759bd47625faea50d18fe2663757552f2aa06aafe6a67d01b302f6c0a8adeeb3fb8698f2dd7ab85bc736fb80094e732e954fa21d596b6e5f72a63ba2d55b4d8f1dcbab8e5587b94390238c4bff02da026844270dfdaff00e6afbd1fb15f5f3f13bff227703efe20aaf96ae1860851dcf0c2a32918563b9bdc6f309cc5145707695a853d5c479f52f595f6846e5bedafa06312820bb54e7bfa1430407b8acd45b8a8b47e902c8db839ca5235f43ebc935237fbc587fccf9f0fe7eae3d3f51f423a80b19a7e248688504025d9552f6aa2a63af754fbb514d7cf7fd13feb17f50a8850580cf11b0c2c6f104237662526e142d8f3ac711dbcbe7e82a0900c00b2c4f4b10f6cb5bafbdfbc50a902da1fcd418b2572e1ea7e9c100096f0c57e8061d2531fa587f925110ee0300cd013e7fe63c082c4a9e55faafe04d3e87d42821d65517db28a83e920b5a0e6686274fe8e89875ef4dd4ecef42fbae266e3c6335ea0a58a8a391d047a5c56c7ef865a68ed960fb8f615643dfcc04c9372414312ea529e601a3c6995e463f10ee67dfd36286bf822af20187fe928b185e40fb6d9911260553ee5c5bb1c55426e4cf5bdf898cd2357401880d4dda29497cd5d8f4954b18be9576622d62547eaea13bd5bfd857fcc78897f11dfd5e3d11d1f421f44aaba2e00ba8a895200ac2fe099fa3f75951f00f54212a6e150032b512ccc5aa01cc65e1ce54ce0ca622001690724db8e943e0310d41d8f07c46b235ecf4ca92332435ca2c5ef2dae21839ac5bccc9432c25f388eae3150594363812b6e29f4879a40fc0d782de603b58a6b6d364ba0ebafc69877fc238b2604460eafdc7ecb81a278b963d4d38808e3f51d0d46c4ccf15fa6713291fab937cc371fcefdaff987fbaea3bfaaebd11fa0fa52ede6f04c05b13e629128173288a4a5ac4bada7e7941a8c0aed47d555efe4a9dedd6bbf11a63184e34d8c46d61265eda1cacb1c0011f04cfbd4a391cce330231aa5df82e5895c4733210108b2ff001107e3994a514eaa42d21bfd4c8663720e69be066509754a6e1d534438858ed37a7954717363f1aaab634b8f7bf09ad2823e7475690200c01bb3d47a4b58e9fabc902371e1c4d43305ab62d5daaf6651143baff0e3ebfe8710ff0098ff005dda3fe0ebea4ccc6d4ada52255c0b197bab8d386f51fb17065f7b10f401c8ceabcc6eccae95fcc841328145a7816c22b7bdd17cf16c2bed717da0bfcb726566da1985da82a4609592d21cf82e0fac2fcc2374cb13ef5cd9c92aac98b8826d608e61a2a1567c4296b81188180899cf156bd26634d7bb71bf9a947a7d9f548ced0dd4bbcdcce815a5d4b065aef30814623cca71b1840d3e2160950d44c7342de99441a89f4e260d4e65fd7fbe1ff98ffd9d0a8510f0ff0083aff0cd4263e580ee0c7c428212e37325afe60d5d450d53312f11bc0398fa08174d12f596377b885eaa255ac1e7fed8068fe0984e2882e061c06888a09af3045d619bba99d12aee53a328ecd4a3cb2ca7f4dc228a1c1984a12edc2cd00271020d2f42bf48191818717df0042e1a8fd08aaabf4afbabf67fe6707e9fe7fc1d7d095cc1602f3fd12b61c422474c30bf1001a026ae2554031b47eef3336ad7b859b602854051e212db87129154a2c22ab2d23adccd89970c59984011509aaadfbc6d7749514f3f0c0051a206a30097be2a1beb34fdc99002a3fe2a0bb5f81ff30ca6f63ec5fd48fd09c47786afd59288208695a8e13d23e11194885c68e65b747d0df302b12c11a62a6357051bb884acdc0405c0b2202c8c42e96188eae24d953e6940304af1043689d445bf41b692fa1507073b0d41cbf4e3ebfecbb3fe67cacbf29fe1c7d09684b6266cfcb0ea043e204a07d1446b336e1899971528ce7c6257fa18b7087285dc122cb4c307d0156241c38e220e4f980c5afa3700dc2ddc39fd03e2098187a12ab2a60fa707d7fd774ff99abb9f68ff009101a1cb821e307dba93586182564d511a2d8e67a412ce9a8210c798019a609821825d65f47698a5d62ea3a2521541b80a7ab2e15b0eb88535d36adf5122da3c0dcb26460c131d41439c729aa454ebdcf586c7dc104a3f1ffe47fd8f0ff99b7b47dc7f81f43730a5d67d5caab1410304d20b81089484c2ddcf4a8ce05cc769c7d8b951c388c0072dc097b86710800620bcfd05a615800cf113c57cc5c5d07894014606ea579866f0c1d90b96469775394eff00574657d847da050f21fa3f539bfd61ff003383aff6f5fe2c37048f1f60a00f44d0cfd26097a805dc3cc98f8e731c9c118d17d90bba8f9591acb88a8f8e60c8c503bb605906ae0be226732e830ad056e0912a203bae6212f102cdb056ae9ac5e6146ec4e6aa06107f6ca34c787e879870cabb5fbe5cf590ff000bfaa1f77fe65443213dd623bfa71f461b82d3a695a43e922e2629cb2c0b2ea61c1ed95cfd0b311a3c45596cf88f62ca71789874ba449583c44dcd572b3144dc70884aebf10f641e1964d7ba98ee7b9af96007625ba9666a1ace7e951e7e83fd3f7167c443fc13cafb2bff009962565563d5ff00830dcb978fde4d517d6150c665f733180ddc0b053ca73f10161fa08cb096b7572d353a095ac40d65800567c11337c74e3f0d41d76075f3a271c045b763223752fc3330f519119cf105534c31cdc25db58941ab73ac8acacb8d9b155cf102b1c733547e07d079b9ba078cbf78db6d7fc08dda9f80ff009a4a7c7f1bfe1c43705f87f6134ff05d330f7386252aa69a9502d44a53440c8631c4b184b07d039a80620cb6f706b27bbd314c71771ee961b380b8ba885c15c30dc3d5c25240909d260ea74c6b530eccea1a58a3ea9056922f302c3978944d919a4bfa1fb28bf0fd3fc08e14c95f97fcd5fd34ff00813621ff007392601060ccc90595106cdc70d4b1cb88ee34753e63a450438654665435783a22bdac4d24057b1958f024a8653961454203984c32e4a5f4407ed1c0812dd5c4722091067a4f8a0bd3e3044f6c77b8e2dfd6c46091c1fcb2c3dff805a1db040fea0aff009aae85803fc4618066dfd50fa17d01e195c92dcc65304e655936e4760ae9d4e0716237122e07e7dc0a1b95453c475a05636504ad058f42b9d40782d01410754023b8f708aa33172d5c405293a11d733345f4267e9178bfb421fe18e391e8cb0ff9a36ac113c3035ca9fe2379fe6be99a86a1f4398e32b7e622a3f64a3e9994f094971628da13082724cb8205d981623237394330a0e20fa92cba7e88620bcc048efea24d7dccf7fc25538ff0be8c353e7087fcdea73e63fc59c28cafb22c1f503e83e8b1ee37e61972d72f146e37e5d2cb83537dca4bb99434ca452691332d964e23fb9441c42a9717d097055cc2226d08be331dbdbff2b8fd497d995a7c63ff003953afefff00e2ff00d71d70016c023e19ac103e967d1cbb9a40cc28f114bcc1998d22b9a8e1b8297979c4597fa5852ea123c07d14836cb6081994a8c7e8d20dad225e7143fc1900b56826a603d9e5ff009d6306cf99fe21cafc9658a187d2a5288c629551c6e6480372a6ac9698fcc00e58cada54a31645ddc0b23f0080d5879664643f12de29d92d9773129b9cf71d906fdfd0608be8fd3ca51db75fe26767fe721ff3ae1eeebf2ffc4ee32df637344714e26e12a38446710d16e50d352d3671da139f25b3118518655b7d9966306bedc4d1401f218e22dc2ec803d412899b2cc2cca5e8ff0070b2dd266b571439433a1984ddc3c5a9ee000b5667acc103fc091ee0a196f609f2e7fc548334c27fce80022523c8cab0db276bfc3148f3f7e301f40612a12e710d4bda95b418c08c3ac86ada32a05d67fa6541150c955ea6458457f304dca3c48dd289d429daaab094646105c8f2c50e6919832125db59b9b29abcd97516335b7348904bd52e1e711740064a0cdf7ed962440ce5ae26449eaf44f22dae90dde0a5f50555e21a811fa5fa2a8d4d7aaa37395f6aff00c09cb207966b2c8f8ff9f7b46ef29cc222899fabd34c5e55c65311f17c7d7c83183f5acc0d9059467354314b6883c91af92a0296edbe44abf8444c78034111a008adcd5772a60de07c42b81059ec39803d162db7a2a3888083b6d41f312ada85b320e202a556ca5891d31c2598b42dfb9731214b2ba05b5987d2388430c63805cdccc57c7f8cbbb9f736ff00f00ce5df81affb7fc117cbf2cf532e982769920fd0cbdc6308374270188c25671bf56b29c8aba30c25981fe57fc4286b04a950b287cc5cb9283588b80e05fe4fe62163862008e5b9502664ba97f453e810436ab2741959915841e311fe173e304d6754bdbcbffc0dfc9812fb9dced69faddab8bb9c2425a8a3913e85c4b858a85a0c19799712c98a2c4d08c2cfc4b58a6a1ca5047a5879a59c2c632fad114e601b671e08dd28fa2e1f52e32012e6680c1075d7e7fc403898f2f3f3ff00c18b568fe23fe00f4eef36cc6a980fa8a0f9ff00003e8ae0a4f1889798e59e121d24bb895a2be8768e58cb620d4616a3157d2aaf68729d08c38da6b47007f8297bfb8b5046a003c10ffe08350103c8ca8aeadfbb27d5ca9e2e123c02b473c266018398a241b8c7e99fa2e308c6c8a8c1c162b189108f88117e93153b8eb2bbc8798eb75c7e77f8bc79fb7ff8560e615f06489f5b8ac6e197fd3e693e483f44ce1045ce207d42263e8797d0165a6a544fa2aa5e3fc20cdf4d3ad543743c7fc8ddd57ac9ff00e1695313e78ae1ff000c95f39b806c287a47e8dac2787ea21812aa5cb2cdb5701b80328a373c5cb5c486c84ea52a2c7d2c2bf46a9686723817f98f59168daaff0083f46a383d3cdffe19b85b6b84dc393fc029b71cbe7361b41cbc3e8eb6e5d066704a203923ccc4b42cf925a77194955552be96314c7f5d1198094b78786e5f31c4aad1b55ff0d7d0810f7fa6075020380ffe188e352a2d1c50bbac45fe540a47fc19e365a0f93a677873dbd7d1564c90650ccaa54388ca30d6be8128fa0e2005bf4b17d07bb595414833b3fb6167bda36aff00970616dc63983400140603ff0087113d17ea5dbdb2ee39c89475c495b6ba7ea0e19bfaa671c3c83a1c935ae5753f9c18e638cb099ea02454a48ae12b2e6512c6128f98816c47d40499e522cc570ae23c4a254aadabfe1afadadb47427f72e75797ff000aca6d9c723d1e23d8b2b6639098601a08b71029868167ea659c59d493ea3511b678b5c7e1e62165bac2f43865553cbf49c2c88ac137f50c7c25d5e2a2fd3c72b3e825cc757b47039633df25f95ff8d2453bb4827c10d58c4c2f39aff6c86aaf83f4dad2f01ffe14ad5bc5c2e3e9bd3dfe76535530945470a613954d1b5d90e9acf5c93fc0b9472d42dd518fba329cc0c9104cc280fa867f5b495251f40831f4cb6c5aa83cac5c0e43af41cc51c7ee81d071fe26af9ae27e025561e6bf924c9c9873ed72cbd0c1c695f3fd14383274900c601cff00fc19c6e15d868971e72b2bde4fcc00d006b9e4fcbf4c2560b1fd5fb8f63316c5fe38a9ff00150c9d8b0fb2200fa8f940a4dcda9f6a1608b387e88115ee59c8a85cb060747ba89d0474d485918709a1e863fc6a0e4a7ad7f89d1f71d1f6940aa96137c62d7cd4fac16aaeb8074c0af470bb5ffc086d3d5710b26cb1a7a0fa5dd6e784ad4a612ea11bcae1ba8a058c6e0f3467fba13fc9f00362348cac62ad7fccaa3e7fe183cb7e9ff7699df94b086fe1903f1cc19bcf346791087ed8ea492d4f5fe41131ddf6facc784000280341021a9e0fa19230b5f3a98619d4813c9f57207f64e986c10dff0071d9ff003c451ad5144f2f5f57445254aadabf5bfbf32e44087d2546d2cc8b09b0f64b9bbaa7f9913ffe35a9d4751e020bbfad5fda9a003f9fa287d51c0f980690b020fd425fab436b129258635e9fe97fe72c4f02db3437707f80306b11c1ca84785260015041f43e8129020522ec48dd92c5bf33c469ff00f00430962598672a1e18ebed0ea414a941f460cce748199e3dfddacd96a3f526a80d73ecec81581623627fcc2c14cd5b3d3db1513da5aff810b0ed6982bfc010207d53b42c398a3cb67f9c93d488391f31ff00f5095daada7f5078ab346ded72c287d1dfd710cda1a0f0ee153e3f098b8d73fe4c51dc9c7983d27b0ff963822b5341145b76747fa9fe44cab1fe1852a1389107d0425ff8306377f68176fb4025aa914d9489c3115ffe628777e754aa2f20e8857d598fa30e1052c360477fed509ea2ff0096176aff00b0f30dd6b27fca6316f01957895031b6a1fe64a3abfd7158bb5bb8ad02d0257f85cbfab0ac1f79810ee87408f80e91c27ff90f7b0d6a782354f4db95740625112a5a7d1848916be858602d8dd4ae60835f80d479c544ff003d53387d081894dee57fc8a80ab44029d0c48bb117ff0081289866bd9b204a8bdfd1823187d582091afa1e087e03c037453fc85a43b18ff9307cbb966033dd309808307cc7e8c6bea4665075416c14ec3b0bbf7ed4e1ff00e0953390327039180f30c3ed7fc787b35ab15b3d66fdff00fc8226f4dc61b573c4dc542e3976663b62847e857d5984201c67ed2d13237d4189a95d98cca2ba1d3d137dbd42fc9d913fc5cd7e5a783cf8130f26c7f4228c0c1f4cc1b953331cc21bfa0f30090191fb0944551916856dd19fdff8e25403be271f445eafbf8620017067ed3ff1970ff83e5f046ca518b4797ccf1c7ff911d6c8993be3f061c18c4615fa032fe8bf45128782340269ddb2af445636174b9f473293260ddd8376d4570fcb80f0ccabcf3fa769c57f5e3d4dacc57ee53e9458f411bce3c27eab6020e616ec8981194254afaf32c233884c6590691c4c669166db3a97a235fe24a5b9c7b96a05e0fa05bcea03451bb3f116233c0ffc45ca719ce42f4640f27b15cc147ffcd446e1bd57979905955ae6628d408c096c19b9667362ec61080ad400795c1330ee600798c4fb55cb067cd593647644f6822da2be0da16f6c55a9d547499bc503d920248ae2e9415513221d632798547f019fc8d930895dc276abddc1b25cb21184b08bb84edb991999a4ba9851f30db9605ef8200b8fd03e9c6208dc49b67a8cd91ce7470318b86834fde5509e7c1f98100faf7fe129ebed54baed98189bf8d2e6711aee779ff1aff12666416a0d68c7f362ce2d96b5b7cc5d417687d78a2b542c33d28e58c2cdef2f4658f5ce2979ed84ed555fbc9455c8547cb4faa839f1bd3e0f3125a7b9a8040ae828889c19ee03941bac1f2cdde3c3626143468849dbbabe18e6dc834b1be7a9bc31c9d4363372c7e84afa5c26a1109997679c0403f0e35296e17e71a95780be88fd689463f31ba89bad415c444352ada838c905ccd5ea0177515c8eb151716d38ce7c30503e65c7c3000823a4ff00fbae3e0f8db3f3d45d17865fdcc69df45cb25205c3199437a6352f17b3e95f403bafabf5262a15765caa1c0801111b19ee514c0a62a5f33bfe2503cfd2b2561687894b5361b0f46e34bd81f972a6d0ac98859a4f971f98eec916d1630820817ee9e21852903cb2c4875fdaf9622a7795d1db315c0d853a640386fba965c053c31c1d225a2bdf98124d3294cb2ad4a433e0f882b1e2d37be650a557e83287d1532332b8c20e8b8d162f17c913056a76ab65efcb53264b59a94edf48eaae147438acfd3233241a4b2220c376ce7966572c323e2253505b4a78b991b67f98376622256af203a8d6df2c7736aaf2be21df264e02ed457fff00536186d5a083a47c61f732f42bc6ff002cb50b77b5956998aed8c5820951639a80d7d2a30ccafa3fe18218f98d1f404390fd126a5d18ee0392e258460b209c528572d1cb067bdeafe5399542aaae5895b3e8784b874f2478b58ec1abf0cc7700750282cc8051ee5fd3b84ff3c5a214fe4b5078de2e1dfde544cc68655e71e2597e7dff0052368be25adc2da8c9997357f332080ddda2edacb62b8df630382e399261840c49718b8b0e732b7fc479419c4a1abbab9650a39ddbaa88cab94d1147d4c24aa332b7f0b0b0b8cbfefee02fddb295c4dbc36725402be0dcab0b4178aa49956607e618674c4bb33c2e25590f5e667982544aba4ac77c3130aac85fc88d01e92fff00e6491bfdc546941d7f5cf0668e03d1f5c88a9c36d6257fd45f49c1994158d9bdc48129ab9b6fe99e3e8fd081f4b43e1446e98cac667e2224e338f6c450d13b8956db04d2b0ba5c076c78654733c1e08ddb8c0fc133196b7dd41c0d4e2962cc14d5d306724b5abe49c8811262a5aa97f92790ce9fcff95310a8312c5d21c5c10ac48591dcd962945192532d11e474621a3c61ee01351f70842d148ce0e63d5f50d3b1f9865158e6596d784aa3673280871c87d7b8367e6bdffec1a530d90b96a6507a1bfebe7dc6e8390bf995529bef152d0c5e37e9e271459dcd0caf3e4aea599b3c84f66e25a698335e20203478cf3e219c8d017775e32ca693c8ac7c4660ae3d5fccb3773c1f641cb2eb51f88616f93ffe269bdedc5f5b78594f2c556dcc17bfa3b950349cec98e6654cd02a6220093176c5b56e595e615736658951c335fe00cac5ca1f6f72e0c839cfd2b8ebe4c9d824b03b81691468dc9622005787e90edb0c76f9534a824011a9f442d116e4ed49bf0d77c7f24cd63f83ff00c46e5896540ad8f88c8a10d723f315a8a3a85f9e1fd3e18dede371ce7a6724f64069a61b925aa108897490ed288c00656255944728ce5b020068ae3cc130bc3c63ed05af4dce614391bd4cb092a7460d86a09c129418599b7cde20a32e5f572c203d67888955c38f3297fa6b7bfdcb4a5130e4678a875d384671ab86db1ac7da08f2414c561080b54fdfa955828c62ab7d4bb7e3efb777fccaf8750f3321d3853ee4229f4a70fb21146c06ff00fdafd4ad1caf88bdbed378a4ab965fd1998566cbea0ecee22646c8d25c7d03132766858bcc2802ce6b986652fd2a65189729ad418c20f897632ba940ad868c42e3e7dfd0fdbfdf316009b22bcbc45ace0bab85262e7fdae379e1514608628a25ce91c614adc7292fe504291363fe212c0832c82e5346619c34398e0b96bed155b5b885b21e3b186d0a0aad61b4307d1b34fb04b94e09c4c6457664800a4cd81c47672c20d53d6724df53809a17cf213065d6062933c16e706790fe5969bb3454a725c39215d9a860aa8050597acc456eae51592b35052c374045e930e17edfc11b685baafd4cac03761e2e61298b82d75ccb714decf10aa213010be187885377e6352c3383fac7e8950b5ab77d4451966a9dff00efea5fa1fcc68c4a6deae6d82895f20736b5ec8475bf3800823a4fff002e9c15edf44bba4e433f11f9b729b5fa05908a56a659c4094bccec5c3ac621e581ba41ae65006d5df8cd4b05a25bcd625329799a94b7e082d9236d1cc6f4b1951b10b101a641af70a45b8e6714db49f5b85aa17584ac12efb825dbc85d098352ef476cb72106319ac4c59258473e9c2a391a81abf7fa9ff137f40b809cde6e0dae5b0d32cc1e808aac0a0ad2f9ea6454d39ddf65a8c6e1eb1841b3273b5c907ed843438730533429e9fa2ce3df1c4c5b02b14deaa721a154b4329ae8456c3c9df70e3c06fafe08e59cf2cbef2db5019e6d17822986da8a9f23965f29e0c42d4174e099dd3a839a2a9b0aff007825954174ef5afd40959158febf5359b5e9f5afd4b38a42d3fd3d4ad02e2efe3ff2093b8732832e9cd6fa7e6e12908ed9e3261b13140e6e8afebf71b0bcb4f7e7e7f52a4392de1fe8990a3633caf9888d1c9cc007d5470b60f1f822db6e65995b6c792074bc979b42ae5cab3fc6eaa87517b169ec97c3f710b50f95fa57d08c61d438850135bc9282bc405430d88a82378662881b9842170bee3b45a6f3777737b6351b6ca0c1163421bcabd4712ce1fe914c08531516e05022ad042b70413271848b6abf40947ba7bc7afec99d485fb49bddb2f202989440fa1bcfd127c67b81e4238472247c7bf9efeb218fa20612e8173b5cc55a0deb14c4ac0414e8bbec016394a9fe0108ae22d1cf52d21f687cd9624ab5efb3c32cd343b6026944a84dbd13e8333768378d0fa1150b6f14e656ca9e1267872d0d5706f8a655a37b61d6eae1b2f7d2f7f6cb002b39165cb105080b98a3d032c2c63407053badc14c0de630d94c430867af10d34c557fbf1042e4e5dffb530c6a7078c3fa94e7a02a9bd0d4a54f83e2bfb807dc3f3ffb30568d3f9bfee603419e1e9b941641051b15aea000004bf8732ccaf5eff1dfea09673f923c02db6efe5797b88e1655e73e73fcf99de2b19331c29664dc71472b7b829471667cf32a8d46f962d309d1b8bc4281e72404c9747fa84105a6b2a8cec6c8ea84c80971afa9b86f5f4ac5ca87135156d0b81273e626042b349735529a4c1758ee17cf58960210276a5cc4157d532fda552fb7c44476e5d9e2f997b490b30ba60cd414a8d29280338228805615db1cd5b6516fced2b78990953502c6f9cc6df77806b8f509d4b205406a71b86948889f11b8b1b7ec953687f83e32fe21b51921c4f463c0f24ce975d4fead9cc0aa2557a3aa94162aad6446bb56a505fc783b5f04af77f37fac8db399ca6a0b326c8129862d98cec7d5b0a1a795b26c1371557dbf11144a612e1dbf26655eabdf83fa23a0e0f8afe0992c0528297d3b9d7b52e8ce3c87f3321775592ddf8bfea04796d7e22a9b16539bc244d0352dbb7eeaa3d7fd5e007344656199ccaa96b68eefd1b3c795f4424d416bfd0b98d58043007fdc4036830ac0b55fde0c3806b5636b0a825a27ac54141b04ba738828da4529f347f701704e44aa3d9d47abe0d23467c115335401028b2a608b69fed106962e8c571ff67ee62bd0060c129a3571423be6e2b3844bbbf11a57c7cc4acc1c7f80355a4b5bcbdd35fa86db9513e8fd498bd40655b01ecea22658616770705311abad8b63b98f80f595a1ae258ec07258d5212b0e45dfcf106370d160f3b8be4a1b1a075126c5ae4ac32694cc2ff4caf13842cbea5834b1b8a05a319f50ab6556b32fe068c92ef31c7d15d2cac4df1f432999e29fcbcd80fd065cb65cab892f552b0156cc2ac574b23a32bc54af81c0f0fd5e4cf31b173882282ec1b09b6e0afee97e7dcdaf9974cf3132ca4835086924d3e28ba61270273184451e6db633c20b182d70772e94d5ef9f47fd4a829a4b38c1fa3f2c6bed6dd529be7bf9629ba1a190b4e29859776444e0f1fcfcd12a58c9f19e71afc40668723e08a83d14df2dff006ca8d9cb55f2416d167f97f89681bd5978c350c09030aaa83fb8a0b26b78c1822b5eaab65d17fd410342d05617aa2bef29b85cb64005bd370fcb2ab06c78ae65619573694734c665503a95474f0659a905ba40d32eb06a202e9c7c9b99e408372d11c3bc9298e544ba2da3c7db11bd56d2bd1a8ddd1c3c44a6caeb199ba00885db0f064b2053b5802534e22531ae2759e2623f4cfd15c9317f4e22554a21887705260461181b7447e8e5d4580acb2ec0377af70c288fa1b418dc02a2c3bce6ab8ee679bc78e262503e652ecf59964df79b45cb41bd36945b1f05dfcb1320920b25b7716ad1c318fd208eb5465fd700b78313c4b311b59895113d1897393fc632713f53eabe6259b98c331a2bc0f646c1f381ed23f4cd08c60bc988e8b90c6094bf1d3e7170094000280389463994d290f87d104254da90c512c9c9368a2da812c450505e398039255206064b06ab7e7cc28a2eca5bdfc9fa218bd8555f1fc09668514e3d3947f6cb296cc8995deeb998c2f7c3ec31ada9d699c6bcbee932f54c034561b970e90cef899c405ad5c0f10f816dd941899d6a5dde2af7fdcb1b976da34377fc1044210863c51e3753047029cf15ff0071c82d62058f2fd5cb35162bf169fa8b119c0f03ff0051aad3258f4a315855db55f8965165b5e0ef2c54db915776677fb6161be9658b78fcd4b86bec57170d2b96a698599bff0075297039e3cf50cc6b7a4c7da570d398f75f6c46d685c1cba82b38df702ab50c267e6145ddfc4a532f52e558b039995dca5950aa6fac44a7cee161ad45244716238623b4af74ad85071eab597ece8a284b41ca7ac45bb9358666ebe61b2115dda2f7db6c3b140d5e267c5fdb0559f411d857eb98666b2e638121b6e09ab4e17f689bce2319f8670339e3104206636e2be239c57e3b296c97fe0f995f4a8318895c2c24b04415763b211573fd7a4750a56d78f70c4a4c406dd037857e9979d1af096b3339eb276bca296c0b8ccad2e414e6007f86b088d1f96c70c303b72df388d1fcff00dd3af98620197dafbe585d2774ba3d59fa2528b0e96157f8870b59c87f34fed85d9d01f37e59950eac14b7795bdd4392b58a0158e311f38f159fb6e5368e214e5e25a64e19b018fe098c51e44af8650da5291b54bf6eab354fdba8a4a453178896c55d8a6e00a4ed7046f20ad9f7b97109652b7fb8810723fe89996262e869f172bb477459f9f3e2569569a41afaa3983695542cd1c0ba2391432f1cdb046b8739ab588b4c1c795feaff00504e1b7c70f5eff04581bcb77f3fdfea6c19435efa78bfd472d5ddf3280d5fade619db281053528e5816dcd1b94b727ac7d4b747d1eb1289a6094fda5ab08e8625d2aea055877db029acdc0073c44c43084bc1384c64a9d297e219579a8d7d2a57d119ad7c5c280d286f1291ae92a9342630e262dac6f103c917e9ac4b9c932dc5b5afbba14b3c4b84a84a95f449f6a9427b8d46e2daee6d8490d7151aaae18c2e5034badcaae802f44a24bc890f047602977939a8028c41b203a94ee2257f8c5fbefa3703efddf50aaf8df8fbc1c38cb425d79cfed8518dd6c1cbfbfd279708707e4fd12ecea971d7c382354e0aba39f3dbed964e4be1cdff0071e42b93ab970211e130aecc24536186a9f2561f6c54cdab8ed4fdbf15185441ce707cea20e030dcb4f50a57c3ceefcffb885d8b7aafc63f44ab715116dece57c6ff00ee7b8b6f14e628a98f192198506e9a7d7f728195ce8811cdfdff00985572fcad87407f03e1fe65a855be3ce0998b37ae2c7f57fa80a703e599ade6c16c6e0539b5bf166fff007c4a42d737585af7fb7c46d615b8d814a8fb94a97d7fde63b1cfcccadbca2561337539082851f920fa2bccabac40a10cb02994568e2581dc06f912ad71922062a0f97132d6352f4c561f1ea1b0b2a0c4c5e25d6df24b16dbfa8a505679945324657d39d7c4b034517515c2b0c5a86aa256594ce4ac113c9e55b7b88296379954317386371dfd044bccf0c73b49fa328cae5c98810210253f5752872af223ee47f022f6dfdf9b002d61584ba3e8719fe7a776b557b80b3fc255f71257d68ab415f88ced57c922837ce6e763494899be43bf3ffb2e95757b7fd665ac1828fe0be3d132a0790560f34fed871408dfcff701cb27e6e3001c8c02d6d566f9fe7f48e2851db05fb317e09894cec2955bc1a968ca277d1d1d3e08462a70707f1f2c45153164c22ebf389725d566fe56dff2cac612b17aca63e6bec423039c001e715fc7701628676fdf3fb798f35e3e1f9f8fb41652900ac63c01fa229d6c6fef9fdb0a02dcd63c7afd10abb0a7178f36fed8822972e29af3d4000914e6e96f57d7f5068bdad8f187bff751d9b15cbc979fb56582ea8b05ad66f39afcc4a119ab5df79fdb0b95c33c9e5b7f2c3a9698fed9fdb31727cefdbfb6526de55563ce5e265d982534b4ccb1112cf69ae372d43dc73b2aa042c66aa6cd733b6a9ea6542988a2eb1d436789806f170bbeac7994d745f4824ba95761193736a399c0de7301e05a733296fda4aca60c7c626190025257114ce06b98f2b02d940433f447dae21b7137e42bd51e8e99b604400cde2eba96f72f09888a11b7f53345ea33096ce65ba8b147e2238fcae05cdbf10a303e95095f5d3728219e3b7e651d50951747d61801a35743acb05fbb44ec2f997b9e1dd0a5b5954b9fa0951ff043b017b308ead558678c4828dd55f5c416c327d94fcea062b79beefcd7f2e25596d679647c637f188226478e29fa3f70bb6bcca5fcd3fb8c1bd7dcf3f3323673abbadc03b059acb6fc7fe4c55d95f25f1665f8a2379035bb30757c7a2308240d429391e3dc23a4e405b4ce732e0000e745c8712cbb46b3a3ec3c7951eeccb78ecc14bd7e203668eb166f31594d6f6d37cdeb8df46250bc06ad3b318e1e8e26f54d1ad28783a5d1cb051c1b2e8b8f36fed80b49e38bf457e897e8a5dbe3cdfecc2942bf7f66afa3889408038ca6857864f9fcfea0dd01acdbeeafed97515b572fdd9fdc71c2939ae33fd99cdaf76bf2afbb30b56936b9d36dfae7ccdf1f2f22b6beb9f31e4aa0d02e4a6f3ebf732d8d67c7fe7ee7032739f10b219b7073e25700b658151547e623e6fa6a3a66f8f51e5c4eab04d4c02eea536e330d1f98718c415c5be2b329483e07504a5e6f11ab705f88e2d5f8ccc8237a486c13988b77782dfed60c06ef9182b090d4a55d3186a31546a82d8b441c5ea2b4a35708a9abf78ee50ac1e04cb000ce12dce3af4c356595c16752f6ab5f9993557cc55ebc4cd793717078817cca28e6ee25554efe962562a6c87c4d8c51292efe2bfc007d3319acb2593427b3df82ea013a2bb56c50157dd6ff008dca18696f0f26a055254b1aaf25e0ddfaea6601cc0fd07c7d18fd46cf383b96ce5757050f72a8e938ad7f50b00b77be7ecdbf30b1e0a4b7f8b33f04e96982b5fc1fb942e45b6f9e6e9fdb32e7d3377fdfea5b25b7e375d5405d70baabb837cd7b55bf166fd11b39c60363f768f885708d5d67ef5fcc155bce19caf8e5f7a8d623636064e0bdd4b5c156adbbbe6ab56799906ec3377797e7f0414264e1efc53f8c4b34703b3c75107438c4ca07a6fdb7fcb2e15daf206defcfe898d14561bafd1bae8e773485308ff39fdbe23050f160a5bd51c3d1c440a9e4e3ce7aede667d5a2bc3e7c434aed79dfb7c72cb7274bcf3e5fb628c0d70e7cdd3eec714b43818c65fc9883cf9db939cf75bf700b942ef775e5eafe5889dd734e5c7f5fb82b833f0d7fd3f2c40b385bc37aff0068f3108d863ff288d9143618b9762f7f6cc134716ecc76dc09581c7fe27145d18881493cd6182998e8b2017ca18a2c96547435b9c457a7c54e07cdf10b28a419a61424e6f10b1036692e3cdb2de2f37dcb0019f3a2186a946f0463640d0401697db2cc82dd66269c601a94580d70b1740880234edafedc5ca1ab7f3a816afdabb9d3f0b09639b9bba5bea3851777b981758e2346d17889e254f93e8c715330e0df92a79f84210ff0d180f8a62d25992899f79b45cd0c4fe412d6dd59b5b422ebe677bdac437f5fcf11012977d13568e0710c38810f8faa67eaa2b83f795459872fef84b597a0d57e6bf966815b57cdfae58d834ecd15c5ff00044c668a040a2bdf07ce6380fcbce1e39f6ccf20172e6d38c6fd189628b8d7878c6fd106eb93e7d1ff004472374377fd59fa20f91478e5f6f86630a3e457f1fcc53655b85b4e077fa4bb7694b4ff000c6fd12da9f4428ff0af196504832854a5750915b9c886bb5d4481942aab2571ff0044a074e887f387c1713abc1becf8e220db2f2d76ff00dc73017b786d39f2fe08d60d6841d5718eba39dccf09072af62fed895a0c536e1ceb1fa382543821a57cc0cacb32f6ef3fb625386387ef9fdb1f39add9f3fd9828a1094a759ba4a5238179ca5673eb9f32985528b4d15dfafdcc3934035c7f24fdc32a52ac6755fc97f789ab54cd7db0fe26a00cf067c40d939d9c7e38fe2601c8e76eab7ff6c765a238b3247513272348e030a6f15e62676b962859c65dc6aeaa1471897e3d54b0688d8837b89c10291f313216e60bb320fb54476266a332330b80d9591039079e1b20b83370e869a80e86a5d855989251492b411a382cc32bf8f3139d89b9988df7f80be2614dd9ce23960a2a6742f32d7e530ac666ad3f04c6b1f40cb9b8eda8b6dfd35cc33b7cb33e1d075709baa19ed915874d43e84afae9094b94d4a0f6fe432e217e7454ae431d868b5b6595197b556f6fe76cdb918c290c55b78fba99ae61d9fa2895f4632adf7098d98fde7b59310d60da71fd419037baff00afe5995575a396fc76c4146c2bcd07cf1e898022d0dd7f35c7b602779ceafece634ef178b39fefe311c3d6a875aff744bce72b8ae838ff00a2388a5ad5f55c63f4410d75f15e7fd5ca303ada75e69fdc22cbbb1e553f93ec41ab44b4cb7f17fc4598c515c62fd6bd198b5454e24d2f2f5fb9532fb0bac3ef57db151741446e9db8e2584456117a0dfc11155a05a580bf47c5b03969cd35fa7f6ca2473b6cdeeef8fdc2e544bca67277c7f0410daaa30631e39f1db188b72df8fefcb1aa14c160fdf2fe58ddb6f2739ae5bfdc52bd80efe47f931c339ca9d9ce7f9f3122d30eb69cfb57e5941bbaa7dd739f5fb859574737bd7f25fde2c154296b6698efa3cc6941bbc06dc357fd79964032334df35ff442033f07e223a8e9e1b2dbf1fc4c9ba6cb6fd66e0177bd62dd5673dbfcc016be30c28cd3710ba61657c625f158d5b9cc6aad0aee2b6158bb8e06e6dfc44d98a1b0866b39bd40b8c58bddfa960699f332f93f0710406d77b8b9dc1a3002d0ae340d788117763ea8e25282e7016b06f7a2ef34ddd3a8cce035cecb151dd14bcffba942e97adea38a007063cc02a470e26c06f8abccc82eb26e34e0b7cc6d65eff12ca81875632ee205c9f4a52eb04c5b0edb7f984cd077e831983143fc6e2242e6358339bd6141bdc146882fcc0d8dd695484252e4145ae0c6a6ec250d62b09c24b5567f1e28c4c7a87d2a3180e3bc7b99196d2540e47530d06b9709ef82269aac6b34df20efdb365b9795df8ed7d625294a0c754572e88534d5dd5673ce7f6c001d97e5feff005285585026d7e31bf46235643d0ba7edfa25820d18bbe5ff00744ba82a8d754fe3d198413a68c09ef8fda6050947140fb4fe5993385f395f0eff00497380395af5c5f3ea0100e18dd55ef5af4662146af2ac9c67af9cc01052855a7ca375f398144a5395a7d647f6c655408340f1c08aaaa141697d8ba3c90440a3bb77f62ffb8165b61541a4f29c7b65844d046bf0995f082a9083293be3dfa25da84d5dba39cff300150c551569cdbeb6cb85806d32aa2f3fee58d02cc781a0fdd5fde0d1a1d0d5f63dd7e58d0dfc755fd5fde535745df2d3fda3ccb2a62ab0c8718f25d1e65a940393e18fd12beed07dbfe88940a41ac605712f2e1dbe3bcc0abb1caf667f1fb880bb094d7a7f8fdca68531c66e5d6a0de65531da614ddaf3aee0f0985bbe264dd8459cb99601a32fd2b32c76008db8baac15dca280d78cc06e9e698e18fba8437ddc11c6bee4b4da4ea0441d05550b57c70418a0db055ec7b65992e8a5556b518343c77078ba5c164847c188f02b293603c52e63703c5544c6a85bcf89455319dca70bd7132952ff00af8990746bc4aa5b57c152855c11bcdd31a9791832356de0abb8f6af708b5467a205d531e85917d07d31f4a5919ccb2725a9c3512b3bb8d8281cf2e7d4186f6d5415410709ea3b4ddc2192630407e29dc3e9b87d18a0737f80cb3aad4a9ab5736b2b34383bc4402cc8e0e7f383e6511a57585bf5dfce20455c70bd562acdfa255a975e857f10229bb6d1cfcd3fb60145efe7fb3fa8804bcaacfef9f46204a4e2e8f83567e882808c611def1ff844e45a31e05f5af4661795a1c2f5e5ad7ee0500c99178c9e1fdc223afdcfc39fd26db2f16ebc2ff487b6833e2f8c63d0cc031a132d95ff004fdcab12cb35c1792eebdb99a038cbc17e17479732f54a5ba7ddcfed852a85651aa2cbb76d92aa615b16d9c7f40cc36a6463263dbfd8cb8308d95aa7bbab8801c14f1331ace6f64c3b916f05673eb6f98832c9b57e73eb6f96022182bbe39fc7ee59c2a515d9cb3ebf71a255065ebe7d7ee30d9d97baafda1f9838b07ef558c7935ee5013634192b17fc1e6586d6b683d57fd11b2db0d34f8dfc510a49b2563b961a07386b1de4fcb16e2a9574b77fe9fb8bedc507aebd6a5ab725cbcb4cc3394a26d47364438669456255b0b039de2156cd079cbd12cc812029a98a0a66586dc759b584506afe48d48c4cb6ada4ac1e25b4cad5c59e817e4f05ee20a130abea0e2da6e8f50580f5b6e0c855b4f8e288360283f70c2bc9a1815579e0cf312c13efc4b8d140d1f2ee055adf6798835759dd1a834b68e9dc294ebc542957ca589a676587d35b39cc6c3f72b741b61101c9f78aedc0fda632a6e1f563a597b047a27fb142780a1e60c45a980de2ff00648e39c2217fd333f019698fcc56afd1d3158a9baa6aec84bf314e21f1f48dd28f993478ccc2ada2be3f89954db8e4f9cfed9a5b5f2acdfa77fa4b14958e7f853f44b1409b0b457bb8bd8bbb00b1f34efdb0b0f36d359b7f93f114bb1bc57fd79f4468aef14670f167e899ac81ce58319ac5fd899b1c3438e3c60f8cc145d033c81ffafdc4aac1810afcd71ee1b87974673c7397e712f2f3e4fc59bf50bba05c5839629ac1f1996790860787e35fb8aac00f481eff00b73139325ba7dbc3db98b6db18cd5b837c79635be15436e7972dd4481b2d36d7c9fa228347a1a07f1f932cadddb037566ad8795d0abe3aa3f441caf67755cbebf2c4d851c9561596fd5dbe6062f60d0f1cdbda7ee62cd2b81ce4cfcd73db12d4d55de2f0efb4bf965ada5d75b66fafcb2f24050f3c3beebf70109a0150baaf3d97f79a02a65ddd3fad1e628eda5060e0c31eb47995ba6d9571c63f51467ec30671f9fd4bad0874f0de7fee0907d9f8cfe36f98d5b71ab6522c8580170319841317aee6c5e88944c4a35869a30471d37db1b0306efc4c661bc98e658183efb94aa22c711a6d8bdfbe08395e63778606b27f51852b98a94daa0ba78e7e22ec423766c3c5c00c8b501c98398bb2fbc001a14335cf861442e5222a84d918c0ed4a378afe2248ac9cc46de07fb882e40c9f3325673f985de35ccb69fa311ce317d914a0060bab607657888653dc5e020db34826483697ac5c15bc8f3cead97d2bb878ba7998cd21f5c4fa4289c87a3160260e0c36b4a6ad4c58724cff00dca942030ded9e634a5f3e7536fa12d1b1a658edca6abea35f56ec5d9a7ac4baeeb7cd750a18e1ebfbd1e58b718d95b1f57bf6e23749ae387f26fd1888cd37fcfbebd10d3144abff005c1ed896d9b66d5fb1dfb712b2b694ed3c3cfea2b6239a09f85f3e8c4000bd5783c7fd10bb0dd58e8375e1f0421420949abf9ad7a26760aac955ff0047ee34b85537e1fd7b6d9e072e75bba72fbc2145ece2fdf1667d0c4b44361bbaabe31af466146480be35e7c7ee513a5651c0f3e3f7281740b56be7c7b731628b298296b6e65ca2142dfc3b7f5365451ada9eacfd420b0258355d29cfe60185ff004457969fcdbfcf70e48ba3268e75e3f701a1ace6f2159e7abb7cc5b447245d572fafdcb74015b79ed67afdb2b7824babe2bf75fb94b4b21b07f875fb8a32a1e1bae73f2fbce8a0a1b2f4e7d9fb86c29578e47f2347981a5d565f8c63c9a3cc0d02dd07dbefc1061432600f8c7bd7a995089e5e4dff00dfa8ddab950b65dde6ff00980e0de34d66ccfe3f70057675187063a8972b15015c4a3368a72c1832e2822d60c17576472df96b50f807536526a6c772348ea62ba3383896bbb31a2080d17ae18101bcda152f81b048e986e6b38af7cc2c0b2b1393f30be22aa5d4b5df0cf4771eb9324c6ab0571af1a976460e7d316ca93da228d19cb8d7732045a3779625a79bb65ae8135ee385b7c95a8ef8dc72802f87896e502c705e3833178bf88d98fd4a128853771e0ad300a17cd3e233e4c17953d4f1f473f5c57d25a9c0f9a48dba2aaa2aaba00636fb658ca54686215ed946457b968d5df8c408fd0fa3df7ebb34fa109acc7b2df85c6815ceae6ed95c071973f9cea5955553055df9afe589e3943b3f9405875a2afe2cfd1366efc314fe21e86b74183c83fb6587158577e7cfb710506b78beff0097d1888d002f40e7e3cbe0c4cb60a7378fd7e88fb129b28bf5fa206aa1cef547f1f19982d75c184fe07e6659116df21e5344f2f276f34fee1b0278cdabc51cfe04335bd632e8e0b35ea122382deabe0c7ed2e85021cd0cfebf72d1000b3fd5d7b7300dd7885f1bbde3e59639b1aedf61cafc4a88e24370f5fd239031f70eff00f59aa99250d97aaf2f10959628a6c01cd761f962b982780dd1fd3f70586833c00de7d73e6228b45ed2e8f35d6df31ae69580e0e6fcd6df31100588ab8bc37bebf70b088e29cd566df57f79958532f019cfafcb15a450553c51cf9dbdc08d64abd64ac7e3f7392032e6b87e4d1e6700a195db3fcf041528d5946be3dea0b0037464df3f9dbe201c95e57f3fb6560720ed8f3fcbe61a421da5a9c38cde2252833412e6d56472f1ee21bba51c26238018665a2828e6116b9277df88d53913906614b4755529abae3a1864b7cee02d577ea0ad70a4c77ea2f6d530a40f2e68886d258f9d44c6198ca2f2e1202b239392088d5a00a7918535b141a61a8e12f8a4cb44a177c302b792a0e3dc5bc1ad981a2e1966695dfc0c2c5320e0ee1b0b53e996872eee5e86e8f865640be0dcaac59771237c4eea1a74fc30b06af332cccaff0013006fd798e9384f4d5126c3fc0662e39e9a37dd61ad30a30fde3b3d4b5a4c8fba81d3c836bcb316d15ba39a61cb5f1f5b849e1f3f895d83d97f40cc26ac2b0af974a59cf2ef3000298e547b8acd5a7bbf8e7e62ba4cde33cfb797c129d8f6baabe14d7a22a5b032ba71f83db9858a6aae839fefdb1c03a1c15dff00af89a3b3d5e7ab36f8311e04e2bfeb1fa2616ae4c1e3c789f355acd55febd118d2c03a715febe652cd9f4fd6bf71857673a2bdf8f7b885adde5f2774fee2cc0b3e5a78bcfe91363d14ebe4fd436d456c1e4f5f816cc0b0776ff43ded95742482a9463cba588021af05ab6a7f2cbc8caabac1e2f3fa1158b9469b17c0983d12adb551f623a19b0e735b2f7da6de081bf45e1f90eba4534b13cde19f9afcb1908e76b10acd79ae7cc14c5f6cf0e73eb6f994374596a0dc37f1f965d052e478ace7d7ee6872659375b67bafcb06087cdc959cfadbdb29a616e5e2bfadbe63a0552d61e2b3f8fdca356dd6e96abf75fb8b0617aac25638eb4799643734757fbc47b1470f5feff1105b2960a57c8fdf98616a169f4e222d62ef134a7944141a38872ae06aa35c35ec4819741028a4363ce7516d602c7e200dd9975c2df2e6174ba4ad724aaf20f12c280793958705bfbfc4ab76ec309922e85b9aac75032d2f34f12ab6abb29978c461a44a42efd6e2fa4036580deca94c65ac5851a431c7150308bf2de595a22271296b606fcd6ee25551aa82d1cec86a87ec7822bc068884c5db8194629dbe60124a6871cc310bd57114eb9d446086cc92d38d71b81830571f6999c683954310cff590bff1293c3017b09f1365d978a89b38375e7ac456aa97782ea140a42f0c8df6c5592ee862a6f7fe097b7f1b04fecde8c886ff00c16dc96b017db7a9b51b701dfdff006c4b60e2a9547fb9832aa377a7a53f44c93601fe9c0fccb4c47eebc83fb62286d7bd3fdbe7516c299d777fdc2c30b3fd35fa25bbaddacd078c6bd101703a39d24665e57c6ff5f199902b8e068b7ebf711cb694f543f8fda389fc538e51c079731f2d64805b1dd3fb60a8d8a4f2df90dfcb10d0d21458cdaecbfe229633df349f263e198ec5d0f59ef3af9cca29b2a12fd9c42200f5a1ae69dfb65e5d8065ca35bb5cfeb0ab0557abaffabee159714de4636573d101c698ef43f839ed8853335dacdadf24adb128aacd577feb328bfe0d0a2f3f93e654aa6193ae7f1b7cc5e8270dda5179ae4dbe65812a326eecacfe36f996581d641cd797d5dbe659aba068052f19b7f6f9965280585be0bbf4db0868a7cef1a5f5b7ccce855b5b9c33f8dbe62408acbe9e7b35ee0daa578e5c55fe2592996c98c06ee0d8ecb26db8caaf02b1fa203a7820b1cfabb0814700679a9939904807c950585562f3172ecc3497c09532e62876c571c91f5d8dc4a4e0642e382ad9aadc5c94554ce200b0cf3dc00b0d9c7fd9132967973f8fe23db4459f8dbe7dca0cea1b2caf3fc1110a7e7715a0ace120154d867f9e6353f9192a92c3c9921c03c785c6840b4c764c957dd572c3996264bdb0a8708b581b6b2f50116e82973cbc622b5928cdf2cb32349a8a157c9d662a820670d7ea72f9f12e8950dd24ab2c2746eeb1d7cccc5c7a99cedf9a681ff0dd1b4d4427201f0a47269ee50a0692f1920120295f52951e1c7fac0b8e005c32e8bbaae63f5a4cfafcff001fa04638f91166c9327f506f057eeffb664c8d2a79cf4a6fd100bbc7778af6f078330183e171f8e3db11b59df1fd1b7db376805e5cabf6fc4b0484d525d7fb5d13bc2b94c6f86bf44a2eabae382fbad7a3330d9f3a1fe258b08bf57fa22008405ba2a61582ccaebfa8e2d30e0e0f03af6e665c0641aebbc3fb62e8e2f5c9e86fd9c4aca72e4c81f056fd61355e2570af0d6bd1995db2b67d1782c0f9b6039d172ee86789b325de3e7cee018161eb2d7b6adf5881631eef1ff84a4d5b597276fede0992b4aa4f1d3ede0e08add32eca18b28a3af21c3f93e60807e0981f3bbadbe653a11e30aaedfcb0a81043d55179f5b62d360b2adb6aaf35d6d8ab91d605dff21b620381bafef3eb6cc97a0154f2e4bfdb16bb2fcf92fc1b4a578c5f11cdbeb6f99745a14ace5d75dff32af4e8d7b309711456b8b3fa861e5810bcb5c4034b6af12c6ad5e4a83bb3adc2db4c20d6a36b46d83bb2b090b56b39420c04c5cb02e6655cb516b57316ae1dd4aadbfea70c31f372d2b8c3b5286aba828bac9f1020d83a94b4d3662b79f5fc40915be9bb0dfbf713d2858577e3cf98ab010765eb58f109ecb0f31d973a6981f622676f0c541e6d8617593862d957eeafd0c2b9038fcb04df220e6e24696392d96417418cd30b2aab7825eedaaa55b1a0c831d242e36743d4016230c9486836660ca58f8660d5866629c46b2573bed99ce0d2b9985e027fedca3a1d39e1c474b861d484bf1fe0c1c315708bf19966f6af776b9914058c635067269e327cc44cc1f618bb6046e4d09e172a54cd761cf0ea592cc8b894fd4589a03fe3162cfd0c742967c171718dd2e0386fd739f040c1306bbb7af2c305bd6dbaaf69af442a9355765ff2c0fccc54334b82fe438f6c105e1f2b6d7a3979712912e84d10fe7d189928aaf27f86bf44aa0b54069e1eeb5e8cca0aab6c514f8be3f689469a1746106398641bb368e0afd10288fba43e7c7b65e8b43547ee1c7b60e721b55d7b78796628b736518f90d7cb3142aabe17c5e7ddc4c1ac687363e2ccfa189766965f7f8b2c3d103eeaf5caee9a297cdcb7686d6d1579ba3cb2b10dd9d63ca0efdc3b2dba1c9af70297775d3ce9fea3cb02359cd077e0e7b6129be4b338cd5f7cc3015c0cba10bcfa3330a5376a2d0673eb6f965da818516e02acbaeb6f995838b2b0fbbf70966d14d519effb4641605204b299be872c58bcde1fe50274762dcd673fb84202ab4a79bcfed387365572eefd72c2ea8dd96ab1de4fca2a89b32bda3febf7632b85d428dcddd951e4ec315c1956002972e652d1e09a784ac44762c6d755995a6b9f3cc58d0732cbd00d59016a65094fcb07705f35288a8cf3cb1b4851dcb5a14a7ac4b0e16ed89e00749c4a6433183c92bab58b11d47938f0996ce21a1e288193e57882dc45a9719f32c0bee276f66173fb946fb3759638a4c0546fd5416695721e234a88b5d35f78d62f242d82aa46ceb4cb4caae4d77068f393a608ece4753214b4de79dc4a6320eba98b739e1655d7f0c17757cc64b6e267a3799931116adb7b8193f2c2c3aafc4253b2b30f5e2079609713aff199eebf18e3e370040cd228b555332d5d14d57ea56156e2ee1809c0106175737028ab55ddf3dc386e05bfe5053f52b311aa7cfca930fd61528d38efd541ddc59361c297faab966eb65ab8f4a7e889a062b7813fa4156bc983f0bd7b61b806d0675b6b9f6c50033df0f9195f888b644d37c560bafd1314b46cb70579afd1345525dbaa3f83f3320367e0abfc7ed1a9d88e315fd7b60dd08654cd5792ff006ca7166f21547bcfee2a3655b87fbf96207ca5f3f6bfdb0328d66cd0f03fb65546eb9d21af795f894a2afe59f9c5be0c47b4be859c67660f4440ad929407128159954c1660d1477fd9cc42b017a1739d979f66186b75a171f2c5c189a4bcda79d2fe08228232645f82aff1f7890855fe82f90e532f1de05c3c8bfb88004056c6838b33ada142c50c393bfed149a5aad9ef25f876c42972035caf3f76d025821425ede7eedb12a8598a154df1e601745dacda84de7ded96172bddf5767df6c055d85ec6f1793ae595c70f237595bfb4570285effd57f6c78357c512ece73758fe61a0be194a8b1a6b8ea6e14717a95d176d47011b78856b92a590538d1280aec73dcc46c557cc3343a215954ee5bb008840a02c450e97929802a907587dcd935c3cdbc467aa5e6542d2b8c4152d36ef51c597968b3afe7c4b1d1776c2fed8196c668ee9cd571e6082a1c85ebc32e693055a2eb4168b75986d0d7ca9c250d81910c1c86f8c4564a28baac55c754bdafac9101c8b5c66080c8a96249ab38959a08b43294409e4be1b0961ceaeaa017c67dc6ca921586ef2b354d5400208b3930a3042a1b5cd9f1fb616ad0f8de155a87d388cb8ff00fbc24172c50ade388d55384cb0b76883087a757b44964a5cda5df862b45c720510e88c2c6a3bf24ddfa931982d78c18403907eb017938025a73766bdcba963e727e33f1349558ae287f07e637605632155be4bd7b60513be37f8e7db32b7ef6fedfc42b2aceac5fdd6fd12a9811a34fe29fa22d61baaaacd7e878dca1be5605d95e09661eb0602bfaf7b8daca654639d3ff6b1456852e3c792ff006c09caeec53b7e7f734d552746595c0adfab650d6b1685b90df9aef510d981a51611ef6fc41656ed337b1e533e862522055a0d629c150fd7b54b34034c2659c5978631eaf07b6605d36d3743f972be600e01b6bf8bfc4141ad8a4c3c9426fca250e1bc616c2af853ec4a2dbae829e81c1fc4db82e6f1cdde7bdbe214509055fbbb07dd984aa1401db9c9fbc01183465ab7cb972f8252907ef9cf3ed9f51d4d36eeacbfb73ea25052079fba9fdbe22996b6d66ac39fcede88586ec30f6bbaf9dbe20f6574c279bcf8e58354d5d37c8e73fb6368f82d5cd160deda05ee30ba3c571ea2f6bce200151c9b28b3089140fb9030dda554ac52dbcd4181d6ca8d05e60c945904d437c115ce477dc6d50c2066ee540d20ac0b115b16c05e6a0b3214d67f71ba8334ea5a16b0bf31746ba5c5d4441a10bcbb3db1b395a601ba3febc437736d2adece5e625814ad159beeb95fc4b46f75a395251be62f00986eaa2982cd83061ec1c50b8edc155efa96d4dedbe4274617c4a1bddd5e65864aef1145d15d3aa96a555e6f04d584ccb6da2dc5406b4c29516d3d537e6242b2dae37304a75abfa56574d67736ce5b8ade56e678a8ae0bcdff00eb1a9610e72b0127ec11b855fd3b8dbe60790fdc3386f9f27f12d6d4bef44e022d71008b79746d5f11cc8a8abff642dc8d6bc0631bfb5a7cbb8974a38fa97c428561ac4ccc2bd79acfd02f1105a1c9f8c28bba5bf155e7f82670da51a15fbc69b732d6ace6f96bc83fb6596bdd2f363e7cbf12cce33bbb6df8dfa31280d2b6734578b3f447416f14f4f57af49c138da63c434aa756ae2bc97af7b82d25007901fe3db05b9a8cbc7ce7f6cd7036fe1a77ed995a0d62f9f3b797113540e6d7f26ae25c1462eee5dd14a7bf9f2fe20c3787955ebbbffa42c9943376afb77eb50b0921178144000da825de1fd7ed9432de5a62bcd71edcc6be01be5bf2bf983c6c98ba1fdbf8216995b00c9c80ebf2cc670546d2bd3fb536165be1471c770a01542d3917cdd7bf5288a13140d1bcf72f7e702f55fd6d9a145acd32e74bf73e20a894e1c197be3f48ed45ad9acfbe87f44b19cd3969579ce8e5f12c65ab03c959fcf3e2597aeedd687379e876f8981722b016dddfae59404aa3145455e9ef700ade2cb3c545572573c6e569d8a1f69592f6ac3c9b8901a98ac7eff98b4aa438628764c349f26e3a7f35c18be49cc05724de0ef3882db515b65943916bdcb1349668220b0e5fc54a6e96ab67729152b59275468399d9a716e53c4cc55bc3af5e6220143c1860420d359ac30416cacdff00bf69782d35bc18e2faed9a4d8d678b86860d4cce5f2544d2d8d66f503b72874ce6badc2aee8d54b045e062ae0579e08817ce7678851781efbb9c725f9aa952d17628ee2340bd62c3199779bc5df444a6f8616379f867c4acaaa72196af9a8987079235e0b87198fb1c1a974e354b5a182bc4caabac3e03fd596d1c0390dbc112fb2cfb8bb07e9c4aa486cc60bbbe0a4a29b1b58eaaa17f7b9536f22536341bb4acaeb32c7402ef43ad91d96e26dbe7aabb8ebf677f523c999dbd3cd4ef55af6e098f0dcbc61320563a66a8d2291ebfafdcb0d279d7e41d7b6585725d6d7f9f67101082b5e76afdbc68800349586ff0a7e92bf0c74f83c1e0ccb4d96858ba4793afda16cd58af1fbc1f396356300dd8cfe750235b314b0d5f3fb629f252d6f6e2fbed2b2ab2de5321cf9f6e216072a26ecf3cfe932084aa717ed9db140bcdb58af93f315696a093235e9cc594d12aa1bbafdfad4b586b2c0851692945bee688f66a5a98fb5b3bf1fcb15e39bc155e569cfcb96050500f17559bfee12c9b74637c7b79e895105bcaa3e41e75151682a78e8790fcb2806b80b5fb4baf5072b05b5d859d6ffa224aa25b2193a6a5165caca62b9f16c018b4215618cf17ed28cdb8e165e735fdf445da54cdddfcfabdbe2051165daf964e3b7c4bcc02302f59cbdf2c040b78b6719dbeecaa205b972ceed3ae58d1455425695be62de11766976218c9ab2631e76c20014b7cb8ea2279018a6aa34085efdfcd44ac824c6fee1c174e204445bc225a2d2e39214d5cb287815bd4540e77b3339d5ade346b1a98ac1ae25120a428655d9229eea60d6616dbd7103171ba98b436bdbc4e454175965696a9ac6afdf1f960dbb462a3530e0c3c6d7bbe664de3728429716976f632f51aef4072e14578954876a2a9404c0f96a6d082dde7383afb4ca5503431920e40e7cee50db06b99565c38c116b38ae7b2058739e3750ca81c2c752f865fbc31507ce239cac3b79942ce064e2258de7f550a763e7a8018a4b836dcf00234e052fdf7fc4e71abe95fd244ac317e329ee61f50a02cb780cb02ade2f5752e7999a94b4b2eb9e38660d5f2d0e081cd2d95053cd4b42ab5c4077920c4cb5f416d43e2066b0421184d1d7eb88a509757adacc0345afbff006a23658335a79cebdb2aea5bf0fabdfb82d155a62edbafdfc620a52ca4047e94fd131745baa5847bfe06621b2c71aa3af1fb8176b54745fc5e3f699bc940b0e97debdb2b85ab9b5fc9fdb2dbc00601933ce7f6cb368362bc9e439f6c0216b94be1db5bfd446d8db6ed6fc69e351c332e0daf1aff00c823796867300c2e6ceacfdbe35061283c3ecf2f826059b7296afa38ad11258138376fd33ee2c09a13a5f21fdc2c7b2f756ad6f3f88d2d63ae75d781fbb1a96336bb555efbbda555b737f2efaf1e230fb8b33f87838ed8e6c4a517f81f1a8d20d25d9e1c7ac41a0488991eff003985ab50bb707c3c10b815c14529d6ed9f7481318ddaf1dce0898d9b7d8d5edf1020382855e73f39623140617af9fdb30463745a169e6f839981c342db6bce4f0e7dc08a35b58952852abb9755b821ce7380a5e2a01c39d26eefafe65af033ac540ab52311aaae7c426497dd40b5304db78182630f8970c62f980719384ce614e0adf2db144aaf288b36a6c8a4e5441694d61cb04b2204e5215b478dc2cb716addf697414b3796259a96a9a171393cd0d7eff71d33d96512d6167b5563c1d4cc607017069686983c3143311a868aae98148805b46e78be0dd4d502d1ce313406ae4d4512aaf74d4dae6baf2c782c6b61ac40173c3cb12e2268d53bc544c25f386e5302ba77ad4c4d06ea9e4b8e46dcf104a69a3f7cca4470f8abccbc02280e750b0d14bddcbd28b54bbbfbfcc72be0ff00b2111c8327833fc42696abf6d72c0ea11d4c54afbb564ec5e548757a8d8dbf3abea597c2cdb8f3a8c059a0ac3f316c7036b016170cb0cd3a61bf2156d831aae62b8d87df1ccd113e9ef5f333fa1f9666a1a8a0dea20c5144009ae0dd536fd7b669cbcd3f61cbe585adbbb34b957edfc449c0dad8f3d17fa104e274d81f18d7a22297e28749eba3f32a161557c57f57f765b60940ad5d57abfdb1b6c6f6a1b4f35fcb13110a4da58f9cff0032cd81afd9ce378e5c4c5a94beb361f95f882119255d85ae69bf462642eedbdfa29bf4406861778bc787f0452e12dd5a7e2164494a432791ab8b1adeb00e431a229585aac76067882320f39ab3b2f5ed8004e319a579a77bda28518ae1cb7bf9fd10170f436f1fd3ee89a4b5cb21c0ed0ef961298b93bb7f5dba25d8ad9a765dbe038220608538c9eb79fe612240c2cbbdba782611585e6e5fa9be28096d966f9e0ce4880d077757fc2eb89a4456b53037879cdb2ee82cece079f5b7b67e60d0d3e38e7cc6d017708c0673051d8d09c0cf37034a01541a437512105ccb171c233819b2b6d7cca914529aaa8aabcd6b188b548a73728627e260c9eb72e861614ab57899bef3cca45528e614a0b45d92d18c0d5d648e14607072c6e2818718dee2c057557e20671eab53ee5951e69d16727889036cea14501bc0019786b300defe650734dd9e520cf04a9d1f3d939036b57289cd7262584d698a848d6ef7e096148b4dc0ad83be69da348461b8156d8b34f926215b620f1f07a966c349402075690bd354bcda436f4baeea3914e4e75036f0de208a955e234df966af9e2589415933b95d29061b9f0d732c58a0e388db39bdcad0171a9434e166b07fe45c38a4e8679558327d0e9ccce15d9510dac2b3873c2c321c050318c672c37ba1ed14430a35fcce480b485b71781aa855b3db784f103bdacb797a94959871dccbaacd67894a0e0fbc0bb9a03e61a48fcade123a0b8ae17e1eb8530c1929a31ce652a94336073e69fdb05429c2f576ebfd6a61762db977e1adfa23543b419c55793f44552b45137e8f07e653345533a57145e8fcc551b68a70d579cebdb997b010bbdd7afed9d39abbc3f9efe58036336d61ff00dc168b36c1c3e7cca193ca38f26371829c401bb069e5f48e4a16f3e7ac1f8265dbcaf6fc7074421b18045ed2f7d4a6e503d95f1fd4035556065d7ecb9598b86d4a6bb783f7118ca2d294dedae3db1558a5d00867de5f6cd415107c9c37f98dd9de32ca79b4c5f1d1163451bc30c58fc080b51b19280cb69bada844a59ce016f2639629f6b697c464a5aa8ace0d0b30683577e3c932b054e4587bb9d856e215034db9b457ea2141bd0d50fa5df8ed8c22da34d97e1eff0098816899a719c1e53f2cb181a26bfbecfdccd514814e9c09b95b660d92bb2b8d8c4a20558e33ef73352b59af11bc99b5509c6a14ad0a0ba198458d53112bc46d8b32366f246aac2535a83809cd3054d9d0638a6c54ce236c4199643392ae538057998a874a6098dbb19a2abb8a6a956c69c441c39dd750b986f01cbe3529652daf37db005942b679c517c40310009e4a841590e91bcc0d371df733ada45c12c4b31c563d4ce1ac5a14d5352e3698c815f12dc8e588b0e56a9a31c66149b38c6d06d56aa6445acd17a3244c82e0c2b750c42ae9ac5cc2355cf04c8b0c5ebab94042ae8ee177794ace62c85a9c62258dd541a436d89fcc003aa2dbf5308a642978fc5f042acdd272f24309bbd7cb97d0fd182a0d189d5d44ae33677c4260550b0dbccf2b0724b0140739b17cc0a321fb9857a640604366380699baaabbd38815a51660620cb78fc1352f1457187cc6a4b39e3a96bd43624d5f78c3254f868ee16a6ba6f11d449743347f6fe225a870ab76c769bf440f2c4bfcd6bd26177801a3fe83c6e3b51b00640c3d5dff0029788b196802fdfed960934b88557b7ed9543726c9cd3b2f7ed97a17aa1a5b7e7cfbd42948e4b0cbaf1cbf88176d9cbcd7e5f4626bba6d4fb7adfa2266bb102ff18fd12c3d5967f43a1e08455e8a416eff0083c1017d4a0aa87f5280080316ca782e185492dbc8806c1c0d190fd7cb30b14db819e4fe4c7f0ba88166155e3968e0fcb3219adbb77cb75cbcf44b0a6ba0f3d3b75034fc970268fb17f2c585c20a0e5de7db2d145d9055adbce36dc11fa9c554ad16260555c52ad2c2ccf1ec95b95b6f166665a02c0f55ef8796566d0b2d8a9c73f620da05606816d1c4156d7c863de13f89795702986623e5cea2f300a30c2fda705803d1258760e6242d694443ad41b6a8f53143163a03b6a7a83519164e63585592e5ec420ad30cd4c95ea2e4d8540c1965453654b7c6665bb2c99896868bcdbaf11002acf3b60c09716280e43baee327b55c210b9f11cab01a2a146387f82214ab43c38cc1500064e573474b128deaf351c28b90df132c00728b42202f06c4e1ebe5181e21be2bd6a6802ab3016a3673598578546e1cddb84025b762f8a1af898c0f43372c950fbd5c737cab84a941a106b172965c8cd6e1c8573b32d7c4c593fd226dd72317326295b6bf728b3051b78d4a7678ef77d4388d9a39fe3cb0ee5fce9256d7b08e9fa3bfab0a116748ed295f5122f9aa164208a17d82c181d0cc4b66b978e788fa742ff711b05e2d7d5414fa2f2bcf45441dbb0aaae6549566afb33b862b6335fa595577a62e1bc729f1b0a73657e4b11e34a95dd2b77050013684c9495bbc9d3dfa3110517261feb1c7826216341b555f18d7adc30d122d2b143ef5fb9535c64e2bc97af6c1101b4380d9f7fdb2ea323c11ac17cedf2c428294c5eebdedfc466e9001546cf354b5f68509d1aec14fcbfa88586b0575eb1bf442f3305acb8be1afd10fb700ba7e6b5e888edac9b11fc0f598a50141b3a7d78fdcbb80a59540783c5cbac6d14ecbadc5312b00124e8b7f1ee009780a01aed9fdc51b15f0d9eeddbe61756bd0f9990c8e545a1a30fe1062dd4b2f066b1f97b9714862ef28539f2fc10ed748c81c1d741a3b86a5dfcb4628fb5ca090c21581008f028d31845bcba2a0a64a5d759e8963bad2b8cfae2080c8abee554528ce2b859daff32b0daa6d6fbc70ff0011c0282c5adb764b0467aceafcd316497ee4308d2e8dd71316ed9872cb0e916692cea08e0b78cc5643401776ca184cf311dd3110e54aa8ed5782ed881ad2f3dc2dc239dc0494c9eee292a5de4d4c434551aea03782fbdcc941a2f1162d069324b4bc17cf0cd8115c6b1cc4bbca542271572ae98c35cca2d791e1551324aba07728ad14e6ee6a63cba8522f7b6ed96d968e00bdc0800c720736ed951170ee19105d36ff0032908d0aa74f710bc25bac395f7552d5456c868eea0731697c089e17fc84a46b35cf443853abf6c2f585d305510d97dbdca54af3c201f694a29b2fc532ba667075c45c225be21587b6605f2e7d5730a51441fbc556ef8beedc54cecda78e7e3dcabf9bec66f7a8e9984094afedf78169485f0a9c16d6a52ee0045b871dbe999160ad65e4f352c369a31e65d282c06b98c8caef028e7d7105b8d46739500300004a45adff004b85462db6dcf9e0265040b384072c01cd2d6e1ccb30331d866448d6b2adab1acf92559bb78acb396f0e1eb1da7e899cf2aa058adc78f466256c4a382bfd3f6c2856fb60d7cebdb99ac568381ba39cfed80345a32959b7c5fe59742cb6ecdeb9c6e66d4338ad8ff28ad70378acb7e31b0ea72aa6c4f39c6abf04f1b28470d1a31af44a0cae985429f3c37c105dec000715e31afdcc15c16ace71d7ee2c914c36bdbd75fb87975035878f1f3028d86143955adb2cb4bdf9f1d587f6c1c15429b0f9ed797103b62ac2abacab619afe582eb9b6a821972f9fd111335038d567141c7e5b9585ba0b2cf9179f2c3ac1b7db4f810c0454038aa6b2d18abf10942e2d67138d50d2866a6e561831aea094a1de4b655a040db6255414ec27e5b6aab30657709577d658d0a8d8b8b0dab354ab7fdcbc014a36dc605a68aa870b519d7af6cb9741c2a622cb91b78c302f01b8b3364abe273ae496e4f34ca972ca717d4c2d311112d43d699746aa671a12162b84bb66052c063c0e23b22ce34db2c178cb8439057e261c990c428820634475caf45cc6d6e8e87d2665259d34659f884c76bb2d68442a729555cdb70634edefa8c85b557ae6bbb96b5566eb9a81344bdc3533bffc543c8739bf0b1d68a6a2f282834556c2aea5ea6aaa7e339f752fa3179e759802ad4cdf68b05c265605c0d342f78a85129c38b7571e43620162ea016b759f0dba8e98cc5850c12de3ce209a278f1ea5aa86b898f785d0930c67e0be625e69a6b9f57f2c43b0b6b2e1b8bad3e0471157be3b4ce46a8d8af89b28642d073a216c32ef332b6694a0e4f7c4af1547e1f785ab72d745fdc145a81560acf994a5ad85721d401487e81e2e5dcb1699b1d61842b0662a1abc56fa94c364294d37a84290c16de2cd84cdba2df3058cade41b801a0af5abe9e5f89816163358af18c078dc69680ce8787c7ed950cb59515478bd5f6e605d66cafe73fb659dcb343954e5efdb88f3c4bcdaa6babfd4b6a96a00d9afcfea58d2071dbd6225b2adb451cd7937ea2b5e0c3786f58e3c1041740cbfdd7a3316d6a1597e073f0dc30d289caacbf07ee73da2a8aa4bebaf7029420e0c193561c7ee2d9176b94ccf10d851cb40c517fb888500b7eebc9edc4bb180dd1dbdbcc3b4ceb672665e2081b5bbe8c4a5d72294b78abcf7e6349314380a6c9e78e88e5d00364a692b61c76ccf85a45de322f9e599858354d98c7f33059a50e7f3a9901a39b0f8e62d17065bc42d8e86c53640b40ec39cdc163adbc6697b650b37805e712d09197dbe2023960223ca7a731a62b80e219c9a62c584599ba715c5c14859a33502c5d9e5b859ce2a86568f3ce659709882293872401748d2e9e704aa90321b81ba5bc26589734a36af3102940261cb051d5158be7b81b52ab382a02e42d5c730b7a2b943b2025fb256ddefec8c554906d079c5f1131853e66635cccf3638c420ed67b7cc45ca2b79e5e19480ddcdc5757a72677012c540a2f88a9e2b93a9436e15502c2be5f3e312f66cc5bf909c90a9a818bb6f7e21b15853aae66b76c04f83efb85ac596b1bbf33054411e353dbf13154b0abdc1419cd19aa85179d51707094c61ee251a2ccb744032325c42dece86bb8a4705a146339b7e208760cb32c71f696d725760b8c533710744bb04ca181ae2e51bf1dc4d8f80719f23702ca2dabbb0f551097b422d86ce54da5f105486b546882f6a1652c39c288e73a253e54e601c2bbe6de9f31d59a2e2b41dba7c10518b68d9900e8c1730e2182ddd2e68bacd7f696abc1c753251295b3397c770b2a9a2ace69f0efa87211e812ff07ee23f27580cd97af6c0a40796aaf1e0efdb1b15aabef5e1dfb711b5aad54726b6bfdb1045c3084ecf07bfd411415e017fadfa2200ab714e70f8ff00a954f07196af1c7e885884284c3419d3fd11506f175b30978af07e65e2afd157febb678d045d535ae2fce58e0baa2e8e3c96e215ab000a7ca9b969b016a0190f4b3e47165e7ce7f2712c76c79525ef1ff48d852d6d5cac56ab019a0bfd76c36ac9f396f5e9fd43455c8e5625d1878e8e58680d836dc4edcd63b8b30bc18cde03e180d8320c17555cf9e58a6c8e7cdf8731186e9554b09176e5ea24b9c644cdc6a199461446a78359aa44fb7cc2d6c0abbfc9086039b4ca5974e5f96bf31138a03e1d4128ca3693390772a75c31b6b042a51552dd31931a975b10b28655ad87a2ee136dcf2d46aadc100171528c7772ed5a352aea0a371da3bdca6088065a2fcc403026f808acaaa70764f101c960b6f6c025864c83f5058814fa89b0c20404c4aa14ddec711baaa0965bafb3385562f0d4402d6f1797dc6cb2ab2df8719e236b0a1b5dce40d946b8885de1731b8b44a61a12ec46e56cc64cbcd45a35fe3956d7b2012edce3392262969e1c5f12957ecbdea5d4176ca3442c598e9ad52d0d41e70b8177501f06aa86b5512ce405e3355174ac3c2d906d51dba2a180e59e271b05b48bc155d5a3c398ae0d629a88a19be2cc518816b722bc7fbdc1d71fb637722db43ff0980b1c20875cc792a01d5d57640a50b38c097e608d55222205e7c510b62215a3164716457c5393b399ae503d5db37332b32bb5f1528673b0347ae0667add1933559c436dcbe4e559b02a5b8f2071efc4c94b4bc160ee31f5166f8e2a0acf14ef7f1172dba613158e277ba74e07398ad94ac9edce7f6ce70daccd8d62c3fb65a72558e95fd93ce256d1ca1cddfbd5fe8830566318a53d6fd1896a51557cb5cf2d746251c7559bc60e1afd114b57dc1f1e3d11647428f158d35af89825250744e715a7f310ab577c51c6335fb8af2aa850e12f9ce0f6e65576c138e1d2ff006e6650a784d979b2658501d634a5c40698de56efcfce218851e066de97bafb4b5a6db737ecb1ec4f1e23451c5c0f83f8fdc2bb84e9d833ff00b11ca1131d2f66b060e08e8167694b3780e3f6c39f7626b29e5ee6d5b0d1945a8e746ad898518c18957483cc0d488c9c1ccca30327cf0f994d0555d69a7881bcda2e359a99112c05e19ab8a24b6532deb388222f92947e18ab470533140bc4b9988b5686cb830960e45dcc0badb102ab578731a3561ca596468e4a9df11a2e828fbca49ba943701c7d1c42021881592e8f988072943b20a725335cc4ab66e07490b51d9a9a21705569a885975cd55e63c4b6d6ea547712bc783c32c6ab738aa82298295e2d8f1504154543dc14a59296810e06b6f9ee5aa52b109e4de8dcb8cae8d72131659e2096301a4c7047d4ac30e43a3cc54c6d550b1f3510532d3f32f16b41fbea1a65df9313cac41c3d710760be9865b318abb7d4a2f38d54d8d584ae7587703d0f096176340e2a05fc18d47743039d9980ba45575715354f357646e2cdd772cb349f812c81b8d7cc108dc14addeee27268cd78f8b99b42044107c14882940e10b5899babd4ba63401b178210cac8e0a404add6c5258e80899614dd0ceea3b10ec6f255c011699c02975f682eeadba357ca107294681e2a33de2e12ab4f3ee1562d1dbd7c6a5022023695af57fb622a84f41f27f36528785d6deeb1fc25f316d8a5a9fdfad400de07e6dc18dfa3134b6f1bab5e14fd45399861b0dbc35fa2282e98deb0f18fd101007978ff00a3c199790a00e1a744e58107a51d17afdc4d895c9e2be78f6e65055aef8c0f39d7b66a95d2de1f92ff006c4604191d62de5befb62b95f5b4a39b0ba4cd4a4b55767d6ff896e851ef86bbbd3f10ca6f0de262e68e69e42e63aabd234115db6038e873a3cfde342c17054b41f6bcf44575a1da14db1afd1c4f0a879b396aefe582151950bf7e48d02b8041d6788e402dd72091a62bbb57445b0ba4175a5ef31266df861e55e209009fa1ab976478a719c4ba33d595fe20dd10f37ff910dd05d2aec84bc2e5defcca3216941c1a1d5cb3978d6f04b1add4c6a0bfbd475b3c050226b631c1159c658357132b96d965a56a5988c480e188d0f968254524aef0c946341e636c5e79e226b00ca59852535ce3c44a0547f88f0c057e66efa8a425a6f2a84b6dd991e486652d965ad4dac2b77dc78e59777ccd96d870f99801046b9bed945d0e1eee20a4065cc4dcc60386e2852f871178bae8e38cf1e4811578a18334b2329a2e593a5dd557a880dd5edaa88d253cf7c4a968e3a4148029dd65f32d8a5a4e7a7134cb93e601e59f8f8cc7815f386a25171c1147c580dff10cb54051fd40337043bbddcc0556775baaefed099629dc6f210107b95fe4cae1e0114493d5e18daad5fac6732ed1f984ad6b51020c2c689630478c33ee0d41cd6306a126627986996e68b6ab1f137424e0bb37e20662d439014cee5d583937574b2a158d96654ea3bee3cf6cb5d2184bafb1ee2d3652c5d843805d191576f65bf9713330760cb6bac77fa8ba4ab54395bd51f81825cba39ce4cdf166eba2671515678f1866bc11686c166a81e0ebd19896d9e021557f7af8ccd0d2aba28f075fb8982602d2b41fd7ee1301656678d41031830740efc7ce65165a8f635da5ebdb0500703435e76fda38349aff00de77ed814d601103baced7db33c8b48341942db980d9003273e833e8c45b68c92de8a332f74ae6a6514d8473655f9d873dc4542aeed57b35fdc2aad888575d15fc10ac84c02160ea9bfb3cb329120acb9e5b1b6b7d1295973cf1559a2f88eced0253a75c2c6819692c6addc69e8e2e3a1651c8357de263b378443f726c2c0cbcb70b3b1af15a9c879196a52c18deef98120178b4a965715987315b1ce7c5ce4e89769617037daf2ff0470ac9833556e053f697bd2b35b229cd35bed884da23588ad6ea20a559528bdb1c5c472d547ea0502ae0c73290626d2b9224007f72d4a12b920c14e3822361abb82bba29c4c006e600b1b3226298426550acfdca8cb98670c4420b06ee9f1a21bf32ff003728aca8b59fbf98584514c1de41670c4d5fcc3c14ecf3317455e7db2d643d7b857739419c70372989586af700eb5d5867dcb028d4e2efd30b0060ec80ec3fa12ee8139562ab35dc2802564bbee50cb0235627398a012b998ba65d5dee2146a98ddb56e92f90aa5f1a6e5aa5a349f1ae372afe1fe4abf03082f150906cf1b600a15c9f12b92607366724590022db9241068da62c1f899a5ddae66086810babf2c634801c18afdc5b9d82d39cf9f31dc038d1edc5e7dc55a685c8281b6eac62680d0aac0392a60b22d49f1f98f7e00de161bd86b33a0d329c3cc2cbacb159c781fdaca7a368f24f5b7e2185928c9caf9adfa20b970b04f0570d7e8948e7803c7758d7a3332c90154e28f2e3d1994225b9bcaabf1fb6046f3800a296dcf1fb8056a9a56859fc4a14f095915e74f9730e55406eb251f3295a359b00f6e61ba6f76586fe7f6c6292c359bbf2defdb896b4c8451ddd72f7ed8fe9740ef82cec4a71ead79ffb7a311225a86ec7dacfd4595c9df88001db968c24bb29aab3c3543f8952291911347fe730a555128b6b2f17da65e88b5321842cbc14e1e884632c79332790e5e659c1b7240be1e6206bfb214416e768c23d2006ec5429aab46cc5fbb6058605d81c3ac6660c1add9f7ea5ed657b7285000c0231abab6bbb9b555cb764c2392d4c5398ddb65540cec8da505397a8b3101d712a688e2eb0fcc2b01dd45e953aa3907925061b8f1a3d46caa78cc5436e594780b8e9fc4a70623f5629c2f532ec2f860a3c3a6c2a647466eee63a07a87dc8a65980a4ddb989281bb7100f24b6c75c405efb3ae603df0025c2acbcfa94045da0d54468b9769733031a6ccba12b5159824a5a6eddca619268d62175a73a960001b6f30b2830aa578e22263d69938d5c3506b9ba6e253cb194611461ca9bcd67c7a8363cf2d950bb65b576f330aaddd653371411795c1aa22040d94f1751775d1a5b70148269871e60ee05e3b80665099285b4b8e2b31015d7fa59668f26f8b3f56c6c4b55ce6fe2e1f35cc302a00e362be06122a5114335acc1a701a5c7297e22e8136a37c42076a52a72dcc94baefdcaaad72166710005aa339b6a0ec06ecaddeb4c285ada29ced97c015e857a3cf9885b9ca8dd3ad5cc80ac9bb318a84ccaab4f2627bd8dc245167061df34e86514444aab0feaa1714e158c5fc9fa20ab011db83c31fa27631db381d78beb6c3438c856078abafdc094033b557caea0872d1e2ab3284480aa782151056ecae3997528d93747b3a7cb0b691a680bdd83fb60669517cf272f7ed81c606445bb32e7db10ca5ab9d236ebcbe25539b4d5aabc1719480ea1db7f21e255ac0adb6f41202077cf14758e3c4669db8bfbc721b2ef342eefcbcf4422c94250f3783fa10b6279715b68e8c1c100770b8a28327bed7986e0bd00bc9c73df5296ca1a9715e2b9a71dc6b0c2807f38e660b1b2c5dd5c0661bb3c1f1000b1530468588f0f72d12642b063e0252b065c3982c5ec31785f8c40bbcd49678e59c0167c5460d81c9799828eff002c2fcb03176bc396a54069765eb2c74885618e1ea6f69c5d9596e24c81c1d598815846e0ea055820377db84bad5634b160b72c052b697fe02bad3b94cde815515af812ca652a8b6dee02d09cd9ac42d404ad935fa8b4ac7b6177d2a5a9c128816d31a66a0caefba88108be4636ee3c0cb9d4a57262ec6596b517db460984abe37112b6e2e6791935430e81909f202ae5124cdcb90ade0ad1c8f0e204aad815ab398257155744b96b8b6cdd73714a0477cfe25c55e6a92f7e1899165e0dd5a532fe48602aabf88a8b3c9d541074f142711139c2cbb85990b051d31480bbf88e40b178e63559541fbcc0f170bb6b651c45c774b9ed6e3f331d801512b390e20ea28559bf3973060f4b1403571291127341532f52969116db8647bd0cf88a680de363e25b0e0dd7571d6c17d60f39ba95312b52853a7a8518dad383e4c3ee34c75c81abe5651faa46a031749e2bde899830528b6e177205a4bb5eaebf010ca70023780e9a31e8854b1c89d1fa7ee51030a45214f79c5fde50aec8216a2ecfedccaea6534aec3b47bed974a4a01a60bef3d76c253305e4a59949bb60dbe2ff0071a071d94b7377ff006cb9a95944e5d5b06f592c2e73cfb9864e06b2f1f9fd4a68a511fb77cfea3470aecb52e3ad7045ab1cea9cdb8319f8850d659b167c75e912eef38952db96db7755ebfd59a92ecde80e7fb454e8c1c957bcd730a6a1477678460a0980097961f17a26401307acb25375b51b854ba1ad346996e4631ca66ebcdc3fcc068166ceff0073a85867888ac8362eab1a804ac01b78dee73aab5833411045d992d9214c96f16bfbb8a2c15763d8d4514575dd12cb34ede26a6398c506f1dd5ca52a8c629eb8a8b6a4ec51447106d7a36f0c46c14e4eb1eea3658a00e8ac0e8217a0b6b98038d6999fcc310aa7116f3894b8efeaea0dd5a299e60d9f2c02b0fcb999d2d601788b9a1bb4bcb049e4f93b974cb61cfb94dd454c7dd598955415ca2a56cb7e2fa94aaa68f2f316393ccaa2f375d5426de7cddf3cc368a9f3e698081357aa3e185b572185c8c5abbc4429d2606d0e775ad17f93d40501d15c038f2b8aec2afd102ee00af4f31543672ef88db055b82e8fccbc41070eafc4ced0d1a7292ed2b59eb71c86b7cf9ea50ca6b618dc55980e8cdc5380763d4c00f4f999a1332de20a120174ce7fea1316db6d0d675cfb85dc2b27476abf7881a34a759fea586b5a599b8a94a38f7b8f1450b42e33328a3d5d02de23ba2b32a5fdc5238c2d5bac3c42130712d8c6b8b5fdd7981a16b42c354e8352aa1e8abeb503d0082a0a2e5d79db032015582ad3535c50e46f35f13c5145b050fad7ee1153a977581fc7bdc299c82ca57ce75edcc48aa0ab068f97ed9c8b4b69e5e5bfdb1caa17b26ddda7f7109032e33f2dfee1b0698160e5add47562aec02db1cc5692f185d6775f69b968a14397d65864ad06af8aaaece88a14068ac2f86b7ea2cc51016dab3a3e2037b4d2996d397d4442cae5db0aa783e02e574303eb82b1abea1043cd5d7c4a0b474358d3421fa84dca0553a3f61f96602c5874d6357fb80a59c879ecbfdf8846cc8022aa5a07358f128431586e81fc0fdd9c42285432fa3303606557afb4b33597a2bc44fabb96039efa8312ba653e481b68d6222d85abc581c3b9ad5029c71e673ab5094ee0f16ca71014042acb29494b88304af0d0e2d3311ec15f3d12d4b99bf18e233a0f94192c094e0f3a882edf4bf3e21b8aba1fbf11f64b7c7d332f0ca8fd4d91e168e0ed8c0100086f6f2b97e177c4a90c9b37550202280f54ca82df8b8d8b39b8407116efd4346eb2b38d7a970f5763d40249613a5c020ab0e7b7132b750550aae70b2f60be5aac7cc1b1d9d2ddcad03b1db88c4102180abc54ab65b782300d74c936f2d281af0473d4a401cb9769c8cc934522dd8f515e01eeae506682dcaf3e2040aa375f6985a8f34efd4cac36300df1059b1663ff0066108ae83732ac8b7767e09de579f6c5ac96fb2b1f12ca265afe88d68aadd6c7880cb34d2ed7fdc11f3a3a8fee39f35946116c8df39f712833dd8a45b36694a2e5b8b701f688aae35c3f9872f416e3da4c8ac1a16ca870a7976a940aaeb5b17bc6a5c95706ca3d1a8caa5c920a1a5a8de072ccce76ebfaa2614335c2d9fdc030103f876688661053a2f0f3607e66e8e0b14553de7f6c4222f1760dadf277ed8d5e06b4b979a77ed8a55009d58bedb7ccab32259f22f9ee208326b4873d471008ad8b9f236fe238a0a74b1f05f7330f03a7ac6e5d4534283aff005e251b1c6286afbfea64553089a4dabdbd13b6c8c4ab15c435915e043cae898e97565299cf1ff66225d8c7440367728b02d842bec5d74e89b494cf67812fdd040720ac5bfa8858d3250fb0179f3e63401438bc50eeade7b48d36a661baefc070412dc85a61eb5280e5a058d28b212bc31d974598f10409457331d9787172f031774694e30f5dc294054b69c3e25a528a57bb6d8f1356f0086ad0bc632fc5c4c05e9d2732d583a85396dfdff7295736592e8145f0ebcca89484d197b266ee869bb7920a1a3cb1b05f7d5b0d1b165ba8bdf12d6137620be2a27f8219a62d4062a02fb45f832e6af012e0c03ed1362bf854a80d9a4bba8b30aea37b533881774aa3b5f804a840c379805e7a070c48a4568d567ccc81e0657a8d43237d0f04a801bc9886c03db52da037a5cf39712f0a3774112ad5b02d08df6bc133b26c4adbdd5ca36a26e10b4abbced87a4b9c632f66a2dd97616d83379e978b830075bc1cbc4b4234d8297ef50350297a6dc5ed898aab8256cffc972e8a1af2984cb6a9446a23969ac17a8d80d0ee02a08e2b9b22dd250033f3f8d46309841c23d177ea161cff007aea350b13186f5e90540374b8cb5e6a5addd659cde73988d9873742ef3cc0063579ddc2872a192391daeef7571d583a13c0bc457288b1c5d6bdf9854560ba5191fcc06252e4174e5fccb10d15c4188058255317cca6aa1bc2d3ee07a255362c01d7f6011280d5380c1e73fb63568a6cbaa51758bdfb65b02da3b2aafda7da034a2f0e55fbfd407427606df19a857779ce0cb5fb60d745a039750e0b28c5b5c32f46ec1bc9f358489c4842f360f15cfa20b40d341c2a18763187438b6aebf7300f442aa21ac5d2d4489e2dbe2efd451b301e818cb07b63e24edbb1b7361e7b731aad08670e032aff0032c38154f0368eb3dc3166cbe7bdb7bf996ca364abc6f9aff6899105bc25ebaaebc4b8f20439cafc7116d0d4156855fafdc4ed06c52a6c5fea0540281c0a35039181a98396e2eea05396033be7abbb8c196ecbbbb8ee47169c9d26b1c4569d5b6ea36042d5c1c3ede2534429bb5b38a8559722c74c66fad425c5d62bccc5568ef54c06b6c1a2e84fe788d0a89bcd6e372d0ab1c92938f24fbc0528d05bfccc282a5aa6b573cf08245fc41a988ec688c244cfd77133ab37aaee64238bdd665176bc11b40837f1023218ddddcb52eee5c52a50456beb9960292d5c65b419245a0f763572b21816175e312ea915e57e33059458a531533587e1e662376516d1f733ed8d2e314372f20a8c4e19a5259b1d30bdbdf1136fbb596a787fb800068b605fd972ada80ba6b93e65a2e9d19f1012c8ade305c56ec18bff00ba8503e5bd7b80800abf0b25844a3c9391c0509e6a161825d598b9b5d3d60f33258aaeb9ba82eb0559a6d77c11b45c874fc4edaeeb9eff00996be4c38dc05de12b214682e4bc27f72d5945b199605383530b62a8a12a2828be0152bcc4db2b560aa2a0f44325a73015cb386c6937a6258057caf921b8212b8b3634f8ccb3b604082fe261761835910fd5d454373cb439e9c7b60b80597679aebbf6c4b7c59bb1aff5e20e19d98ab60f157fa82e72a6530beb9fd4bf2dab070a7afe312834185140781250dd833973bf1029702978f3ea55565a38c144a00b2cbe3a5e352911630204dea0b40b8ae07c71043b62d197be74ee26268d2356e10683db105d6903b4c5da5bee8ab59dfe4e622d7416d0c0c4104a02cce8bf3d7e58a2aa44977464e79f319ae19baaaaae5fdca8181b6cabed88a324a9455656bf2704b791413393ab2ff043487f3ae711dfbf37931512cd1bf0472c8d193589896f103740d99c5e21f2dc19258c0a0727570b0b7942d99e27c87cfc905724d6a9a3d11ecdd73ed1db02d08b450b2e0aef3d5ed5626459d608e140783799759307506528af3024d2b45cdd5a09f9ea52868593bb838a213987026253a8fd5b04a0f0aae6051bbbfc414a39cf995ebf1cc30ae01704cac3bc32e6ea1151b6a1c582f85e23c069ce4c425ac034732e612ec6f05ee505c8d61cb069155ba69e1221b01337cb083c1d1073929cf186a6816cc1759fea0b85d1bedf116994ef99445495a5c44b461ce8aa3061258cd4aba480b795d5d40028f39fe6585b43473f300342f12b5bae04ce2055b01cff00dce32ab584a208101a327572c501e46b5150ba538ee06700b79c302d38186d8733a55817490f31aa7c778cf38874f27150202959b77e8818d0bc18beb3105af17eae0a85a2b25b60b6836e62a5445ae0b82728e214b63746d6bc6e144731b579479cdc29b60d8a714d5350e74b422950714cddd94f70c1d7a2f35da575eda0aa35fa944f6c19b7effce201585ab57871fe84a8852e35f8c6df0620b4e69cddbd7fd112ec1a553c3d63f51c06c0dbf715fa97d02a8ca0b3d79f045cbaa2973384f371e60b04345f10d611f58d374bb960d1659c4201d0918d70f150152cc1588ad466a101b557b37390e7db1db04ab65a3c3972bcc3452c38465789a2c784bb0e3fa8a800bbb0abb7451fa8050366694ae372cc6c23b13106b13f356ffd471b0602d906f3dc3aa6f4748f0f2cd92e0163a226d6423464f37340705d3b6285bb1814296f4b37904ecf13853c94a531ab83765956cbc1c0000af3728f03cb77e3cc69d956dacd33c66639610b2ad98f64544a6e80befcb04a825bae9d5c05c514e2af8f1700c0fbb81b85d5a220b47c13272ab99a55d3ce372b931632733db51b5783f1100d41f57418a5c64811179d3dccab3d63d54f26357ccb5571bb667437cc202737f47422addec5759c42f0ec0b6372cd191c798885361da7a8aaaca3058f5716aeaad35e2b918f49b16bf9fe615467195a7f0911a2c1d31599456b0856f5dff10aa2d7778e203b4df37028e0337adc2ca52cbc4534d14a9beafcc76aca96185d9b52d0315c31b01610143c2402ace34bdc08a4b580c6586851a2060ede22db029549b109cebb43c7c44e076d8757e60ba23ae4f861f72fd92ec050d8ab4f2fc433b83ece08061196737996568590aa62e020c3c8be6b98adcbcb0fa986141859afdccef6ab69d31b122058a72d90054610a2ae56b41aae9a851bba3779b838c1792805b004e0975817407def31c84c30375979f1fb97964b6363fef6c00662ac812f8e4b7f11525b195fe31bf44abcd681b723c087e88de8dd558bae8c7e8972841d227e3c7a23d7485277fd7a8042e5105acbf1f12d7960c18f9aac448b19aabab3dd443a1b5bc3ce3823b47274e69d90ac44bb2e9765c043800bab97cf20b711d01cdada966ea115655f364e4ce53ce256334c67bf8940d9ddb3144ee75e1cbdbf825c396bb345738b4fc410151cf2bdfcfea0f20d22f15ea669aa6c941d1e623950c01b30e7be23594aed7e743cf96058ec5686df04b1100b36f2541d459f2865b4bf104b0dc1c81a1c98daab4a7557752f3060629585aba880d4568efe626d69e324b50036cd1515ae3c7d0206181cf528e8a2b1cfde1b5c99355f782c1923154c56f0550585c4ab3700ac75c1312a630bcdc4b42cbfba0ea1114d0f98d8c31564a89c8236cd29c4358ff0ee711b4e4d56331b6a4593cca1806b41df33632f108b372ead95f4f8957961df1d4d1206c0db10f0c0f0c06496726e59be50ee5ac6b976a4306e21528d709f8979b66f00164b1b495cc703158fce2a200e42795f32d27613791973a076ec84a18b5679c62997ab19a18086728eed630764caf2460c2c27b370164a2c8a0c3c8e4b37ea0aa9d1b41d404936d1996e05978310a16c9c0665da8e3561713670f3788a0dae7f0679d9298929abfc50900d807db19c7cc0576c2b555cd7518bd05ef3996a52a9daae5ead3a282f67701337d03880516fbb68b88a945837eecdc2c81722a5101ae13193cca6bd9dbc91f564a1a0a2fb65d725d1b198950f346ff32e49797bcfa7f6c7555a06318e0632aaaa73fc5ae7c1325d0097930f0d697a330a0b80602ca0febd1982b4a00ab0ff00cf8cc04760c2a53f0350528aca8e11ade09b37be51307cea37096d87f3a98ab12b99df372ece37c0210e792584da365aba3ddd401286838cf18338c9dc05aedb5ad2f051849a0b1422f0e072fea0bd17672ec5e7e31010b540bf52e81a41e037bb0b5dcd8373ec9ed098040ab6d17ebf306974552346e82d5787cc142c752696dac6bdca8adb9ac8be12cfcb05c30356157eaff106eb02c6da34452eec0d3757515d9a677453eb5055722a2035515386f05ba994ba670f2d906c365e1e7ef05aa08e18992ed63df1cda39a628df3537fa11426081aef364bc066b76ee052b013c152a1bcbd99c4545d7aebdd44196024145553bcdef2541a0ddbf188966ee138134e209682506d085bd3cc21e63f56a69c4b88c3bb8d4b71aa950bc9316771a20d08da9cc15c80af372ae7eefd04847e6ea5d5d1dddad4556a1f28f05047052473501d2c7703636c63822b1b8eb168a52d531cae1b2aab22d1070b92aeeffa65b83761a2c6ddd94d155169c78c5466c5b9175728781cd8dc1a5af3317bc9ae2019114acbaba49f371c3f6440ac1170b36381226436c047745d4b478181a11b98de6f92b9497bc1a75772d3001696928a750c5dacb280aadd342f2e09cd034861eb7fa8c5492c29c95c7e21a58db4be6033d1b4b56099df276fcc2e81854af78b75666257951aa0a8e55675c5751bc86cbc6f882b8d7dda6e3126605e32b38b66154701542c462d96a01ae60bd26c7b7c770bb2e72b6aaf263e09426f230384e9ff004cc6126dc6c52f7d7c662ee89ac9554765dd1f98de1cc500aa5eef432c550e6cb37df52a80943d8dd751d019974ef3df5334dd58a63fbd46a350d1c7f43284b55e7c9d72fe65020a20b7752821b26a6f4b6dcc2954b1b7b30ef6b51d286b48e5f58a57c18968766b1516b2dd8b1c7c7ea0a82be762bc73299669642f96fc9d472ca5a8b75cb308b32c1efe711df0c840fa445687a6498a28ac6857b7f0ed84ba737719652e17416d2aefae2635149681e65998605dc1c0ab1cd45e18b965e3c690014c0bcb752e01b5a1a9c4336d9617e068c643646d39b9b308abedbbaa9424427b180a86b91ce624a9338e58045334f3fb82d451971710dd07f3530ae3555fcc06addb541b2cc52fb85bd77296da2660895016af84b0113ea445ad389901745665f2c7f8442d8657c9076ac778e2374056083392ddc7e8006aef7cc0b60df26bdb15e53e7fee170678df4fc41b15c6fd4b5c9a379b96934509032b8a4b453177965b871e382fc45a58da187de21a75ae0dca3a0bf6f731d366b79e79a95e2e4c38955caf351a65855378b6182ca63d45d366398d919268380977907bc36d7f12ac52369f3dcbbe76e2988a9108d26fed10575a349f3320a0f2e6be2080f935783ccc0e0467e668868cf5711b506d5ebb7ed06e10e4d8295d1dc1b7ba38e33ea0b2aabadc629a52ff00a081c0536ad22bc32a57000a6cc072454d0b17933f63898f266ad36d4be51ea3868ef15644e80e6f5f151065f22b6072d45a32937a86d92f0032f35ff53772141955b70fbf44bbb459e9df551c00d5adff006ebf729061b7ca9e73a1edccb4b6385d98afbe8f3b89bb0d9903d376ebf70165872b67ed7fb660c656261c79be22f7a39a318e5cc5a2cb72268f9a3e5970151647fafe5801084e96ebc7f3009768532aeaeb371c741fb186f061d9cc1a460b79517c76fac40128c85755dff044bb725d619515471be0f31bc172ab1497444856e955fbb21582bd6d6630ea0706f055f664310c69d5282a60620db5c569d718cc6512c15d2676fbe0e08856838e2eb1678895852f1adebe630d40053984357efaf8963918de79661c8546806ccf8a980055306e680b830a7104b56fc0d54c8516d65bcc3723388ab5f4bb85fc867306174d1ac58906166fb7a8d729a836300d622829469c8d6e5d72a4af45fe3b620d36756cbcb1550835649a1d099b072f714b572cd9d7d07e8c08d316f4dc52f1a0ff00c2772a65018f72c1c158e25a0c07de18145bcb3096c65d56e35ab1997460e5a2c820c60e62740bde639852ace5ccd9c6b7c95c51104721d789474c987b4860b32c38b98680bb52adf12f00ace18b31884463b5bf12d3f19bc4a08d25bc5f2c2d56067231412c626b00494606e0b2b5b20a62b0dd44e28c368f211bc83e338f37160947570417566a15285c6c773a83778730c1a316f8b8727f62ddca4991380040dc50138ffca828ad99fc6e2b604f0e2c31fc4a28bb250836d76d867ef08cd5587931858996b665192a5c022e2daa8b0dd7a6cf500d0b1aa337ee142a9ee1bc9cec3cf35135eaa2f39977181684c514aad71ff512a345a805556ade275007c000ca7f70c45a17e7dd5f3e58aca16159631779bf2b14d0721e1e36fda5215b6dae6cf68759b06d2b227fbb88ba51d9775c62e166d7191fe3c5fb96f219756d9e8fe599065abad2d87615e0d8de8ea24788c4dede0a9579a8a15561c9b59945561815cf4d7e89dfa607bd510a2aeeb2748d9652cb6b7281519a6a8df714390811fbb99c02d1c6ed62a0288c82db015a1828f7db1bacae6ececc1b8b5745daf35fcb1819996ef86a0e1b8acb5d4a06ec70e023d56c4e6f513355cea3b0c0a55b1ccb502eb38f116ee65b9cc32d836b55cc22a2bc8959bf10a64e0697e86c23d40d156c0e83390eea695c7662ce3e204b4bce2db8ef6636cb37cd5970faaa3c772833c306826c818aa98b8f45688e4f5140b314cb557bdccee964a3ea20478b6511e0b10fc31d8e99554a5c0db2ab7640d21cf894bd3f4a820a6842e605a191b7a527669ba288b0805e1e6a33c336aaf57d4cf0105bf0234245bb5516b0c64eb41acc50a1d614e66db29ae8f34c24ed2b8ba17dc668acdabcfc12da37a60bc6732c09822cda3009b7889b3fe8bab255ab4c640a6595c132d87dfdc100730b5d11a05d8ac767b8b4aa51e15869af3c54aa282385aef97a8a0b3131295361c19dff00128c366d3709aad36e7ceaa04a0d069f04b2eeb357cabfeb01445a78a97cec63af886eff006b652a4585301517628f2665aff0629b265f107980ad3a298c4ac06c002ca9492976a79af045ac0b52bfc9626a7b3319349c1e36ca1523164b078a30131ca0f20c298e6e089cd2e9cfcf9afb41a8bb06f02ff6fd4a4aaad3c2b75dbe7884ab519222fb6f6cd9050f2efbf2f983436161b45b7f7084a2816a78deeedb8a946366428efb86808e0b1dfcf31406c5065a79ee21259a55cc400a6f9b85060bc779cff0128c4b639739f8f44b9a63454a1d1a4b6a020e68cd1af311487c8db99b11a55560ae4ddcc5b328892015b9d58af3d334a23629a6daeb3c7886e6838e5f879fd45418018b705ae899a8a8ad2eba658085154e6ed332e6d579b580084c4012a71bcd4555dddeee0d6259788aba2aeaaf88d160bc57fa4b0eabbcebcc325a60dc57273dc3662e27033050bb09f3f1ee6143a662a0dae2aa571547d2c4a4c4a6f877772f096b3ac906935b62da968b8025069cb8fa05d8352812927884a84ef70c94e60014b836a23f4d8798585870e2042557af100b50b78d4b30d073598ea520d6616d63f413a88b29471c8c6cd8eb93dcc19005e59f700062cd408156a2d0e2f8eaa549581bbf3b8695566b45f38a9ac0b64c5d3d4518065aa6a56cb0aab82168295403a828aab0b056e8dea0b6ac69e6e2562dd92fb688e1600006717b94c52c5397566b52b698cd70bbfe65a97e1e66de5bc09dcc54e700bbf78c4a29976130216e3edf7807b2c1aab8dd6696a5c2c5b9646c06e52821ca5226e8e256b762dd9608b82ad537e9807f77bdcc0597b4c73106701673995668d8b6b2d4c9202a8d6bccb00536e783c90a700ac67177e731f89636ad804052e85dc6df0c102aecabb77750c25966ef155c97fb8ab85aaa387ae1f9614b5a7a2a38c50e6fcb008b1ab5b7c29b7c42ac6cb5b3c0f7ea6017b226c68c6df11283405976be1edf1c402c016a0d87f6c536c8aa7fed6ff44003b2d01516cfdc57dcb556b8fb195864ab1c3b079398805b7833b2f8fd413d408289fca58a86e14eb7da6d2178c28d9c78078ccd8c068ad7b0e26e2754e2d96b115434376be08e83c2cf6e3895169609a5fc7ea2c7680d26512290528f1570160afbc35ea0624101e82afbb2c1f70ca837c7e5e65935b4bac4196ec703fcc10f3a580d3374628a294be399934d5c169ad9d412f308c927dae5bd87f7a2e294414d1c40c656ead15f6e6b2511dad6b4599afa5b8656fda2e58e1fd215142f2b16ea2607e34312052deafc3166aeaad6260c19cf13551a6eee739b980a07ccd8cbd4be102ab6684ddb04a04135066559ab94152fcb1fa2aaf71763bc44c0f26b8aa8d16151b825677280e3d606e54af7f4da0734c0cdb64052eb59750a6cbeec8ca742ba183ff2552eca054fbe2561cb0baac4bd942f1587ef2a1b6c92ea0b24caf8a661a5386de53a82cb69b071bccb32ad0514b7e5dee2d85b17779e23132a2dcb639f35981a2046f262af517b0064e4ac2931b32d5b430caa4a7667128a97469a74ba208ba8bc68284982b681a570c282c846556bdaeae5015429706bdc1a22818cc29d06582dad7ae204b0c8cf0be1f989721868cb7d3ee1901728560581746250e2715b495438034add4b2a951baa8520acd6ded859436234de911a81515ac5f3ccc50e786631a339322bde755cbc4692f6b1c52de43f9596d4ad38be47aadc022adcabc6b35cdf0400f6e2c393c63f5295576ffd5d7a4cb63000aac5f147ea36e8673b3f21fa206466cadbef5fa80a0a840778f8e7c10c94b03baa7abfe086ce0ce4beff008f5333578287e4fd4ab6cd1403558600d04b5d502dc2f1f1194d8a4f2738c6065328bc626da460db87e636da98cd1f78dad40bae04b14f1a55de8cad479be2b25dddc720ea9ac688dac4da4c3d6d9d788d07078973952aeb8cc3655c7154db00dcdb19bc7c4660072f5c7ee31a267c6bdc6569a1e22a83f51e02255cbd9951850808bad63e667608e9d37cc118801ba8ca2c1bab77194796e0ea07496c5d9817c157716c1a94780be48341473b6da7e186600b0db4601b32578e2fba83b7176f96296a56eae36f18388155d5db8a6e344c56229ce1bdcc8a730c0a6c8af2ca591ac3695ec4b2653136fa1b262ce35ce9a8945f5df27b8e8a5d678839d3c330d99369b872e2be84e23aa852aac73ed972a72a309302cad71e23556b78ad1534d5080a5665e5cd2d61bcdb6c469bb40ec8b567f0a4bae28bc38a84d95da5969f151a06ccb97172cab29d3c5c0ad8f3f0f118f0f7731d2d8a64980b1b68b2adf986f6a1ec79f10ed85a14d217c435475ed956d37c43a589575eb3001a502ad83370a1b5b0e628af2d632a6266a18b738088699b0a6f95c56229c1d1e888126458c3e602cd66f2a7112a552d1cc554d529b2ba9859694cf2c7a76bc45b42aa69377dcdf0cb71875c10d801a452db2bf32f6d0ad6f98408995d0378f3bfd115e4112b0fabdc33250e6bfd3f820f0ca2d21f2eafc665906e045bb78c7078dcb9e8a38f9c68f102e2078c7dc7078958065d5987f9f10b2b0c59700e9388fae348bb743d4a01162ac80504c0a7192af3ce7513d003254e1950651252b398cc57266eabb6b046e40868744dd2a68768bb12f3d8e60adb86d5751b5861c1ea3800097554e6b988848de35a8b14702358c7c41990045a715c54d668caf86daf11d62da56f7b82eb69c64c4c900b719c64e659cd9c15171163ae4c054362074b0e650051946a582bc5c114b7480b53081b73ca3a04c702f0c3925436698e6550c2d80ddc019633c54cda651956da2aefe63405851f88e60c68b148070361aabdb31556a8ceae0b0ada5c181e083764e59b09645b8ca0e660254202b709befa8173053f51652b6189a2f287da6415de0aee1964f7e596134c2ff047e8c7c620225e1d7ec6081056bc130ec5c199b8403f5eea6d1651137e8ff31a2768323f04d42f298a62683254bb65da594016fcc4a5158a06e0a88dd5197c90ac8d0ef7e2d820554af25b99fa86b2557f770b6082a625323452ff0050b7afabca0669634dae02636a5a93dcb2819be74af710a5b5d12c2e72314f2c51a50392e3b4bc2b6d408d8e058a2158af345d38db711c01dbc6efe4c4ab6b5cdab94900a55de6bf8dcd4829d10c145e2fcc1a22f05bb2ba88683806f51ae8e2b75e218d95661a3f1021e857a2b3d4b084c14769e19754df72f569835689a31bf06882a095e683db5cfa89ad4a1bc14aa0f07e66e015ab582f1f1ed8794a0c0c07ebf6cac3262dae4b23e0f3b65ad30615147e5fb47b5aed76d6587d12e44365568d56e162761b6b47ea55556d4d9aaaaef8cca0b041a74227e079624d3b501de2db778b9812a1558761cdeea3115c984a1e6bf997d8f0fbc4a2364a1ebd406176f1a5aa8d095595f14750ac94dde9a78c732d6861aea8aee37602c2cac1f132a99566a00e6a97615f788bf76696a0ea64a8c39b7ccbf96d6ae6a8cb877f7961a3545e0339e26b170dddcb0d9714f284840f862c70d374cba0597a6b0771a4c851c4bcb6071c670c770a5c63a8edccabf9fa5c65c5b8974095f03b81146ddd5531451fde21b36acd9001f05696a5c34530b316f399846ef2c7736b01483ca46db141c5d2c146d2f6973374ace2e172aee56752d86ee60a2f88af68a711b19919370523eac04f0ae60dd016979962b90e7c22d6add620e232e2eee781afa9803865cf7e48f1295511ce42c85406d35c373c0a150c6e8df017c3ee2d0c56ad916c666c1b0e196201472d0948a0e0cf12ac8a03b8d100af08d352f628ec7f46ee168c07255fda36a0a764683825c1a7394d430554ebfa8c5bc09f011c979256efc6624038942570df8808a02dd1fee20286cd2de4f24a09bc2ffec940350a0c2259b5c0cbc31ca29a6e8c53ed812ad0a2e5adc323bc6721fa8a284ec4db9ccac852601a3787e2240c76365deb12f9f62340ed7ca810ad674e434659825b8a58b06845e16aa5168251495f16cb791b4e0bac8ca8094a22a4fb71ff0044c796c96503d6825804ab58a567f528b4795ed5f9e7cc058a39c7f62fee3180eeedc0f39fdb3340e5818e303fb96aa8501453e65ddd46747cd392fb6043c607e99706b9b4ab19f8110588883b57a317ee56a2eb55758ef937135e0c868d86c96b9538b7fb97aedda9eb32e4cb7b370176014c969d404ddd0bdd3839fb54b8e70c6df150b8ad2ecf0c4d1176e2ee156b865aefdc48a082f1746b9a84a9c669b0fde60b9480666c5b061e51e42b9c06065534a9715b74731b572ea889145bac4a174101793bcd4d3654bf3710161d39cc13514cb02ab35b6554ff00495997dee95af11a52e87e4ea25e8186a3b942fe208eac993a21a0bb6b14405506af571eed6e8c0cb95e739828330541757246d957d328eb2b72ad2d8b99803960cd01f7320056731af703417506efe3ea6fcb886e0ddc68a58f6ba4221b6dccc62ca596501c2bea25400bdf9f316aba02ce981567b016e02f09cb9228b479abac24a719acbce235b2558af3052d810bb6aa6f0e8bbcb6305786f9b1610198d99ae0f11b2d91ce1fb4b1c3694de6a5a174b50ab2675afd314133dd057c6347c42438a00c58dc4442ae4b7c8ad32c9036c68b5b0288b8b53c8ad302da9d2da6917064da137132d80c5842d454981255750e6def5c4bba5a1c0befc43b6cf00a082791d5f64a87422e9bcccd5e2a189759f8941b719c84367029bc86a1744c200bcffdc2cc6b3f205c754dbc789a1383b8156fc516ba5f2de1f980b0a01cb15eaff729e914da2309ec65f332b7a1be4bfb943d3584451edbc300005b5d17d9e7b752c34568b4b84e479f715b29a5468abcddf31b763272c5f98b8b72595783bcefdca3481a44f1ccb1ed69479828b7640a50ac6002be2db61024bce15fadb122089699b2215acdb6f0d7a834eb1c39beca8216db4d18a09d9d80f82004511a374f7528016e6df70d122583025c0ad9be5f351ab92849ba33c46e28a79dc409055bf7538c006fa2a6685a276b880456974163729af01ed81e8ec8b7bd9b636750e38890177b7d7b8605f0e6f32c8190458d9491bb6e15b86cc5bb82c172a8592d739ac7300ba033c45562bf10cdc641c4f05149e582eabd688288527a21595385910c242a018b7997508b1bb1594c29712deb86739283c54b1b8528ac44fa3cf351d096dc1170f15dcb591b75172562d2bcc61afa731dab03f2cc6fb70701fcc42abc951049ab650ba8d4749c5fe88821bd4536cb69656485617b85e45c3f8f70c33571444296adf016ff00329d51e5a21370efd241518de46230e7363f2150d88a540d89508a878e60292bda406952bc7558161f6ba6b36e0589b597402dafc401a940b5a7cfa81bd83d5d54a50d0ce0c1f9850a2c690dfc4ce532e9fee52db7b765b2f660102ef35b628bbc706aedbe3d4a1b58a16dc62f700562a50dcdc5940ad3cfc930bb39e2e001a0e737e131501edfd5ca2b17badcb0173280a7dbaf3f64cc0c6ef86f907f6cc47b06d7afdb11569741a636c2b968dc1167d5959793f820cc16c725df9c67d430aad8c8fe5e97c18975b034b5b71cc4ee551ce7a0ca45720176f75cc6d564dbcebf6f88ac661b3066018b22bc2a1e1775da4746d6fbccaa598179cb01b5d15a2ca835882b7097677394793c4346f31871301576809975582bdf96380383bc25c68a1633cfdbc42ba86d69b18c7f32e43576b4acf30a060976608c14e4a2b9a94da5e5db6a6ea5fa030de4e335082e5c30306066284cd886ca6cf3502ba5426700cba45d72932b5f353bccb34513079fcac0c738d5b59614409c0a4e771d720d51a8e95cf1ce7d4b8d39a3453077ab6d5ca0b2bf501685b610488815526ae3878bab806fc4b8e8c2e9b6a02f152ea06a56aa5cc46d8d820c5be88116fe81483005536398980cf9d400a525636c5d65d4a3561728defeaeebc3c33609739c446f20bc5f882252d994c4426ed969ea503555e71b232b8cc4746cf311556ad572f55aedacc2d2b2aac25e4791bbb8903a1c3c626e409bb17a99140bb358267650bc180c7e4833d1f6b8348c621f04671dcbaf256aa9744bb55626b69411c1a8516acc5fbe2390afbad5f981a69d5612a52d398839af110a77f04571b7559f32efa782a6fb856d774b8b79b9800881b1a6bbf989a76b9a7e732d2a08e576c48e21d5176e56ee0dc3cb470792a608014033f64bf296d063898ad6568ab8061265119717d5f9d132da176360f0d7e48d2182bdfcf335ad6dd3dd7fba25904f17fc7fd465b1c633468e307e201dd3ba1a86b406ce4ab0f5fa2094b0aaf7e6ff008862d02f77c775fa940ab23913cdff0050714c59aa1c8df0c5b7135f25b8eb30a6b156d318e9ac7c42a2155299c00567ccd91d134f52adba646ae282ee7ec67311595677d4ea3251c454127ca306f8865b018d67e2fb88ebae33d406ce354a1cb2590214baad6625d0b44102c06005c698d1b14c69585ae1a31dd902515f36772b0fee59865dad1be210693cf506cb06170d3f0c335a378d9331296511ce496b7097d2e2862e5537cbfcff00301d9ba393171e6579e06dea214ec7da1a033860506895d0035122eace7315280418e26ae35d9340e6561bf98d1b751d34c316fca65c2ca8518671896bcfd1146ee500aef2b002852e25b426a0a42ce4a9740e79f33678afadc98cc03c9c34fc4aa2d6ff0099411b2e737e6514ba52bf04b6e4dac4e2176773420d36b52f698ec89ba906d82adce6b89c4dd290e2de615903996740a2bb104b2b412e19a603696fc171a114a717f8b83eb61ee1914a8d6890bde5cfe351b5b671df88f3ec27b5a11b85bb2d0bd42846ed8bd4a5f8946f1dc6d5119c630d50cad52c73efc5c0eb9c7662f8c12c100ec56e8e7ef041ba59546ccd44aa27cf240a961856987dc4cb9d3dc14a782c59584bcdf657106c2255e04b56657b19b76ca1b64bac9f8a256a8f34e5277abfd1297afb3fd9e50b5bd6f3f8fd44c024b6d3e5c544cda070abcea13678bca9cfe8fccb413ce6adfebc4a02887acb7fa84501c018bbefa3c1064c97b68225ba9002db715d424dec62ac7817db0c28fa2d1b5f05622677180a0a0c439aac1e48a986f8a39984292834ff00610184d8f3837f1021b7bcb9f6f8968adcdb58c4243cbcd54a4a35db38811318b866e3055da50fdacd6b6c71586a24418da5d972ad3b72c4a340f8f151cedc03058c098ac5d5d0cbbb68ac30bf047b6285587f32e8db8bd105dc319809b4c556c6ab30d2dd7b212b29673ce7880e050d1ab48d5268e2970b0565c1f328393b9588c4ab02fc45cc61c7c443982edee18ab586ec960069422b0766ae14ba2a565e95e18acde46713c0428c5c140ed8c147515fd040021f71ccad9369cb50399805318603ac6a156dafa11a219cc2dcd16cbac4689c1d302a961f246dc82d3de6fc4273c318c5570c4053177a7080d284534d7994b3b5337288317d4690032bcb282a641b5b11aa2061c21a4a0a15774bcd838d44807158edea38b56850e76e58a37528aed1f2c4a52b168c11c4f2e90357cd45a74368d3b2e1b65979684d5b0bb876ac712aac1931dcb4301ab6770565b79e6eeb764596595e29080e0c40ae4c02d659fec84695be2d983407b2166e735026a39f30881384cb02b8a305744d1b4554bad4ae9069c14dd7011b685d779cf698f88a0dc0e3d2fd6a34d75a2dbe1cfa8382004a8bce39fdc394b74c10abeab479dcc9c581ba507144aa52d16eb1e0ea6f21d0fcba264013f5f9d4a49245945d943c625db5bc4a30397895417d4cd7b7b82d2c98d03e488294d98d8226500addb7f04b6d95185a80029d90053be9287b886d1317f69698c5f0b7a6215dccc8d574b84992520ade3cc53a82ab3106bc2e336ff11161b0cf42e2a605a585751166ae9acd57aa88170beb11379804583019bc151e99a265f0c5b1617b79fbca64003d5c6b810a943e884a14be208d5359e4ba95c330bca338cba959a0c831036db7a3cee635957f71599a3b46ed051fc20b6b69c5b08af2846e2a62d6471320b996365a84cb6df089e05d47d06626c8f72d6fd6f7308a05a9cc0085b4c02d160d2c51632afd4662344a80c3c9bec98295f77c7528edafc5cbc996be222d596d45b2097b98c6d86e98649ce8db146589cae2a557245775b802b5d683f7702adbc550fee2b86fc53eb3015be80629618c61ae34ee0b1c1b2a8d152a97950eae111b00cd717360c860300be878425044aadaf38874d54bb86caaf0ca6aac4f9b7c46e36696695391e6ae170079cd63538ca8504caba22ed5a1cf2e319867eddb1f7a6c8856d1a1d79a8a8280e54ca54cf07c6e720a4d873711901699cddf5982a269d1ba523dee6744a6b90f58cff2c50f165870575d3d46cd1eee90e0e28f1b9acb01a0301ccb03755ab59f170132059b381971fccf481ae706ca5cfcc4b942c17047fdf70a00382ab794201a52e30f3b83a455f592b7503f76f655b74eab6dc71b06129f92e0e0033889663c8b8988bf6362329483e52634112ef80aee5e6015b65bfdc1198168378cc7339ece62d79ec7111bab1ac55e6e29601971d303a6a88360cc4b2055cab6bcc2789e18e4a83d1c7bf305142d71cffec31f40ad9f0ca0b336c3849775540d6255baa8b78b68d4bb0e50d37880a84acb52990b1b39cf995822babe2a656fd2a5b27113e07ee0ad8c5b8e262fdf3b8a2b0a47b95485cc6405a978971eedc1e2a02279e4dcda96bc111c53e59aa1cf32d050c7399610a5c4bf945a6c021959f84e022a86f998a3eaf1b86e9dbcb711cf44dcbf66489ad2df642569b8fd0801736172ee694ed77132e29dcb40adbc7cca2ce4e063f12ae45066ddec62a71760402b75c796f31a1dcac5beb51a5acb45ac00d283cf314595a617ee7051c0e2abd4ac4dc63aeaa2df0d33638f3885b60c6a0259550de357509227de549a8a5f985a2077695bba14aace2ce23b722e0f2775a1f0402298099d1d26b61732cce26028ad1cd1c41b5d9ae3e5018da392e203672380a3d67dc50ed4416eb2fb80d2a840e226f8a2506438732b05524387c4d45936f4677febdb280c87c0fc707e5993780c8068787f6c30c2e96bf1cb30bb1c0e0585ed6286b85f913c7981ae19b122e71f7d1f335aa896cfe4d7b9930336d551de638e10b16a5d5ae65c4196c12d51bd0b3f3860a20d242da146d7128b02bd55c30d69d40a2585a10aaf179b4bb7ef06d5ac374677866241a1b4b865547619ac789432935b37335869781b2fe626896a4d0b0c3b9e1bfd55445735c1040c8b60daa0354556ac821147e63d716a38fbc058367171485c5337cb16e8e09843237c46d46dc060c7b960380731afa36b2b5d4c31c959be6209c6793cc41896b56172c72af72cd89e3cfb8b27357440a3801c41bcea2a056e04bccaf66a1b79098145a89d42678c4719113a66e297a80143fe0b60fbc5c0e0c299506cca6f39c46b3f2c45d6923f4188a378b8179575c31c913665f708140066655e4eae245aef54a0ca9184bbc39398b68d7d92259597accd44bec7999087cdb9856fe99073e611a02002f9c5654354b79ea0047438367ef0b34b8e46838a99e5851e03b846b4bc62790933e66b34647130e91e4cfbfbc2aa55a6a03eb87c929032d38710c31239f198a3202b09653d7a80b735792c5f8814167b506ea61640631e732e5b58722bc200501759b644c7375a886867646022b5a46bccb5882661fc932833b8c0b68b002934f8f6ee26561161c52eabaf2b1ce28edbcd1fcfb63283cde7351b0c82de0bbafdccc0a3913fe9f68a8b05da14bbefdc280f2c9c450d6178cb9658dbdeb64be447dd8d21c542d8928ca2d4a755321b6eef8960b6b774c5b6c3c0ac54aa04709b3d4a837a6f9cc0cf93c1c45e15d5db0050f768d2dc441799a8ba0587b650312919238af128b5851c0ad72b52e9f7cfb8621b7496bc71106d4a3934182c957ce352ef154f960188beae72e87aa8d3cc5922334bbaea52d7bc1602cb80bc5b1fa1327b8228e081ab1716397dc0b8b52518d87ee203a0777301a330202c14dc22269778c4babc16c5769783898809732d4019256af17a89f16316b16822ad1df712a0b3dfd0b7f55509a302b150751aedab85134ae1dc03c07172b743367e842d2e375516e0beef88e3b37952515fbaa81bddb0fc91086a36da0ffa862b8a736b89b2057cdb033e431145b7c5de60c5a1ce0c7398800d5007eedb9928c52c2b641918ecf7c4bd07265170752e87c6a5ac8821e44715188ab5e60d115e9ae215961e7a65e8e49bcfcd7e200c5d003d7731607006fe3f328d1a3e087807d9f3a968aadf3c4c25c85b2a61ce873619bfe21d0d95d332a6bb15de6165560042542ce2b665dfa82ab96388ef37182ac89494e0ce9dc1a2a8b7b7de7f6ea34a6b160617de77ed95c0529b2ae2cda20a72fd9a94ccad912556ec4462b1c3c39c05af9e226a8b5a5273676cc237c011e32c6c9a992b269cd118510a18655750d8ca381506b9c5cb029556ddd4b1457cf1046cc65419bef0683be7dc474152e1c43057b6f71cd9318f5123644af35105906dacd150ba6fce792e64777569129015683a3716ca9a77ef55ee58dde4c5dc04a21596e5aac996ac5a0222ec7a8c29510efa99516faa84c0cc7bd40e31cc0f86d2a05284e73b6a5726518e90fd3c77163046129cd3778250b133e6a537c0c6f1b972ef1bc4cd6837aa8d29482d2b5f6828570d954a3996943e89571c1d24c3b6d2a0299a66e239c47210693998a9717fc1016185e6a3b2bbe7996f12cf12db3767e2788c0dbf43dc666da2b70ce84563c4e6b0eeaf98b24b6d30a6daac21730d90d2375e20a3481a71886c0d992adb95cad85ecb8b44ab6b8dcaa4cd12f277cc2d180142194965895868e4116c05ba5e88f4653bfddc4ab202b3755aaa98115405d287d984962a97c59f798b38435cafa625b9838d5b256ed712d554be96fde0202600e67257a1c4e19ea3567373980bc35fb9a5f9cdb3989685b78c066e582891a61012f56c439acc2696c2d554e3ff0022b20dce6ccc76b23ca053858e5c420e01411ba15f1e7d473239a5aafe7cbf044b905ec53b71f6310a9cc786ede847e888514e14369021258a70f56c0c91a01cd0be2af0f88acaade7071f9f899a28e0da567a3f825d07ef2fa8ae0bc1360d9a5d3309c2f06dee67e14a6b3c410b429aac18802f6a003557dc69019397150689a5af335e5e98ab96252974d7ab58d5d674b2f4b36514eaa25869955c568946f100b578dcc24dcc9c7c4f1af4ef87701e181850d4dc769f858cbf068565b4a02dab2056e9e31049baba638cc5b60710bbe11960e3f35ea3704a0bc5dcf7fab29ddf11614d4a0e97894272472fe7999581b85a566ce6b71098757c453f6cd4b19a5356bb4ea679fcb885566fd317825d1ddee3408de2f315d314e088a50c4de62ff83a603fa25c8d07a81c9af2c1ad59bdc4a7838ee0a771951b84b361c9f31b28aeaae036da7550ab8d5bc7040d12955a6ac713a22da3f862bc5420aab6a18586aec2bc468c3381b39f51584e4c91336eb5d8406c0d75a5978ad1cad4181417f673ee2a32ad9a9758359f33085353abb6eb8256aae94bbb6f172e35be1b9597ab816ec60d3559c5441cc12c1ad32730f0b3428b36aaec6e58e4172999c80a069a1f77ea18cb68a738ea2ab76bcbe73335a2fb3f9826e8c3b36bfeb292db6f5961cee63a14c133b0171a16fba85702c0345695377aaa3f44294b54309df8c7e881679d15ac6b67e882c970b56980f894ad15580a28208e9a01c502a041df66757cb0a86663fd08568e1b3873f821e6058257403a2155169d50ba17301046d440ff00a41bd564bcb73230ecc467037bb48ac2b1dbda2ababa10c68628b0502f0a97d0776e798d222163a6ee054bcca2811435aee25320b368bf695134d1f0ed8011e0181abf371bceb766520ce17554e6928a157b6520fb4253926399b862b1598eca2a76750cc25d20171ab67e21a2573dc16b1491718f7f536ab545528a8daf42504683756d91b32ccab7aeeaad880ba6cb0dcc8cd2a7b951ee14214c42ec60efcc3da550a66dbea5b16417fc4dc19dc017575ccd6913cdc484358b059bfa12f6799d883ed98518e6f98d03a6e156acab71480b8155446471cae08e41e1ab8b5cb7a72300218f3c43703c1f398115914392070263b6e0376054c99be626414074c5c2f42ede0ce8d6ce180cbba71bc54ef66abff2670fa52bba69a8ee44cd48e799435bc05207446f88142d30de1216cd1e4f8660051845ff0038a237d86980ecc4a54a6da6afb94198ec33c92b1718154d713256e905d9dca5c3189a0c2736a628e144d95e3c5f4658ab230c5705e6b1a3c6e02c836142583af04586c70f01f1c6b71b1c59b792015650d4602ed8c95473c90cb4bd37d1fc7b94b0f2a5fec38f706b106805b7a46c546d0af74fe73095351e0d1f8956c8e751042155575877c433119d1aa95b5a6ecf243c6ef18a4812d9cb70a8645f4a315802f1a60b41aae0fdca382933756fde59910064bfe616032206370d8896692978a0264af979bea16b5554554515ec758b8962c5d3e020aa2d2f88ec767895bab6a205a5fb80aca08074dc04b6ddddc28026bed2adacb8d52febb9fcc5d952ddec61f962c2f24111a00bc4b02d2aabc12cb44f3118034d36c59a94325e2d9954dc1a0dee1aa6c1e216162523854c25f98a8a806cb8edb63ff37857103ba78864e39d465751af7d440c980cca4a8da3c90851ddf172a90f8e989c0542555750087032d5b859235e259a1858b60ef1a4d623797e73ac4a865c168e619d7cc685a82c18c06c30192e634a39396e0e64cbceb571c04c69b46e36c4074eaee59b965e2b5136b7f3a250a8a38805608ee020483083932f5f13044fe07df9e259c818e89a952b0174bb856bbe8d0d2d99d08a0cd36dd402a28b3699a78639538be050a48864db18ac030032ac3ac467a0105268f77547be266a400296aa1fd5f7b65b701a31af57af6e60a687672f43a7cb2ec014e16cf67752f4052d4946ab40cecbf31ca559b59c911701740bcc749a9d11dd1ed8e866f80b4b00e98ea736b6ee16d0d4b2b660f35e235196e8f371e863d988f0ea6533290b4abf681c4c1ceff52d402dc7d92cbe857044ccbb34c54b0c570ca165582dbb286aa65c104bcd9847b86e956d818276c8e487642a5b0767c19c2239e710c842ee583518b4b5894e46e018561894028dc50a65788f59fa1062e0e9411c2867994a5bfc2e26a8ebc4c056a70003bf511778d7daa20e37db72ac023a251cf9962ccc1065b45a0a85e4130a861e6311fa547fc289b6311c851289556c56313aeaa06db548f0ba9457d1537b2c8a1516e725b11dbf3a95e54bc93c3571365b7931bb8ed96eedbc8c32efe1bcf516c38efaea0089a7cdca125aa581c5c78a23154d1ea0604be56d7039a75632f5388c635c5789b96ef18a258a171eb0de6b3118b396af08a20c8f3ab94bf18655cd9c3f4501d837988964de96fcc3770857e52d08a58242ac0fdcc3195699a082a25182f3a952011555e09702dbcdae9f328d9763aa8869c672ed87379a65f19f3002a6aeca7ae73fb60c795bc1776774fed85943b69ddf9cb6c74a38e8b4f3cb105833d905d4178e2db30ca86157564773437ce7f994ac523d34e4ba6258cf12f71574aac54e728f69c402dccde4fe63452d9d6172891a2f1cc6d9d885ccaa6abc0c4c096b44a650a7ca29b0a621039bebc47886387351170374f3f994339396add3dcb32e9bac2f10302edbc404f3421b52998ebdb9a589a524f3b221397502a84cbf32cb2fe9425c5d897381d6f128b8d07334af3b95b7d0819344b2ad40d2b21f6992c14a799853c6c88712c4339ba2b8959bcd90588f17f30a9f26bba940a35293095d622e2889c431822e7599a536c0b8c21367fc1ea2a259b76c44d2a5aa730ad2b44021a9b83925297318d865d408a059d5ca96f6217023cb97b960454629aba8d86350184db48609843c2ae34d40cbb962bd16a87149e634776d5950190f27310041ac9ab2e3a55b9dbf37a9614cf77b79a98ab7a6c779d3ea5e65e582f350b85512cd16fa944b811541a8296a53add733002879dddbd7c4432720aeaa2705c3c30cb390ae4312d2600bdeee178dc6ed38cc593b192d5b956a5bd1cc6a5d8f1ecbbaea2574f7d6fe0966d8d540982aeeb9bec8cb1c97bb4e4bdfb7133d1d3393df9fd448e35e7271e60018505e739e2e58d1ca79ce3f1d4c617bc5f130b5974635f351ca30122d15608ef34a9b6b3a0bf11552ef0ad10bb116f772a95a59bdc7344576e32f30a204172a42d5a06c5d4559107b32cad6155714190e8648550e4ca741142765ddb33609ce7b6e36bc34fcc134825e3ac7a8b301b4b4a81cd26813e6510f2f244358d4bbb2ce0a60fb115b757dcb1a8abea10e40b38d912e14a978cc086750e6c9877dc4bca84a78999e1c7d494073a82d60fe711a00e1b99ed9b8eecb5342fd416ebef354039c3cc41a2a72331a8d8b14cb9c0ca7dd80e4b2f791a8bda2c4457d044707f8df10ec5f5057e2e25b562182c23b3a213b94079fa21a43cc693e0ca661a72f59c4b22a783cf501de7880e36c7643765b54f16ddfda2d0015357bb86f77b2c6ad21ba58cc69e6b171176cc11a2ebead858295b2d6ade594a0b69c3d5f8cc78d94e56d6e016b73d1b669cf4de372840a2f1c5c14fd2956f05ebc57e62185bcb2ee33682da6ed521fb256b816d09a2f980ab55bf1758b84a106b0f8b209f90302f66ae8335c660df048b566e1034ab0ac540bc16d9576cb1762cbbbf6f35d6a525d778176fc433a2de8c15d591da94822de0272529cb894109f91e9a712e94a033e21ebd2f01aad8e32c5760a258c7af18e0d47e177c4685606a8414545d96c05d0696bc9514203187f28b48305e0aa85102859abb264ad316e3fa80006055ad619555bb8d0821b4ea25c3c41f9a0bbbefa866a37593096b60b1db2c5591e4658c1315c8eabe20b62ca8a69bb3100572d3c1f88845420c5c10d0adca0720c06dc4612ce2f10bd3719583dc7ea0c35aede2269251fd650552e351297f79573610d931cac8af5bb9b80cf623028addac07e184a270163f4b88aab5fe2de6a35073882c3d221c5170d7b75292f3923b896fa86342937b4625790377dc7c3927c3ccbaa1aabcb514425d22ba6020c96778b17c2af5753001e71195002e6f5e8c2b180df0600b0b325926575b6340f5705d5cbf372f16d5c63cc4ba2b5857bddd405abf3d11b1b54550e6e026408186eaf986bc37a1d444692555e9c32961800272f17f899974d5869379e46081284b0a19b1b0970a8de2ee28d839169600839494db2eb730f2e305bde73eee685679602537e0c04c046bb5a70bce38f3e8815c8b6a9575e7fa264add18ac1de9ad429812d9e3101f0f246605a41388fa0704842eb1178d0eeb0acbbea5a3c0a9ce25362e6219562bb71982174577f799e2db83c44428dc14d871b46a5d6f4b4eb729f8ab7894850b3886c60fea2b868cee5361dde4e47b8e450312d5d1699c63e238a87cf89b1daeab81ee5a2be1440b34a2b71e6ae1570dd0938ad428b74b1c2a8b323c971212ca095488358255803b815ce656dfb936014671c4c4bcf9fa898950c02384bdee22e5965f730e4658e21f2628baa8d518ac405c4a61ee54c2e23dc7e8352ee6dfe034c623484d4cad44b77704b3bb8650713c5173f45a12da981cb082454bb8f233152005c570d4418e9806f3d44c36ed388a0bb1fe19695d15a840f02620b64a992bf9806ecbc7188bbc5a6fc66b10135abaab3cee0c3168c1f2ccecd8e2544b9e5cdc6c6aef87a99cf01d1cb1538457c5441c8c966bed7056df4b01952be7577f30a5826758adc7408e95d3bb47e9955952d6ee5086322d5b9b84d9a5cf1502d0dace5bb25e4e01370a6eeeaaa0247902be03cff004411ba9558aaed8d41d917816abc9d12e816338f0e9862bd15c56a20695674c4239a4a26f9155622857075596e3d15505af2209047577ba84dd587054a152df9c6e07d6be65d63070495c8a55d4cb3c9c27c440ccad2f371508ef155880e56d5556bcc2d14e29f8658a154df3d1296d681037be6dbf1ea7059b042c236abcca34e65d83829b60b5f246189260b63d4c32e7b9e21912eaa3d1486cbf714202817ed19f52a5c729be9820b2619202f10583b0f315828acdb1a1b85403372c8d3a65d4ae313ffd9
33	pbkdf2_sha256$870000$TnHIag7xxjNYpnHfeZw4jx$Cs1OnKcY4Oz9In7NUYCPyCzJwVxxv6mdejR7gRb244c=	2025-02-25 02:31:01+07	t	Admin123			t	t	2025-02-25 02:30:51+07	admin@31fasgmai.com	f		f	\N	\N	2025-02-25 02:30:51.494926+07	2025-02-28 20:48:35.334996+07	8	\N
16	pbkdf2_sha256$870000$lcdVpPJkVmCaobuy4ESZXe$iHvvD8XfrFbNH9NSgNHukRsSHN3RHzZerySwdL5kVAI=	\N	f	nurse1	Melissa	Douglas	f	t	2025-01-26 14:11:24.54764+07	nurse1@hospital.com	t	0812412457	f	\N	\N	2025-01-26 14:11:24.99681+07	2025-02-28 20:38:25.940981+07	10	\\xffd8ffe000104a46494600010100000100010000ffdb008400060606060706070808070a0b0a0b0a0f0e0c0c0e0f1610111011101622151915151915221e241e1c1e241e362a26262a363e3432343e4c44444c5f5a5f7c7ca701060606060706070808070a0b0a0b0a0f0e0c0c0e0f1610111011101622151915151915221e241e1c1e241e362a26262a363e3432343e4c44444c5f5a5f7c7ca7ffc2001108025a03d403012200021101031101ffc4003300010100030101010000000000000000000001020405030607010101010101010100000000000000000000010203040506ffda000c03010002100310000002f94cdd7cf3d7d8f563862a925546532932ca659cb29664a4058a2289548a90005288b04ab24ca18b2966187a63662ab6291552e532cd55cee288a2288a2288a2288a31992cc549144511449944c665359c329b13a1939fab151264316508a250b6591559c590c594593218b3ce6b1b931d22d88ca2638fa4b7cd9edeacdcdb7b77f31f2ffa7e8eafe70d856d6ef9e7cbc9613222db0659619cce59e196739a599a950205229401494000004b04b2c6396364c6cb22cb412e53292d9736d96680000000050004b122cb0100012c24ab9cbd4e7eb09a8b00b5288002dc699226724494132cb3cee0cf410a94021b3a5eb1ede81d281a6dc47c425e5e32001652dc6a7a65e79e719dc6c995964596405000582a0a00042c110a912c82d92cb054b94b336cb9d54b355280000028000004949058000c6cb97b61ed8ed2567b4001028545800054195c7291eb2e37948ceaa42c4b6dc694d8b2f5e5f6f40e940000f871c7c600074673d685bd5b39593a326865d0f0ccf0bd1f2cb52e5b171aa6f9a0dd4d6936e26ab7304d66e60bacdec0d46f606a36b0b3c21bc22231b2ac2d92cb165672b32c9625b616d89680005000000022c48b2c004427bae4397a6054b2804b00b6288000672cf431d2a22a42a2885b66c565d765ebd075a000001f0d65e3e3000ec63a5870ddeaf3f56ba3eba28e972fd3cae3a3e7e3e71b3efe7e1993a3cdf6b3dbd39fb12fa79e7e46df9e1e59bb3e5979d9b7e1e1919f9c6b1bd8e9dcefca5c7b7144a22ac04ab25959cb2c6e540b2cab2ad4b2828000000002588956402099fb4bcfd104d40a9550094416811605f49a9918d82c58009445f6a7699fb341d280000001f0d65e3e300000059532b8d932b853d2e1739f4be75336364c90541509500088226a915601095054a9965867334404b42db12d0a0000000009622596208f6f3f7cf50e7d60a4b00b60008b142995cb3b0c6c00004a48beb6bb2f4f6683ad000000000f86b2f1f18a45a62cb46ddc68fa2edaf3d3a0e7fb9b4c3424e9de66d1b575f4d3ab793bd1b2c19e7e8f319b4b575bebb06719bc39dadf5dabef3394e763adf49a1bec9abab75d4619ce6083ccf6cb935aebb5f631c8e535d7acf2d7ce376f231bd7b37cf4b38e8b918eba7652e390039575d5723daeba29c899ebb91b3abbaf3e633d6727a0bbd7c793cbbf71abb59cc025102c594025ab33b71d22c9a00000107ad3b2f4f66c3ad00000000003e1eb2e3e296d671b6a62cbc4f4e75c35dba6cb5b3c7db9f32d77d9f2f6f293db53734cde786a26e61afb6d6c30b9e7931265cfded0d6fa37c3d738f2d5986fb6c6e72bab31cee9737a4737a5cde8a68e3e396baf43d79fd0cf9e8986b6cebb53dfc3dd35fa1cfe865c9ebf231d75ecf2f772cf2d7d5dcd3d75e9737a5338f2d1ded1d75ece58e5cbce04e4f5b93bebd7e475f9075399d2e6a74f97d3e5d9bdadb1e09b9abd1e763b75b4b774f9b1dee7eddbe83394a2054b28b9cd63998e80a94400002bd2c761ebecd875a000000000001f15932e3f3a2a64112f3eef7f9af6bd77639d397439f362f5cfc76f9c9bda7366ebcb3cb4dae83436e4f41320343df5b5d32dee7f45343a1a7e65e8686fc9cfe8e8636ba3a5bd39f3ba3ce5d3a5a7bb39c56794d7d9f3baf1f6d0b7afbef78679e5ebada91d7736fcbd73c9cfe8685bb5eb87a672e57579dae9bf94b9e6b10e4f5b97bebd4e43daeb779bd3e531d4e64d8af6c3679f9d75f9be5bf9edb9a5efc9ccf4f7d3e9eeed4ae3ce28928972cf3bc6d99e9165a000944524ace9d97afaf61da80000000000001f1b5787ca8a2050000000128c6678dde38e71bc653400a80288aa82b254c148524648c590c6d0b2c96c3544a50128000020965ca1723d66b3cace5ea0800a255962d5c7d33bcf78cc93584ce6a613296c168052465993b0f5f66c3b5000000000000000f8ea70f94025135373ceef5b6f57d1ac70dac0b8ebe36fa7b67a4bbbad48dae6f40d5985bd76b5fdac9adef35eeb6f5bdbc13dbd2ebc932785bd1f2cf5e72dca679786c73ba37571cbca635fdbc376f4ca98e2000028b44b44d0a4a00258259640905ce5b18e7cbd296676282ca5b3517d73ac3d7272eb8aa31652b1c739ace133c753064d31b6c917d09d57afb761df400000000000000007c7d3cff25288aac79dd0d0bdb1de7a279e8eff009b5e5e79e177d0e7ede9b1bdadba98e475b9dd2bbd2d7eae9afa4c8687afaf8dedb1a5ba67c7674ba333a7afd5e7dbb9cee9694ce7bba1b6cf3b63cb6af4f6badb18e1cfd9f7d3d74e98e7e60165500a941680255800100b12927a63b19e81cfb820b2aacd32bebcfa4c8e5d04028124ca563339660ca6b3172a751ebeed077d0000000000000000007c855f3fc9808a31d5dc975a9b390d6c370be78fb44d4f5f62833e3ec0f2f6186bed6377a7edeb8deb878ecd3cbd9673797b126b6d13576aa35a6d8c19d99d4f6f5aa1302a8a4ab3529280081421600000f5973cece1ea932950a8aca6a7ae5971ec18d20050896054a152e333ba9874efa7d107a280000000000000000001f234f37c900522893218b218a8c592b151002931ce18639cd74c6aaacb3208b2a0a811425102a8b28aa2ca0a045245801165800196ce39f1f4863a4164b7d25c7dab8760ce92cb028840a016652acce56fbd3e940f48000000000000000000003e4acbe6f94544502ac51144944524956499422aa2a3099e3ab8a9401500a245051059459455525050000008b1008b2c7ae1b58ea1c7d002df5cea66bc7aa5928960588025814b2c5b3d269d067f441e900000000000000000000001f27665e5f972928a45100000045592524596012650c265356281525214054085169668594140000000012c41eab9e670f50b2cf4cb2e7d2531ab96396352658d41621a842095505b3d0bd167f4341e800038bdaf93371afee743d38c3adbbc8d1367abf37d037f7fe43b6751f1ddc3abc4d5ec9e19fcbf68dfc3990f64f037bb5f27f580007ca55f27cd0000012288a2288a2289288ab24b131994d4800140a408595549549a500500000000002ece39f1f445f4c74c7d2b974415658b9639674c72c492cd650b04a0b09eb4e9b3f7e83bd00001f2df53f1873fa3ee3d7e6be8fc4fa5e571fdcf7d4dbd1367e7beb313e7bea3c348faef90dbf21d3d7d7381f45b7a46af3bb032fa9f8cfb30003e56cbe4f9a00000000000000116245964957325115529000a0aa2ca2ca0a00000000003d7cf6f9f55cfd3cdeac2d99d90825952ae571cb1a4b09137912c12cb1eba3a6cfdfa0ed4000001c4edfc79b5e1d3e51dacb87d435b8fb7f387e81c0e0760e96b7a7d69f0fbde7b669f4f97d6383d3ec7cc1b1d5e075ce6edfcaee1f7beff0031f4e0007cad97c9f34000c39f75d369646dbcb44e9b4770c9cccaeba2f3cf3ceb9bd2ba3536e4352dbb3343cf4e91e7397a39f8eba745adaf2745a3bcc9adb520d536af87a359de7ef4d6575b23ddceceeb793464df73f68f66beb1d16a7b1eae6fa5bbc69673bae774dbf7d9cb2f9fed92ccee4b8eb21a9162055cb0cb3aca244966b309a83d751d3b97bf61da80000000e1f73e20decfb5f22747b1ceec9cbe07b754f90ebedee18f6bc3e74f4cf9ff004e7cff00d1fcef4cc795bf89b7c7d7df3b1c2fb2fcfcfacec707bc0007cad97c9f34003cb4f739bbebd5e76d6a9b5867a0b9f4797d44d3ded1e849cadbd4c75bc7a9a34c7a9cbea671cbe9f33a279eaf9f4e92ccf0f2d7d8d7d75d9d4dce55bedbdccea9a1d1e774597377b94d6c6ef2ba8d727adafe575ebe5ebe51d4c2f273cf6fdb5b71ace6bf8279f5b95d5399b1e3eb7575719ad743c3d35f7cfa1afd7e4f9bd3f410f9be84a492cd442c435084cae165ca5b9d618e786f08f6e91d365f4341d68000000003e3bec7e18ed69fcafd30cb2e01bdd4f9eec9add5f9ff00a42fb73378c373e4c7d2713a1ea2f17a472feb39da07d8fc7e637fbfcbea0001f2b65f27cd000f3d6dd5d39fd01e186d0d4bb438fedd25d6af874524e7f449a7e5d12f3f0e9ab9997406349cbcbc76d6e1abba35b1da1a3bc1a5b59d3c3c776b5a786fd5d1bba39d8750d61ceea2679debb85d1c3a2ae76cec44d6f2f6f3f6e7ce6d77397a38db7d07c7f64a71a8598cb37942c4351045832b8a6b293df4c7a56fd2075a000000000038bdad53e2ae7b661a3f5df0c763671ec1f317eafe48f4d8f9bfb3387e7f41cc3adf2df63c11f45c9e29b5edcffb03e3bbbada0763e9f87dc0003e56cbe4f9a00000000000000002090580802511400b2aacb282800003c373d35f17d3c8dfd6b6f64fcb7d40c68092cb244de44d644a12c12ca9b3aae92fbf41d68000000000003e5fea3f3d3b9cee2fdb1cdf9bebec9a7d0e7fd09f25b1d9ec9f1ba9f6191f2ced730fa3f9c77ccb97dae61e7e9f39f446b63d9e01d1fa9f9bfa40003e56cbe4f9a000000000000000040905800008000b2aacb28280031c3c3d59cb03e8e45d3d3b9e3b1f9cfa41e1ee025831b37990d660d482c82c46ded8f4cf7ec3a500000000000001c9eb704d6f3c073fcfbbca3774b6a8f2cbe94e66d7c5ef9f47adafea73799d2f632f5750dbf80fb8d13c74fd7867d2fd26aed0001f2b65f27cd000000000000000021102c0000400005a25a1461597879cfa380f5c0a74357b7f2fd590f83ef00084b18d9bcc966b296525960dce92740f7ec3a5000000000000000713b7ce39186381d6f7e5f78e3697a6473bb5ccccd6ef747847aeefccfd01d3e473fe98e675383cf371a3d935af17ccfd12f1bb20007cad97c9f340000000000000012c44b2c0405001000502a50c7c3b33f13e9643a8059d1e1bdad83f2ff5431404b06366f321acc1a90590dee89bc7d0d06e80000000000000000e3767e38ed6b6be666f0f73a9c4ea724f0cf9199f41a3cfeb9e1b7e7ba76fe5a6a9aff5dcae51e1dcf95fb2383e7b1a47d17d17ce7d18001f2b65f27cd0000000000000004120b084a8280005004abe7e787b607ba05002c7b76fc7dff37f4c4f1765941044d444d652cd652ca2eff5936cfa1a0dd0000000000000000007cafd57c71c9e96dfa0e4f521eda1f4bf207bec737a469e5edb2703a58e47739b078f6f95a86cf1357ed0e7ed7bfcc1d8fadd1de0003e532c32f27cca140000000000004442c4104b2a0a0a965009e3d59f8c7d181d800003a5a9d9f97eacd8df87ee10b71a225886a21a90585e8754d93e8d0d500000000000000000001a7b8341be35fcb743cbd46b7afa0f1f60d4d9c834b746bf86f8d0cb743437c63900007c965e79f9be566973b00000000000410b944b9b0000160a42e38797ad61ef0500000b3a1c77b3ed83f39f433b831acd896e5858b010b04b16f47ba7b9f4341a0000000000000000000000000000000000000000007c77a7967e7f95e971b9b9259a00000000044444d6000000079ed97962fa20f40200000163dba7867f07dd5279bae4c69931465711e9233ab12cb9ba7dd3d0fa1a0a0000008d7d4f1ba897d60a000000000000000000000000000000000f8ccb1bc7e67a65e79e3195c6cd64896a5500010b11112e44b28b025044c3cbd572c4fa00d000000820bbfe1d1f99e9b0f97ea100a20b7119e5e59e57d5d4ee999eed8509259cde7f3e5d9f0e4b9f3e8e3a0ce7e8bd79dd1f4fa75b5363c3e674e9597e9c0d07849eee35c73ec353df5bf471ae71d868ef6b639e741ad4d871b3ce3acc33df40b4000000000000000003e2f2c6f1f9d9658598f4b8659ce4965a85a96510a8b10444b02aa541e7ab9f8e2fa00f4800000020419e3d1f3f4f6c8f83ee1250a4042d406d3addea9eba14249e7c47879fca1cf9800753a7cee87a7d7a38e3eff37aee696ef03ecf1edfa7cb7d4d3536f538eb95bbcdf4f3f99dbe475f7d383d3e5ed631abf41c1fa0def3e37678bbdede9ee7a673a3e9a79639f576bc3dfbfa435a000000000000000000f8bb2f1f9eb099658598cb53d0d673c3725c7db4b7266bc7d135fcf1baebb3adb58b9e1efa5b467e6ce674f630d5efd3d30c5ebd7bf8ec79f5c65e4f65f2d8d2dd40e9cc0012a21e92fb7425f81ee0e1d1012ca1142a6e65d3f4d0f4d0a01a5bbcbc63983cbe300059b56f59eda1bf6f9f43577b96a7c977be67ec789f53f2ddfd63afa9b7afe1f6f23a9cf71e1abdaf1ded6be7fada9d835b53a9cbbadbe3e7b58e7b3a7d6f0e9d75f4d79f1f6eaf97af5ee1bd8000000000000000007c5658e5c7e780b09e73d7595b5e51353a9a5b6786c131a6f4c6f5dad2ddf39cfd3cfd70d67cfc7dbcfdbaf1f7f0f6edaf0669ac72f4f24f7c32f2de3c77bc3de50e9cc00801d3d7dff93ea0f9de980804b292ad9bf9ef7aa87a680000d1de99cfccbd7cbc9e200643bde3efdbd386ab77c9dfd265f39f5396b6b1f43e73e9f85f57e7f4df1f6d0f37a763cf8d9f6e3dbf6f0e473e9ded7d3e56b3f5178b94d761c2e94bb6f9ff005d67b6d1e6e6fd03539cbdc7037ece83874def7e55d63b4e6ebe37da70f7977b479db1ac74fd34f9935df72bd25e8be7faa9b6f9f6a7d025e5d4140f8ab2f1f054a808b050952c80809663e7e8658c7bd46a00054a001400003d3cfabe4ebe96cf85ed0960a4b04b6a74b3d9f6683d140000000f0e27d179f3e5f38e8fbf1e3ceebfaeb5efebadebefcfa1cee27d1f3edf3d9fb7c786c6ff006f8f6f3d83c9ed686feaeb3f3db3d2f0efe69abbfa0acb6f35d8f9dea629afb5afd497474bada967aeaedeb0d7e9ead9ede7a5d03c35369acfa72bbb9e759f0fa5e72f8fbe3bc6b4dde74bb5a9b9a35e1bde7e973adb1e7b72e865b34e8fb79fa79fd213407c55978f8160a1012a5012a63665e78bdd90f480594040160a2800001ed8befbd2fe7bde1cb70096525ceb1ea65ededd077a0000000003089e3b4e4d6f4f569cad0fa47a38fccec77967377bd18e819d80000000000000e7f4173cce950134000039dd15cca4a0a00000007c55c33e3e10459500584b31f3ef32c4f76437280002a50100a00a000bd6f0dcf8bec8b3e7f70a4b01eba4ea5cfdda0ed40000000000000000000000000000000000000000000000000000000fcff6f8bd8e7e5cc679014c3532f3c5edc87a72b0502c25000b280802ca0500d8f1ebf87b654f87ed02006ced8f4adf7e83ad0000000000000000000000000000000000000000000000000000001ae64fcf89a3ede28ecfbf03d73c3b738f18eae3cc7b73d3bcb69d472c751cb2755caa751cb1d57295d5728755ca2759c91d672475af2075dc81d77211f53b5f24f8febfad7c939ebeb5f243eb5f243edfa1f9edf65fd05f9f3a5fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd05f9f0fd071f80f03ec7e3f4a007fffc40002ffda000c030100020003000000213da3abfc2bb113cd284cf7b299d5a04f6fd5a2a08208208208262a082097a6bc0c4752c63a9c646f57dfde0f80480b9b9862e6498fbbd96ea20000165147f7ff0020a30410410400001e40410421fd2f7211f402153c3cc819ac2d08003268efaa73bd20acefbcb0c08219b62c995e25a9a24104100000001a20001d690f43b80d2041ca25747420d400000005ba0b605ad78af9c3fcf8e79d182d7255b7ab849c1040000000023d7c3d92aa56b5c0c0800a8831e9b14c80000000e82095d904e81d2f403b0fbef53abe690c66d6ae49000000000017478389a6e42d4e8034601034b10c38000000000ac20820bd2dc48cec43090b2dfca53bfe6f857e52700000000001757a323f5703d0f610438e0824f6e80000000000b8aebcdd4c570e511737dd8c98bee8011d175f12e68c42400431e8a04c8bf53ab5ad16b6fbefbf3d00000000000007e1a329ff00782df5d9ade92ef5badfcf4148358f2434c88c0f007cc6e2ec6f53a948ae012fbefa1600000000000000c163d8a9fb975640824b0e1f19a3ed273b024662056d0e6725ef1f44cda946174f8a40024b3972000000000000000e71f3e3c30c67f46da0bb1a789c5d4172ca26c413108e3cf1b36c2d3fff001acc3da87b20c574a80000000000000000d08444dc3e40b692b431d19f466150f633cf7f55c6ee105756abd95fb3d26b0ae0666a2b6c30000000000000000009dec535c64b5029601aa1ac4ccce06d47fe8377701ca3ca6f1374805ff6cac7e03d34b44e40000000000000000000c0cc2431353e71dc0cd0ce603468de29fe19a2e38304577c8159d02d5f397e01df2d5c62000000000000000000000dee2824b2bb028e6934792c6a597951fa6996c00311c2d7c3150ac977e9780f800e2cec0000000000000000000000b32fc80007ab756c2293b3b9506921e9a6430000000372b5c2a085d5d1e1687f6b0a20000000000000000000000002e66f3fcf28285f14dbb8c199a4e5fd586c00000000001c0f618b5af5a983f63a348000013452c90c204d0ce08000480000073cf3ce37803ac39e9317ec9e6840000000000019c53623a55cdf9b12b3000000010420134e2ca04800000a400000000000000378087b099ee18653000000000000283c0f1da4b932691840000000011c000d18318828828000a4000b2cf1043480c726113ae330e4ba330814f2010c8efc1a09dda05ce5b52000000000504624a0812cd14120000a4003923e5d09f0abf017fb2cac192c67d6ee230c595d73d41240f3725dc40000000000053853c71c028234408000a400100104e3480491682843bde6caa61013cb1469421809e5a65bce433900000000000011c43c30ce20828a28000a400000000000000002e80414f3069ac00000070900c003b387986d70ec0000000000000430a3c10ce14904628000a40000000000000000aac308041069ac00006420b51405992f9a69262000000000000000110c08128b2481c828000a400000000000000009b0f2804105458008b080169a40bd1dd65850c0000000000000000000f1cd2471c034520000a40000000000000017441c200410102798c0001e0081247ba29f21000000000000000000400608b3cf10814d0800004000000000000001ba0f3c30400002a100004c9ba09ebb75b10c000000000000000000051c438830d04908b28000bc00000000000001596a53352c1363082082349dc35fb2395a1000000000000000000000030000000410c20400000740000000000004e457befac5e38420820919e712669b1fd8800000000000000000000000000000000000000000008d420000000000a162086fba8000820821f319a5b121584000000003b200000000000000000000000000000000000d7bf472000047fe981097b2000000008e5d89b0e619e30000c7b8e059a800891c92c33c12c0000000000000000000b0addb37ada9ec6f091180000000021a27c6a5b71eb8200737cf3c3fb1c805d0ee8c4a412c00000000000000000004bca1faab01fa616e7d69d0a000012e15a9e56eaa8080004f3cf2c642e1718444858f6258c0000000000000000000ad0f2364501a5c407e363f620000823c0bbf550c00000003ff00ceadf9e8095cfadfb0200b30d1b91ca4e9143109000f8956cd0acff52c0c3dca080000018d6af174d000000000017a57ff00c07e2437f9c86ab76d1cc78fb52645269a10000ee03d2343bb0fea834ee00000007f22e519e000000000001324038a10000000000000000620000000a1000000000096a50b5ecb70d2f8a0f7080000a36b16b08000000000000000000000000000000000000000000000000000000000d43d82eb5b12bc3daa0d7a80019882f886800000000000000000000000000000000000000000000000000000001314815f190efcb4c043d35db4c3e530c3ad30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c000ffc40002ffda000c03010002000300000010df1f9d017a572a22a8ddfb80589166dead2c3d0c71c71c71c61c55f3cf3b5dd2337a7d29f29c54506c1a773f7fbb0d475a0e3a739dfbe2c2200c30d4fd43505007c80c30c30c2082573fff00ff0068ef977d500bf0171c785eb59a9317cf3e2afef0d195062d0f3eb8f04115feab62b4d55d62c30c308209f2b2dbef92219ae9ea98dfbf40ec6addfae64f3cf3ccc7fdd2a6512d9ef78f7ec34ad6ddf78a7d21e23030c208ff007df7498f96c2465851edcfff00f74939f53a07bcf3cf3cbffcdff3845c0e491d5abb1f4ccccdc92fee67994b08677df7df4066ff00d81ba45a6542e3d6f03449adc5f3cf3cf3cfab0c3ffe1bcdcc513c86070eb091074d28eb7fc840bdf7df7df41c5b10a085a2aa62a494b2f8e4c257cf3cf3cf3cefb333ff0046a34d8c9d3c9128148012ce425057d757af5d3dfbcf7d23d32bab90a61462f6fbeb8fe66f3cf3cf3cf3ca0bff00dbe523a7db3c8215540e2e3d6f44ef8aec9f5d726330dfc265a07c7bb959753ba90fbefa7f3cf3cf3cf3cf3c2fa3366a02be95f0108123595ac5c2e0fd8b78edad683968c99fe59cc3033186ea3f0a804319f6f3cf3cf3cf3cf3c5f2fadc3efb9e6405a1936f4e0acc7614f3cbe4e943b3cb2b9417653ef37b968c9754986b1753cf3cf3cf3cf3cf3c9347a49b6ef270095252596d46dd89aa35bdb6207a6230d0a3e742579498f22d66584f3760ef3cf3cf3cf3cf3cf3c5d3a3755e08f91d8b9b34a109c97dbe13f6b5529917ecf5eaec5690d1f0f520929d6ff7f5fcf3cf3cf3cf3cf3cf3caeabd46ee99f90f974139dd4d6299aaf7e81ca7acf0447bb7abf63e28dc5e1c912326bf7f3cf3cf3cf3cf3cf3cf3c91c2017797e9d4de73626a9b2b192f4f8b8ce0e3e3c0adafcf8f8bd34bb068acb6a1f3bcf3cf3cf3cf3cf3cf3cf3c7c254bcf36362c233e23555e31bca5616f2177df7d2a59b6075e8aad681b7e5c37e4ff003cf3cf3cf3cf3cf3cf3cf3ce0ea00332dcee09141c54fc1ec2677b43c16f7df7df4a40961e623af5c892cd38f93cf3cb30818628534b1841cf3cd4f3ca0f1c71c512b14f33cdb951eb4728fdf7df7df6b086a0a35a84175b42ae4cf3cf3cb0073cb2011430401cf3c5fdf7dbca0867fdbe59d369caace90db85bdf7df7df6226210a9402a63407c03fcf3cf3ce2442cd2c600d38d1cf3c5fdf74d75c36dfcda0c5ea36cfa7d0f84774dbdd35fd5e811cdfe078d25ede5f3cf3cf3ca28e2ca0ca20e30d1cf3c5fdf42f68b42fdaf7739c1b5590d60a0e66a78ffb0a3170f2ca2717ca6c6b7cf3cf3cf3cf3050c100314a18c3cf3c5fdf7cb0f31cbaf3ff002fcbddfdcb64c85f9d7ccfea260fd9d4f73fbf54f4f3cf3cf3cf3cb1cc08228d30818814f3c5fdf7df7df7df7df7d716ff00ff00347d4a56f7df77a1729fef6ba50293bcd3cf3cf3cf3cf3ca3c500c1802412ce1cf3c5fdf7df7df7df7df6aff00bcb6ff00ff00d0017f7d8e3072e3d6d9ea8cb172df3cf3cf3cf3cf3ca00e24c20600d2c034f3c5fdf7df7df7df7de4228efd7fff00ff00fc42eaa08031653bc4a472caf7bcf3cf3cf3cf3cf3cf28318038a20934714f3c5fdf7df7df7df7d89593f79eff00ff00ae6634c00069377d6608cf6bf6f3cf3cf3cf3cf3cf3ca18704f04620004c3cf3cdbdf7df7df7df7d28cdbcf35ffefbc8e00411b03659a05d1c877fcf3cf3cf3cf3cf3cf3cf3812462cb04a3431cf3c1fdf7df7df7df7d8f8d96fd1e3fc610c30c30cb8a6ad84661ddf3cf3cf3cf3cf3cf3cf3cb0c70cb3cb2cb1c31cf3cd1af7df7df7df7f61d430f2e9358830c30c0244e698ee955f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c7a74bdf7df7de5665adbaf30ac10c30c31d51b8be66940fcf3cf3cf05f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf03a88eb3cf612f981fbbc810410410cf51e5f9daa885fbcee171ff004afbcf78dbaffec3adfcf3cf3cf3cf3cf3cf3cde563140a19d69ac09d880410410431f666f40d63b49cf3b5fefbe54eb5dfef0e452d6a9d3cf3cf3cf3cf3cf3cf3cb665fd3d6edabca6ab6afaab041053eb7f5ff00c685cfbcf2afbefaaff0f64f7ec9b0d82addbcf3cf3cf3cf3cf3cf3ca669937efbf72a1a7702248b0410c38c9e6a4fee7cf3cf2cdbef6f34c008eccceeff000d73ef0f1fcf0fd8fb3cbff3c45aefc65b531e4cdff68b0c104105e547ade777f3cf3cf3caf69885e509fadb3545569ad6c371510ed693c2f95f3cd445d6619251d36ebfba70410411ac9ba7767fcf3cf3cf3cf1739fbfdf3cf3cf3cf3cf3cfaef3cf3cf5ff3cf3cf3c4e9cee9a29dd0a7f9efde0c10414b661c147f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ccb5615099be49527eaff00aac104ef49fa777cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ce0dfd4a4dad47dbc85b31f2cb0d7b8cb200ac30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c24d3cffc4003c11000202020004040208050304020300000102000304110512213110134151203006141522324071a12333536172428191073450a22492435282ffda0008010201013f00b6d083fbc363b773367de6cfbc6263184f86e6e6e6e6fe1066e026293ef373661263130933666ccd99b33666ccd99b30133666ccd99b301314997ddc89a07a99cc7de6cfbcd9f79b3ef367de6cfbc3b9b3ef367de7319cc7de3dfcbebd617663b26163ef367de2b30f5328aeebec54427666262263d417bb7a9f1b1b99c9f81a3087e60822f8b4687e50f804d851b32cb0bb13f19108f1b2ff00459bf0d402514597d81106c9983855e2d600eac7b9f1d7c244610887e5880780f06861f943e059936ecf20f92446d01b32db0b741da6a058161129a6cbac088364cc0c14c5afddcf73f09f13c46a06c1ca7995f940f7332b3131eb46753b63da64652d55d6e14b73900013ebbce1c0a5b9d7bac5cee6477f2982afac6bc0f2ba7e3ed2fc8f279072162c740087397cbe6e43be6e52b3eb7ca8cef595020cbfe13b9ad872c5ca62acc6a6002ee579a18a835b2f37e1317318d9c9e4b6e0caace41a7d7dfc008208218de047ca1078097582b4fee7b4d92767e4bb851d63b973353500f0aea7b5d5106c99818098a9eee7b9f927875de75d7af4b03ed3d88976264e55a19cf9615743d7a9870b24d1552dfe8b3f103fe998b89652f7861bdf6727bcaf12cfaa5b530d16275129c977a4588156bf5df79978ef6bd3cbb001ea44bf088a42d60b1e704ecf7894dbe4baf903f42dbdc5c5c8f26e5e5d06039577b95d1704b17c92bb4d6f9b729c3b6bb2963b6007504f633cab06459605e853420c1c8016c0fb70dcdcb141206e289a807818de27e67403665b61b1c9f4f9365a17a0ef0b163b3f0d75bdae1146c99818298c9b3d5cf73f34c22159cb089a9af0d4d40201009a9a9af0610f8187e48804cab7fd03fde0f01f15977a2fc55a3d8e1146c99818098c809eae7b9f96aa5bb4353004f48a85b7a22352c013d22d4cc3623d2ca37d22d05c6c112ca1906fa110ace4898ceebb056724af1ddc6c6a1acab107bc5c67d03b0232143a316976008d42083af0d6cea36339f558ea558a9ee27d52cd03b5ff0098b533d9c83bcfa9d87b32eff5894bbbf20ef3ea56fa321ff787c2aa5ed242eba46c4b154b6d4ebd8ca687b77ad687726362d8aa5b6a40f632aa1ec048d687bcbea7a6a67e875ed28c4b7236caebdfd4cb10d6ec87b83af88b051b31ed2dfa7c55d6f638551b2670fe1e98c9ccc36e7e49f0dc5ea75bd4550aae4303d22e89d6f50285adf4c0c1fc83fe517f92f16a2cbb2c008e156ae5e604ee72ce5940fe20850fb4440b580580d9065cba7e6ee0cbbf12fe825dff00e3ff0018aa14202c0112d52ae7c2bfc6bfacb3f9dfff005327f9cffacb2b5b8a72dabbe50352a614ddf7bd360ca4e39b97979f7b95d8b5dee5b7a3b131ce379bf739f7a3de37e23e18dfc9c8ff001989bd5dfe06523ff8d77fb4a07f0aefd22f4c57ff0029e6f998795ec0aea627fdcd3fe6265a379f7368eb9c8dfc023d8a919cb1ebf12233b0551b2670ee1eb8cbccdd5cfedf289eb37371143776020088aff7c1d888a1b7b6027dc44701c1dc42a6b2a5b5d61e45ad8060498a15aa0a580eb1915474707c6a0a0862c25bcbcaa01dc211d53ef81a12d2ba400ef423047d1e703a4b48dae8ef4238476df3812e605ba1df49b88c03a93ef196b2fcde60efb96957b89df42625552bab79cba065ac1ac723b13318a8b54b1d011c82cdfacc52ab6f33301a10f527c318a72da8cdae61de225552d87cd0db5d4c7e4f2ec466d6e015d75d8058092217a5e97a5ae084907ac61451896a0bd5cb91da61575175b1ef55e56ec665bd028b425aac5ece6d0f0dcdcb2f03a2ce624f5f89159d82a8d9338770f5c750efd5cfedf2c9ebf241f91b9b9b9b9b9b9b861f8c402096d82b4263316624f8ee7346b028d932ccbe6e8bda078af01f1dc40cec1546c99c3b872e328771bb0fedf30f7f1429fea04c754e40ca08eb14d5d0153022f9a57d04d56cada041022aa79618a93d63a28e42011b816be7e5e5307286208d88421425411a8a1390b303de00ace00ed0256491ca6687231f63e16a85200f68bd580fef2df294b2853bf84fc620f0c8bbcc7d0ec209b85a1696deb58ea65990f61818c57315e23c0f0bc40f638550493385f0c5c64165837611ff001f349ebe3501c8cdcbb223bb150393944ac91afe1ee0fe7bfe92b042d9b1e916c751a0d2d6629513de556d85d41633af39e9beb09dd6df77510b05d726c1967dd71ae92bb1d9b44fa4af5e5bed77d658abc818291d63842ca0d64f41d632eadd28ec613ceae5ab0081dfe0dcdfc8132afe51c80f5304dc26334bf282745ea633339d93e00780316c8b64ad5ec70aa364ce15c2971505960dd87f6f9c7bf86e2d8cbd9888d633776260bac1d0319ccc0ef7d61b1c8d163e0589d6cc0c41d888ec0ec185d8f724c0ec3b1223124ec98188ec60765ec488cecddc933cdb07673399b7bdf58d6d8468b123c4984cdfc8b6c15a16319cb312603371dc004932fcb2db54edefe204d78185a6387b5d51012c7b09c2784ae2a0b2c1bb48ff008f9e7bcdcdcdce69cd39a069b9bf00603f24c2613f2b2aff0031f40f41e00cb6f4ad764cbb21ed3dfa7b4104020135351e57559758a88a5989d013827044c2ac596006e23fe3f204cdcdcdcdcdcdcdc0d37373715be49309f95997f2af20ee7c6fc954d85ea65b6331d9304100804026a1895596d8a88a4b13d04e0bc16bc24165801b8fedf91266e6fe2dc066e6e0301f8c984fcab2c15a1631dcbb163090a364cb724b6c2768d1e24100804026a254f6b8445258f61383f06af0903b806d23a9f6fc913f277019b80c066e6e6fc4c30fcacabfcc7d0ec25972563a9965cf61ebda01184789160100804aaa7b5c22292c4ce15c26bc340ee01b4f73edf933f304066fe130fcacdc808bc80f532dcc0bb54ea673331d93b80402308e224480402534d973aa22ec99c2f85d78681986ec3dcfe50f8d743d8a586b43dccf21f9c28d1247bc4a1dd4b0d681d7531ea7460a477ed0e2da0eba6fdb70a90744759654f5101877119190293ea3620a5feef6fbc3622e3587b153fef146cea7d5df5bdaebf582973bedd3fbc7475201f58ca54e8c556760a3b98c8c1f94f7dcb2a7470ac3ac35bf3f26bac38f6007b7fcc4a9df7ca23d2e83675a8b458cbbd003fbc353870a47531b16d1bec75dc0312b773a5132f78b435afae51ea265e7bdeedae8098912023de065f784afbc758a3ac4100945165d62a22924ce19c2ebc3404e8d84753f953e348438d67392073098e105e39092394c4556c6605b97efcbc68d0a3aa81d1bde6492321f5ef0d7cf929d3b282d2e4b1e962ebd55bf63323f0d3fe12e04a6381df963114a720fc67f11f05ffb67ff00212a00d166db5f784b7a2d4a0ec7bcc8fe69942b723b81d7b09721e7a9c8ea75b96ff11987fa91bf687a599247702515ad8745c868dd31535eac77054a6967573d35b132fa3a81d828d41d6bc627bf3fed02aadd732b82da3f7670ce1af969ca4f96a4ed98fb099f9f8b957f11c4c75ffe2d38ec398ffa9c7af806f689cc7b981440a2720f68e9ec602ca6544198f4597d8a95aec99c3786d7875fbd87b9fcb1f116115326bb9dcaac35bf3013cd3e594d773b82e3c8a846f476236482dcde52f37bcfac3eacf76f595dac9cdea08d45bf4a1590301da0c93e6872a0e86809e7213b350f01611594f73058456c9ee60b4f272ff7d8963976d986c3c8a9d8082d2102eb7d7705ec2ef30086f7f34d83b9f483200d95ad41f795dc5010402a7d0c6bf685150283de0bfee85740daed0596db6a72aec8239544e15f465dcfd632c952dd4209f4df8f6370aa28c2a555ee23ef7a6965fc54bd0d4d342528e76fcbb25bf5266f71044100804021586b98b876e45aa952ed8ce1bc36bc2a87ad87f137e5cfcc1f19f8b0786e56758129427ddbd04e13c07170143101edf56338e717a384f0ebb2ad23ee8fba3dda711e217f10ccbb2af6dbbb6fc5044100804026a63e2599360445d9338770ea70abd01b73ddbf307e60f8cfc3c1fe8ddf9656dbc14abf73317128c5a8574a05511dd515998e801b267d38fa4878bf103554e7ead49d2ff73efe2256228804020131316dc9b422098383562561546d8f76fcc9f983e563e35f9360aea42cc6707fa334e372db93a7b3dbd040001a03c3fea17d26fa9e37d9d8ce3ceb47df3ecbe222888b144020987877655a1107ea7da6160d58950541d7d4fe68fcc1f20ce17c0b2b3dc1d14abd58ce1fc331702b0b520dfab1ee7c78ff0019a383f0eb726c3d40d22fbb4cfcdbf3f2eec9b9b6f63127c4088b14402098383765da11074f53ed30f0eac4a8220fd4fbfe6cfcb1e3af86badec70a8a589ec04e13f463f0dd983f4488895a8545000ec078bba568ceec02a8d9267d34fa46fc6388b256e7eaf51d20f7fef008de90088b1160104e1fc3edccb42a8d28eed31312ac5a82563f53eff9c61d7e5080403c48f1e1fc2f2b3ac02b4d2fab1ec270ce0b8b808081cd67ab9f87fea17d243450786e33fdf71fc523d04e4302464fc31522ac0209c3786db9b6741a41dda6363558d52d75ae80fcebaf5308f920403e10a588006cce13f465ede5b728154f45f5329a2aa2b54ad02a8f41f0f1fe2f570ac0b2e63f7c8d22fb999765b979165f6b167762498699e547afeec0201009c2f855b9b60246ab07a9945155152d75ae80fcf3ac61f200807c385819399604a909f73e8270be018d8403b80f6fb9f8adb12aadac7601546c99f4978d3f15cf6209f250e904e58521ae1af60c5481270ae0f665b87704543b9f795535d35aa2280a3e2e29f48afc2ce6c75a5580d7595397ad1fdd41fcc308eb089af835008a201e201274270afa397e495b2fda57edea66362518b58aea40a07c7f4df8fe87d9f43753fcd2201e1a9cb3923d7a6dce17c1db2585968d563f795d695a0545000ec3c09006c997712a93a20e631f89641eda10e6e4ff0050cc5b0d94231efa9c75bcce35601ffeca250354d63d94783b8452c7b09f69637b989756f59753b13ed2c6f732ababb5768db975c94a733f682facd42dde960e238c5b5b3010c010763e7184465844d4d4d4d40201e38b87919760aea42c670afa3d46285b2ed3d9fb0f91f48b8d57c2b05df7fc571aac4badb2eb5edb189663b27c441009c3b851bb565c3ee7a0f78aaaaa154680f024004ccccc6b58aa9d20f830cf261a93e8099429cee38081b06ddffb09c331d2eca4ad86d75388e09c4bb5dd0fe1332bf9167f8ca9d452e0d3cc4ffaa6005fab5df7bafb4c77c6547f35767d270b56e7b0e8f2ce27ff006dfef0d4f6f0eac277115ea0a2bba9d6bd477940ac54be59dafa7ce30c2b0220425977d63222d83eeec1d7496a05b1801d37391877062d756d5793a91de2041d0a6cee5880390a26b446c4e1dc24665881c72299894b6263abd2c1579f457947bebbcc83603b194a9d3f09022bdb6e2d5679c2b24753a9856bd82d0ce1f95f4187c37df5e3d2f6d8c02a0d9338ff0018b78ae7bda4ff000d4e917d87c020138670a2fab6e1d3d160000000f1cd62b8d611f05486cb1547a99c7f3570b87794a74ee3944fa27c3d955f2dd7bf449c071b4af7b0efd1671cac361f37aab09900b52e00d9225272eaad9169ef30f1adaebb59868b0ed3071472bf9b5f5df4dcca4c8ac29a3a28eea2587332b95193425d45a31d52a620a8961cab5056d4ecfbea6254d550a8ddfe71f11ca5344fac6e567077d04bb91b5cbef0962002c4c0d5ed5b67604460ac4cc5c6c8c8b4252a4b4c5fa3a2ba59ed3cf715e9ec262d4e84038c89d3b833c8caf2c53c8bca2cdf36ff00bee5b45bf5877f212c5206b665a2c34aa8a15bdd49e826152f50b4b205e66d851f0fd37e3fe6bfd9f43fdd5fe691e03c4027404e19c2b5ab6f1fa2fc37d7e6d4e9ee2329562a4751e001274254b56050d91790342574e4f1ee226d6056853fb4e17c34da6baab5d569a04caab4aab5451a004e3d94bcab429ebbdb4c5ad6cc8a91bb330063f0da6ab2eb2d2452a74bee65585664f3bd4a1501eec662f0b77ca355bd001b8dc36ffac354ba3aebbdf4025bc3f22b7ad48079ce8107a47e11968aec42fdd9470dbef40e85747dccab0326cb5eb0ba2bdf72ee1b914d46c6e5e5deb60c3c2b2bcbe71ca7a6f40cfa88b30286ad37633e8c5e1d7b5ad58e5257f11df411f87e425b5a100f3fe123b4ab875b56454b7561831235b898165f6da2b0a02b6b44c38190b9028200632fe1d914842c010c740830f06cc00f45edef0820907c4fc8e1bc07232c87b3695fee6626163e25612a403dcfa9f95f4ab8eaf0bc165461e7d83483dbfbc777b1d9d892cc764f80f050588006cce17c245405b70dbfa0f6f8f2f096efbcbd1a2e06417d15d7f796e4e0f0e1d4f9971eca3a989c3789719b96ccbdd74efeed6270afa3c52b45e4f2aa1e9ea6555518d5855d2a899dc66aa814a4f33fbfa09658f639773b2661b2ae552cc400186ccb33e9befbb1ee65f28fe06f698d65031db18d95f32b6c13d8883310711ab9ac4e5552bcc3b4c6b28a2fc9adae46f306c37a4bef446c5afccab42c04f2fa4af2aafb43318da390a694efa4c57c55a28647a8107eff003778322ab32731364a381f797acb6ba29e1c10b314360eadd0c4bb16b762b6d210a74f798b9f451874a9653b72186fa80663d98b4d9914f9a8459d5589e9fa19664a25f8b59b2be557d9e5ec25163ddc60b062ca18e8fa6a5071b591f7ab16f987f1fb4b6dc3b332a2f62102ad03e9b99175231421b6a2c2d53a5f6dc39557da81bcd1c9e5eb7be92e20dd611d8b1f13dfe2c7c5bf25c254858ce19f47e9c7d597e9dfdbd040001a1f2b37329c2c5b722d6d2a2ee719e2b6f14ceb321fb13a55f61e22568f630551b2670ce1298e0596806c3fb7c8b0da07f0d413fdccbb133723a5993c8bec8262f0cc3c660c9502deacdd4ca789bd20725350fefa8fc6f35bb328fd04b72b22dfc76b1f9755f75249adca99764df76bccb0b6be1a722ea4b1adcaec68c249249f8cf73f0f0de057e510f68295fee66261e3e2d612a403dcfcb24013e9afd21fae641c3a1ff8359fbc7ddbe0a6ab2eb1511492670de175e22066eb61ee7dbff0f7d655b7e87c71f16fc9b02548499c3b81538fa7bb4eff00b08343e67d32fa40387e21c6a5c79f68ff00ea21249249d93e38d8d6e4d812b5d93387f0dab0ebec0b9eedff00882011a31e8507a198f8e8f6a8624898d914e3204ab1c01facfb4cff004bf79f699fe97ef3ed33fd2fde7da67fa5fbcfb50ff4bf79f6a1fe8fef3ed43fd1fde7da87fa3fbcfb50ff0047f79f6a1fe8fef3ed43fd1fde7daa7fa3ff00b46e2ac149148edef389e2dd9f9b7645d904b337b769f638febffeb3ec71fd7ffd60e0e3fae7ff00acc0c1a71290107523ab7fe27fffc400401100020202000404040403040904030000010200030411051221311013205122303241141540715361a2062372732433343542505281b1254391a1638292ffda0008010301013f00cccc5a06875632cc8bac24b399b3ef0931c98e6133737366759d7d649f78ccfee6067ffa8cdb7b984b7bc666f79596f730337b99cedee673b7b99cedee673b7b99cedee67337b99ccdee67337b98c5bdcce66f73399bdcce66f73399bdcc2cdee63336fbcc0a1aeb413f4ac0753666ccdcd9f06dc3b9cc66e6ccaaa67ea7a08a028d084f80dc50cc74222051af1c8b0d973b7f3f131e346f01078ebd4618a26a343120f924461e86888cee1477266352b4d4aa3fefeb22110882538ff7783c7515493a111028f598c232c65844d7a3737e82619aeb02c31a7de2c53f24c61e873386e36879ac3a9edf248810b1d012ac709d4f53353535350292742575841f23f0ec794efa11bdcae836b3007b7de26397675240e5ef1f0f4549b1795bb347c0e5754f354b345c766f3bafd131f1bcee73ce1428d9260c07f302f3ae8af3069f83e6b1512d56261c3fef92b5b54f346c450caa2e524b6b52cc12aae45aadc9f50f68d8482af33cf5d46c4b0630bf7d3dbc0c03c098f04114c1f24c3e0663506fb47fd23bc5014003c07aebad9cf48952a09a9a9af0d1274222051f27f109c8887e9e5d1896d752687c4499e7542c771ff12f6fe7326d4b16bd74d77596de8326bb17a850259663d69772396367db5da625e94a5dcc01257a0331f341bcb58428e420687411eeabceadc5e7f70bad46cbc617e3b736ca93ccfad4b72293656fe786d3ef5cba97e6d56d77a8d2927a103ea105b51c6aab2dd459b3fb439f8cc5aae4d215e5e69a0098440237830820822983e418619d58851dccc6a053505fbfdfc47aaaa4b753d04550a343d222272fcc686158cb0ac226a110acd4d4026a058442b39632f487a182080c07e4184c669c3f1fff007587edf204aa8fbb7a86cc44e5f95b129acda480ca35ee63625aa8cdb4200eba32aa5aedf2b28d7b9d4b30ad4467da903be8ca716cb94b290003dc99760db5a172548fbe8cab09ee52c19075fb9d4bf02da539c95237ad83b9c86796655c36eb5032b27edbeb0d641d4c7e1f75ea594a800eba99650d558c8ddc18bc2ee2aa4b22ec6f44cc8c6b2860afaea360894f0ebeeac3a9500f6d98ca558a9ee0cd408ceca8a3a93a11b8264f36bcda41f6e69652f4dad5b8d329d183836472a936543637d5a558b6db91e4268b6c8efd3a45e0f93bd0b2a27d834a31adbae352eb986f7bfe5070ac83d9ea27d8342347c31b16dc82c135d06c9274259c36f4467e6460a36747731b12dc8e6285405ee49d097f0ebeaa9ace6460bdf94ee63e0df94ace854283a258e84fc9f2010c5eb6407a953b9462b3a0085401d351d4a3153dc7a91198e809552a9d4f53ea00931102feff00259c08d7010dd2b7e7755e70bb3dcca6a5aa8ca617a59fddf653286f32c0a5c2efee62d6b561e49172d9b03e93da56dffa731fff0024a4ef0aff00dd655885ebe7362aaef5d65a12bc435f9aac4befa4e5139670f1fe92bfb18f5302588e849d19452b5e3207b514b3071b3f69c42a22ff0030302afd4113887facabfcb59c43a8c6ff00284aebae95c65b2f456424904fbccda4d590e09077f1023d8c2661ff00b5d1fe313289fcd1baff00ef4e29fef1bffc53271abcc6a4d797503e5aaf2efaee625830b3b7683f0120ea61370d6cbacd66ee72dd37da63e4d78f9b6b580f29e6075fce60b70f3903ca36f3e8f7ed1cfc6dfbf860ff00b366ff00804e1c7e1caff24cc76d70ecdfdd66139387c43fcb1ff9956cf06bb5dcdeb387d1e4e05a0f7241328ff5d5ff00884c856f36c3ae9cde812ba99cff002895aa0d0f577311397e55977530d84cd998b45773307bd6bd0eed2a4c6c5a720fe291cbd654013171ebbb9b9ef5af5ef358f8b8990a3251d9c0000987651661bd2f72d6dcfbd985e8a312d4190aecc46b52834db88a8d72a90e4f597515a282b72b1f61353530d29465b1ae51d0f49966b14d48ae1b44ef52c4a2fae93e7aa9540083331abe5a115c3720ea44b931f2391ff128ba4034667dd51b295470c1100244c9af1722d168cbad760743389df53debe5b860a8177fb4364c6b953229763d038265b8d876651bff001d5005f9b532eda2fe256373eab67faa63e261d575768ceac856debef329d6cc9b9d7b17244e18d5a6656eee1557aeccb886bac61d8b19c2debaf279ddc280a631db13fce6e70fb29e4c8aacb0273a800988b8d8b5641fc52396aca80260d943e3655165c2b2fad1302e2e261e5019696358a000b383a56f84e8ec1776061b8c2aaa8b145818b11da6322732bb581747b4c86abcab02d80967df8ee5346fab40001a1eaef11397f7f96c76c7e40622576c47dfa498cf19e3590b985a6e6e6fc14c135353535e04c630998f4b5d6851ff007888a8a154741e216048b5163a02558817ab7530a113a880f86e6e6f662272f53dfe613f119bf0c67c55e6f3ab66f6d1d4c8ab14e225f4a32fc7ca413b9559c388456a2c2c7409e68b874fe6165277c8a0982bc1beabcd55ba322f36cb6e514628c4175953b92e4694ea6563d09f846ad5945bbda93b23462d588327c814dbdc0e6df488694b5d5d490091d0c64a1e977ad581523b9dca529f21ecb149d301d0c51559908aa08524082ac57b1eb14d80807aefda0aeb3897da77b560042db3388d35516a2203f4293bf732950f756a7b1600cce1c3aa6b6a4a6ce753a0c5ba78ea6a08b07a5a34d12661630a6ad9fa8f7f10b024ab1d9cf412ba12b1d26a158c908227342d002655505ea7bfcd6ee7c37387aa8c6c8b7c816b290002099999373d4959c615206de802366613d95841f8257db6f98a98a0fe6d923ee51bff001312ab52acd2e8ca3ca3dc4a7372a85e5aed651ec2711b6d7c5c0b1d897218ee60711cdb32e846b9882c01115d8e559a4e6d39e919cb6259ba826987694d96a5447901d58efa899c4557a941ca7941d0fb19879b936dc55ac62bc8d30ca1c3c9e7a4d83cc1f0899b45031aab6ba1aa25c820926652e3b5d507c27b09441ce0903b4be83571074a109e57daaf7ed1d8e55396d7612d6ca9cc1c020efd0040b00f0dcdcdc261844e1f89cede630e83b423c1562aca314b68b74102aa8d0137e244648d5c0b2bac2f53dfe737d466fc29cac8a37e55ac9befa32ecbc9b80165acc076d98bc4335142ae43803b0dc19170b3cc16307ffab7d6599f9762957bdd94fd899b8f7596050ee4851a5dfda576d95b87462ac3b1131b2adadcb2d8413dc89f8abad5d3d8c47f330655d58d258c3f632eb5ec62ccc4982eb2b24a311b1a3a95e55f4efcbb5977df465d95917002cb59b5db660e239aa005c8b001dbacf3adf33cce73cfbdf36facb33b32d428f7bb29ee09f1022ac0b3535eac7a1afb55044a96b40aa3a011840b2b4248004a3142e99ba9f027d02058e91500f9ec3e23e1a9a9a334675f4a9d19559d233c6684c309f40102c5580786a6a1135e201275303185350247c4de044aa87b0f4129a12b1fcfc0f8efc1608c77fa061f119cb02ce59cb39672c2b0afa11c89cfb84c2613e811445100f51108f0e1b8bcefe630e83b78d38e5f45ba095a2a8d010c30c27c44584fe84afc47f78166a6bc3535350ac290ace5846a299b84fa544510083d6651435d60412bad6b4545ec20058e80956385eadd4c58b1a184f8133717f4647c47f79af91a85672c61eb02288041eb335b9838a29af988f89a5753587a4aea5ac74f0116346f0266e08aba1fa36fa8fefebd7a088c211ea51144107c8e1b8be63f98c3a0ed2ac52da2fd04e50a340788310c68d0984cea4e8444e5fdff0048df51f1a716db919d7940074493a9f84b7cd158e52c46fa10655876da8cebca003ad9204b71ada9d5597a9ed1b876429d7c1bf60c37191958a9041df697e35b415162eb63625953d610b0fa86c418b69f2fb0e71b049d43c3321f7ca6b3a1be8c20acb58106b64ea7e539254b7355af7e711786643f99a29a42013cc35d65f897d0ca1d7eaec41d832ea1e9b0a38ea2514597dab5d636c61a2c4b8d4c34c1b52ec5ba8b45762e98cfc35a2e3572edc1ec21c1bd413f09d7700826538f6dc4f22f41dcf6025b8b6d4bcc7447b83b95e1dd620600007b1275b8d8f6ada2b65d31ed1f0321437453cbdc0209955165c4845debbcaf86e4bd88a14104f707731306ba2b51aea0468d344c21bda00ded10c263184cea4e84440a3f4adf51f1c6151c0bbcc62abe62f503730854330796c59791ba91afb4a511f06c0d6041e6f733301538880f32a8e8fefb333c919b6107aec46a7cdcea491d456acfff006132abbedc577b134c8fb1fb199bfeaf17fcb996a4d386a07535cc8618949a54ff007aff0059f61ed0caff00dd777f9ab312b47e1d92af6041e6275333d7cba70ab56e741d43fbce2a3fd31ff65ffc4e1945be4645c8bb6d72a7ee665d2e2fc5b99745f41bf71323fd22cb17fe3a9f63f9ac3d2fe20cbf505e931294bd8a9b595faeba4b36bc3eb0bf7b1b9a2e3d6d8cf62da495d732ebde712245a8a3e808bcb17ad3825beaf3081fb415aa64e4d89687701be09cc5786d8507c46d01b5383e0be2e3abbfd6e4123d87815f78da1f6858c2c67318af34a44b0113449d0888147e99bea3e2b79143d3a1a66077fb4c7bcd16070013a2279ede4355a1a2dcdb8325bc94ac80795b60c7cf567367e1939fdfacfc65babb7d5ace85a5390f573fdc3290418997aad52ca95c2fd3bfb45ce7190b69453ca34abf612ccba5892715093fccc3dcc5c865c77a7434cc0ee2e432e3594e869d81dfed06530c7f24a8203f303ed326f6c8b4d84004811b258d15d20682927a7dc995653ad22b20101c30262e658b9472001b27644fc659f896bc000b771f68334292d5d08adef29ca6ac32950c8dd4a99665eea6ad2a5456d6f51733e054b2a570bd89ee23e5bb5a8e40013e951d846e20eb93e7201be6d99c031edbedbef65e5a58fd3dc130275f068f0986130340f37be91542fe9dbea3f31a1f52f80f43385ef1ec2d3030ecccc94a94773d4fb098d8f5e3d29520d051e2c63186130cdc52c4e8455d0fd437d47e6187d420f43da17a0849276600588006c99c0f868c3c60ce3fbc71b3e26398c6130c3154b1d0888147ea5bea3f318fac41e04803ac7b49e83c7fb3bc2fceb3f136afc0bf4ff33e8631cc26130c552c622851faa6fa8fcb31be4031ac0b198b1f1e1f84f9992952f6fb9f6128a528a52a41a0a3c498cd18c30c0a58c550a3f56df51fdfe5984cdcdfa8bfb7a154b3050364ce0bc3570b18161fde38db78084c668c6130c0a58c0001facded8feff2898cd099b9b80cdf81204249f4ff0067b86877fc4da3e15fa44e685a2b7785a3342618149300007eb55f4c603f20c768cd37e806737ab0711b2af541dbbb194f2555aa20d051a105b3cc88fd613e0601b806bf5d6ae98995b407d6ed19bd03e42a9660a06c99c3b0862d001fadbab1f0eb398c0fa221685a282deb09b1fa9b537b9d54c5681a6e6e6e6e168ede8307c8e0b81b3f8871fe11e3a9a9cb0ef51109ea7b789200d93a12fe2b4d7d107318fc5b25be9d2c3c432ff8a6625a6dc7adcf723ac5fa7c6c7088cc7b013f35c4f76897d4f59b15b6b3f35c4f7694df55cbcc8db12fbeba139dfb419151a45bbd2910714c52dad9fde2b060083b07e73096d701222b40d39a7342d19a1f46be470fc36cabc0d7c23ab1888a8aaaa3400f505df7f124004999f9cf739453a41e8e1c08c4ae7659c5725f1f0dec43a6e9a9c333d7328d9e8ebd184ccff66b7fc329b1463ba9a3989ff8bda70e0a312ed375ebb1316cc454b05c9b6fb4e0eadcf6b00424e2dfecbffec235365dc32a54ee3ac4b2954155f46b47ea1d0cc7158a53cb3b5d74f9cc232ee595ca128af15aeb6ae73cfca06c8968c7ab2d4795b46553cbbf7998a9564da8834a1ba08e96a005ab600fdc88b5627994d069d974079f98fde63b6383e5b631b1cb74ea44cca1572deba50e87603ac08c96a87ac9ebd54f4265b454d8b658315aa6565d6c9ebbfde7e1f0fce38fe41e6157373f31efcbb98ab5b2e8e1b59f17d4098d5d34e65d57e1cda01d2aecccfa6bacd252b29ce9b2a7ede9ad1ac75451b24cc0c35c5a1547d47ab1f52afa33dca62d847b7a29adadb1507dcca2b088aa3b288e7ed3fb47960b250a7b7569fd9eb1973797eccb3294b51600364acc76cda2a645a37b983896d755cce3458741387618e57f3aaebbe9b99699558538da0a3ba812d39d99ca8d5f28df597e3dc315529721947ff32c39b7562a6a367fead4c3a5a9c7446eff003888442b2bfc3b633556395f8f9810372e38f6e52b172115546f5ed388db8f6f2f92493cecc491aef2cc8c9b542d96b301d81312fc4f329bcd8c19100e5e5f698b72d373d877d5580fdcc4b6c47e74721bdc4a3258e65575eecda61b27a99976d6ea4ae5bbfc5be5227e270fcd391e6b731ab979397efcba94e4d3f85ad3f12f532b12743bee526a17bb364b2fb381d4ccfbd2e6a82bb3f2268b1fbfa782e072afe21c753f48f52afa722af36974f711d1918a91d4780049d01b3386e09a873b8f8cce8a2711cfaf1292c4edcfd225d6bdd6358e7658cfecee23733e430e9ad2ccbb5aac6b6c5eeaa4889c56ebaba2ba406b9c6dbd965d9f562844b58b584750a265f17ad30c5d4f524e844e298ff865b9f637d35aea4ca789635a96b024720db02346271ac2774505be2ec7532389e363d851c36c77204bb88e2d54a5a5b61fe9d77328e298d75a2a5e60dade889f9be279a10961b3ad91d27e62d5f10c84b2c02a440446e278eb4a5adcc031f846ba995f12c67aadb0123cb1b6047512de2755d8d6b536152a012da8fc42ac7aa9369662ca0ec08bc4719b18dea4951df43aca389e35e5d5490ca36411a838e609206dba9d768082011d8f89861844221585611f3386611c9bc123e05ea6280a0003a0f11e0abefebcdc04c81ccbd1e270cca672a5743de61f0dae9d31eadef19d2b1dc4cfe3b452196a3cefff00d4baec8cbb4b312cc670fe056da55ef0553dbee6575a548a8834a2672b3e25caa09254e84ab875f8d8f464d2ade6afd69ee2655590725728576f2ba68851d418706c3c32ee4adf9998372b779955646463e2dab4ba9a8e8afdff00798f8cee9976f97686351039bef2cc4b7f2dc25149e757d91aea265a6635f7aba5a415f8397b438d7578b8566807ad8fc0fd3729b322fe265c2a07151e8bd44b29cbb1143d571b0580b7b4cae1d7e466dcc158690153ae8489935e5df5e35de53a9afa3281d7f712bc577c7ccb0576f33268737732ea928e0814a8462a363ee4cc8195cd8ff0d86af287d1ef29a73aac2b8256e09b7647df531a8b8e617f2ad0a69236d3f0977e5053c93cfe66f5aeb2804515023a841e27c088443088d09f974d2f758a8a3a9330f1971a9545ff00b9f4aa6be4ec4625811b97f0aaef279efb48f6dc4e0180bdd58fee653878d4ff00aba947cbbb1e9bd40b10309462e3d1bf2ab0bbf4dd8f4de145881b47620000007ad8104886110c319808767e6707c0f2abf39c7c6ddbf90f400498a807fc9f88e31aae2e07c2d0f8310046727e49f4708c037dbe638f814fff00260007880498aa17fe50f5a58a5586c4c8e195a9dab910e00fe27ff51b85ecf5bbfa67e523f8dfd33f291fc6fe99f948fe37f4cfca47f1bfa61e103f8dfd33f281fc6fe99f938fe3ff004cfca07f1ffa67e4e3f8ff00d33f271fc7fe99f938fe3ff4cfc9c7f1ff00a60e0c363fbf3fff00331b1928a52b4ec04e4fe7393f9ce4fe715401ff0029ffc40045100001030203020d02050302050207000001000203041105122113311014202230323340415152719134611523425060245381164335446272a106632554738283b1d1ffda0008010100013f024c639e744ca41fa908983c1650b285942ca1582b05656ef3656560ac1650b28e0b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b26b6e5582b0560ac1582b0560ac1582b0560ac1582b0560ac1582b0560ac1582b0560b2a0c0ac1582b0560ac1582c8cf2591be4b237c953d235da91a292829a51ce62abc01ba984ff85341242fcaf6db818c2f759471860fe24d161ddecadd153c19cdcee405870d7d0c75519046be054d4f24323985bb95232cdcdfc4983c7bb81d1d3c19cdcee4d6803933514523f310a3195807f1102e7bb86f470405e6e7726b401fc61a2ddd80e8e180bcfd935a1a3f8c30775087470c25e7ec9ad0d16fe3005d6eee80749042643f64c6868e8872a28da699c6daa8a1646ccf2279ccedca1819b219b794f6e5790a311b606b9cd4d10cc0d828dd1b2ed704ed935a1d954791f2eed13fae7dd48d02269e0fcb6b0121398c7b3335461bb2b90b6917a142c69b928ba137e6d953b4173917c5e84dcae977689c626bad954ac6801c146627699548e8f51650301b92a7665769fb7345bba01d2410990fd93181a2c3b8d290da724a972d4c576ef0a08f34a027b5a5cde7ee55acdcf0a3c9c59b9f72e63222e8c2bddd753f60c54a79ea46bb6874f15369134701c9b36e64f9581b95aa236853a40475144e7b6f60865941bb5538b48f46517ea28bb64e1117ebbd543bf4f82a7eba93b42b201186deca46e68f7dedfb6b077403a4861323bec98c0c161dc99505b11665dea199d11b842aace738463545c49bae32765908bfdd6dcec8476515416022d744eb74f9f3b036c9ae2d3708559f16a7c85e75e07cd99a1b6e064f91b6cab8cffd013252d28d49b68db28e52c24d971aff00a02db73f3593a42e7664f9738dca37e43759f9f9aca490bcdd473167dd1373fb58d5016ee4074b0c264728e36b05874a3f86b077203a586232394718636c3f8d345fb901d2c51191ca38c31b61d38fe1805877103a58a2323aca2883077774b501c6cd5b6a9f4a867739f95c11dcb6d53e95b6a9f4a826325c1de13dd95a4ae3139dc16dea7c94136d1aa5739ace68d56deabd2b8cd48de1432ed197575757575512ccdb640b8dd4022e020745752bf23095c6ea08bd82a798c8db9e096aa4da16b02dbd57a54352f326578e0a999d18165c6a716b8098eccd079323f230b90a9a93b82e33543f4aa69b6acbf03aae7da16b6cb8c567a5445c580b86aaaea1f165cbe2b8cd67a51acaa6ef0146eccc69fb2aaaa92390358b8cd67a7ff0b8e54b5c330086ee4c95936d0b631b9719adf4ff00e15355bdf2647844d82e3b50e71c8dd1719acf4ffe152d4ba525aede148fc8c2ef25c6ea5dd56e8b8cd5fa5514db669277853ba46c64b05ca75656b45cb47c2a595d2c41cee940e9a389cf3a28e20c161dc47431fd51e13b8aa5ed64551d93bd9527669fd52a8f73bdf86a3b272a4ec95d5f9157d7621b87054764e517d2bd51751dc117d53f80fd58e0adfd2aa7b18943d9379355d8b95276414bd9b961fd99f7e083eb0f0e21d68d36ae1ca355573c7232cd50764cf655640aa612b8e41e6aaa6648f665f34ddc390552fd54befc0dfae4fea1587feb477154bf512aa9ec5feca87b24e1763bd9619fee7bf0577d3bd61ff4e3a40de9a38cbcd828a20c6d87721cb99b216f316caad526931cdbf8276ca7a88c55562a8ad7779aa8ec9deca93b352750aa3dcef753bcb19709ada970b828c55277a8999196e555f5988cad601757550f7ba4d98429ea00b266d607869f1e08bea9fc07eac701dacee3f6469ea48b154af7e7319f0e4d5762e549d9052f66e587f667df81d4b51b42e6a78ac8c662553c8648838a921649d60b8953fa555d3c51b2ed0a0ec99eca4a78a537705c469fd2aaa18e27b328f14ddc390552fd54befc0dfae4fea1587feb477154bf5122a8ec5feca83b34f1689decb0cff73df82bbe9dea89c1b4b72a29592b73377744074d1c65e6c1451358dee63a18feacf09dc552f6d22a9ec5deca8fb252750aa2dcef7557d9283b31d0557598aab73133aa13bea8705476cc5e0a2faa7f01fab08ee549d77f043f52fe4d5762e549d9052f66e541d99f745c1bbd020f8aacec4aa2ec1bc388766141d933db86bfaf1a6ee1c82a97ea64f7574dfae4fea1541fad13a154bf5122a8ec5fecb0db6c94a46cddecb0cff73df82bbe9dea2fa02b0dec3fcf41656e9a38cbcd828a211b7ba0e5be0a82e367ae2d53eb5053398fcce28ee469ea7d6b8b54fad53c063b927529edcec2d5c5671b9cb8b54fad410ec9aaa233232c17169c7ea5b0a8f528c39adb38ebc99a391d6ca51a698ef2171698ef210d029a9dce7e6695b0a8f526d3499c171e09299e5e5cc2b8bd4fad434cf0fcce3c069250e395cb8b54fad53d3b98e2e71e4c8ccec2d5c56a06e72e2b527f5aa78b64cb29a212b32ae27503aaf468ea4ef7850c7b3606f0d553cb2b858e8a36e56347db866a596497366d10e4c9472ed0b98edeb8ad5fac2a7a57b24cef28ea1713981391cb8ad57ad535398892e3a9463da34b5710aa6f55e2cb8956ff00702a3a6d834df7953b1ef8c861b14686b1c2c5e1710abb5b38b2a480c31653bf961bd3c71979b05144231dd47f0868b0e9437a78e32f360a288463bb0fe0ec6f8f481b741b6e9d91979b05144183bb8e59ad881f15c762fba0411709f551b1d6375c762fba8e46c82e14b3323deb8ec5f7514ec93727bc31b72b8ec5f742b2226daa3a05c722fbae3917dd037174fa8631d6375c6e3fba63daf1709c7282571b8feea39d921d13de18db95c722fba6d5c64db557b0ba8e66484db845430c993c785ce0d175c7a1fba8aa1929b0bf7d68b9e90355ba7630bcd828a20c1de072f66cf48552c6888e8153f62d458c3fa42746cca79a1516e7fbaa8eddab66cf4850e954e559d928b63b36df2aa8c9b48f2db7a97a8e54bb3ca735b7aaad9ecf4b287b267b22c69f04e632c79a372a4ea952f66ef654ad698b720d0370557d97f9516cb20eaa9f26d1996c9fd93bd951753869fea24e19fb272a4634c7a80835a370efad161d186f70630b8d828a30c1de47289b0bae3150f2723344fe3720ca6351372b005299037982e53e4abca6ec5456c854ff0050ce08bea9ca48c3db62b88c5e654d0b62923b79a22e2cb88c5e6554533238ee2ea1ec99eca52f0de60d539f5563cc549d4520258e1f651f19636c18a199ee716b86a9ec0f6d8ae251f995242d8e46593fb277b282a446db652b8f37d0535d985d366114f21b5f55c7dbe82a2944adb8528263700a3e3718b08d53cef73cb1e35ef8c6f8f4405d06dbb83185c6c1451860ef4394fea3bd952c8c6e6b95b78bd610374658c6f704e9a2ca79c1516e7fbaa9d276adbc5eb0a137aa711c35646d63f7e1ad2364a1ec99ec9d2301b1704e963ca79c152754a7cad61175b68bd41426f52fb70d491b5627f64ef654ae8c339c42a97c463e690a0ecdaa22c13c9994924191da8545d42a4999191996de2f5850106a9c477b68b956e8437b8b185c6c1471860ef639445c2e2507915c4a0f229ad0d1609f4b13cdcae2507914c63582cd5242c93acb8941e45470c71f5470ba08dcfcc77f0c90b24b6640002c13e9a279b95c521f2298c6b0582731afde171487c8a8e1647d5e130465f98ef56d2cb89c3e4571383c8a000164ea585c6e42e25079151c6d8c59a9f1b1e39c171283c8a8e08e3ea8ef6d6d87421bdc5ac2e2a3883077c1fc0e36f8f4005d06dbb8b585c5471860efa3f81345cf40d6a03b8b5a5c5471868efc3f8131b61cb6b3b935a5c53181a3bf8fe031b7c79405d06dbb935a5c53181a3f601fc000b943921a80ee4d69714c6068fd847f00636c3921bdcd8c2e298c0d1d04f8e470cce8f64490bfd42cfec397fa859fd872a0c51958f7b432d945d55d70a573016139954e2229f65cc273a92511b0b8f82ff50b3fb0e5455adaa8f3e5cbee8e20c6d5b29f2df378ab8f3599be615c79f0498eb192ba3d8bb4365538ac74f131e5b7cde0a87126d5e6b30b6de6aab11653398dcb9afe4abb14651b981ccbe6175fea18ff00b0e5fea167f61ca9f1c8e695b1ec88bf247efec6f8f200ba02ddcd8c2e298c0d1d0c2c6bb189b30beaaa313a38667c7c5f72a3aba4ab2f6882d60b05e6d756fb27e3703e50d7437d557d7430088ba2cd7dc8cceaff00ce69cad66f1e6bf17a31ff002c9b56c9b0e91f1b722c22bd9b48e37b2ef2eeb27524a6b76db5e6f92a913cf8998592dae9f4733a8d908979e3c57e33c57f25cd24b7c5471d3cd1093662ee1758b51cb0f38bee09d02c3eae29a190323ca5ac583da5927daf3ac7458d006be8c7d95655d2521634c17b854f89d1cd3323e2fbd4cc6b7188728b6bc91fbf0172ad6e10dee91b0bca630347454fff0019996211486b26b31dbfc9604c7b6496ed234583fd7577fda835c6a741fad46fa731461c597b2c5a89920ce25c961bbcd60f0b24a2a969b795d4d8408a2716d55feca0665c16725b6721c64eeda7fe5524d2d24ed99d1b8dbcd5047b69f8ded7afae4f24f100d5c19fe562b883e5fca11e40d775878a898fa08d929066cfe07c156d7b6189bb2843b3b75b782609f6e086bc5dcb18faea1f658eb1ee922b349d161f1482b21bb1dbfc9547fc661e48fdf98db0e10dee91c65e546c0d1d1cb2cb4d894b208c9d57e2f21ff943f0bf18975b529f85826735154f7348bb1612d04d5dc79aa2a57d43e77ed08d99ba7bff00128dcfcf932f879ac35ae6619597d15053bdd0719ce4e53d5535509b0a9eedc86db950384585364d9e62abdc25c29d26cf2954cd75152c5579af71d558ad5edb0f6bc3b5242c49a3f0ea236d54f88474f490681da26ff485a47e6ed3ff000ab2b594c61fca1cf58e671534af6b49b357e312e97a53f0bf17907fca1f8514b2d4e2514863235e48fdf636f0017405bba4719794c6060e9062838ebe17b5800f15538ccf0bdd6a76965f472663b53275299a561d595150e904b064e6aa5c3194fb5b3c9ce9f0c98739c22697897adf65353c14d550ece6cc2faaaaaaa53452012b6f916115b344d0cd9732fab96294d4d519e58e6bbeda3078aa3adafa68444292f655d8b4f344e85f086a9637bf04a70d6dcd95360d4f3345e739fd2aae0a3969e380d45b66a930833caf6b8b8346e2b0385f0be7da34dafe2b1b9627cf064703ce588d6cf4db3d9c01e326a57fa8a5fec31536333ccf6de9da197d5c99534ae20091b7e48fdf1a2e500837bac719794c6068d3a5c629e9dae748d939f7dca2a2655e1b0b5ca5d861bac2e0f779238d56461a4c360554e252e561a719cdb5b29f18ac68b490dae15ca19dc6c2ea8e5963b523d96cca3c3df4f8a401b98b2fa9595be416334b4c33c81fcff24daa75360f4ef02fa2c12674b88971f1054981c4f91d2190ea6e9b53491303368dd1498ecdcf6860f10b0aa26d6bdef7bb76ab1aab9202c85adbe76292391879edb5d53d6cada7753b1b7cc5613869e6ccf2e0e0777247ef91b106f758e32f298c0d1a74d5b85506674d339c2ff742ab138b994d18310ea9b28b0ea0a825c5cedaef22fe29cc129d956f3226766551d053d1873a3275f355c70bab236b37555650c3be92ee6f8a84bdb330b07383b4550ec49d3719922d42c3f12c4aa668eec6ecc9d4d962350fa7a6748cdea5a2e3949c6ac4ca54a33e1915337b56ef6a0e8b0f884b0bbf3fc4150e294af85b9e5198b7553e1985f6b23dc337dd54e1f4c4b38a12f1fa9523f0fa28ddb3979c46b74d9ab310aa8a42db861b68b11c3a19a1da3ef76b5612ca0004b2c96787215b52faa6086c61f13c91ca7bb2b1c7c82655d4bc5db1051cd525e03a2b055150e89f1b40eb295e5919726d554b85c421475977e491b94a71b3494caba87f5620b8dcaded22b051c8d91b76f032bb34d94816e0754384e23b0e096a1cc99acb0d54d24cd2324775b7abfeca3593870698c5f82573dadbb45ca3515205f629b5550f171104c9652d717b2d64caaa878bb6209b5673e591965e0a09cc85d71bb86a6a3620586aa9e5dab2e9eecad2553d66d5f95c004e36693f654d3195b7214d3b221aae33527ab0e89954ecc1b232cae9d584bad1b332e335237c2a1944adb8534ec8b7ef5c66a4ea21d14354d90e53a394cf31c65c9b5552e171085155ddf91edca7824abb3b2b1b98ae353b75743a2a42d9c66080b7436e92388bca634345ba7c5aba674cf84f5415867d143eca27d5b6b67e2edb9cc5414d535a6d58c203750a69a081a18f75aeb16a48209212ddcf3aa826c2a189ec6ca2ce4f6e1318324728ce351eea86be3ab83673bc66277234e6929246d30bbbc1564d8aba022661caa8b10ad01b0c22ea8a8f515120b4aeeb2c6194633163bf32fb95360d4afa68e4f12dba7b6e725673636f5100c8fe879c0f5d620ca6bb362ebb8f5961d0e254ce004472b8eaa5ca6039f75b55590c06a5aca539810b097b69e3104ba3cf872472a6ec9feca85cd10eae1bd0734ee7055bdb40aa7b072a2ec02abb1a88b2ef4feccfb2c3bb37fba7343858aa6fcba87b3c155c99213f74f832d3b1fe20a89f9e369527d6b782a7eae3e09e61132ea9a224ed5fbcf0cdd93fd950f64a5ecddeca83b23eeab6c5d1db7a1d9ff8545be4f7e1edaafecd54df973be353764e4d6111095bbc141e1f013ff4aa0ec8fba60db55bafb82d022633e21573f2c3a78aa6883236a2e6f8909b97f4d945f9d54e27c382b5b90b241e6a737a5bfd951f60d5536353165550fc90b8aa28c08f39de5346d5d95537f4d8818bc1dc9b7708a22f29ad0d16ee18c8c3f33b25f6d7d550e2d45152c6c738dc0f254bfd2cf24f268d7f5555e218a43cfcc3238f3744e7bcb73623ff00e3b202b312781a1630fb68ab68708a66105ae0fb69aac323c324bb670ecc5dcd551498752c9962044ffa5523b19e311edb2e4beaaa22ab9aa8c6eb71755b454f87c267a71678f1deb0cc499511b1ae75e5b6ba2e278454d4b9995c64f152e2b5904ce858f1918eb0d3c1495b85d542c1505c4aa9a37d2c77a0160e6f3aea885266938c5f3f87bac34d6e57719b6fe6a918d7b0b4ee2a7a586971781910b0b29a8e7762514c073472472a6ec9feca92963923bbbcd454d1c46ed55bdb40aa7b072a78257c776cb651de09ed26b7f152750fb2c3bb37fbf043ceac71f255b203335be037a75646599721dcb0f934733c94bf58ce0a8fac8d39c1adb94c0ea9973bbaa3913764ff006543d9297b377b2a68647b096c96d559d04c369cebf8adedff000a8b7c9efc12bf2464aa69c47725a492a59c3a563c023cd486f093f6546d0e8082a226232c47c8d9507647dd53736aa4694f607b6c55442d85ccca4ef55e3f25a542e0e8dbeca5a563c9712561fba4f754bcca891a7c783103cc6b7c49530b527f80a08267460896ca2bc13da4d6fe2ab3581ca99c5d135aa9a1c8dfba1f9b8b661e1dc6dc31445e7ec9ad0d161dc717a29db349316f349e08b38899c73a96e62395a2f57d97fb4aa6ae59cd9c6e06e549592d3bb98eb02755897ff10fcd8350c1aaa3a1aa97f3221d5299453be1324a3f3fc1535557b31086199dbcaad6e266776c7a8ab6aeb7586672c26a63a7a9cefdd64e92299e4d0f6ca9e0a09dce6b85e51d7f7589f121cd807381d5471e30433d361f0aaa0c3e99a0c8de79ff00f6a8eaf109aefcdcc69e72acc5657cac6d3bd4b26c5a4d57d48eaac1ea1f3536679d79239528bc6ff6544c7362b385b5e0ab63dd2c360a704c2e015234b610085570ed1971d60a3ce69f51ad953ba78411b13bd39f572e819954106c587cd52c6e323e47b558792746f6550735ba1deaaa02fcae6f582e315205b62a082432ed64dfe0ab76ce21ad69b264d3b1a00a75c66a3fb086ee0985e372a36b9b1ea149ab1deca898e6c6730b6aaa62da467cd53e7d959c35548c734bee382b03dc1ad68f74c606b40b29e3cf1916516d38b16969baa36b9b1ea2cab6173807337aa1639b1f385b55514e5c43d9a38213d537430dd164f3b9a5cdca027303d994a0da9a73cd199ab6f54ed36365490ba26bb378aa8a7739db46759718aa1a6c547048f93692ff0080aa4130b800a95a5b08042ac687b74eb04c2e730665153d444eda46ccc3c93aa6be4195b065fbaa2a3d8025dabcefee71425c7ec9ad0d1dcab712c3eee8666136504b878ad7ba48ef0db40871aaf90b237f31bd5054b8562b231ad7bc16b770542691a6464ecb9dcd4da7a6a36c86aa30738fcb58230be92a1a3c516e21453085b2e5da1f0555558ad2c9924a8374daf88d3b9cfb9a9fd2f54e31aa88c48ca8d0aadc3ab98d74d310549250f118dad8ff003bc4aa534543491d418f5f309f57236a66921796e62b04821a99e4dbb73fbac45957f97c5df95addeb15ab655189adbe61bd458562b1b1cd63c06bb784fa7928aa633379dd5555e1d5fcd6c7f9c74692a828712a7919cffcbbea3923f7526c9d25f8228cc8eb26b434587748a22e3f64001dce5a1a5712e7305d075353e2336d19762c14b4d54c5ba0f054b1544734ee91f7691cd5ff0035ff00deb18d7897f846a29a8a46461bd655d1c2e81f2e99832e136b627d3384c3349e7c140c91f8535b1bace55ec9198539b23aee54b598732063648aee03553d452368daf732ecf2585c70cf5753cde6f82c1806d65480a4adaa333d9b43d6214d452d3c90b9ff00a8aaa86a249a0746fb340d56345adaa84bb5037a99cca8ad8f8a8caa8eadd4ef6d34c6ef3c91fba39e022e27800baa68766dfbf748612fd7c1000774c5f16eb42c0e6b81deb0ba8a2aa2227c1cfb6ae2ab686a28dfb48e5b071fd2994188be30fe3bbc2735ed79f3baa4c418d63c4ec7486dcdfb2c34ede9677c9ce7377129f55567334c8fb282a29d948e8dd05dfea4ca88051491183f30ee7265455462cd7bc0500acad90426576be69986c8eac7d367176f8a99f05151304ec12595156b20aa99fb2395fb82c3689f1c8f9cb85a4f04fc0a66c86532b37e652b3f14ca23764d979afc2f13ff00e795460d5658647d487582c1aaa9999637c1779768e551ff001987923f73749e5c8a486e739ee90c25da9dc80b775c51aee3b369e298e91aee6dc152d5323a4873b735c2ae6cd0b592897479dcbf16a5d9e5d86b6545511c6650e8af9f72a1a614304b99c0a8f14a37ccd66c06aeb29db491465f901b265452ba91f3ec469e084d4c68f8c6c3fc26e31030ddb4c981f5f884a63390bb551d1cf5352ea7326e550ea6a0a78b3461c772c3f1465512d6b2d60aa2776259c31d93677ba6edd9216b491aa6bdf44360f7e632ee3e49903e0a3983df7bb4aa09d822e2e59cf71d1ca965653cec81fce793d6e48fdc4b804e793c8863da3ec9ad0d16ee70419b53b9016eedc7227d5be1753345bf5952c31d0cefaa1966cda6cc2fa6fce3f9bb4fd1e9588d316b592edaf9cf53d2aa688526c9db50fbeb65f8bb76597f0ffd36bd951d0cb54d717d498fec50c005f4ad6dd7149a96ba363a573dbe7e0ab206326e34c91a5acff6878a18847c4b6bb01ffd34eac85b45c64d2b7fedb2a086374fc7768d6ed35c9e4b8e1a3c4249b665c14ce9ea2573b2bece75d423f0963663cfda0ddbaca2c14b9db56d5ef398808c506c080184809a676ccd91cd79ca7c5421d8939b367d9866f6f9ac5a364989c6c8dcd682d1a854982964ec9b8ce7b7247ee0e92c89bf200b954f0ecdbf7ee70419b5280b777c71d1f17e69e75d4113e929d955d7cda6558592ea895d28b03e69f82c73bdc44ff755b43c58b0b1f9d458d8bb19b1f20b1fbb658f2e9a2c2e8cc8e123e5ca5ae1a2c49a38ac87c552d4491cec775ac77235539abdb6c4dbc90a99310fe98c5903bc50ff00d3c7fbcabdf26cf8b6cbaa7aca3c59d0c71b1d4fbb458c3f8c534258b0fc38c119e7df3b552d2b291cfcd2f5963356da6b4623ebb161923450d46b6362a9a092a2660d753bd50d2f1687266bf247edc4d93a4bf2a920bf3cf73820beae56b778a9c0993cae90ceed7c11adaba5fc86d2676b37151ca7157189edd8e5f25454f4944f93faccd716d5536191c3b43b52ecfe69ff00fa7e26974bb7769ceb5909995ff9d210c747b9be6a4aa964aea73247b3b3956d78927e2acca5ae1d60a5a29682b186263a50dd77215ffd2e7d8b76bfdb5438ac9355b617d3358b8fc82b648a48f2c60f5cae3343fdc8d63916d69e1d932faf82c2a8e08b9db6ceeb6ad3e0a4aca66b5df9acb8f0ba6cd1e2327e6ca22c874d77ac5e3157514e22399b96c48f05f8152b6c0d6104f826c8dc2ea5949a39a75ce7eea39237b6ed703c91fb6b9e022e27950c4647a68ca2ddca083c5ddeabab8c6db43abfc9498bd6c62ef840ff000b047ed2a6671f152e1f40657133eb7f34f9a38631cef0d14b8c5667d9b9960e3652e194b4bcfda7386a023b2af8def7bacf668d1e6b0ca18f335f33ad25f72af97614d24a06ad0a91d4d33c5549200ff255359b1c48cd1ea9ae8712a5635ceb38ea5621836c22cd11712a95bfd1c41de8527f4923df4dcf73b78549863ea36ce9730f10a970e8b33f6ee2cf254fc4e8a19724a1c77aa8c426a8a863eda83a2c4679e69f34adcaeb2c03e8f923f6c749e5cb02e553c5b36772860f1777bb61b0563e535003fc42ac9b0bab8f23ea85aea91b845292595435430cc32aa47ba39f33b7e8a1a69ab1f6a96160675554e1b0cfb2cc4f3372c7e9a67bd858c2401bd60f43048c74f2388d9b9626f7beac54d38cec68eb2755c95583d43dfbeca870ca39291b34d216aaec328e3a474d0c85cb0482886cde25fcdb6ad52cf0c0dbc8f0d0aab15c4232efcb1b3279a7cd45535b46f336ced9fcd7e2b47b1beddb9b2aacad7d6ccd0fb5b327e0d864658d7cc439db82aea46d1d4c5b1b9f2552f967ad671c1b3d35f6546e9219591d30cf078bb923f6a2e0139e4f41470feb3dca083c4f7ce2d1d462d331fbae9f4783b1c5ae7ea14787e17366d9bae405823432aeb1a3c1aa8316cd2c8d9dde3a2ae9aad862300e6feaf658a62dfa6175c11aaa7aca86b1f033fdc466aba488d3b858151c959c4646b47e578aa19e8ce1ed8667d9574f4630f7430beeb05a189b0c538eb16ac49b88d439d1e4e65d4916272c7146e8f9ac589d24d25240d63350a0a18e36bf8df374e6a1944c3cb329a7c3277c4f7c9ab068b16aa8dd511be275f2a9f8dd683505ba0d2eb02aa81b088cbb9d7e48fda5cf57bf41044647fd90000b0ee30c16d4f7da7ff8cccb11fad9bdd601dacbecb07faeaeff00b551710dbc86a49eb68aaab269e3b509ccd039decb06c3e9ea98f3283bd57d3d3d157d3e4d1b7b955ac656d48a86eb00de54f3e67714a2378dea9305a8db0db47ccf7588c2c86a9cc66e58562a62736395f68c0f2589d73a3a412c07c5325c79ed0e6b5b62aa2b718a7b19728baafe20e8a03564f5744f6e0194e573aea9e86a2a731899700a83070da595d3b2ce034d560fb2fc2e5daf5331baa7a269ae8e5a617881dfc91fb39364e7dfa1009360a08846cee16ba860b6a7bf7188e9f1699cfdd7524d8348f2f70172a1abc2a0cc63b0242c0dc1f5958ef02d47f06325b28bdd43450450c9b16db3b10e3f40f11825b9d55edf8cc3c6f5ff00f89d14b330b687b15053b69c6cedfd57e85931cf539576c362e12fd42c2b0a74a5b248cbc642aca0c424bc4d0767e0154e27b1a78628dd67b3472a979c4a18db16ae6f5962f5714ec818ddec1629b6cc2fb95156e1b0f322d33158a8ad2dbc44e4cbaaa3ac747689cefca279c161dc5b63f93d5e48fd99cfb226fd15243facf7002ea1872ea77f7f930da391c5ce8ee4afc2283fb4bf08a0fed2828e9a9f36cd96b85f8550df36cb54058594b4904af0f7b6e46e53d0d2cc419197b2869e2a76e58db609d4901984c5bcf1b8f04986d24afccf8ee5471b22606b46837703b0ba27b8b8c5a950d0d340498d964ec2a86f7d92fc2283fb49b855135c088b509cc6b9994ee5f84507f69430450372c62c3923f64ba73fcba3822ceefb21a0e9c024a8610ddfbff7a1fb197d9124f46d1736513031b6e9dad2e360a288307dff007b1fb139fe5d2d3456e71e8072dad2e360a38833f7c1fb01759175fa5823ceefb74ec617151c4183a42e037ada33cff700877e73fa66b4b8d946cc8db74cc617951c6183a5a9f0e08faa3f6f1c03bd93645d7e9e9e3b0b9e8c1e18e32f298c0d1a72cb80de53aae26f8a35edf06a35eff4ae3f22a79768cbf054f87033aa3f6f1df0bfb8411e637e96f751445e7ec98c0d1ca7bdad1a952d77a13a47bb79e4d01d0f0546f437a6eee4d4486365c2e3d2fd971f97eca9eac49a1dea5765612b8f4bf65c7e4fb286b43cd8e9c35352f8df60a92674ad24a9e76c411ae97c2c995cebf38263c3db71dec77a26c8bafdc18dcc6c98d0d6dba5a784bcfd935a1a3952cad8db72a699d21e5d07eae098f3d462ee1c15755b0caa09992b730e1adec8a81a1d2005545344d8c90a1bed5b653f64531b99e02342dcbbd755ca03789a782bbb5587751deeab7b72a94407afbd4b45af315342e886a7bd8ef25eafdc608b28bf4b05397ea7726b434729ceca2ea794c8fe8280734a3b938dc950375bf062aee7b42a2a93148078140dc5f82b7b229b9afa27326b6b754d2358fd429fb129a729ba7564845935ae7b946dcac0382bbb5587751deeaa69b69af8a7c3233784c9e461dea9e71237bd8e539d9412b8effedb9433896fa594b51b33d425432895b9ad6e4495418ecb94942b05c02c21492063332e39ff00b4e50ce25be96e191f91b7b5d71cff00da728e66bdb74fabd6c1a4a6d402eb65213df945ed75c67fe8298f0f6dc233d8f50a6ce1ceb65b7494f166373d2d3d3e6d4ee4d000e5d6bed1dbcfa1a66648829dd66db8226e56a26c1554bb499c7830f933c23edc15bd9154ee0d9012a4a98721d6ebf5277d37f8518ccf010a28916b206e60d5f881cdbb45c721cbd65349b47dd51b4b62f753d4ccd711b94354c736cf555b2cdcc587ef777b1ca9bb277b2a7ec9aa1fa9953faa551f667fee3c1b78bd610208b851fd5c8aaf733dd6f09ee6b1b72a92fcf3e6539ec6ef75936463b73814481bd3a78add60a9b73bdd41d7914dda47ee89006a8c9158f382a6ecd17306f29ce0e9db6e8d8c2e75935b945ba4a7a6bf39cad6e8310fd3d052c79e4fb2dc148ecce513331e0af9f6715afa9e1c2bb33c153197b2c17139571295414594ddca565e32028e9250f0504402a6a237bb17159bc943446f77a02caa298483ee9d4928f04da394ef5144236d877b1ca9bb272a770d937550fd44a9ee194ea9afb41a1fd49a7408d2404ee4d6868b04c3fd53d5511cdf743729c669e307721a2921649d64c82288ddaaaddccff28451582680068a0ebc8a5ed23f7551d51ee8450d90000d13dac76f595ad99b97a3823cade929e9bf53ba2af65d97f2e5b5a5c6c153c223629a4f0405ca63728523c31a49555399a427870e8f240382699b1373154f50c985c29eb2284d8a865dab6e3866a98e223314c707341e9aaeaf8be5d2f754f36d630ee555d5ec2dcdbaa7976b1075ba51ca22e2cb8a33d45471363dca481af3a92b89c7e6790fa763cdf5429580dee780c60bc3bcb80b95d3d81e2c57166fa8a63328b2740d26e9b0341ba9230f162b8b37d4535b9459181a4ef29b035a6fd153c57e71e920a6b6aee8e460734852c663791c96b4b8d82a6a611ea77a924cab57151c79539c1a2e55756194e56f5786929ccd20f24d686b401c189f605535508603e6a9299d50fda49b94b23208afe0b8fd4bc9c8cd15257ed4e476f55d2bdf2f3bc150d4cae2d611a5954e2043f2462e50c42763c095aa7a8b53191886273653a6aa9b117ba40d7aaca87c2d05a17e235237b5535489a3cca6c49f9f2c611c46a1839ccd55154be66389525754e773433728312799035e162dba351d5b60a467aaca9279e5e73b46a9b117ed32c41331099926595aaaea4c7007b10c4e4200b6b755b36564672837513cf15cc1be08e2153af315257ed5f95fbd56d4c90db2b77afc46a1a79cd4ca9cf4e641e486272dce89989cb9f9e131c1cd07923b8dd177758a3cee40585ba202ea0a7cba9dfd2cf009029237466c786281f21d02869d910fba92603408073ca6461aa49591b6ee2aaeb9d368deaf0c14ef99d603454f4ed85961c389f6054148f99ae23c150d41864d9bfcd62a49637c9533ea447cc60b28e9ea38c07e5f158af5a350db8b37fed501904dcd1772a86554d6ccc09ec7330e7072c258d2c9091e2a601b5ba79855b5663218029455ec49781658776737b2a3731951cf588cd03a2b0209587c9b3a791c993d54ee3b3014a2413b73efbac4fb38559c32b88d1091afa4259e4a98ca243905ca9e3aa988ccc556d73685a1de6b0ca76166723558b6e626cdb1a26951c95735cb00b283371d6df7e655758e126460550daad95e4b59517d1ccb0e00ce5626d0256aa5fa767247702e57eea05d431e46f440127450c019a9dfd3c91b1fbc27d0bafcd51d135bd657630274ae76e4c849d4acd1c637aa8c4d8dd23d54b34929e71e06c6f76e0a9f0c71d6451c4c8c59a3915d13e58acd0a820921610f0ab685cf7668c6aa3a79648367305c56b21243372a3a6a86bb3c8eff000b10a47cc016ef0a8e0a96bf9fd555341207ed224da7ae91c331b05510c8ea52c1a958741242c7878de54d473baab386e970aba8a49087b77ae2f5d230872a0a6961cf9c29e2a57ca6cfb15347046dd1f99ca860cf4ae07c53696b2171c88d0d599038eaaba9a69591868dc9b485d49b370d551d354c4e21cde6953504cc7e789474d5af782e75956c1249006b752a8217c30d9e3c56292b1d95a0a106da8dad51d357339addca1a1a86d435e4697deab286532678d3a9aba5673952d34aca6918e1a954549345292e1a2afa59a57b4b5aa00590b5a77f2474e5ddde9a2fd47a26b4b8d828600c1f7ee174650117c8edc10849eb14585ade68d54bc7cee1f09f4b5afeb5d0c36a0fd937097f8b828f0c85bbf54c86366e6f76930d85e6fa84dc2e069f129ad0d161d13b0d88c85e494d1945ba51d2972bf77863cee405ba1630bce8a289ac1dc4b02c8dfde4747745dde1a2e6ca28c31bd0c7197951c6183f8630dda0f445cafde69a2b738f431445e53181834fe1b4afbb2dd05d1777a822ccebf87431425e7ec9ac0d1fc35f52c63ac4a86431bae9ae0e171ca2eef6c6971b263035b6e82184bb53b935a00fe1b53531d3c65ce2aa6ba69a673f3704533a329950c778ab83c1745ddf29e2ca2fd04305f5280b7f0c748c66f2aab19a684687315595f3553eee3a7972413e6ae7cd5cf9ab9572ae55cab9572ae55cab9f3573e6ae7cd5cf9ab9f3573e6ae7cd5cf9ab9f3573e6ae7cd5cf9ab9f3573e6ae7cd5cf9ab9f3573e6ae7cd5cf9aceef5159ddea2b3bbd456777a8aceef5159ddea2b3bbd456777a8a1249eb3f2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2b6927addf2a57bfd451e1ffc4002b100002010204060301000301010000000000011121311041516120304071a1f1508191b160c1f0e1d1ffda0008010100013f2121082f5692de764d9364d91690b4049a0908442211088208442211088441088208e2820844081b46d8f447a242204081012090484081020408102040810204081020408102040810204081020408101a0d341760da368da368da368da368da368d8360d8360d8368da368da368da368da123c8432368da368da3687a7c1366e8ea73ee354561f9a6c14105f4971a10842eb18f890be05912fa844cc50e53c3294962920a20fad2c55177c84210bac631f1217c0bea14a44729b0010925c2cebb7c9c108421756c7c485f070942e9b5b96a0808492e356e4a1310bab7c6be0e174aaa2571cf04d9848497215b9284c4c4c5d4be42f8296afa546c44892492492492719f05145c956e4a10842175e85f032204a11d24a2a70493c2b0693d2e559c7ec61fa9096350d85e2531eef264950a77b43291724f94315e8b02a4b41365562b8d5dc8ca88817aed4705c46eb642846cc498a9024da911f162c4f22dcf2318542f1d665cc54963e6217c0c6e93579ad23a396adc56c4427d0d18e559d471c56917e460c5f2c93999bc1291df6159dc5742b4da0cf9a57626a34a5124932cc7510b201a21462f328820f00ea4610fe424ad6b8212e152627c942f8095cf46936257315bf4c5d47315b8a11b71748b342d607b87e93a8a8683744d3329f4625ba28ad86c3d4662032a40a2dea4f826329c8c1f467866e854790e3240aec4e0b47ec5228646a6b2b32ca917df58c92d890a41930e206c9e4a175e8da0811d1318947320d966c4144736ce62c13244c4c9279f3cb42ebe152fa296e473218ad988c8e72b73d3249249249e09e29249c1be5a175b3ba2d5e6c712a66c56473ece28208238e49249249249249249249249249279885d6252e0541d024d895cd444b6a23a4ba056c608208140889a50d87e0ed5c4a50343747e1b4fc1f221b7e855eb8ec355d7f0739b554363986d3f068ca63b101c30635ea2a346525e84a8f0351e4268b02d877ba891044a1b4fc119497866358d2680f6379d70edd1555c761ad2d23b153aacc3c22a343d0dafe11facc4091484ccbf856565d8dd941132aaccdb888ac9bd06947c2d2cd51636a20b93241e8382d07a1b70816011a124535a3e83455a7e1112a41a6c94431908fa97a7365128e6a9afd0afd0961041041041041fd64102afa38133e3f057805aeef124924f347291b02f918790531d6e15e0f18de3625fd042c1a19b89a340b8cac9e14b282428909b561e17058f08845feccf14bfbc8fd186f207f6c10b70d57d5cd7a9ce5f046477e8928410410461126a8f5d7e890b25e11f32b6748d4a1b5bb1efc1c39fee08548f712c328ee474f09249c3cb26fdc5252654606d5887b8d998323c8c7370855ea2a16a085b89642e31bc6c4a97d575236e16e5c105694d06f3f45a84e753c28a12da375fa531a4785c163c62ff006678a5dde78987f302cfdf810fe30befa2242ccb930d90f3a3e08492e8d28411c32b5256a7f5e12b51d5ccb185010bb960dfd910bf912b5e291ff6c17878495a9e78bf83c8256b82b879e36a1d78f4644eaf65852a9684269483abfc03c83c2e3e41e17058f0e86a5eeccf14753dc22e6587f302c8deacb850b70dd5ec8657b267f7f213b122e723a05449777d22538db0889a54d97e8e93988db25a0d3747e9b2fd1ecd02f5242a75a5dc6eba7e9309b96d94673224a12fe9b5fd1664709dd19775f6389e50b02d88b04cdbfe918ee1e0ba2a4da7e886bb6881c0a499b0fd2540df0efd0a9571dc740d3f4ae5d66a480e0b1447711c38bb88d1b1853d8cd894c5620889092e184a5293df11a2dc0b22d471e527b9b3fd27981bc4a052d2ddc36287fa0c4da592cdeaa93035dc4afad4926554edc7aa47391d04752ae6fa5b3a28206ba582082082305d3aaf3722486e410411cb4f411d5f6fa6b3a368687d2c61041047519ce5410302041041040d7141040aa08e974f6713709b1814522d30b5618f8a91b7f924290a76ff00249d7f63f5b36ff229e60e98d8e7b0d80a5a59a1b15246de0da969648db0e0a74d4ca91b051d2e1a35ac948b49d318227139bd91b1f92fc5bf5c8942e4c104f712220820820820688c208208c1241d5f5ea2ce37ff00883e52beb0ad25b3e8da869822a6b67ae112095230173646c7f341e10b9f75093df9563c28ca5afe1bac6479a79e121b575658c45dec12bea8d8ee264799114dc66f144e9e78f824ddaae85b55f5d6472f12923abe44104104104610b087c57a9b38a63421550231ac531aff00244c84b015a9dca6b84563c219ade032c5d73086366305b1d293c393490555050467ac8a2296c64d489b2197ac1664babccf32333b2b961aa4a66380f2c983c7281684b68cb710e1eb19ce535857290411c08e83776bd559c70a516ab8221253943d8498f232b0c64cbb608a709518b099aac48466ada3c790e0637a333cd118f7c090e34ac5c4ce67991b920e5dc88489c8f089dc957318529e0f384c35c46318951d5b49414725ec492e5c10411823a0df1d5d9c4862798d8e7c87b0106c21956e7b9ec08f90846a07b025712113c54b1d04bb08715b97b9ee084341744c7b824a18a929868d9ad036b9f21ee05a4b21edc97b9ec082d421521ef099f8321233df3a082057491bd7acb3a763f8b92ae34342ba14091bb3adb3930410410411c863f8aa309428e36b10ba1842ebc5673a392d0c8f8f083318974318446b3ebece8638daf8992ae26057448c25f03ab3a8686be1e982428e17310ba28c2f82d59d4b43f8b0cf78ae820488d2e43b6c314c7f5d88adad0886ba4c4652477513034b686a1925a0b33b3446c57884e8477fd8a7308d644d3b1262be36ae076224653132c6c1e371a1f45d878af0d9d4b1fc2cee5c0c09e02e7c4911a5c947253231809cf4148c3080a89ffa372328a652fecec174ebd45a65d8cc9ea0e37521f21854ede1111dcba526b381b755db718afafa97ddc3d687dfc1dc8854ff00ec5230a0119e8239299170d9d53f847c02823173b8925c2b17cb842236b95e7b1d4d22eed751e43fa3db6b8aa16e3b0e1bc31e12cbe82fbe7555a851a7cb98f8a454710c74cbb2d50efd403ccf4511b74447bcd529108928d613717dabb17e507099e07fa766ba875248bcf5c367cf770c2248efc6b17ca82a443972fb37f0dc9648141ca15fd675ee3a50e18aee847b327391614c43a6d0e3f07f690770fd4767130446503608cca05b58c4c154a4c460a512fe8ac55a28d0657fa9b4ab59586a3e8be29d3b9229384139289d9bfb86cf9d91cbc1a13c82c5f263eada8b89732731ef2d41505c7d0df64232aaa1c5c95e649268ea9de5654d393684b3a7a2ec2ba8dde5c8a50c6a075d489d37fa33f6510a74e15d029bd8dcfb85fe4769687a114552a82ae0c98ad87e9414586c2be4b86cf9ca3102844f56425ca583e446f2d48f735576eb98dfe33911f3c386c2835abb0a4ead540eb599550d8e5b644399ba245086f56d56a2684eb2c7ae20b6d2a5edacd8590ab1156ceb1744f88cc83ec26e122c95d8f555084b9acc85760386cf9c625b91df07c958be3a7ac27a4e74888f210e71694a32508ac17cc2851b6451b536d24844b64e05a22eab9b1368521b8aa825e942d84aa107116ae4ea652561d532b7d1a3a15caa659ccdd8b3823cc8ad04cf64698b55544aba992371cb2b61ec34f3e85341394bb3c3671394acc2504bec42963aba8822f7093a96913fc5f6380bb7084edb493dcceba8263a50da4a58f82a6d4e14dd3cf048dcb311ecad54dbf912c4d954554861d9c3f3242ee4f197d8a931506860bec55245d86ea7b0ac4a9658b210db2642c5279a1cbd590f66848362998dea2ac50915eec855be51282eec344a5ba0f0f322e29ed24326b542dccd6442fe910076848926d13fc5f63719bb9764b55494741298b1e30c86488643c160c7c36b504f45cf7fd97115a122158fd1c7f7322afc30a4787723392ca8d14cf4362c790790429ef14259d9b11085a6f4a537239dc721ea98bf62575f1e6509b4dac212ac0a371052aba48c3c7fad5200816d48f87a8f7e1b38bcf91e42abb1bc31d99e67fb3c3c2a25ccac6342c8894c779b9d0de3421d1379fa6f0ae0a5590e8d7c90ff00ae2e0cb9dcf2187c0b3446a0f838d5075169db3aa3c5c231257abf87922655d9450c922e6dfb43626ba083955a99ee234fb4cbbf640979aa6305d16d544f6a478454d76703b3d837b84940a9598ad0ba13c48584924924925081f0ec21611740837c2cbe6f04abd6dbdee3650f2f084e9713e9c032c73319e64ab14506ccd1e49b68ab5a3c585eecf9598d5f6ecc3e7f631a9c953427520707409de6f14a8995ad34d3ec773ada1bbf646822394431a5613ab910c739cf0d9c5e7ca9e99156d2799fecf0c4d657429e68f05868bb3108a6c873d3891cdc533e785491bdd448cf6544424a17065cee7901d457213ba198369ad678b14cf4133a0b91531dc2d6662d0cd96cb9bf079618c3939c3d0be2f331af40d0c35a093063264e392f9a1a9825845009ecd741e2da060b2bd04832a085b6aa1a0b2b0f85f2a491878f0b08e86bb0b0f0966483670f90a5fc2e2bd00fa88e01963777f72684978cb59e87d3bd05466e893f017d25dad05e3464963302c9b7302772450344bbfce2ebea3ee2ace25b62a6f2e1b389c9252db9332d2be0f07b49d7f45f12e2c3a1263a1740784f54a189bb26561252de62b30f7636c26de66d063c7942c6ec8a5127ad4fa12682b52cf034342ee6e3c8eda36a3062694b686a4e4e45692d42b9ada8814515434efa44d13d6a5e0ccad3623ba885afaae8465225121ed39a7312d38d29b8ce9ad2b8fec092c198be4c0f961a81e169086a34a99d4cf83c8b0d84121293d6a2f6484a89e83b527b8b0f682995cc454bdf26f7bdc4daccb85f2a7091c32a31004ba2d9c9933f18d27733648cc6f8589b1efb0c9a0b519171ba113ce51561685a6903ef47eb1ccf7a0d44eb9a8d41111c60de8ef549721fe0c44d122af15a76433f9312d4cc6f85c870b5a09265a4255355697c367caa12a3a856c1653ec5bb0b8df2a49c169b0b612e8d8bcd9940965250557490b96de127fc7d8a9d6ea64459de9233cb3741975b630cdef41bde82fb844131b5a880fc6ae12ba1648423113bcdc6229c6c54b4f192c9a05dc4925dc6b07efc367ca8b9ae0c6492a9516aae363e549230905b09749b2d6b102dabbcf8f4a50d4a853f54912cb810b8a4ad5f58ceefd1a2684d2a361a3dedc42c3b3bc86c28aeb247dc95c100b755ac2eaac94232f6aac86f822566443e49e15ee360cf73cf95205949e49a573cc67393b256c569e1b3e49b832c36de34c299721f2e47a80b485d2b513de4c9f603ba5a576a0dc96aaec4f436260ac1d868b490d6bac1ae9a408b698428b6ea520c6c17623ec36ab01955dd5d886c8a5f584b96456b70b2068364b2d7fe42597717e142c7f6043768e159f22a6a761e06a326620a59721f2dae642c2e996904055155aac0a9399db3ca2829323bc9c150eaf057b11519dd75fd21b621d15a36d22f209ff9c7a86ff439a3dc853ffa14733a568aa5a0b0aad291b926120292ef0561d4ce0fa9292aa35b8409a1d49503420a5afc19a59675e1b3e4154218d5e06212cc56fafc97ca6b25d04242b74e9d3f904ae5d3f42b90b1dc2dfbad1a16d9d5c644c6b7181deca539427cca5f65caa7fd1c115a9a110508b703383b8b460a4d11125bab4b2327e3ea51596d2c5c91d4927d56405aa20da3e477786cf8e45c3a85c533272e4b1f26c6a6824485d42a4e53450d3be6a75150f52f29c5a7a7542811d0b0bdc93a0caa6866b73e64632a5a26a6e27c0ead6338a828632baff61da07fa25c34ece1bafe32d013aa8b6130843510fe81bde5b062395df71d9fed0a02ace8b42359db86cf8e1735e2505966252997452c2be8492ea58e053a98ed26ec5a456d90376ad04b349fdc5a0e1ae327413d75503b8e932d0a81568550e405b923df2be528460a8295a7022ea1aa494cea9667b15e646b41155b5fb061318f3c48d2d0a25c9a043216e98a81b33cf86cf8b6d232c373c4c425989452aefc97c9b6afaeaea8e6a0b6b6074d869d422a3c65ca126735acc915be8d8a9d5e83e3aa6479228b50526b6497a177910f42ccbc3cdbc2063794d969862f7b61419b637828cc4134201e54cc5b4d94e45c748825ae3e16cf8b9ec3c8c97b729f1dd90c7e7d6911cd55c238d02d30f8fd2345444ce51dcb0b6b8fb7cb435dcbe3043dc4eb5aacdfe246df12356ec4f0bb03dbd0824f97d0e546c2ed93a7c0a65621ff009aa0690c9926c542da170d9f130d10d9abc858d17169145d024db842923af5be7bc6c7c87f4812d1648026ea6b40ec26b232a393595b3295112b76342061de4669f9827669509d50c82bed52ad0d784cab09e22da10ca6d5c0c86d4b88a850ea317b5619e725199eaacf86cf874dc32ce4ad22ac4859e7d026684852a5d7ae4e5c0374ae321c804c733e4779a7889991e508ff008d482aeed3714206ba5a966b2ab39c319146f7995191a28c0b296ff0b1efdf07c3e4e8ef35478a36b1b8e8926fac126d580cf354b8567c322c19772b2dedd031a1094ebc6b5f127fd59ff563469b13ec77226e2109648ce72c4a8290aa76a00ad24c0749867246f950984f6992dc95916e32cd5b72ea7fd59166652a382e610d1ff5676c9386df8468ae35d39672f45c4484b227827951a4219f9a1e885f04a0f6bcb6ad05b4fb249249c53a72100271f367a217c04a3279a8199912492492492371c60146ff0038f413175ca0ee6aa8ec14250b1924924913a8f850d25cda5cc2584e7e3ec184fadc84373cd4141084e0924924924994492491c4431737fa61e07c7d82185d5243f9ed7a7c724924e1324a5ac2f24e3b388d702d9835681b22531ae0de42b9e27c7d982627d4c561b6efcfafac8b72a491418388c92e26a70232d3ec7f2de1a7ef83528b459edc2cb78da1b019da0d4791b43645c89e30ad58c9159545f41c7420ba451b0b8ceaec58a627d3243fa0356825273648c2824b89e984bdba69c9a46c04ac56a26589adc7ca2de250499f723c314cb3654935869b168c7babc61fc06813b83284256a1a24639dac685275766284c9e914a886cefd0c5b5df35cd809892a7129ad643736e99722bbb8f0cc91133e8c27d88c43d61484cf0f2856bb2294622de70c9b5683529916790b69296d9b76b0fe1852695037abf42f55d9922cd65d5d8b85312d6c9091d9c88626659328bdf22366aa2bc11533b0dcc677639326e308820f0d71969f62c044b4d85278868213c8d4bd9d98bc53ca6161d99ebcca0545cd6bc6214971be2720aac84e715288cf081261bc90e9fa4d3b615dbd187943a884589a2c5e8d446abd225966c809d47e925013a987624cceb3c0953754ee332fec94d975762e27146d1e690fade386970ff72544a3c023f448494d0dd0a42c218540b2ddc33871b082592422d02d8c4d206491b6967f62d32ee4934fb72d490525398c648a6824485c894f20d44aa0a04e6856725829c9889fdf832de36d1d9205f3190ed04314a89894424698d3fe0562b2b3e8422489b7e86f490f68817bab2c5c5e288500d5b710952c31f41cc909a1b6fd15eda14a7790f28b56968d272c224492a10f074dc70534fb8d71ca03f347e90eb464a6798e9c4c5be50212d6d48a5843d341f2be49b702666aaf9772c7d084a393029c651455884b3cc89447a921694332a21bdb658f706194d1eeda240d45c134b14a45221366a9ce88250f8956e26badc1f494f36c5c4a73599a09272a6de6c9125d8488354504e131b47b0992e35c1dbba530421b3c762a2236fb8df26a7413e6db5a953182ae136c7a66ab36defca99076e5a4db842a0aae9cb61734380b850112c5875a42b91ad6c524e63032c343a8c51514dd96824b0f2909757b705c74a6b98ccf092c4f6641d0b06069b4a34f7607c4585336343c8ae62b35524832382e99970d2a937288a459047754257908c1cb81e5fdc404cb50844d685969f0e04886459396bc90d99c4faf6a4462d327086e4a84462a320dd661196445fa84322f4154498910cb3e1b3a16886bb74ac42cb316a4b7298d090a44be6ad7ae4c7d4e3910d49844ea350304addc7e550c9ba312fee8c56bd9bc7ca45a685b42d43c95c445c1304334091db129227ff91a5a370450902a6ac158c18c50897e9b81da2324d683ff00f6206c80861910a2202a5158f104bb7ae87d6e4792f74782132e6c90779d28fc123bc5119170922438bb022aadea528c3f39ad4652503fe7c3674084367d2b1924211ae7ca8d25458aa73c95a05ebd0af34b28ca10e630a2ea888cc06a34b6bdb0730f644d2d84141703ece64749c9dfd990c952ace646f07e8909fb618e2f652b48cb75bb5858350ef2597d23f6e811d9bc2d2a56271512b4dc531d4ee5dd7a97cc0e448ac4d5af314eaaaae4945b4ad44ca1af223a6754736df21ca916e27ba88a123931c483571f647048d2ee11c9a4dc840bc47725949a3a615fd36e4bc92dc5c942af0d9ce6d21aedd3e41db950e0467d01a237a28110d24240aee1ed890734317c5f6c0ecccc29a4ba56a540eef23d098cf78404425c9754d15511cc094a59736ce6a10d9f4ee468ae21125c9862165d737d0b4ea256442f98b396d10c7d4354820257cf930e4a82ea4bfc337639484367d4c3cc7c9d8d991d4ff0d5eb9721a218faa74cb04a1472264c2824bfc36948d0939331799c48561b6faa4b4149390d41024bfc3567a8a8b524114ba76c28cb682fc8c560f068863eb2b6bbe43b4e21217f862ea68725b6a19b66e02235c6f87ac3719b8cdc66e33719b8cdc66e33706e0dc1b83706e0dc1b83706e0dc1b83706e0dc1bc3786f0de1be3da1ed0f687b43da1ed0f687b4207fb47b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee07b81ee036bfdec66dd5e3ffc4002b10010002010303040202030101010000000100112110203130415140617191a1f181b15060f0c1e1d1ffda0008010100013f10805ec24b0f1382867b7d59361ecef061e2848d02929197b53da9ed6957c42009494944a254a25129113da8f863e38c4cbe2e7819edcf667b33d987867873c39e1c3c33d99eccf667b33d99eccf667b33d99eccf667b33d99eccf667b31f0cf6e3e39edcf6e7b73db9edcf6e7b73db8f8e3e38f86787a30eec2566c001de0000424243748024ec0004a88cdb9698989899994532f8b3dbc3c786141c1e6679e8a2cc1d0f3a06ceb5673a04fcb03b5f7775ed610952a56d25755d58c5b843a087a37a2c63a2c010c8efdfa8418307a0ee219d2b43458c7410081fb831801adbb4a83232e35a70e48681e0d175bd56c6421bab5aeab18f40106821e8d8f418c745f91f1d6183065ee7cde20451b4d18e81e9180980306d454405f89ec91b8d4e38e283a5ec254aeb3a31d4656a6a1087a363d06318a44000eb1060c197af33b91406acb972e5e8c56017ee0e000dfc7b897063d271418686a7a262c516547534108421e8d8ef6329617baed7a63060c18302a899979972e5cb8b2f40ea4490bcc2a801d078f4062d95283087a35d18a2eaea4308421a1e898ef632f558231e9bb865c5603b030c30c103060b45172c34401d1e3dd4c34b452d131b2de210d69d69d94e94e94ec5d162c58c0a8c768686843d131dcc6318860231f44d93c400a25cb97a1858b2e0e800a20e58298074963b9417261824969313c17020e140585595f10fa34cc28634a1d4c182ec70c41af8082b50208544e46643e65bbe92f848cfb444b69077870813c2ea175e2e1139899c335c91f7f2a0a598b20fe0207467172a415870b115a5c58b17458c7686a30843d1bb58c3b532c63d576f7e38d6f4b972f5203c50e5808003a7c5b8e7bca92d255952f7200c9cd651ce788088cbd30823ba3b459e4b58fec256579187c86c49e3c11fd92890a620b3ee4817f9f88cf127352fd6fc2570332a422727feb0673a79a941cab6a0934e0d0ed139fe518865959424b60d1079232f1a165e971747606c20c3d3ac5997704631f40851321dfa830081850783a9c5b85a80ef8dc2e297860363ae588a6b95f312b3c6939250d8f2c651edd60b10da1680ed32b20252d148b2df0789423128477dcb862a456d62513f245d052d85212724a0e669b6a3e5f645d4151546549ec8638fbc98b50e12948bca2c8c7b0651f1148b0c7a16ebc6838545972e5cbd6e28a1b0843d13b5609100447d1299a3a750e010c05980eaf0f488452f40d4a680cb972f75cbd162c6162cb972e5cb972e5c51c371e89d8b198f32fa27cb840183a83810f295c6032f5b8f47a2420c1d12092492081972f45cb972e59186185d0b972e12e5ec23d06c34183e818e8b163de9834763d30b6895e7aa0d8c87cad3afc3b2a56d0a81a5ea410492492695743b2dd430c2cbd5771a5c361a1e818c62c58e420a1d274762b47546a1e3ee80edc65f41c5a04340d0ae6a8d0d9802ab82a00a2d06884448996c643c80325dcd4bd76f880569c5069e99544928d06e0b1cc957d2a89f10d800c0d912e51380ccb25ca6802ad188e4dccc9780c0d46525af4d97a3c633828aad15096772e1e771b08e14ddb4942eb82117fdb28831cca6007407bb801a6f6f0cc218911e4b82091905b12ca94b1fe48c86db85c23ab1044fbb06c5a1634f0caece864cb2288571097e02c206d006cc439986c8ad48822c5a4616d9a9190c971b0ea56b5482b05e563e23528d1d1e8a32f882283aa4d62f301867bbe8461082083515f1135c128d5e342be096aa394ca47ec4253e584e2eed50af04ac8ea51a17d7771fd468b3e2d3fe163c30dfcd95e1309dcfca80dcdfe3c2449c6739f95d00fcb3ec1a021c12fac88b94813feaf89c2b058707b2225d45edcfc2611f91fdcf609ff0073c4fcdca423847298c94e25be72f3450b5ae206aaeaefef40075438c776060bacbd162c20835150288be6da941feaca04f712a0e44f22843a1d15d1952ca85a0fbd063f2c1f62083b86408141e0c08e5a5ce319fb22acbdcb1098e0517088384b9634b0c4a2ff003158c600760dcbbbfb4fcecbd08231194250a12e33c6563f226d3f1b42fefcfcac20c8b95358a4cf116731b331f40e14d4fdfe31d43ca67fd5f118002846a7ecf041a85db7b7bf099f98fef4ff00b9e23fb7142bee6afc941e708fded38ebe54b0d56006a22d29b23d011442e7cf583a2bbb0d35f77d1e2c208a95a547c28f8d2983c68f653833969c7da98169cb1715ca0b84d29318d1ec3754e584d6c31adee4fc0c75f110f1221cfdbfd9161082c7be7b68c699f8918589ce70c7133f89952b5fc384b5271d739f9d941fe4608407de2eb1c6c7f8d9ff0057c6bf8fdb9f84c417b597f73d9fdc77ff006623fb7016a13c5bcbbeb6c44897bca77d2d422e81143a5ee36a268cc268d8f49a93e5831aebd218b0256c65ef14db41810d6854612950312891498f3029a8e06ae2e5adab880112428f5b316a0a1cc282876219eaec4b6cb972dd11c48645a8e0a87170adf031ecf8202ac033a59e2c270dc0c54b0e1b6dad05c2c829b9914c4bf0b969d141d8558952a54a86a355a18655f6900288f31cb8565152f21125b46edb8b143c902d6ebceaa223ca4555b48bf06a5e54105c93d9c3634952bff456d6855866829be60a7c048eed5de8c5398c621a9a82fb43da397d5a94c98f323dcf425dae4a878a3c8cab23ef6157ad3d99d2a54a952a3398a851123a3d24a0e72f8854987a50e32baf51230e813a442102040952a54ade0068210eb318b1750a020979efd0a952a541aa085972d0c30c244db52a54a9f2506040cd7a6063a3d7a89a8089a9b4840810204a810254a95a2b6804343a352b6318eaced1f1bc254ad44b1008cb0c30e81224a812b60303be583c17ddf3e9f875a89a139c05c48dcab889429fe233161631120783465b3240d36de039d38a8613b45f953c69c3d85405938720b6111f862eff00e33bbba23c825344fd2cb05896c7696a7eb6024517845d6d1ac4fd540d82a852734c1430edcec95023c2cc9c62040961b45b5a512880764ad952a56a421b2b73a318ea84768001baa040d042d1c080504a461861861d031508208a4381f2c3a17ddea1c3b904462956ff00846e6072027e04b123ca219cfe3263002826310a4fe941ac0583e2727ccc51ddde508f1ebc7c9e20951f58607f8e8b822305deea2098c1d8789f93d0cb8ae6418f2acf8034d60bc1bbca01e2178c1ff37682acb734211450a3afb86a8f1277218fab7e4074c874dd18e82502097977040810222a08748512b54891230c30e9904542d63cb0c00ae5f523195b41ee118a64c1c4614399a8fe672453ec88934a73486d8e73fea4e09f9efea5995bc4fdf4176d77f0671a82989560a9c014b0c0e466e230af15b505d1f2c5748012894857279862cb145f66f10983e9a207fcdda3b36edc53cfdc4e0fc5c055215f29fbc25c4fb18dc70012c92dbb90d9197d2add7adcbdaeb6fe08ed08102042804f90e82448c30c54a951d03e65240f2f5418ca952b5fce47b7af967ec60732709139876585e75f299376445fe855b0a0fed83011527c6a67282cf169ab060a22090b8239161c08a5cce7f6bc78c26c8303f9a04c4b448102014282c9ff000bc69d2b2cc7dad18ae72ebf946054eaaa518d120f18b07f2c160af27c686e095a575d2080e3bc021b4204081332e086d06abbea30c30c54540db961f03865f57c72a54a952a718c2988158b3fb1c0190288c46fc534188942076b84699fb1cbc20bdd6f51cf1479c635ca276d350d6a1a08a76d9aa46641d68acafed2d85c4a2f2adc0811d28be710f0ca89162942461206828969a96d527ef70420f7372a1479ef3f778fa617956d86e0952a57a0054084566589134a81020445a095d4400d5e8d6861d0862407b9f583195a54a952a54a952a532a54a9533ad6951208224a81020744d86ca812a04a952a575ad51f1a31226810462821de5ea902544874e1103dcfade1d2a54a952a54ae800ad81a241044950206f3421a9ad6950204adb52ba6a1d9de190d18c4950250ae080d0746f6108421b38140cf77d771eca952a54a952a54a95184952a54a95a56808c54086e3521a9a10204081d2ae802a041b9e5db506b4100a881b1d8b2f690842c3f2c0a0f73ebf8f654a952a54a952a54a952a568a952b4a89a092ba06a6a684204081e8ed760e372944ac7bc0951dcb17690843ff399500cf77fc070e952b4a952a54a952a54ad2a544952a54a9513504d2ba26868421021e8d884131db6ab6e080d0408118c762ef210f1fcb0c019eeff008138e9502574aa54a952a54a952a544d01ad6a6c086c204210f440ad10c94cbb015a21110086a631d5779087471dd8343e5e8392da56a8caafb16c616ba1ec8b5fe3012eb28b82fc697a564ba104c6a1acc7f2785c53427c2095966b8a2a01684f24652159948f7005c3441dd0dc49955c34eabd3020ad2432dd0ada71952a54aead4a952a54a951208226ca95a540dc687a274c41838d8b6219efa9a08c63a2eeb97083cfe587c73dde89776a039dd6a433cd1b480aaa98f832c0fa8111d51c1e231896fb7a1329d9c5617d010407c18480a03e24516150de86afe61bc7e106e0da904644c1138e196b145e612d4adaf6e1e0163fbc6798361073bac586eec6d0e32bd054a951256ac60892a5695a540da434343d112108476d72b810500d2f43411d0c765ed1a4d7761e0f97a727d805224e22b10bcb93fe6f8c085d891083868e9b0d7bc24ff67305c96b116ca59106c73f0188f1b56ac06d7c2227b24dc407c69efcbb1342bcff0076c45a8f0040cc994a605706a72c70d63c2e6012967fcff38ac4072ec3d815aa0e374b87d224a952b46244892b50e81a1e8c15a21dc9946095040cb3755d4d047431d5d97032abbb059fcbd336faf8872eaf2a2079962c10d1a203e613c9416511855dc8cd4cbb3a3282918c92b871c620c9708f383074a2ad6700ac55ac640484943a8232e125c2a8dbefb84451e8b0b04d866ae4831761087e8d4ca79922d10c9a9c2086df0f3b5c3e9ab4631224a952b656d34343d161ac1c462f83106f7d5d831418e86318ed0215dd0059d41362073b1b0c85aa97e79d99893be9a2cb51ab22f062e368a17eed2a05560a4a873c286cacbbde40d454da8304517c774f178dceac12945315bf92757097b29a4ba012c550d4548c51b3f3006afc12dd4438669698b639a1aa9e2dd955aede1f4ec631d2a54a952b710843d1a0401847f0604a08eaec20c51d0c62c745d0602ad980c5d513ebd28a02ca679516653edc35123b057461f1090b3c07741657a27cac4bd700adacba655a22402f1a059fd12178de9355282a317ead960a232120af54194bc6010d054e98c9cd18408732eca080bbb2b49e97ede1f50c7fc102a04238b508de4ceda18c768c5065e8631d1d04828f2c248577eb21a25250b827078450428a63c72b165d45e2952ca883811381003438bb5bdad0482062ecb8216f51612a4b2e04f944c33d8ad9196be87a90c2ac08fc427312ae70542504c49e914f1b95bc9fa8a0870c3cb84621709307a692c9cf4efc523adc01dbe1dc451500f0d44777a584578b82604101aa5b599a868eca9e21a53e1082f60e22040a8d4ae76148563e041849523a4a032cba504376a680b4e7caf4a991dabb20d5c948e18fff002e1ebc95c91aa4a50584ec529c1950b5a861e52085985bccb828335645f3ad4185cd24989461a9c5b7f825b7d8486416e063442b2b6638e0a41f05c6778e90652f89e59c855c2917e3f4a908dc802d5883d32d293b57de884340693b304dbb07961987d965a394872e561c6860643e1083768e08b442671f21920feeb04051a393b8c380463a8b32eea208a5ea3a2e862905cb04115d7cc9490f742de3925a87ca0fd41eb9924de7d5671177175f66549ef330fe4a74c8c907448b6523e1085732e67a5c32d2bb5380c06b388b3b50803fe63a42bbaab0c8b11e23840655e0f0e3a70a5423c677f043033f73b95dc3f176f8779de2be3125f17e05d25f85d001020fdc4280f36d145d813242caf0331770481d806f915c335b46fe753f804fc2221d6caef2b054b7a5ed1d907ff13c6806aa5767cc03c855fad88555f84d3152d2ba022077ff00119bbbbfe4874fe2659bb5697968bf8220591c724c5221fc195735df76171049f6084dd51794abfe20e7ee9f0800500107baa29de223cfdf4fc4211a25fcd060e00fb94307958c675eff0011efd6a45d188b3dd119678d0a8a96d2080e2fb40918c743b843cb0b901e806ecdb2b02b54890b1f38e4e690bd5e3bd482c06f0afb9c2c607086d4b815a828314764298707022b495f8c579e6f08123cc6fee17610d6968b2643068ac5cd60b01568d6cc6d34d9ea5b423cf43388299e28718ab9211ac2545fc69abb463d3b8ed5c3bce8b8b30c53922b2e92fc2c599782b194cd52f310a9c2b455015704eeaaad8a34eb38aeadabeaa6595a45f8665b03868c279a21222d314027b69a804001c11d907ff13c43c5a94582f8451271ac44fad53b4b45fa6b4f1143a028e07af21317598aed2fb13058f998608b750ee39154c5346360792f2239e255fc843aaed5044989a21388ab7412f204220be4063b7a60ac0e64e979851b2b11d9e256074a6d6164877f8135af31628eaeb72e0c268f33bc4b1180d4a1cb28e01e85170a68150b799e6b139c7c47b4383420f116e1fc2c603c4552ca11fc04bb7945e4094ad0cc2da365b70cc9479babcbf633ff004ee7129e0a649f93f724b1c2e14d632f10cdee844b795717276c7b8376f0ee4ac00099303d0ad33a7d4388702a6841d6fb304585bacaf3caa52d107c798a8f788176455e3ac97b38033f4a42a54584b7710b344ac2111542e68dea84d01e20741fa62d704c9a27ea10276afaa4101540088f05c0412edf2364711d16727044d3f0d9a65979062a0228ab883630c07721aa2507213b75c44602ca392425ea942a7f693506396151ccbfc8ea10f70af5bafb32e6e156054b5855413fb0df097d678c68c56aaf7e08b5102842a482c817ed4510c885845089dad714b51a582a1dbeef5d8e86317565cb8308b984101c8a1cb08180f44f5fa4698b8ea487858e7d168076e64442d8c83b793290b69af2b9964e69360d6af1829ba2ec81301f2e0d49e2cb9dbb02d1597a8ce8abd26372c1947cc2a485cfb02d6ccef6de04542fbd360cb19a18c8884b19e072e3be118f14b9471f076870fa863bab71a1d658a9da1d057e2f2817504606ac743b18badc342e02741864c07a3b201aa0cb142b83d81421f859886bc1cba9d92e5f83072da718a46c69b7571b8c238b44c174d4208eb568410d2ed06f8277eca879a6b219b4e0ac03eaf025386d2dc2c94310a14707bf87616a63529c2ea8dc09e4adbe1f52f4eb61d4239b638563c696564d0421c2edd2af63a8c7462ecbd40228186680707a4115462595fdded2b12c26b042c381c9f1ba6eab23c8f32c568b46494206768b34ad698447256c187c7d2b4f0d727425165e453851f09bc488f1c8315468caac438510964252c7a14190b094cbb1ca0b3fb53cf2b8bb181b9ecce1bbaf6f0fa8747a152b69d200ab393ec885adeac584df628c756318e97a07aa82e4007a54c48c935328f7540d1e7e5227b727b35715d2b94ed6f3bbb89f6630ca75216c399c70262beddb2411553537827c238f5070f7d2d9401131c2db32a31928b625752950a6f7ccaec702de519b1f17ca638230729bc13a577536f0fa87d4b054728c6c1c868e508fa0dcc628c757475604041c1e61d300f4c4bd498efb11001556c7016539072fefe2e32460fdc2710c11cee9ac0176d238f467fea84bbe63812a6ca8bcbcda928756e8555e2a05651e3f84ac18d24b168154bc02e240bc9096b12c35cb58a1dcc1e0c3c176c803918bf70e5a86c3c41c47cb19d7144483e426017314615e0ed70fa863d63a0b53bdacbf2bd8595aaa0d5c8dadec5d0c7476b280c78215001e9d901b2ea32a1af2a97b57878101775d2b171855367067718c68992fd94b2a50d6e481353520b2adee96a41158e20e73f194107ac2331c8a1d92ac257c816d63938b9d37cae457e1181ef68da78825cbb07ec10b2ed4ed70fa863e80da35a883848abb58430e3a9b5628a2e8c74755430ec820141ea1a7ed5962d9d05bef9c39e29ca38864e2beb62e7e22e0b9d2166ef1dccc3180c75686328e359b6585ff007462385a93e581a96195a4931094ad2f9593413333f6b8bc378bafa6a0cf640dadf9c435933078352f8c823ff727f01a24cbb36f0fa863e80d8625db182b714cc5b50e7a056f62c58b1d8e94a8111613920500a3d4db778e5659b9a51887c42067b7d6e171770f61012cec25cd6c91b8e51ba1638dc7f762bc44d970dd2a5b506fc8a09d557a46515375132bc4747631641749ed8ad25a5b6600d584a8ab5e4572c2a09c56f2298bf40d4ac11d6a71dbc3e9d8ee7a840156727db112adbb892b5510011895a9b5628b1d18e8c05409f89200003d50d297d98c3c9fe6e1bd8ea7203d18755383891e3ca47bdd567cd2a170660de1a215cd8540b6e30b6fe1c02d86c465b61efb2f0a3a353aeff896571a6e395d90723ce5180c56f321a3595dec6dbdd8542e98b507dbf0fa763e8846dcc42aeba015d866c62c518e8c740400b5982f3da000a3d5e4d6762f96a30b5f0ce34e3eb94e1bc9c591e042719c8a517df4709ce0ef922e72889cce4c8e6706565c0592d06172dcc062c7f0424c6ba6ddd09891247d8c2db82120fb34461c51bc404836ac6d787d3b1d2e5f56c21df2b2e0ade802d64b52b60141b3b6ab162c58ba31d0105ac316bb0815eb45f8cfea7e467fcdf18ade7b1218f33241ef7c31c59061d4e0dbc8f066d446c7cfe4c3b7a5b82163120b70715e98c7fdc9c8c55eb83039a218b16454f4e4161ec17e6c677c5509512b580c90cf4027a3b79e3e9d8c765cbe8856a2c981d1760a504a95996b6bc68b162c58c747428a565881f67b7aecd1d9189fdcafe9059169b70fac59e58cc4044039b2a5f0a82c4053945f9cb87eb83c77be0465ed561a1080b85bd905d8569054c7686a2d6ef43e211840c95e4cf06ba9c3fc20784ac7796f8501c2a0820bec5b8eef9306d78fa662c5db7a0ef3d3262d6ba551dccdcb972e5c5c458b162e8c63183ced61b3b5ebc5b295b0b67b2fbcf65f7998b076b70608775787ed000f6261d632a540bbca2288b73a5c972cb1c5eb38d0d4f2929f1e7a2686197b5cacb800d2b583e9764cf65f78132c15e5b01f7c2aa7b2fbc75f375ed58c1f48b162cbe8dea4da97b808aadbd2bd86cb82ce81468b972e31788b162ee0076b0790aff364a1e898b162f4ee17576cb42e98eb6ace661ca849aeb8b2c958ba2ec022d65905ae5ff394a0c3d02c58b165f4922d6727d9155b5ea199e5c35083647211e770742b0ae05f2ff9cc5d2507d02c58b2fa41f3989fb755c42b2308f8025cbd06d08a5cb972e77336594039eef51830106a20009c7f8f78ea0307acb162c5e8a816c12e28ad7aa42dab392caccb972f700806c01b1c776010f97abc642dc25decff001ef18b4141832fa6b162c58f40ab58d783ad960d360c6cb972f688648a9d024096cb07a7bbbca5f94423a993da7397cda9c67fca1dd15e22240cc9e1d01259098fc0ff001fc7075a1832e5cbe82c58b162ef508763362b6baea232000051bae5cb97a314605938a2072c22c06e1e8110537ca295afb5ed7f6e34362167ef0d0fb36d68a10ccfd742ccfd50287b528e6c593f550b4bfaa102886cd2de251c92a1c402a7755f10f903e21c23c84b538facc307581972e5e972e5cb972e2c58b177856b31460f41dcb9843f06abb5d165cb94e93ce0c600dc442fb116aceddee1a3e292a7ef050220322b49717138f0ebf8086d5a8d806627745d6173cb054512fafb3844735dfc4ca9ad3c7f184b7c22d5c2bfa873b4c0ad12cd5ddbc7abe3d062d22065e972e5cb972e5c58b177f7918cdaf400a81005e3bf8e931d049a32a6c3837359416c61956874170f910fb4033df963d0e30d08778b4cfcaa11fdb008e9f8082cf6b5102c1e6d231836a1f17178b1bce73959169a2aa30ec84a35ed6887f8e20999be9221e077ca560c1cc037cef5cc307479294b325db08912e46e59a86b90a94d65e9ecd6e2e29323310812408415af61cb28967d844dbad26a6c2043b93fe09179b4e5724ee5a0a23ca1d0a9e4b2aa1af3f7101021e23e15771271c48b7513d917bb0000daed740b4876f305180de4d6954f40201dd84994ad03de601502543ba5b038f2312d60c90d32d9736d1f8086cc3bc20e57f2c1cc79c4944e70e1ae963d47022d241db9860197cf99845952e10838096b159625428e20a3094f94c30e38426a767af43067dda73838883e74b2d096132e260d39183836e1251b839c02803ffde02d22186571025a0d6629335c5aa39382e95c7e61caf10e56d3dc97376608da77200a823dc8831865cf789c92e96ef101a6836f4c4a77cc0b280d8ec74602b412a45c850a050741d3ed5d077b56d97e00119438608e2e01404aae6322ab6e8fd85f42e72474c15e228497083e0b690db64b28279084d58998c314cf1af0025190432a808a060710b4f904378339caeeff0080c33f3302136bc90d1222a0101bf2c1cbce273c9110f292fcb5b7384c2710b71340cf980eaf0b7de27f8c82f955dec7306b00a02356dd95488841594ca5da5646816482841ec94e861cb2bb1f631da9a56472a5a9068c0788b5a9f74c4da46e9be90005acf7109d5d1dc0a00b63d87de000028e8a82b5677aec5250eccb72e572f30fab567de88258158c662d1f635b0252d7447755818303775f625a09f256b6645ea307627e0f5af97b1976324ee0b1cee1bc6fa343fd85301e0bc0cbfbe43927c4eca3f4a06eae5407068b8edaf95d5c7359082b2152fbf1b4634cb19b597c90b1c40b8fb25589e62d8fe5697fb965a0b4008e21ff00d8848a79628497c30d8771d218e31b8e8ea282d6661bb140000e9120220cae3178da9591c10085afc46e96e182144368cf985e005aca4b265f3a8e5db72042841fc6b06f04c1125ef8b28204501efa13b62768d2a89243006085e306965ba61168ca1480c3c04e020910eae67ffd5caf41c5bccab08740d0cc8745a610acb4139d9243194ac4013bb05002b325f25c9691ceab997841cf88115ca2f68c2ec5e68221002a3118186f11c11908a047ba2d4850f5abc9e1855a2d292dd0d1233f86f6f0f4ee5ed06d662384bf49daef2a07340d1d8ec1ee5596e2471e3aafc6860a54f0ea2843bd41147714255b87c82ab965d39f2878908c509fbd5e416f64830f0d841e300c44b99a7b18865a0cb26eb6c60c65cc0e1037b8471ecccc5b74344e51150929c4442c8901f5059e4bed892e86d96a56ef921e68961a99a1e03103d4a9e2ce58c332c16cb0d0ef71509e1945e5311db12f51206d5e2982454b200cc5f68219c103464880c06acec612150a46389417965cf7609c9a07e36a491a42016edf0f4af7634cb19b5f4a1ddab44164cf718e8c1cc543204eb9b77c3de18a17e7b4709a68c03b11e12129168f119a59ee4b52f3c18616cb63406d9f6833ebe30f3a6cb472908eb2e1187cb67ba05f9d8d0c596e121b997cb4c214676c528196393561b403a92c72891056ae06c2d0238a8396b96838815d8054a352a9011124aa0c35a2c34d4afa2b157411e304083b8b5169846b524ddf25041bc63f7a843c34c2c75592b6a4888bf99adfbced5d4a0e3a4372c64ee0fb86c46ce32e602d2e09657828b510395f2503c9c311ed2e8e9481835a85a82573a9ed70f40dc25acc4604bf5773b18450ac70168cbe807ca42f0dbc11fb23ccbc663af0c44413b52892d91d928f823926a77e6a123e2cf4a08b848c8316dc21e753b321df1501d1079022f0e65c873d051d5e3ea5cc6996336be9ed633401140741877e630c05abe8458dd9c6881707f98e1d86e2136b31860de7a11e6d580d6595bd8c3aaf26076beeff00a6119c0874718658cdafa80b94a7e2dee82e8a2e509ffa6c20de824dacc2983a675cd0c4881837b0e05081d803fd35f9c035f3041cb020104486cbc4c664c56d7d51ff0076e6129c19e81914100000ff004d25a1dee28cd0d40f0d0c5afbd42d878986582686e5989307a63682a04c0f8fa0a035da402141fe98953fde149eccd8417c7c1b1a3852070fb59fbb625cfdaccdff00b4fdd4fdd4fdd4fdd4fdf4fdf4fdf4fde4fde4fde4fde4fde4fde4fde4fde43ffb93f793f793f793f793f793f793f68cfda33f68cfda30b0fed6149fdb9fb7cfdbe7edf3f6f9fb7cfdbe169fdf8201fe9a8c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c30c319437cc9728be56f5fffd9
34	Admin123!!	2025-02-25 02:47:07+07	t	admin12345	asdas	asdasd sad asd	f	t	2025-02-25 02:31:07+07	firdauz.workspace@gmail.com	f		f	\N	\N	2025-02-25 02:32:08.723985+07	2025-02-28 20:48:03.959743+07	8	\N
38	pbkdf2_sha256$870000$cFBS6B0IE2ee8rA7XmysAd$GuYFBjS+8i2DMQ/hYFq/0QkdJK1ZSLj9ScCWGpzGy4I=	\N	f	test	test	tester tet	f	t	2025-02-25 08:19:36.885018+07	anythingasdas@gmail.com	f		f	\N	\N	2025-02-25 08:19:36.886018+07	2025-02-28 20:48:31.848325+07	9	\N
8	pbkdf2_sha256$870000$2oKDC8e6P0qJHOsJwnCphW$2Cu/MS6GDyqWM5Ot7c6nfihq20zmUIUWE7e6J2UpS0M=	\N	f	management3	Mary	Chavez	f	t	2025-01-26 14:11:20.836606+07	management3@hospital.com	t		f	\N	\N	2025-01-26 14:11:21.29267+07	2025-02-16 03:24:23.150244+07	9	\N
30	pbkdf2_sha256$870000$8ehdxq8VXngbYR22qbuAGk$T8VWhDWtDZocx9mJWWccruDQ7PQTA3m5833BMGHJ1fI=	\N	f	nurse15	Christopher	Andersen	f	t	2025-01-26 14:11:31.003852+07	nurse15@hospital.com	t		f	\N	\N	2025-01-26 14:11:31.419834+07	2025-01-27 10:05:52.72969+07	10	\N
27	pbkdf2_sha256$870000$Um6KYbm0bEDU3B5ZRxwsMC$IOn9CRm+p5gM7B5gz3kGNRXogDqKyYlPrwroy61jpXU=	\N	f	nurse12	Kristen	Williams	f	t	2025-01-26 14:11:29.713705+07	nurse12@hospital.com	t		f	\N	\N	2025-01-26 14:11:30.148829+07	2025-02-10 07:25:07.673486+07	10	\N
15	pbkdf2_sha256$870000$gr1emkbEAexkEXkfdPxVGt$4awRa/vmU8fVkE5G6/vThbzwpWwg2siG0LKSKJ6Hwlw=	\N	f	management10	Kimberly	Wright	f	t	2025-01-26 14:11:24.077032+07	management10@hospital.com	t		f	\N	\N	2025-01-26 14:11:24.545645+07	2025-01-27 10:05:57.338772+07	9	\N
14	pbkdf2_sha256$870000$OeMJwZT1PhX3u4Z9d6fj8p$oBG9itE8L1KUrM4dw5nV2W+pSGOgPlo8p+KlgAW74ww=	\N	f	management9	David	Collins	f	t	2025-01-26 14:11:23.61249+07	management9@hospital.com	t		f	\N	\N	2025-01-26 14:11:24.074023+07	2025-02-26 05:38:46.30891+07	9	\N
\.


--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_permissions (id, user_id, permission_id) FROM stdin;
1	34	1
2	34	2
3	34	3
4	34	4
5	34	5
6	34	6
7	34	7
8	34	8
9	34	9
10	34	10
11	34	11
12	34	12
13	34	13
14	34	14
15	34	15
16	34	16
17	34	17
18	34	18
19	34	19
20	34	20
21	34	21
22	34	22
23	34	23
24	34	24
25	34	25
26	34	26
27	34	27
28	34	28
29	34	29
30	34	30
31	34	31
32	34	32
33	34	33
34	34	34
35	34	35
36	34	36
37	34	37
38	34	38
39	34	39
40	34	40
41	34	41
42	34	42
43	34	43
44	34	44
45	34	45
46	34	46
47	34	47
48	34	48
49	34	49
50	34	50
51	34	51
52	34	52
53	34	53
54	34	54
55	34	55
56	34	56
57	34	57
58	34	58
59	34	59
60	34	60
61	34	61
62	34	62
63	34	63
64	34	64
65	34	65
66	34	66
67	34	67
68	34	68
69	34	69
70	34	70
71	34	71
72	34	72
73	34	73
74	34	74
75	34	75
76	34	76
77	34	77
78	34	78
79	34	79
80	34	80
81	34	81
82	34	82
83	34	83
84	34	84
85	34	85
86	34	86
87	34	87
88	34	88
89	34	89
90	34	90
91	34	91
92	34	92
93	34	93
94	34	94
95	34	95
96	34	96
97	34	97
98	34	98
99	34	99
100	34	100
101	34	101
102	34	102
103	34	103
104	34	104
105	34	105
106	34	106
107	34	107
108	34	108
109	34	109
110	34	110
111	34	111
112	34	112
113	34	113
114	34	114
115	34	115
116	34	116
117	34	117
118	34	118
119	34	119
120	34	120
121	34	121
122	34	122
123	34	123
124	34	124
125	34	125
126	34	126
127	34	127
128	34	128
129	34	129
130	34	130
131	34	131
132	34	132
\.


--
-- Name: categories_id_category_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.categories_id_category_seq', 1, false);


--
-- Name: courses_id_course_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.courses_id_course_seq', 1, false);


--
-- Name: courseuser_id_course_user_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.courseuser_id_course_user_seq', 16, true);


--
-- Name: detailinvoice_id_detail_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.detailinvoice_id_detail_seq', 1, false);


--
-- Name: invoice_id_invoice_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.invoice_id_invoice_seq', 1, false);


--
-- Name: paymentmethod_id_payment_method_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.paymentmethod_id_payment_method_seq', 1, false);


--
-- Name: token_id_token_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.token_id_token_seq', 7, true);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: apelmusic; Owner: postgres
--

SELECT pg_catalog.setval('apelmusic.user_id_user_seq', 11, true);


--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling."AspNetRoleClaims_Id_seq"', 1, false);


--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling."AspNetUserClaims_Id_seq"', 1, false);


--
-- Name: CustomRoles_id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling."CustomRoles_id_seq"', 4, true);


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling.department_id_seq', 1, false);


--
-- Name: level_reference_id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling.level_reference_id_seq', 1, false);


--
-- Name: login_history_Id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling."login_history_Id_seq"', 1, false);


--
-- Name: refresh_tokens_Id_seq; Type: SEQUENCE SET; Schema: nursecounseling; Owner: postgres
--

SELECT pg_catalog.setval('nursecounseling."refresh_tokens_Id_seq"', 1, false);


--
-- Name: AuditLog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AuditLog_id_seq"', 1, false);


--
-- Name: Consultation_Result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Consultation_Result_id_seq"', 3, true);


--
-- Name: Consultation_Type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Consultation_Type_id_seq"', 7, true);


--
-- Name: Level_Upgrade_Status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Level_Upgrade_Status_id_seq"', 14, true);


--
-- Name: LoginHistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LoginHistory_id_seq"', 1, false);


--
-- Name: Management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Management_id_seq"', 12, true);


--
-- Name: Nurse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Nurse_id_seq"', 23, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 156, true);


--
-- Name: core_levelhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_levelhistory_id_seq', 16, true);


--
-- Name: core_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_materials_id_seq', 88, true);


--
-- Name: core_systemconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_systemconfiguration_id_seq', 8, true);


--
-- Name: counseling_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.counseling_id_seq', 32, true);


--
-- Name: counseling_material_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.counseling_material_files_id_seq', 58, true);


--
-- Name: counseling_nurses_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.counseling_nurses_id_id_seq', 73, true);


--
-- Name: counseling_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.counseling_status_id_seq', 3, true);


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 19, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 144, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, true);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, true);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 35, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 90, true);


--
-- Name: level_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.level_reference_id_seq', 22, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 10, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 117, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 225, true);


--
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 45, true);


--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_permissions_id_seq', 132, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id_category);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id_course);


--
-- Name: courseuser courseuser_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.courseuser
    ADD CONSTRAINT courseuser_pkey PRIMARY KEY (id_course_user);


--
-- Name: detailinvoice detailinvoice_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.detailinvoice
    ADD CONSTRAINT detailinvoice_pkey PRIMARY KEY (id_detail);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id_invoice);


--
-- Name: paymentmethod paymentmethod_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.paymentmethod
    ADD CONSTRAINT paymentmethod_pkey PRIMARY KEY (id_payment_method);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id_token);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- Name: CustomRoles PK_CustomRoles; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."CustomRoles"
    ADD CONSTRAINT "PK_CustomRoles" PRIMARY KEY (id);


--
-- Name: department PK_department; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.department
    ADD CONSTRAINT "PK_department" PRIMARY KEY (id);


--
-- Name: level_reference PK_level_reference; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.level_reference
    ADD CONSTRAINT "PK_level_reference" PRIMARY KEY (id);


--
-- Name: login_history PK_login_history; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.login_history
    ADD CONSTRAINT "PK_login_history" PRIMARY KEY ("Id");


--
-- Name: refresh_tokens PK_refresh_tokens; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.refresh_tokens
    ADD CONSTRAINT "PK_refresh_tokens" PRIMARY KEY ("Id");


--
-- Name: roles PK_roles; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.roles
    ADD CONSTRAINT "PK_roles" PRIMARY KEY ("Id");


--
-- Name: users PK_users; Type: CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.users
    ADD CONSTRAINT "PK_users" PRIMARY KEY ("Id");


--
-- Name: auditlog AuditLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog
    ADD CONSTRAINT "AuditLog_pkey" PRIMARY KEY (id);


--
-- Name: counseling_result Consultation_Result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_result
    ADD CONSTRAINT "Consultation_Result_pkey" PRIMARY KEY (id);


--
-- Name: counseling_type Consultation_Type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_type
    ADD CONSTRAINT "Consultation_Type_pkey" PRIMARY KEY (id);


--
-- Name: level_upgrade_status Level_Upgrade_Status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_upgrade_status
    ADD CONSTRAINT "Level_Upgrade_Status_pkey" PRIMARY KEY (id);


--
-- Name: loginhistory LoginHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT "LoginHistory_pkey" PRIMARY KEY (id);


--
-- Name: management Management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.management
    ADD CONSTRAINT "Management_pkey" PRIMARY KEY (id);


--
-- Name: management Management_user_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.management
    ADD CONSTRAINT "Management_user_id_id_key" UNIQUE (user_id);


--
-- Name: nurse Nurse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT "Nurse_pkey" PRIMARY KEY (id);


--
-- Name: nurse Nurse_user_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT "Nurse_user_id_id_key" UNIQUE (user_id);


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: level_history core_levelhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_history
    ADD CONSTRAINT core_levelhistory_pkey PRIMARY KEY (id);


--
-- Name: materials core_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT core_materials_pkey PRIMARY KEY (id);


--
-- Name: system_configuration core_systemconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_configuration
    ADD CONSTRAINT core_systemconfiguration_pkey PRIMARY KEY (id);


--
-- Name: counseling_material_files counseling_material_file_counseling_id_materials__5674bdb2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_material_files
    ADD CONSTRAINT counseling_material_file_counseling_id_materials__5674bdb2_uniq UNIQUE (counseling_id, materials_id);


--
-- Name: counseling_material_files counseling_material_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_material_files
    ADD CONSTRAINT counseling_material_files_pkey PRIMARY KEY (id);


--
-- Name: counseling_nurses_id counseling_nurses_id_counseling_id_nurse_id_f86c91d5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_nurses_id
    ADD CONSTRAINT counseling_nurses_id_counseling_id_nurse_id_f86c91d5_uniq UNIQUE (counseling_id, nurse_id);


--
-- Name: counseling_nurses_id counseling_nurses_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_nurses_id
    ADD CONSTRAINT counseling_nurses_id_pkey PRIMARY KEY (id);


--
-- Name: counseling counseling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling
    ADD CONSTRAINT counseling_pkey PRIMARY KEY (id);


--
-- Name: counseling_status counseling_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_status
    ADD CONSTRAINT counseling_status_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: level_reference level_reference_level_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_reference
    ADD CONSTRAINT level_reference_level_key UNIQUE (level);


--
-- Name: level_reference level_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_reference
    ADD CONSTRAINT level_reference_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_groups users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (id);


--
-- Name: users_groups users_groups_user_id_group_id_fc7788e8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_user_id_group_id_fc7788e8_uniq UNIQUE (user_id, group_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_user_permissions users_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_permissions users_user_permissions_user_id_permission_id_3b86cbdf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissions_user_id_permission_id_3b86cbdf_uniq UNIQUE (user_id, permission_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: EmailIndex; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "EmailIndex" ON nursecounseling.users USING btree ("NormalizedEmail");


--
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON nursecounseling."AspNetRoleClaims" USING btree ("RoleId");


--
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON nursecounseling."AspNetUserClaims" USING btree ("UserId");


--
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON nursecounseling."AspNetUserLogins" USING btree ("UserId");


--
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON nursecounseling."AspNetUserRoles" USING btree ("RoleId");


--
-- Name: IX_level_reference_id; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE UNIQUE INDEX "IX_level_reference_id" ON nursecounseling.level_reference USING btree (id);


--
-- Name: IX_login_history_LoginTime; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_login_history_LoginTime" ON nursecounseling.login_history USING btree ("LoginTime");


--
-- Name: IX_login_history_UserId; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_login_history_UserId" ON nursecounseling.login_history USING btree ("UserId");


--
-- Name: IX_refresh_tokens_Token; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE UNIQUE INDEX "IX_refresh_tokens_Token" ON nursecounseling.refresh_tokens USING btree ("Token");


--
-- Name: IX_refresh_tokens_UserId; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE INDEX "IX_refresh_tokens_UserId" ON nursecounseling.refresh_tokens USING btree ("UserId");


--
-- Name: RoleNameIndex; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE UNIQUE INDEX "RoleNameIndex" ON nursecounseling.roles USING btree ("NormalizedName");


--
-- Name: UserNameIndex; Type: INDEX; Schema: nursecounseling; Owner: postgres
--

CREATE UNIQUE INDEX "UserNameIndex" ON nursecounseling.users USING btree ("NormalizedUserName");


--
-- Name: AuditLog_user_id_id_ef4e36b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuditLog_user_id_id_ef4e36b9" ON public.auditlog USING btree (user_id);


--
-- Name: Consultation_Result_consultation_id_id_3e50b709; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Consultation_Result_consultation_id_id_3e50b709" ON public.counseling_result USING btree (consultation_id);


--
-- Name: Consultation_Result_nurse_id_id_b39134b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Consultation_Result_nurse_id_id_b39134b8" ON public.counseling_result USING btree (nurse_id);


--
-- Name: LoginHistory_user_id_id_b92a6e60; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LoginHistory_user_id_id_b92a6e60" ON public.loginhistory USING btree (user_id);


--
-- Name: Management_department_id_id_82e55f2b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Management_department_id_id_82e55f2b" ON public.management USING btree (department_id);


--
-- Name: Nurse_current_level_id_467bb164; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Nurse_current_level_id_467bb164" ON public.nurse USING btree (current_level_id);


--
-- Name: Nurse_department_id_id_e287f124; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Nurse_department_id_id_e287f124" ON public.nurse USING btree (department_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_levelhistory_nurse_id_b50d17a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_levelhistory_nurse_id_b50d17a7 ON public.level_history USING btree (nurse_id);


--
-- Name: counseling_counseling_type_id_58c5c855; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_counseling_type_id_58c5c855 ON public.counseling USING btree (counseling_type_id);


--
-- Name: counseling_management_id_d8626129; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_management_id_d8626129 ON public.counseling USING btree (management_id);


--
-- Name: counseling_material_files_counseling_id_ec9d409d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_material_files_counseling_id_ec9d409d ON public.counseling_material_files USING btree (counseling_id);


--
-- Name: counseling_material_files_materials_id_28b98b23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_material_files_materials_id_28b98b23 ON public.counseling_material_files USING btree (materials_id);


--
-- Name: counseling_nurses_id_counseling_id_dfafbb06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_nurses_id_counseling_id_dfafbb06 ON public.counseling_nurses_id USING btree (counseling_id);


--
-- Name: counseling_nurses_id_nurse_id_9dffdcab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_nurses_id_nurse_id_9dffdcab ON public.counseling_nurses_id USING btree (nurse_id);


--
-- Name: counseling_status_id_945fe010; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX counseling_status_id_945fe010 ON public.counseling USING btree (status_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: level_history_from_level_id_e533988b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX level_history_from_level_id_e533988b ON public.level_history USING btree (from_level_id);


--
-- Name: level_history_status_id_4dece8c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX level_history_status_id_4dece8c3 ON public.level_history USING btree (status_id);


--
-- Name: level_history_to_level_id_a6b66194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX level_history_to_level_id_a6b66194 ON public.level_history USING btree (to_level_id);


--
-- Name: level_reference_level_260c5968_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX level_reference_level_260c5968_like ON public.level_reference USING btree (level varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


--
-- Name: users_email_0ea73cca_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_email_0ea73cca_like ON public.users USING btree (email varchar_pattern_ops);


--
-- Name: users_groups_group_id_2f3517aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_groups_group_id_2f3517aa ON public.users_groups USING btree (group_id);


--
-- Name: users_groups_user_id_f500bee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_groups_user_id_f500bee5 ON public.users_groups USING btree (user_id);


--
-- Name: users_role_id_id_9e37972b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_role_id_id_9e37972b ON public.users USING btree (role_id);


--
-- Name: users_user_permissions_permission_id_6d08dcd2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_permissions_permission_id_6d08dcd2 ON public.users_user_permissions USING btree (permission_id);


--
-- Name: users_user_permissions_user_id_92473840; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_permissions_user_id_92473840 ON public.users_user_permissions USING btree (user_id);


--
-- Name: users_username_e8658fc8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_username_e8658fc8_like ON public.users USING btree (username varchar_pattern_ops);


--
-- Name: courses courses_fk_id_category_fkey; Type: FK CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.courses
    ADD CONSTRAINT courses_fk_id_category_fkey FOREIGN KEY (fk_id_category) REFERENCES apelmusic.categories(id_category);


--
-- Name: courseuser courseuser_fk_id_course_fkey; Type: FK CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.courseuser
    ADD CONSTRAINT courseuser_fk_id_course_fkey FOREIGN KEY (fk_id_course) REFERENCES apelmusic.courses(id_course);


--
-- Name: detailinvoice detailinvoice_fk_id_course_user_fkey; Type: FK CONSTRAINT; Schema: apelmusic; Owner: postgres
--

ALTER TABLE ONLY apelmusic.detailinvoice
    ADD CONSTRAINT detailinvoice_fk_id_course_user_fkey FOREIGN KEY (fk_id_course_user) REFERENCES apelmusic.courseuser(id_course_user);


--
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_roles_RoleId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_roles_RoleId" FOREIGN KEY ("RoleId") REFERENCES nursecounseling.roles("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserClaims FK_AspNetUserClaims_users_UserId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_users_UserId" FOREIGN KEY ("UserId") REFERENCES nursecounseling.users("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserLogins FK_AspNetUserLogins_users_UserId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_users_UserId" FOREIGN KEY ("UserId") REFERENCES nursecounseling.users("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_roles_RoleId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_roles_RoleId" FOREIGN KEY ("RoleId") REFERENCES nursecounseling.roles("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_users_UserId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_users_UserId" FOREIGN KEY ("UserId") REFERENCES nursecounseling.users("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserTokens FK_AspNetUserTokens_users_UserId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling."AspNetUserTokens"
    ADD CONSTRAINT "FK_AspNetUserTokens_users_UserId" FOREIGN KEY ("UserId") REFERENCES nursecounseling.users("Id") ON DELETE CASCADE;


--
-- Name: login_history FK_login_history_users_UserId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.login_history
    ADD CONSTRAINT "FK_login_history_users_UserId" FOREIGN KEY ("UserId") REFERENCES nursecounseling.users("Id") ON DELETE CASCADE;


--
-- Name: refresh_tokens FK_refresh_tokens_users_UserId; Type: FK CONSTRAINT; Schema: nursecounseling; Owner: postgres
--

ALTER TABLE ONLY nursecounseling.refresh_tokens
    ADD CONSTRAINT "FK_refresh_tokens_users_UserId" FOREIGN KEY ("UserId") REFERENCES nursecounseling.users("Id") ON DELETE CASCADE;


--
-- Name: nurse Nurse_current_level_id_467bb164_fk_level_reference_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT "Nurse_current_level_id_467bb164_fk_level_reference_id" FOREIGN KEY (current_level_id) REFERENCES public.level_reference(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auditlog auditlog_user_id_c2df745f_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog
    ADD CONSTRAINT auditlog_user_id_c2df745f_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling_result consultation_result_consultation_id_73ac5f62_fk_counseling_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_result
    ADD CONSTRAINT consultation_result_consultation_id_73ac5f62_fk_counseling_id FOREIGN KEY (consultation_id) REFERENCES public.counseling(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling_result consultation_result_nurse_id_4ab0db0b_fk_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_result
    ADD CONSTRAINT consultation_result_nurse_id_4ab0db0b_fk_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: level_history core_levelhistory_nurse_id_b50d17a7_fk_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_history
    ADD CONSTRAINT core_levelhistory_nurse_id_b50d17a7_fk_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling counseling_counseling_type_id_58c5c855_fk_consultation_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling
    ADD CONSTRAINT counseling_counseling_type_id_58c5c855_fk_consultation_type_id FOREIGN KEY (counseling_type_id) REFERENCES public.counseling_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling counseling_management_id_d8626129_fk_management_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling
    ADD CONSTRAINT counseling_management_id_d8626129_fk_management_id FOREIGN KEY (management_id) REFERENCES public.management(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling_material_files counseling_material__counseling_id_ec9d409d_fk_counselin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_material_files
    ADD CONSTRAINT counseling_material__counseling_id_ec9d409d_fk_counselin FOREIGN KEY (counseling_id) REFERENCES public.counseling(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling_material_files counseling_material_files_materials_id_28b98b23_fk_materials_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_material_files
    ADD CONSTRAINT counseling_material_files_materials_id_28b98b23_fk_materials_id FOREIGN KEY (materials_id) REFERENCES public.materials(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling_nurses_id counseling_nurses_id_counseling_id_dfafbb06_fk_counseling_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_nurses_id
    ADD CONSTRAINT counseling_nurses_id_counseling_id_dfafbb06_fk_counseling_id FOREIGN KEY (counseling_id) REFERENCES public.counseling(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling_nurses_id counseling_nurses_id_nurse_id_9dffdcab_fk_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling_nurses_id
    ADD CONSTRAINT counseling_nurses_id_nurse_id_9dffdcab_fk_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: counseling counseling_status_id_945fe010_fk_counseling_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counseling
    ADD CONSTRAINT counseling_status_id_945fe010_fk_counseling_status_id FOREIGN KEY (status_id) REFERENCES public.counseling_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: level_history level_history_from_level_id_e533988b_fk_level_reference_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_history
    ADD CONSTRAINT level_history_from_level_id_e533988b_fk_level_reference_id FOREIGN KEY (from_level_id) REFERENCES public.level_reference(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: level_history level_history_status_id_4dece8c3_fk_level_upgrade_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_history
    ADD CONSTRAINT level_history_status_id_4dece8c3_fk_level_upgrade_status_id FOREIGN KEY (status_id) REFERENCES public.level_upgrade_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: level_history level_history_to_level_id_a6b66194_fk_level_reference_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_history
    ADD CONSTRAINT level_history_to_level_id_a6b66194_fk_level_reference_id FOREIGN KEY (to_level_id) REFERENCES public.level_reference(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: loginhistory loginhistory_user_id_c129d0c5_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_user_id_c129d0c5_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management management_department_id_052b73a2_fk_department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.management
    ADD CONSTRAINT management_department_id_052b73a2_fk_department_id FOREIGN KEY (department_id) REFERENCES public.department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: management management_user_id_35fe8afe_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.management
    ADD CONSTRAINT management_user_id_35fe8afe_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nurse nurse_department_id_d601fb53_fk_department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT nurse_department_id_d601fb53_fk_department_id FOREIGN KEY (department_id) REFERENCES public.department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nurse nurse_user_id_792daec4_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT nurse_user_id_792daec4_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_user_id_83bc629a_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_user_id_83bc629a_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_groups users_groups_group_id_2f3517aa_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_group_id_2f3517aa_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_groups users_groups_user_id_f500bee5_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_user_id_f500bee5_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users users_role_id_1900a745_fk_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_1900a745_fk_roles_id FOREIGN KEY (role_id) REFERENCES public.roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_permissions users_user_permissio_permission_id_6d08dcd2_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissio_permission_id_6d08dcd2_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_permissions users_user_permissions_user_id_92473840_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissions_user_id_92473840_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

