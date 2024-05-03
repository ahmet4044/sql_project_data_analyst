-- creating company dimension table
create table company_dim (
    company_id int primary key,
    name text,
    link text,
    link_google text,
    thumbnail text
);

-- creating skills dimension table
create table public.skills_dim (
    skill_id int primary key,
    skills text,
    type text
);

-- creating job fact table
create table public.job_postings_fact (
    job_id int primary key,
    company_id int,
    job_title_short varchar (255),
    job_title text,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    foreign key (company_id) REFERENCES public.company_dim (company_id)
);

-- creating job id and skill id dimension table
create table public.skills_job_dim (
    job_id int,
    skill_id int,
    primary key (job_id, skill_id),
    foreign key (job_id) REFERENCES public.job_postings_fact (job_id),
    foreign key (skill_id) REFERENCES public.skills_dim (skill_id)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.company_dim OWNER to postgres;
ALTER TABLE public.skills_dim OWNER to postgres;
ALTER TABLE public.job_postings_fact OWNER to postgres;
ALTER TABLE public.skills_job_dim OWNER to postgres;

-- checking our indexes to identify indexes we have
select tablename, indexname, indexdef
from pg_indexes
where schemaname = 'public';

-- assigning additional indexes on foreign keys to improve performance
create index idx_company_id on public.job_postings_fact (company_id);
create index idx_skill_id on public.skills_job_dim (skill_id);
create index idx_job_id on public.skills_job_dim (job_id);

