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

## Kubernetes Components:

*Dùng phương pháp Socrates để học*

### Level 1: Recall 

---

**Câu 1:** Một cluster gồm hai phần lớn nào? Liệt kê các component thuộc mỗi phần. Trong đó, component nào được docs đánh dấu (optional), và theo bạn, trong tình huống thực tế nào thì cluster không cần đến chúng?

Trả lời: 

1 Cluster gồm 2 thành phần lớn là 1 Control Plane Node và 1 (hoặc nhiều hơn 1) Worker Nodes.

***Control Plane Node:*** *Quản lý trạng thái tổng thể của Cluster*

- kube-apiserver: Cung cấp các HTTP API của Kubernetes.

- etcd: Hệ thống lưu trữ dữ liệu dạng key-value của toàn bộ API server/cluster.

- kube-scheduler: Theo dõi các Pod mới được tạo ra nhưng chưa được gắn vào node; Lựa chọn và gán các Pod đó vào node phù hợp để Pod hoạt động.

- kube-controller-manager: Thực thi các controller-processes (các lệnh) để triển khai Kubernetes API behavior.

- cloud-controller-manager **(Optional)**: Tích hợp các logic điều khiển dành riêng cho Cloud Provider (AWS, GCP, Azure...). Nếu chạy K8s trên môi trường on-premises hoặc trên máy tính cá nhân, thì cluster k8s sẽ không có thành phần này.

---

**Câu 2:** etcd lưu trữ cái gì? Trong số các component, component nào là component duy nhất đọc/ghi trực tiếp vào etcd? Theo bạn, tại sao kiến trúc lại được thiết kế như vậy thay vì cho mọi component tự truy cập etcd?

**Câu 3:** Phân biệt **Core Components** và **Addons**. DNS thuộc nhóm nào? Nếu cluster không cài DNS addon, một Pod gọi `http://my-service` sẽ gặp chuyện gì? (gợi ý: domain `my-service` có resolve được không, và vẫn có thể gọi trực tiếp bằng ClusterIP không?)

### Level 2: Understanding

TODO

## Triển khai cụm cluster K8s

TODO

## Thực hành thao tác với cụm K8s

TODO
