ALTER DATABASE rdorgan CHARACTER SET utf8 COLLATE utf8_unicode_ci;
drop table if exists articleTag;
drop table if exists Interactions;
drop table if exists ForumPosts;
drop table if exists Profile;

create table Profile(
    profileID binary(16) not null,
    profileActivationToken char(32), primary key,
    profileAvatar,
    profilePhone VARCHAR(10) not null,
    profileEmail VARCHAR(25) not null,
);
create table ForumPosts(
    postId binary(16) not null,
    postName varchar(32) not null,
    authorAvatar,
    threadPostDate VARCHAR(8) not null,
    threadPostContent VARCHAR(777), not null,
    articleImage varchar(255),
    articleDate datetime(7) not null,
	 foreign key(profileId) references author(postId),


);
create table Interactions(
   redditUpvote,
   redditDownvote,
   articleReplyID VARCHAR(16) not null,
   articleReply VARCHAR(777) not null,

);

);