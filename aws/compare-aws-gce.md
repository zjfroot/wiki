https://lugassy.net/why-we-moved-from-amazon-web-services-to-google-cloud-platform-726c412fd667#.jbfz7m4vf

https://cloud.google.com/docs/compare/aws/


###Compare basic terms
| |AWS  | GCE |
|-----|------------- | ------------- |
|Data centers and resources in one geological location |Region|Region|
|Independent data center in one geological location|Availability Zone	|Zone|
|Edge Caching|Edge location|POP|

http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-regions-availability-zones

https://cloud.google.com/docs/geography-and-regions
###Numbers



###Compute

| |AWS  | GCE |
| ----|------------- | ------------- |
| Container | ECS | Google Container Engine  |
| Serverless | Lambda  | Functions |
| Virtual Machine|EC2|Compute engine|
| PaaS|AWS Elastic Beanstalk| App Engine|

###Storage
| |AWS  | GCE |
| ----|------------- | ------------- |
| Object storage | S3 | Google Cloud Storage  |
| Block storage | EBS  | Persistent Disks |
| Cold storage|Glacier|Google Cloud storage nearline|
| File storage|AWS Elastic File System (EFS)| ZFS/Avere|
| CDN |Cloud Front| Google Cloud CDN |


###Database
| |AWS  | GCE |
| ----|------------- | ------------- |
| RDBMS | RDS | Google Cloud SQL  |
| NoSQL, key-value | DynamoDB  | Bigtable |
| NoSQL, indexed|Simple DB|Google Cloud Datastore|
| Cache Service |ElasticCache| ??? |
| Migration |AWS Database migration service| ??? |

###Networking
| |AWS  | GCE |
| ----|------------- | ------------- |
| Load balancer | ELB | Google Cloud Load Balancing  |
| Peering | Direct Connect  | Google Cloud Interconnect |
| Isolated Cloud Resources|VPC|???|
| DNS |Route 53| Google Cloud DNS |

###BI/Big Data/Analytics
| |AWS  | GCE |
| ----|------------- | ------------- |
| Batch Data Processing | EMR | Google Cloud Dataproc/Dataflow  |
| Streaming Data Processing | Kinesis  | Dataflow |
| Streaming Data ingest |Kines|Google Cloud Pub/Sub|
| Analytics |Redshift| BigQuery |
| Maching Learning |Amazon Marchine Learning| ??? |

###App services
| |AWS  | GCE |
| ----|------------- | ------------- |
| Message Queues | SQS | ???  |
| Notifications | SNS  | Pub/Sub |
| Email Service | SES  |???|
| Custom Search | Cloud Search | ??? |
| API management | API Gateway | ??? |
| App streaming | AppStream | ??? |
| Media transcoding | Elastic Transcoder | ??? |


###Management tools
| |AWS  | GCE |
| ----|------------- | ------------- |
| Monitoring | CloudWatch | Stackdriver Monitoring  |
| Resource provisioning | GloudFormation  | Deployment manager |
| Usage Auditing |Cloud Trail|???|


###Security & identity
| |AWS  | GCE |
| ----|------------- | ------------- |
| User Management | IAM | ???  |
| Certificate Management | Certificate Manager  | ??? |
| Encryption Key storage, regulated compliance | CloudHSM |???|
| Encryption Key management, regulated compliance | AWS Key Management Service |???|
| Directory Service | AWS Directory Service  | ??? |
| Security Management | Amazon Inspector  | ??? |
| Web Application Firewall | AWS WAF  | ??? |

###Billing
| |AWS  | GCE |
| ----|------------- | ------------- |
| Grouped accounts | Consilidated Billing | ???  |
| Interval of compute resource  | Per hour  | Per minute |
