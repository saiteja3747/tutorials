Staff to include
- kustomize instead of helm (explain) (built in to kubectl supported by most CD tools)
- why not to use kafka operator - You can use Confluent Control Center for a 30-day trial period without a license key.
- load tests with default configuration
- The main intent of this test is to find out the following stats:
    1. Throughput(messages/sec) on size of data
    2. Throughput(messages/sec) on number of messages
    3. Total data
    4. Total Messages

Links
Let’s Load test, Kafka! - https://medium.com/selectstarfromweb/lets-load-test-kafka-f90b71758afb
Kafka requerements - https://docs.confluent.io/platform/current/kafka/deployment.html#memory
Running Apache Kafka in Production - https://developer.confluent.io/podcast/running-apache-kafka-in-production/?_ga=2.192827690.1478841638.1668369384-484006472.1668369384
Kafka architecture has been greatly simplified by the introduction of Apache Kafka Raft Metadata mode (KRaft) - https://docs.confluent.io/platform/current/kafka/deployment.html#production-configuration-options
To learn about benchmark testing and results for Kafka performance on the latest hardware in the cloud, see - https://developer.confluent.io/learn/kafka-performance/?_ga=2.197072300.1478841638.1668369384-484006472.1668369384

Notes:
https://www.atamanroman.dev/development/2019/09/11/usecontainersupport-to-the-rescue.html
setting -Xmx and -Xms disables the automatic heap sizing.
XX:MaxRAMPercentage=75.0
