#cloud-config
merge_how: dict(recurse_array)+list(append)
write_files:
  - path: /etc/kubernetes/config/worker-kubeconfig.yaml
    owner: "root:root"
    permissions: "0644"
    content: |
      apiVersion: v1
      kind: Config
      clusters:
        - cluster:
            server: http://127.0.0.1:8080
          name: kubernetes
      contexts:
        - context:
            cluster: kubernetes
            user: kubelet
          name: kubelet-to-kubernetes
      current-context: kubelet-to-kubernetes
      users:
        - name: kubelet
