ALTER DATABASE rdorgan CHARACTER SET utf8 COLLATE utf8_unicode_ci;
drop table if exists articleTag;
drop table if exists Interactions;
drop table if exists ForumPosts;
drop table if exists Profile;

create table profile(
    profileId binary(16) not null,
    profileActivationToken char(32),
    profilePhone VARCHAR(15) not null,
    profileEmail VARCHAR(50) not null,
    profileUsername VARCHAR(20) not null,
    PRIMARY KEY(profileId),
    UNIQUE(profileEmail),
    UNIQUE(profileUsername),
    UNIQUE(profilePhone)

);
create table post(
    postId binary(16) not null,
    postProfileId BINARY(16) NOT NULL,
    postTitle varchar(32) not null,
    postDateTime DATETIME(6) not null,
    postContent VARCHAR(256) not null,
    postImage varchar(255),
	 INDEX(postProfileId),
	 PRIMARY KEY(postId),
	 foreign key(postProfileId) references profile(profileId)

);
create table interaction(
   interactionId BINARY(16) not null,
   interactionPostId BINARY (16) not null,
   interactionProfileId BINARY(16) not null ,
   interactionUpvote BOOLEAN,
   interactionDownvote BOOLEAN,
   interactionReplyId VARCHAR(16) not null,
   interactionReply VARCHAR(256) not null,
   INDEX(interactionProfileId),
   INDEX(interactionPostId),
   PRIMARY KEY(interactionId),
   FOREIGN KEY(interactionProfileId) references profile(profileId),
   FOREIGN KEY(interactionPostId) references post(postId)
/*article columns are meant for the subject area of the post or reply*/
);