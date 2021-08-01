apt install etcd-client -y

# get member list
ETCDCTL_API=3 etcdctl --endpoints "https://172.31.233.208:2379" \
--cacert /etc/kubernetes/pki/etcd/ca.crt --key /etc/kubernetes/pki/etcd/server.key \
--cert /etc/kubernetes/pki/etcd/server.crt member list

