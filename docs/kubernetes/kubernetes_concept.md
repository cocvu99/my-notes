Phần nền tảng: 

- **Container** chỉ là một **Linux process** bị cô lập bởi `namespaces` (nhìn thấy gì) và giới hạn bởi `cgroups` (dùng được bao nhiêu).

- **Docker Engine chỉ quản lý container trên đúng 1 host**. `docker run --restart=always` chỉ restart container khi process chết, nhưng nếu cả host chết thì không ai làm gì cả.

- **Bài toán Build: Đóng gói app thành image như thế nào?** Sử dụng Dockerfile + `docker build`, Buildpacks, `ko`, Jib, Buildah -> Docker engine chỉ giải quyết được bài toán Build

- **Điều phối (orchestration)** là bài toán ở tầng *cluster*, không phải tầng container

Do vậy:

- **Kubernetes sẽ giải quyết các bài toán về điều phối (orchestration) các container trên cluster:** Scheduling trên nhiều node, self-healing, Autoscaling (HPA, Cluster Autoscaler), ...


# Khái niệm về Kubernetes

# Triển khai cụm cluster K8s

# Thực hành thao tác với cụm K8s
