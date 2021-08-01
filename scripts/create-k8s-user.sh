openssl genrsa -out john.key 2048
openssl req -new -key john.key -out john.csr

cat <<EOF | kubectl --kubeconfig kubeconfig apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: john
spec:
  request: $(cat john.csr | base64 -w0)
  signerName: kubernetes.io/kube-apiserver-client
  usages:
    - client auth
EOF

kubectl certificate approve john

# get  certificate
kubectl --kubeconfig kubeconfig get csr john -o jsonpath='{.status.certificate}'| base64 -d > john.crt


# create role
kubectl --kubeconfig kubeconfig create role developer --verb=get,create,list,update,delete --resource=pods

# create rolebinding
kubectl --kubeconfig kubeconfig create rolebinding developer-binding-john --role=developer --user=john

# set user
kubectl --kubeconfig kubeconfig config set-credentials john --client-key=john.key --client-certificate=john.crt --embed-certs=true
kubectl --kubeconfig kubeconfig config set-context john --cluster=kubernetes --user=john

# validate
kubectl --kubeconfig kubeconfig get pods
kubectl --kubeconfig kubeconfig get no

# change context back
kubectl --kubeconfig kubeconfig config use-context kubernetes-admin


