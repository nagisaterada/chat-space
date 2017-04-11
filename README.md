# Database設計

## users_table
|Column     |Type       |Option               |
|:---------:|:---------:|:-------------------:|
|name       |string     |not null             |
|email      |string     |not null             |
|password   |string     |not null             |
### Assosiation
* has_many :groups_users
* has_many :groups,through: groups_users
* has_many :messages


## groups_table
|Column     |Type       |Option               |
|:---------:|:---------:|:-------------------:|
|name       |string     |not null             |
### Assosiation
* has_many :groups_users
* has_many :users,through: groups_users
* has_many :messages

## groups_users_table
|Column     |Type       |Option               |
|:---------:|:---------:|:-------------------:|
|user_id    |references |not null,foreign key |
|group_id   |references |not null,foreign key |
### Assosiation
* belongs_to :users
* belongs_to :groups

## messages_table
|Column     |Type       |Option               |
|:---------:|:---------:|:-------------------:|
|content    |string     |not null             |
|image      |string     |                     |
|user _id   |references |not null,foreign key |
|group_id   |references |not null,foreign key |
### Assosiation
* belongs_to :users
* belongs_to :groups
