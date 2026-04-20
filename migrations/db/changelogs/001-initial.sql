--liquibase formatted sql
--changeset fiwka:001-initial

create table statuses
(
    id    serial primary key,
    title text not null unique
);

create table currencies
(
    id    serial primary key,
    title text not null unique
);

create table roles
(
    id    serial primary key,
    title text not null unique
);

create table expense_mode
(
    id    serial primary key,
    title text not null unique
);

create table users
(
    id            serial primary key,
    first_name    text not null,
    last_name     text not null,
    nickname      text not null unique,
    email         text not null unique,
    password_hash text not null
);

create table trips
(
    id              serial primary key,
    expense_mode_id int         not null references expense_mode (id),
    status_id       int         not null references statuses (id),
    currency_id     int         not null references currencies (id),
    title           text        not null,
    description     text,
    budget          numeric(12, 2),
    invite_code     text        not null unique,
    cover_image_url text,
    start_date      timestamptz,
    end_date        timestamptz,
    created_at      timestamptz not null default now(),
    finished_at     timestamptz,
    constraint ck_trips_budget_non_negative check (budget is null or budget >= 0)
);

create table trip_participants
(
    id      serial primary key,
    trip_id int not null references trips (id) on delete cascade,
    user_id int not null references users (id) on delete cascade,
    role_id int not null references roles (id),
    constraint uk_trip_participants_trip_user unique (trip_id, user_id)
);

create table expenses
(
    id                        serial primary key,
    trip_id                   int            not null references trips (id) on delete cascade,
    created_by_participant_id int            not null references trip_participants (id),
    expense_mode_id           int            not null references expense_mode (id),
    amount                    numeric(12, 2) not null,
    description               text,
    expense_date              timestamptz    not null,
    created_at                timestamptz    not null default now(),
    constraint ck_expenses_amount_positive check (amount > 0)
);

create table expense_splits
(
    id             serial primary key,
    expense_id     int            not null references expenses (id) on delete cascade,
    participant_id int            not null references trip_participants (id) on delete cascade,
    share_amount   numeric(12, 2) not null,
    constraint uk_expense_splits_expense_participant unique (expense_id, participant_id),
    constraint ck_expense_splits_share_amount_positive check (share_amount > 0)
);
