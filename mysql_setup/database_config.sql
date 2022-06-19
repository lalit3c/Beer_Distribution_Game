CREATE USER "se_grp_7"@"localhost" IDENTIFIED BY "Beer_game@1234";
CREATE DATABASE beer_game_grp_7 CHARACTER SET utf8;
CREATE DATABASE test_beer_game_grp_7 CHARACTER SET utf8;
USE beer_game_grp_7;
GRANT ALL PRIVILEGES ON beer_game_grp_7.* TO "se_grp_7"@"localhost";
GRANT ALL PRIVILEGES ON test_beer_game_grp_7.* TO "se_grp_7"@"localhost"
