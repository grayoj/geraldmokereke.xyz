---
title: "Why I don't like Mongo DB"
date: 2024-01-18T10:17:51+01:00
tags: ["databases"]
draft: false
---

Gerald, why so much hate for Mongo DB? You don't understand **SCALE!**

![Mongo DB, A Joke](https://i.ibb.co/s3TNdNB/mongodb.png)

Yes, I like boring relational databases. I love SQL, SQLite. Except it's Oracle owned.

Before anything else, once Mongo DB comes up — the first thing that comes to my mind is _data integrity_ as it should be. Mongo DB as we all know is a NoSQL database that has gained popularity over the years. Ah, partly because it’s being used in maybe — _every single Node JS beginner tutorial on the internet?_ Maybe that, or because in standard industries such as banking/finance, education, we tend to lean towards structured data which Mongo DB is a train-wreck for such use cases.

Mongo DB unlike the traditional SQL (relational databases) defaults in ACID (Atomicity, Consistency, Isolation, Durability) that guarantees transactional consistency and data integrity. Mongo DB assumes it’s worth sacrificing data integrity and consistency for your application in favor of performance and scalability.

Also I find the memory usage in Mongo DB pretty [disgusting and not encouraging](https://dba.stackexchange.com/questions/148395/mongodb-using-too-much-memory). I’m sorry to say. MongoDB’s memory and storage usage/overhead is extremely noticeable, particularly in environments dealing large datasets and high write throughput. Hence you’d find Mongo DB in your environment kind of slowing down your other applications.

> So just use SQL, for petesake. Here’s a [benchmark](https://www.enterprisedb.com/news/new-benchmarks-show-postgres-dominating-mongodb-varied-workloads).

So as the datasets grow more than the available memory capacity, Mongo DB begins to dwindle, unfortunately.

Another clear in the night sky issue with Mongo DB, is Mongo DB’s [Eventual Consistency Model](https://stackoverflow.com/questions/33589380/how-does-mongos-eventual-consistency-work-with-a-large-number-of-data-writes). MongoDB implements an eventual consistency model, in which data updates are propagated asynchronously across distributed nodes. Though eventual consistency enhances system scalability and availability, it introduces challenges and complexity in ensuring immediate data consistency. In scenarios where immediate consistency is paramount, MongoDB's eventual consistency would fall short, aggravating data integrity concerns.

![Eventual Consistency in Distributive systems](https://media.geeksforgeeks.org/wp-content/uploads/20230227103752/eventual_consistenct.png)

I found this article here on [geeks for geeks](https://www.geeksforgeeks.org/eventual-consistency-in-distributive-systems-learn-system-design) good enough to understand the model.

Limited join support is also another terrible, terrible problem. Mongo DB doesn’t support joins like in regular SQL relational databases. In the need to perform certain complex joins across several collections, I can fully guarantee that the experience is awful. In summary I genuinely feel Mongo DB throws out data consistency, integrity, memory management functions in the name of “scalability.” I find that absolutely catastrophic.

Lastly writing queries in Mongo DB is pretty much complex, compared to traditional relational databases. I mean, just look at that!

{{< tweet user="pilcrowonpaper" id="1750431140585062622" >}}

Funny enough, I’d only ever use Mongo DB for “pet projects” I may never roll out. I said pet because in my opinion it’s beneath _hobby_ projects, which I would definitely use SQLite for — or a simple store solution. I started [coughing blood](https://www.reddit.com/r/node/comments/vn2awc/comment/ie4n8s1/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) seeing this comment on Reddit.

I think most people going crazy over Mongo DB is due to the ease of setup and being very useful for prototyping projects. People love low-bar solutions that they can dip their feet into. The shallow end of the pool to be precise, before they move up and possibly drown. I mean look at Python. Toodles.
