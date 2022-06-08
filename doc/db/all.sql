-- courses
drop table if exists course;
create table course (
  id char(8) not null default '' comment 'id',
  name varchar(50) not null comment '名称',
  summary varchar(2000) comment '概述',
  time int default 0 comment '时长|单位秒',
  price decimal(8,2) default 0.00 comment '价格（元）',
  image varchar(100) comment '封面',
  level char(1) comment '级别|枚举[courselevelenum]：one("1", "初级"),two("2", "中级"),three("3", "高级")',
  charge char(1) comment '收费|枚举[coursechargeenum]：charge("c", "收费"),free("f", "免费")',
  status char(1) comment '状态|枚举[coursestatusenum]：publish("p", "发布"),draft("d", "草稿")',
  enroll integer default 0 comment '报名数',
  sort int comment '顺序',
  created_at datetime(3) comment '创建时间',
  updated_at datetime(3) comment '修改时间',
  primary key (id)
) engine=innodb default charset=utf8mb4 comment='课程';

insert into course (id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
values ('00000001', 'java, c++ Intro', 'This is a course example for testing, it teaches Java and C++ intro lectures, help cs students make their first step into the coding world.', 7200, 19.9, 'http://simply-course.oss-us-east-1.aliyuncs.com/course/3xzByd6GCMOocGK0qIa0kI.jpg', 3, 'c', 'p', 100, 0, now(), now());
insert into course (id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
values ('00000002', 'Advanced Machine learning', 'This is a course example for testing, it teaches advanced machine learning which may require solid knowledge and practices into machine learning and coding. But after learning this course you will deeply feel how powerful machine learning is, and probably become addicted to it.', 2500, 200.9, 'http://simply-course.oss-us-east-1.aliyuncs.com/course/50D9sDaCYgoKOOcikCSkGo.jpg', 2, 'c', 'p', 100, 1, now(), now());
insert into course (id, name, summary, time, price, image, level, charge, status, enroll, sort, created_at, updated_at)
values ('00000003', 'python dev', 'This is a course example for testing, it teaches intermediate Python language, very easy to startup as a Python developer, and its likely to get you the first job! only for $20.9!!!!', 900, 20.9, 'http://simply-course.oss-us-east-1.aliyuncs.com/course/20ssDk0gqQGmo0q6YWI4i.jpg', 1, 'f', 'p', 100, 2, now(), now());

alter table `course` add column (`teacher_id` char(8) comment '讲师|teacher.id');

-- chapters
drop table if exists `chapter`;
create table `chapter` (
  `id` char(8) not null comment 'id',
  `course_id` char(8) comment '课程id',
  `name` varchar(50) comment '名称',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='大章';

insert into `chapter` (id, course_id, name) values ('00000001', '00000001', 'test chapter 01');
insert into `chapter` (id, course_id, name) values ('00000002', '00000001', 'test chapter 02');
insert into `chapter` (id, course_id, name) values ('00000003', '00000001', 'test chapter 03');
insert into `chapter` (id, course_id, name) values ('00000004', '00000001', 'test chapter 04');
insert into `chapter` (id, course_id, name) values ('00000005', '00000001', 'test chapter 05');
insert into `chapter` (id, course_id, name) values ('00000006', '00000001', 'test chapter 06');
insert into `chapter` (id, course_id, name) values ('00000007', '00000001', 'test chapter 07');
insert into `chapter` (id, course_id, name) values ('00000008', '00000002', 'test chapter 08');
insert into `chapter` (id, course_id, name) values ('00000009', '00000002', 'test chapter 09');
insert into `chapter` (id, course_id, name) values ('00000010', '00000002', 'test chapter 10');
insert into `chapter` (id, course_id, name) values ('00000011', '00000002', 'test chapter 11');
insert into `chapter` (id, course_id, name) values ('00000012', '00000002', 'test chapter 12');
insert into `chapter` (id, course_id, name) values ('00000013', '00000003', 'test chapter 13');
insert into `chapter` (id, course_id, name) values ('00000014', '00000003', 'test chapter 14');

-- sections
drop table if exists `section`;
create table `section` (
  `id` char(8) not null default '' comment 'id',
  `title` varchar(50) not null comment '标题',
  `course_id` char(8) comment '课程|course.id',
  `chapter_id` char(8) comment '大章|chapter.id',
  `video` varchar(200) comment '视频',
  `time` int comment '时长|单位秒',
  `charge` char(1) comment '收费|c 收费；f 免费',
  `sort` int comment '顺序',
  `created_at` datetime(3) comment '创建时间',
  `updated_at` datetime(3) comment '修改时间',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='小节';

alter table `section` add column (`vod` char(32) comment 'vod|阿里云vod');

insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
values ('00000001', '测试小节01', '00000001', '00000001', '', 100, 'f', 1, now(), now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
values ('00000002', '测试小节02', '00000001', '00000001', '', 500, 'f', 2, now(), now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
values ('00000003', '测试小节03', '00000002', '00000008', '', 200, 'f', 1, now(), now());
insert into `section` (id, title, course_id, chapter_id, video, time, charge, sort, created_at, updated_at)
values ('00000004', '测试小节04', '00000003', '00000013', '', 300, 'f', 1, now(), now());

-- 分类
drop table if exists `category`;
create table `category` (
  `id` char(8) not null default '' comment 'id',
  `parent` char(8) not null default '' comment '父id',
  `name` varchar(50) not null comment '名称',
  `sort` int comment '顺序',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='分类';

insert into `category` (id, parent, name, sort) values ('00000100', '00000000', 'front-en', 100);
insert into `category` (id, parent, name, sort) values ('00000101', '00000100', 'html/css', 101);
insert into `category` (id, parent, name, sort) values ('00000102', '00000100', 'javascript', 102);
insert into `category` (id, parent, name, sort) values ('00000103', '00000100', 'vue.js', 103);
insert into `category` (id, parent, name, sort) values ('00000104', '00000100', 'react.js', 104);
insert into `category` (id, parent, name, sort) values ('00000105', '00000100', 'angular', 105);
insert into `category` (id, parent, name, sort) values ('00000106', '00000100', 'node.js', 106);
insert into `category` (id, parent, name, sort) values ('00000107', '00000100', 'jquery', 107);
insert into `category` (id, parent, name, sort) values ('00000108', '00000100', 'mini apps', 108);
insert into `category` (id, parent, name, sort) values ('00000200', '00000000', 'back-end', 200);
insert into `category` (id, parent, name, sort) values ('00000201', '00000200', 'java', 201);
insert into `category` (id, parent, name, sort) values ('00000202', '00000200', 'springboot', 202);
insert into `category` (id, parent, name, sort) values ('00000203', '00000200', 'spring cloud', 203);
insert into `category` (id, parent, name, sort) values ('00000204', '00000200', 'ssm', 204);
insert into `category` (id, parent, name, sort) values ('00000205', '00000200', 'python', 205);
insert into `category` (id, parent, name, sort) values ('00000206', '00000200', 'web crawler', 206);
insert into `category` (id, parent, name, sort) values ('00000300', '00000000', 'Mobile dev', 300);
insert into `category` (id, parent, name, sort) values ('00000301', '00000300', 'android', 301);
insert into `category` (id, parent, name, sort) values ('00000302', '00000300', 'ios', 302);
insert into `category` (id, parent, name, sort) values ('00000303', '00000300', 'react native', 303);
insert into `category` (id, parent, name, sort) values ('00000304', '00000300', 'ionic', 304);
insert into `category` (id, parent, name, sort) values ('00000400', '00000000', 'advanced techniques', 400);
insert into `category` (id, parent, name, sort) values ('00000401', '00000400', 'Micro services', 401);
insert into `category` (id, parent, name, sort) values ('00000402', '00000400', 'Blockchain', 402);
insert into `category` (id, parent, name, sort) values ('00000403', '00000400', 'Machine learning', 403);
insert into `category` (id, parent, name, sort) values ('00000404', '00000400', 'Deep learning', 404);
insert into `category` (id, parent, name, sort) values ('00000405', '00000400', 'Data analysis & mining', 405);
insert into `category` (id, parent, name, sort) values ('00000500', '00000000', 'Cloud computing & Big data', 500);
insert into `category` (id, parent, name, sort) values ('00000501', '00000500', 'Big data', 501);
insert into `category` (id, parent, name, sort) values ('00000502', '00000500', 'hadoop', 502);
insert into `category` (id, parent, name, sort) values ('00000503', '00000500', 'spark', 503);
insert into `category` (id, parent, name, sort) values ('00000504', '00000500', 'hbase', 504);
insert into `category` (id, parent, name, sort) values ('00000505', '00000500', 'Ali cloud', 505);
insert into `category` (id, parent, name, sort) values ('00000506', '00000500', 'docker', 506);
insert into `category` (id, parent, name, sort) values ('00000507', '00000500', 'kubernetes', 507);
insert into `category` (id, parent, name, sort) values ('00000600', '00000000', 'DevOps', 600);
insert into `category` (id, parent, name, sort) values ('00000601', '00000600', 'Operations', 601);
insert into `category` (id, parent, name, sort) values ('00000602', '00000600', 'Auto ops', 602);
insert into `category` (id, parent, name, sort) values ('00000603', '00000600', 'Middleware', 603);
insert into `category` (id, parent, name, sort) values ('00000604', '00000600', 'linux', 604);
insert into `category` (id, parent, name, sort) values ('00000605', '00000600', 'Test', 605);
insert into `category` (id, parent, name, sort) values ('00000606', '00000600', 'Auto test', 606);
insert into `category` (id, parent, name, sort) values ('00000700', '00000000', 'Sql', 700);
insert into `category` (id, parent, name, sort) values ('00000701', '00000700', 'Mysql', 701);
insert into `category` (id, parent, name, sort) values ('00000702', '00000700', 'Redis', 702);
insert into `category` (id, parent, name, sort) values ('00000703', '00000700', 'Mongodb', 703);

# 课程分类
drop table if exists `course_category`;
create table `course_category` (
  `id` char(8) not null default '' comment 'id',
  `course_id` char(8) comment '课程|course.id',
  `category_id` char(8) comment '分类|course.id',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='课程分类';

# 课程内容
drop table if exists `course_content`;
create table `course_content` (
  `id` char(8) not null default '' comment '课程id',
  `content` mediumtext not null comment '课程内容',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='课程内容';

-- 课程内容文件
drop table if exists `course_content_file`;
create table `course_content_file` (
  `id` char(8) not null default '' comment 'id',
  `course_id` char(8) not null comment '课程id',
  `url` varchar(100) comment '地址',
  `name` varchar(100) comment '文件名',
  `size` int comment '大小|字节b',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='课程内容文件';

-- 讲师
drop table if exists `teacher`;
create table `teacher` (
  `id` char(8) not null default '' comment 'id',
  `name` varchar(50) not null comment '姓名',
  `nickname` varchar(50) comment '昵称',
  `image` varchar(100) comment '头像',
  `position` varchar(50) comment '职位',
  `motto` varchar(50) comment '座右铭',
  `intro` varchar(500) comment '简介',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='讲师';
insert into `teacher` (id, name, nickname, image, position, motto, intro) values ('abcdefgh', 'tom', 'tommy', '', 'tokyo', 'everyday better', 'from us, good at java');
insert into `teacher` (id, name, nickname, image, position, motto, intro) values ('abcdefgi', 'jack', 'j', '', 'us', 'good job', 'nothing');
insert into `teacher` (id, name, nickname, image, position, motto, intro) values ('abcdefgj', 'leon', '?', '', 'china', 'dont do it next time', 'are you ready!');

-- 文件
drop table if exists `file`;
create table `file` (
  `id` char(8) not null default '' comment 'id',
  `path` varchar(100) not null comment '相对路径',
  `name` varchar(100) comment '文件名',
  `suffix` varchar(10) comment '后缀',
  `size` int comment '大小|字节B',
  `use` char(1) comment '用途|枚举[FileUseEnum]：COURSE("C", "讲师"), TEACHER("T", "课程")',
  `created_at` datetime(3) comment '创建时间',
  `updated_at` datetime(3) comment '修改时间',
  primary key (`id`),
  unique key `path_unique` (`path`)
) engine=innodb default charset=utf8mb4 comment='文件';

alter table `file` add column (`shard_index` int comment '已上传分片');
alter table `file` add column (`shard_size` int comment '分片大小|B');
alter table `file` add column (`shard_total` int comment '分片总数');
alter table `file` add column (`key` varchar(32) comment '文件标识');
alter table `file` add unique key key_unique (`key`);
alter table `file` add column (`vod` char(32) comment 'vod|阿里云vod');

drop table if exists `user`;
create table `user` (
  `id` char(8) not null default '' comment 'id',
  `login_name` varchar(50) not null comment '登陆名',
  `name` varchar(50) comment '昵称',
  `password` char(32) not null comment '密码',
  primary key (`id`),
  unique key `login_name_unique` (`login_name`)
) engine=innodb default charset=utf8mb4 comment='用户';

insert into `user` (id, login_name, name, password) values ('10000000', 'test', 'test', '62af1ad1efd8f9481692bc42f19ad963');

-- 资源
drop table if exists `resource`;
create table `resource` (
  `id` char(6) not null default '' comment 'id',
  `name` varchar(100) not null comment '名称|菜单或按钮',
  `page` varchar(50) null comment '页面|路由',
  `request` varchar(200) null comment '请求|接口',
  `parent` char(6) comment '父id',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='资源';

insert into `resource` values ('00', '欢迎', 'welcome', null, null);
insert into `resource` values ('01', '系统管理', null, null, null);
insert into `resource` values ('0101', '用户管理', 'system/user', null, '01');
insert into `resource` values ('010101', '保存', null, '["/system/admin/user/list", "/system/admin/user/save"]', '0101');
insert into `resource` values ('010102', '删除', null, '["/system/admin/user/delete"]', '0101');
insert into `resource` values ('010103', '重置密码', null, '["/system/admin/user/save-password"]', '0101');
insert into `resource` values ('0102', '资源管理', 'system/resource', null, '01');
insert into `resource` values ('010201', '保存/显示', null, '["/system/admin/resource"]', '0102');
insert into `resource` values ('0103', '角色管理', 'system/role', null, '01');
insert into `resource` values ('010301', '角色/权限管理', null, '["/system/admin/role"]', '0103');

drop table if exists `role`;
create table `role` (
  `id` char(8) not null default '' comment 'id',
  `name` varchar(50) not null comment '角色',
  `desc` varchar(100) not null comment '描述',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='角色';

insert into `role` values ('00000000', 'System manager', 'manage user/role resource/access');
insert into `role` values ('00000001', 'Developer', 'sustain the resources');
insert into `role` values ('00000002', 'Business manager', 'manage business');

drop table if exists `role_resource`;
create table `role_resource` (
  `id` char(8) not null default '' comment 'id',
  `role_id` char(8) not null comment '角色|id',
  `resource_id` char(6) not null comment '资源|id',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='角色资源关联';

insert into `role_resource` values ('00000000', '00000000', '00');
insert into `role_resource` values ('00000001', '00000000', '01');
insert into `role_resource` values ('00000002', '00000000', '0101');
insert into `role_resource` values ('00000003', '00000000', '010101');
insert into `role_resource` values ('00000004', '00000000', '010102');
insert into `role_resource` values ('00000005', '00000000', '010103');
insert into `role_resource` values ('00000006', '00000000', '0102');
insert into `role_resource` values ('00000007', '00000000', '010201');
insert into `role_resource` values ('00000008', '00000000', '0103');
insert into `role_resource` values ('00000009', '00000000', '010301');

drop table if exists `role_user`;
create table `role_user` (
  `id` char(8) not null default '' comment 'id',
  `role_id` char(8) not null comment '角色|id',
  `user_id` char(8) not null comment '用户|id',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='角色用户关联';

insert into `role_user` values ('00000000', '00000000', '10000000');

-- 会员
drop table if exists `member`;
create table `member` (
  `id` char(8) not null default '' comment 'id',
  `mobile` varchar(11) not null comment '手机号',
  `password` char(32) not null comment '密码',
  `name` varchar(50) comment '昵称',
  `photo` varchar(200) comment '头像url',
  `register_time` datetime(3) comment '注册时间',
  primary key (`id`),
  unique key `mobile_unique` (`mobile`)
) engine=innodb default charset=utf8mb4 comment='会员';

# 初始test/test
insert into `member` (id, mobile, password, name, photo, register_time) values ('00000000', '12345678901', 'e70e2222a9d67c4f2eae107533359aa4', '测试', null, now());

# 短信验证码
drop table if exists `sms`;
create table `sms` (
  `id` char(8) not null default '' comment 'id',
  `mobile` varchar(50) not null comment '手机号',
  `code` char(6) not null comment '验证码',
  `use` char(1) not null comment '用途|枚举[SmsUseEnum]：REGISTER("R", "注册"), FORGET("F", "忘记密码")',
  `at` datetime(3) not null comment '生成时间',
  `status` char(1) not null comment '用途|枚举[SmsStatusEnum]：USED("U", "已使用"), NOT_USED("N", "未使用")',
  primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='短信验证码';

insert into `sms` (id, mobile, code, `use`, at, status) values ('00000000', '12345678901', '123456', 'R', now(), 'N');

# 会员课程报名
drop table if exists `member_course`;
create table `member_course` (
  `id` char(8) not null default '' comment 'id',
  `member_id` char(8) not null comment '会员id',
  `course_id` char(8) not null comment '课程id',
  `at` datetime(3) not null comment '报名时间',
  primary key (`id`),
  unique key `member_course_unique` (`member_id`, `course_id`)
) engine=innodb default charset=utf8mb4 comment='会员课程报名';

-- # ---------------------- 测试
-- # drop table if exists `test`;
-- # create table `test` (
-- #   `id` char(8) not null default '' comment 'id',
-- #   `name` varchar(50) comment '名称',
-- #   primary key (`id`)
-- # ) engine=innodb default charset=utf8mb4 comment='测试';
-- #
-- # insert into `test` (id, name) values (1, '测试');
-- # insert into `test` (id, name) values (2, '测试2');