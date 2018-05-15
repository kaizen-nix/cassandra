CREATE KEYSPACE VotingSystem
               WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};
        
         CREATE TABLE  VotingTopic (
             id uuid,
             topic text,
             valid_from timestamp,
             valid_till timestamp,
             created_on timestamp,
             updated_on timestamp,
             PRIMARY KEY (id,valid_from, valid_till)
           )  WITH CLUSTERING ORDER BY (valid_from ASC, valid_till ASC);
       

           select option, count(*) from VotingOption where votingtopicid= ?

          CREATE TABLE VotingOption (
            id uuid,
            votingTopicId uuid,
            votingTopic text,
            optionText text,
            valid_from timestamp,
            count bigint,
            created_on timestamp,
            updated_on timestamp,
            PRIMARY KEY((votingTopicId, id),valid_from)
          ) WITH CLUSTERING ORDER BY (valid_from ASC);
