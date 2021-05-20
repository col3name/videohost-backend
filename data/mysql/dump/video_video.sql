create table video
(
    id_video      varchar(255)                                not null
        primary key,
    title         varchar(255)                                not null,
    description   text                                        null,
    duration      int          default -1                     null,
    status        int          default 1                      null,
    thumbnail_url varchar(255) default 'content\\default.jpg' null,
    url           varchar(255)                                not null,
    uploaded      datetime     default CURRENT_TIMESTAMP      null,
    quality       varchar(255) default '1080'                 null,
    views         int          default 0                      null
)
    charset = utf8;

create fulltext index IN_video_title
    on video (title);

INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('0699cea9-b91d-11eb-a2fc-e4e74940035b', '7gb', 'description', 50, 3, 'content\\0699cea9-b91d-11eb-a2fc-e4e74940035b\\screen.jpg', 'content\\0699cea9-b91d-11eb-a2fc-e4e74940035b\\index.mp4', '2021-05-20 06:39:48', '1080', 7);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('10bcdc26-b871-11eb-a0d6-e4e74940035b', 'Чехол для Redmi 9 9A 9C Zroteve, тонкий матовый чехол для Xiaomi Redmi 9 8 7 6 P', 'Life Of Pix 1.58K followers Follow  1.54K likes  Collect Free Download', 50, 3, 'content\\10bcdc26-b871-11eb-a0d6-e4e74940035b\\screen.jpg', 'content\\10bcdc26-b871-11eb-a0d6-e4e74940035b\\index.mp4', '2021-05-19 10:08:51', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('13be6f11-b78e-11eb-a175-e4e74940035b', 'Фигуристка', 'фигуристка завязывает шнурки', 72, 3, 'content\\13be6f11-b78e-11eb-a175-e4e74940035b\\screen.jpg', 'content\\13be6f11-b78e-11eb-a175-e4e74940035b\\index.mp4', '2021-05-18 07:04:00', '1080', 12);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('150f8a85-b870-11eb-a0d6-e4e74940035b', 'Чехол для Redmi 9 9A 9C Zroteve, тонкий матовый чехол для Xiaomi Redmi 9 8 7 6 P', 'Life Of Pix 1.58K followers Follow  1.54K likes  Collect Free Download', 50, 3, 'content\\150f8a85-b870-11eb-a0d6-e4e74940035b\\screen.jpg', 'content\\150f8a85-b870-11eb-a0d6-e4e74940035b\\index.mp4', '2021-05-19 10:01:49', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('1527d749-b86a-11eb-a0d6-e4e74940035b', 'black mirror season 4', 'https://www.youtube.com/watch?v=oH85obU350E&ab_channel=Netflix', 50, 3, 'content\\1527d749-b86a-11eb-a0d6-e4e74940035b\\screen.jpg', 'content\\1527d749-b86a-11eb-a0d6-e4e74940035b\\index.mp4', '2021-05-19 09:18:52', '1080', 7);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('1a682a20-b5e9-11eb-a342-e4e74940035b', 'pexels-polina-tankilevitch-6646568.mp4', '0.02469122039591076', 5, 3, 'content\\1a682a20-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\1a682a20-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-17 07:36:52', '1080, 123456', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('1e68c398-b5e9-11eb-a342-e4e74940035b', 'Pexels Videos 1443653.mp4', '0.3040077363178206', 22, 3, 'content\\1e68c398-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\1e68c398-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-16 22:45:21', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('21574449-b5e9-11eb-a342-e4e74940035b', 'Pexels Videos 2019781.mp4', '0.4459650511350157', 19, 3, 'content\\21574449-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\21574449-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-16 22:42:21', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('24599ef7-b5e9-11eb-a342-e4e74940035b', 'hello world', '0.3178020774552618', 13, 3, 'content\\24599ef7-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\24599ef7-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-17 08:40:21', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('2879f883-b5e9-11eb-a342-e4e74940035b', 'Pexels Videos 2046575.mp4', '0.2511152646049068', 30, 3, 'content\\2879f883-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\2879f883-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-16 22:38:21', '1080', 5);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('2c5fab6a-b5e9-11eb-a342-e4e74940035b', 'Pexels Videos 2314125.mp4', '0.3021701213923936', 41, 3, 'content\\2c5fab6a-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\2c5fab6a-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-16 22:35:21', '1080', 14);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('3379d52f-b911-11eb-8df9-e4e74940035b', 'черное зеркало', 'description', 50, 3, 'content\\3379d52f-b911-11eb-8df9-e4e74940035b\\screen.jpg', 'content\\3379d52f-b911-11eb-8df9-e4e74940035b\\index.mp4', '2021-05-20 05:15:09', '1080', 23);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('34bc4791-b947-11eb-be57-e4e74940035b', 'Чехол для Redmi 9 9A 9C Zroteve, тонкий матовый чехол для Xiaomi Redmi 9 8 7 6 P', 'description', 15, 3, 'content\\34bc4791-b947-11eb-be57-e4e74940035b\\screen.jpg', 'content\\34bc4791-b947-11eb-be57-e4e74940035b\\index.mp4', '2021-05-20 11:41:44', '1080', 6);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('3cb8c447-b5ca-11eb-b22b-e4e74940035b', '1.mp4', '0.7575048438808926', 351, 3, 'content\\3cb8c447-b5ca-11eb-b22b-e4e74940035b\\screen.jpg', 'content\\3cb8c447-b5ca-11eb-b22b-e4e74940035b\\index.mp4', '2021-05-16 23:45:21', '1080', 5);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('40ae40c6-b91d-11eb-a2fc-e4e74940035b', 'sad', 'description', 50, 3, 'content\\40ae40c6-b91d-11eb-a2fc-e4e74940035b\\screen.jpg', 'content\\40ae40c6-b91d-11eb-a2fc-e4e74940035b\\index.mp4', '2021-05-20 06:41:25', '1080', 6);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('41bf7f08-b5d6-11eb-b2c5-e4e74940035b', 'pexels-polina-tankilevitch-6646568.mp4', '0.8810138859609271', 5, 3, 'content\\41bf7f08-b5d6-11eb-b2c5-e4e74940035b\\screen.jpg', 'content\\41bf7f08-b5d6-11eb-b2c5-e4e74940035b\\index.mp4', '2021-05-16 20:45:21', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('4bebbff8-b948-11eb-be57-e4e74940035b', 'asdfa', 'description', 30, 3, 'content\\4bebbff8-b948-11eb-be57-e4e74940035b\\screen.jpg', 'content\\4bebbff8-b948-11eb-be57-e4e74940035b\\index.mp4', '2021-05-20 11:49:32', '1080', 17);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('4bf80026-b790-11eb-a175-e4e74940035b', 'Black mirror tiser', 'In an abstrusely dystopian future, several individuals grapple with the manipulative effects of cutting edge technology in their personal lives and behaviours.', 55, 3, 'content\\4bf80026-b790-11eb-a175-e4e74940035b\\screen.jpg', 'content\\4bf80026-b790-11eb-a175-e4e74940035b\\index.mp4', '2021-05-18 07:19:54', '1080', 87);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('57655d3e-b92d-11eb-989d-e4e74940035b', 'sad', 'Life Of Pix 1.58K followers Follow  1.54K likes  Collect Free Download', 50, 3, 'content\\57655d3e-b92d-11eb-989d-e4e74940035b\\screen.jpg', 'content\\57655d3e-b92d-11eb-989d-e4e74940035b\\index.mp4', '2021-05-20 08:36:35', '1080', 11);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('64736bf5-b449-11eb-875e-00ff7c2a75d7', 'girl-model.max - Autodesk 3ds Max 2021  2021-02-23 22-36-51.mp4', '0.13255492889560286', 34, 3, 'content\\64736bf5-b449-11eb-875e-00ff7c2a75d7\\screen.jpg', 'content\\64736bf5-b449-11eb-875e-00ff7c2a75d7\\index.mp4', '2021-05-16 18:45:21', '1080', 4);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('7e7ca286-b5c6-11eb-a83a-e4e74940035b', '2.mp4', '0.01973301732887795', 351, 3, 'content\\7e7ca286-b5c6-11eb-a83a-e4e74940035b\\screen.jpg', 'content\\7e7ca286-b5c6-11eb-a83a-e4e74940035b\\index.mp4', '2021-05-16 23:43:21', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('85e4778e-b6f3-11eb-98eb-e4e74940035b', 'girl play with sound', 'description1', 34, 3, 'content\\85e4778e-b6f3-11eb-98eb-e4e74940035b\\screen.jpg', 'content\\85e4778e-b6f3-11eb-98eb-e4e74940035b\\index.mp4', '2021-05-17 12:37:40', '1080', 6);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('89432f72-b5e9-11eb-a342-e4e74940035b', 'Bee Farm.mp4', '0.7010003306912261', 17, 3, 'content\\89432f72-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\89432f72-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-16 14:45:21', '1080', 10);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('8be2d07b-b5e9-11eb-a342-e4e74940035b', 'video.mp4', '0.4458026322031418', 10, 3, 'content\\8be2d07b-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\8be2d07b-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-15 22:40:21', '1080', 14);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('903ae11d-b5e9-11eb-a342-e4e74940035b', 'video (1).mp4', '0.12601219967567567', 5, 3, 'content\\903ae11d-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\903ae11d-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-09 22:45:21', '1080', 14);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('93264759-b5e9-11eb-a342-e4e74940035b', 'Pexels Videos 2019791.mp4', '0.2926531325025979', 20, 3, 'content\\93264759-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\93264759-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-08 22:45:21', '1080', 10);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('95f88e04-b5e9-11eb-a342-e4e74940035b', 'pexels-andy-barbour-5337311.mp4', '0.0852290942196074', 15, 3, 'content\\95f88e04-b5e9-11eb-a342-e4e74940035b\\screen.jpg', 'content\\95f88e04-b5e9-11eb-a342-e4e74940035b\\index.mp4', '2021-05-15 22:45:21', '1080', 4);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('9fe60de8-b6d6-11eb-9200-e4e74940035b', '12', 'description1', 6, 3, 'content\\9fe60de8-b6d6-11eb-9200-e4e74940035b\\screen.jpg', 'content\\9fe60de8-b6d6-11eb-9200-e4e74940035b\\index.mp4', '2021-05-17 09:10:48', '1080', 6);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('a64a26b0-b5c0-11eb-b566-e4e74940035b', 'girl-model.max - Autodesk 3ds Max 2021  2021-02-23 22-36-51.mp4', '0.5481861043238883', 34, 3, 'content\\a64a26b0-b5c0-11eb-b566-e4e74940035b\\screen.jpg', 'content\\a64a26b0-b5c0-11eb-b566-e4e74940035b\\index.mp4', '2021-05-13 20:45:21', '1080', 10);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('a76d30a5-b866-11eb-a0d6-e4e74940035b', 'check auth', 'description', 150, 3, 'content\\a76d30a5-b866-11eb-a0d6-e4e74940035b\\screen.jpg', 'content\\a76d30a5-b866-11eb-a0d6-e4e74940035b\\index.mp4', '2021-05-19 08:54:20', '1080', 23);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('ac7545ec-b947-11eb-be57-e4e74940035b', 'world', 'description', 50, 3, 'content\\ac7545ec-b947-11eb-be57-e4e74940035b\\screen.jpg', 'content\\ac7545ec-b947-11eb-be57-e4e74940035b\\index.mp4', '2021-05-20 11:45:05', '1080', 2);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('af3eee9f-b903-11eb-b645-e4e74940035b', 'redmi9', 'Life Of Pix 1.58K followers Follow  1.54K likes  Collect Free Download', 50, 3, 'content\\af3eee9f-b903-11eb-b645-e4e74940035b\\screen.jpg', 'content\\af3eee9f-b903-11eb-b645-e4e74940035b\\index.mp4', '2021-05-20 03:38:24', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('b2b8ba78-b86f-11eb-a0d6-e4e74940035b', 'Чехол для Redmi 9 9A 9C Zroteve, тонкий матовый чехол для Xiaomi Redmi 9 8 7 6 P', 'Life Of Pix 1.58K followers Follow  1.54K likes  Collect Free Download', 50, 3, 'content\\b2b8ba78-b86f-11eb-a0d6-e4e74940035b\\screen.jpg', 'content\\b2b8ba78-b86f-11eb-a0d6-e4e74940035b\\index.mp4', '2021-05-19 09:59:04', '1080', 6);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('b591502a-b91c-11eb-a2fc-e4e74940035b', 'sad', 'description', 50, 3, 'content\\b591502a-b91c-11eb-a2fc-e4e74940035b\\screen.jpg', 'content\\b591502a-b91c-11eb-a2fc-e4e74940035b\\index.mp4', '2021-05-20 06:37:32', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('c5b34027-b791-11eb-a175-e4e74940035b', 'pexels time', 'pexels time awesome descripiton', 95, 3, 'content\\c5b34027-b791-11eb-a175-e4e74940035b\\screen.jpg', 'content\\c5b34027-b791-11eb-a175-e4e74940035b\\index.mp4', '2021-05-18 07:30:28', '1080', 4);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('c6c04ca0-b943-11eb-a79d-e4e74940035b', 'black mirror', 'description', 150, 3, 'content\\c6c04ca0-b943-11eb-a79d-e4e74940035b\\screen.jpg', 'content\\c6c04ca0-b943-11eb-a79d-e4e74940035b\\index.mp4', '2021-05-20 11:17:11', '1080', 15);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('cdc1a0b3-b943-11eb-a79d-e4e74940035b', 'sad', 'description', 30, 3, 'content\\cdc1a0b3-b943-11eb-a79d-e4e74940035b\\screen.jpg', 'content\\cdc1a0b3-b943-11eb-a79d-e4e74940035b\\index.mp4', '2021-05-20 11:17:23', '1080', 0);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('cf561af0-b5f0-11eb-a7d7-e4e74940035b', 'videoplayback.mp4', '0.7816580662333016', 566, 3, 'content\\cf561af0-b5f0-11eb-a7d7-e4e74940035b\\screen.jpg', 'content\\cf561af0-b5f0-11eb-a7d7-e4e74940035b\\index.mp4', '2021-02-02 22:47:21', '1080', 72);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('d4065d39-b943-11eb-a79d-e4e74940035b', 'Чехол для Redmi 9 9A 9C Zroteve, тонкий матовый чехол для Xiaomi Redmi 9 8 7 6 P', 'description', 20, 3, 'content\\d4065d39-b943-11eb-a79d-e4e74940035b\\screen.jpg', 'content\\d4065d39-b943-11eb-a79d-e4e74940035b\\index.mp4', '2021-05-20 11:17:33', '1080', 4);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('de1fa90f-b946-11eb-a79d-e4e74940035b', 'Black mirror tiser', 'see', 50, 3, 'content\\de1fa90f-b946-11eb-a79d-e4e74940035b\\screen.jpg', 'content\\de1fa90f-b946-11eb-a79d-e4e74940035b\\index.mp4', '2021-05-20 11:39:19', '1080', 14);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('e016b2cf-b5d6-11eb-b729-e4e74940035b', 'pexels-polina-tankilevitch-6646568.mp4', '0.4525605528173601', 5, 3, 'content\\e016b2cf-b5d6-11eb-b729-e4e74940035b\\screen.jpg', 'content\\e016b2cf-b5d6-11eb-b729-e4e74940035b\\index.mp4', '2021-05-16 22:45:21', '1080', 11);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('f3c685ea-b942-11eb-a79d-e4e74940035b', 'imanabek', 'music', 566, 3, 'content\\f3c685ea-b942-11eb-a79d-e4e74940035b\\screen.jpg', 'content\\f3c685ea-b942-11eb-a79d-e4e74940035b\\index.mp4', '2021-05-20 11:11:17', '1080', 13);
INSERT INTO video.video (id_video, title, description, duration, status, thumbnail_url, url, uploaded, quality, views) VALUES ('f9648da9-b865-11eb-a0d6-e4e74940035b', 'test auth uplaod', 'Life Of Pix 1.58K followers Follow  1.54K likes  Collect Free Download', 150, 3, 'content\\f9648da9-b865-11eb-a0d6-e4e74940035b\\screen.jpg', 'content\\f9648da9-b865-11eb-a0d6-e4e74940035b\\index.mp4', '2021-05-19 08:49:28', '1080', 17);