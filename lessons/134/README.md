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


CSI Driver
kubectl apply -f aws-ebs-csi-driver

Installation
kubectl create -f prometheus-operator-crd
kubectl apply -R -f prometheus
kubectl get pods -n monitoring
kubectl -n monitoring port-forward svc/prometheus-operated 9090

Zookeeper
kubectl apply -f zookeeper/namespace.yaml
kubectl apply -f zookeeper
kubectl get pods -n zookeeper

Cadviros
kubectl apply -f cadvisor

Grafana
kubectl create -f dashboards
kubectl apply -f grafana
kubectl get pods -n monitoring
kubectl -n monitoring port-forward svc/grafana 3000


curl localhost:8001/api/v1/nodes/









ebs csi driver (volume metrics) - https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/metrics.md#volume-stats-metrics
kube-state-metrics (PersistentVolume Metrics) - https://github.com/kubernetes/kube-state-metrics/blob/master/docs/persistentvolume-metrics.md#persistentvolume-metrics


aws eks update-kubeconfig \
  --name demo \
  --region us-east-1

Installation
kubectl create -f prometheus-operator-crd
kubectl apply -R -f prometheus
kubectl get pods -n monitoring
kubectl -n monitoring port-forward svc/prometheus-operated 9090
kubectl apply -f kubelet

kubelet_volume_stats_capacity_bytes




go to prometheus ui and type "volume" -> execute "kubelet_volume_stats_capacity_bytes"
value / 1000000000



kubelet_volume_stats_used_bytes / kubelet_volume_stats_capacity_bytes

{{ persistentvolumeclaim }}

Persistent Volume Usage

Decimals: 1

Persistent Volume Inodes Usage

kubelet_volume_stats_inodes_used / kubelet_volume_stats_inodes

create variable:
namespace


label_values(metric, label)	Returns a list of label values for the label in the specified metric.

label_values(kubelet_volume_stats_capacity_bytes, namespace)

kubelet_volume_stats_used_bytes{namespace=~"$namespace"} / kubelet_volume_stats_capacity_bytes{namespace=~"$namespace"}

Persistent Volume Usage per Namespace


deploy grafana
kubectl apply -R -f grafana
kubectl -n grafana port-forward svc/grafana 3000
create dashboard
add a new raw (kubelet)
persisten
persent (0 - 1)

k exec -it prometheus-main-0 -n monitoring -- sh
df -h
dd if=/dev/zero of=/prometheus/test.file bs=1G count=1

generate file in prometheus container
