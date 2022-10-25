CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL unique,
    password_hash VARCHAR(255) NOT NULL
);

create table todo_lists
(
    id serial primary key,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

create table user_lists
(
    id serial primary key,
  	user_id INTEGER not NULL,
  	list_id INTEGER NOT NULL,
    foreign key (user_id) references users (id) on delete cascade,
    foreign key (list_id) references todo_lists (id) on delete cascade
);

create table todo_items
(
    id serial primary key,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    done BOOLEAN NOT NULL default false
);

create table item_lists
(
    id serial primary key,
    item_id INTEGER NOT NULL,
    list_id INTEGER NOT NULL,
    foreign key(item_id) references todo_items(id) on delete cascade,
    foreign key(list_id) references todo_lists(id) on delete cascade
);