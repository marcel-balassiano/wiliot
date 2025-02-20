Hi , a separeted all resources created  from terraform 
namespace used - marcel 

terraform_show.txt - resources created 

- ks8 commands and scripts

- app python created by me

-rds 
~ /opt/homebrew/opt/postgresql@15/bin/psql -hpostgresql-instance.cjhcxu64g69o.us-east-2.rds.amazonaws.com -Upgmaster -dpostgres

list of dbs:

            List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+-------------+-------------+------------+----
-------------+-----------------------
 postgres  | pgmaster | UTF8     | en_US.UTF-8 | en_US.UTF-8 |            | lib
c            |
 rdsadmin  | rdsadmin | UTF8     | en_US.UTF-8 | en_US.UTF-8 |            | lib
c            | rdsadmin=CTc/rdsadmin
 template0 | rdsadmin | UTF8     | en_US.UTF-8 | en_US.UTF-8 |            | lib
c            | =c/rdsadmin          +
           |          |          |             |             |            |
             | rdsadmin=CTc/rdsadmin
 template1 | pgmaster | UTF8     | en_US.UTF-8 | en_US.UTF-8 |            | lib
c            | =c/pgmaster          +
           |          |          |             |             |            |
             | pgmaster=CTc/pgmaster
 wiliot    | pgmaster | UTF8     | en_US.UTF-8 | en_US.UTF-8 |            | lib
c            |
 wiliot_db | pgmaster | UTF8     | en_US.UTF-8 | en_US.UTF-8 |            | lib
c            |

- load Balancer - using ingress -  i try to add anither loadbalance before a db, but i prefer to work on resolve pods issue. 


i couldn't finish because i can't resolve a error of pvc that is not allocating volume for pods 
i'm adding some screen shot 
<img width="793" alt="image" src="https://github.com/user-attachments/assets/3dd39992-b059-4f69-93d7-98b658ab68ae" />

<img width="772" alt="image" src="https://github.com/user-attachments/assets/b7b076a6-87c2-4ca7-a68e-fb2bd51116c8" />




 kubectl describe pod flask-app-56fcd6bb9b-4wmg2 -n marcel
or 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason            Age                    From               Message
  ----     ------            ----                   ----               -------
  Warning  FailedScheduling  2m45s (x28 over 137m)  default-scheduler  0/2 nodes are available: 2 node(s) had untolerated taint 
  {node.cloudprovider.kubernetes.io/uninitialized: true}. 
  preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling.

