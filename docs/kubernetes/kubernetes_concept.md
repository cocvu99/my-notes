Phần nền tảng: 

- **Container** chỉ là một **Linux process** bị cô lập bởi `namespaces` (nhìn thấy gì) và giới hạn bởi `cgroups` (dùng được bao nhiêu).

- **Docker Engine chỉ quản lý container trên đúng 1 host**. `docker run --restart=always` chỉ restart container khi process chết, nhưng nếu cả host chết thì không ai làm gì cả.

- **Bài toán Build: Đóng gói app thành image như thế nào?** Sử dụng Dockerfile + `docker build`, Buildpacks, `ko`, Jib, Buildah -> Docker engine chỉ giải quyết được bài toán Build

- **Điều phối (orchestration)** là bài toán ở tầng *cluster*, không phải tầng container

Do vậy:

- **Kubernetes sẽ giải quyết các bài toán về điều phối (orchestration) các container trên cluster:** Scheduling trên nhiều node, self-healing, Autoscaling (HPA, Cluster Autoscaler), ...


# Khái niệm về Kubernetes


## Kubernetes Không Phải là:

K8s không phải là một PaaS (Platform as a Service) toàn diện/truyền thống.

Vì K8s hoạt động ở container level (không phải hardware level), nó có thể cung cấp các tính năng như deployment, scaling, load balancing; và người dùng có thể tích hợp các giải pháp logging, monitoring, alerting (Khá giống với 1 giải pháp PaaS). Tuy nhiên Kubernetes không phải là một hệ thống nguyên khối (monolithic). Dù K8s cung cấp các building blocks để xây developer platform, các giải pháp mặc định đều tùy chọn, linh hoạt và có thể thay thế (quyền lựa chọn thuộc về người dùng).

**Kubernetes:**

- **Không giới hạn loại ứng dụng được hỗ trợ:** stateless, stateful, hay data-processing workloads đều được. **Chạy được trên container là chạy được trên K8s**

- **Không deploy source, cũng như không build app:** Các việc như Continuous Integration, Delivery, hay Deployment (CI/CD) workflows thì được xác định bởi văn hóa, tính ưu tiên và đặc điểm kỹ thuật của tổ chức, của công ty bạn. → K8s không liên quan.

- **Không cung cấp sẵn các service ở application-level:** như middleware (message buses), data-processing framework (Spark), database (MySQL), cache, hay cluster storage system (Ceph) dưới dạng built-in service. Chúng chạy trên K8s, và/hoặc được truy cập bởi các ứng dụng đang chạy trên Kubernetes, nhưng ***K8s không đóng gói sẵn chúng***.

# Triển khai cụm cluster K8s

# Thực hành thao tác với cụm K8s
