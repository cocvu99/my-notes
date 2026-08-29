# Example 2: 

Role: DevOps Engineer/DevSecOps Engineer

### Nhóm 1: Kubernetes (K8s) Core & Storage:

#### 1. *QoS & Scheduling*: 
Trong Kubernetes, ***requests*** đóng vai trò gì trong quá trình lập lịch (scheduling) cho Pod? Hãy giải thích mối liên hệ giữa requests, limits và các lớp Quality of Service (QoS classes).

Trả lời:

  - Giải thích vai trò: Kube-scheduler nhìn vào requests (số CPU/Memory tối thiểu) để tìm một Node có đủ tài nguyên trống và xếp Pod và đó (Scheduling)

  - Ý nghĩa QoS (Quality of Service): K8s chia Pod thành 3 mức độ ưu tiên khi Node bị thiếu tài nguyên (OOM):

    - **Guaranteed**: Pod có $requests = limits$. An toàn nhất. Khó bị đuổi (evict) nhất.

    - **Burstable**: Pod có $requests < limits$ .

    - **BestEffort**: Pod không có cấu hình requests và limits. Bị đuổi đầu tiên khi Node cạn tài nguyên.

#### 2. *Pod Startup Order*: 
Khi triển khai một ứng dụng kèm cơ sở dữ liệu, làm thế nào để đảm bảo Pod Database được khởi động và ở trạng thái sẵn sàng (ready) trước khi Pod Application bắt đầu chạy?

K8s mặc định khởi động các Pod song song. Để đảm bảo ứng dụng chỉ chạy khi database đã sẵn sàng, ta dùng Init Containers.

Cách làm: Thêm config initContainer bên trong cấu hình của ứng dụng. Container phụ này sẽ chạy một đoạn script (ví dụ: Lệnh <code>nc -z {db-host} {port}</code> liên tục) để kiểm tra kết nối mạng đến database. Chỉ khi lệnh này thành công, initContainer mới kết thúc và K8s mới bắt đầu chạy container chính

Ví dụ: file pod.yaml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: web-app-pod
  labels:
    app: web-app
spec:
  # 1. KHỐI INIT CONTAINERS (Chạy trước, chạy tuần tự và phải thành công)
  initContainers:
  - name: wait-for-postgreSQL
    image: busybox:1.28
    command: 
      - 'sh'
      - '-c'
      - 'until nc -z postgresql-db-service 5432; do echo "Waiting for postgreSQL to be ready..."; sleep 2; done;'

  # 2. KHỐI CONTAINERS CHÍNH (Chỉ chạy khi khối Init ở trên đã hoàn thành)
  containers:
  - name: web-app-main
    image: web-app:v1.0.0
    ports:
    - containerPort: 8080
    env:
    - name: DB_HOST
      value: "postgresql-db-service"

```

Chạy lệnh
<code>kubectl apply -f pod.yaml</code>

Sau khi chạy lệnh trên Kubernetes sẽ thực hiện luồng công việc sau:

- **Tạo môi trường mạng**: K8s cấp cho Pod này một địa chỉ IP nội bộ.

- **Kích hoạt initContainers**: K8s tải image busybox (một image Linux cực nhẹ, chứa các công cụ cơ bản) và chạy lệnh command đã khai báo.

  - Chi tiết lệnh: Vòng lặp until kết hợp với công cụ mạng nc (netcat) sẽ liên tục “gõ cửa” port 5432 của dịch vụ *postgresql-db-service*

  - Nếu gõ cửa thất bại (cổng chưa mở), nó in ra dòng log "Waiting...", ngủ 2 giây (sleep 2), rồi thử lại.

  - Nó sẽ kẹt ở vòng lặp này mãi mãi cho đến khi **postgreSQL** thực sự sẵn sàng nhận kết nối.

- **Bàn giao cho containers chính**: Ngay khoảnh khắc lệnh nc thành công (vòng lặp kết thúc, InitContainer exit với mã 0), Kubernetes lập tức khai tử cái container busybox này và chính thức khởi động container web-app-main. Lúc này, app của bạn có thể kết nối database khi triển khai.

#### 3. *Node Placement*:
Làm thế nào để chỉ định một Pod chỉ được phép chạy trên các Node có gắn ổ cứng SSD?

#### 4. *Downward API*: 
Làm sao để một tiến trình bên trong Pod có thể đọc được các thông tin metadata của chính Pod đó (như label, annotation, pod name, namespace)?

#### 5. *Data Migration*: 
Nêu các phương pháp để di chuyển dữ liệu từ một Persistent Volume (PV) cũ sang một Persistent Volume (PV) mới bên trong cùng một cluster?

#### 6. *Volumes Lifecycle* :
Trong Kubernetes, hãy phân biệt hai loại Volume là emptyDir và hostPath. Ý nghĩa, mục đích sử dụng và vòng đời (lifecycle) của dữ liệu trong từng loại này khác nhau như thế nào? 

### Nhóm 2: Helm & Application Deployment

####  7. *Multi-environment Helm*: 
Dự án cần deploy trên nhiều môi trường (dev, staging, production) với các cấu hình khác nhau. Bạn sẽ tổ chức cấu trúc Helm Chart và quản lý các file values.yaml như thế nào để tái sử dụng code tốt nhất? 

#### 8. *Helm Subchart / Config Reload*: 
Bạn đang dùng một Helm chart có chứa dependency là Redis. Làm thế nào để override (ghi đè) cấu hình của Redis từ file values.yaml của chart cha? Làm sao để cập nhật cấu hình (ConfigMap) cho Redis đang chạy mà không cần khởi động lại (restart) Pod? Liệu có thực hiện được không và tại sao?

#### 9. *Helm Dependency Troubleshooting*: 
Khi triển khai (deploy) một Helm Chart, bạn gặp thông báo lỗi liên quan đến việc thiếu các dependencies hoặc version mismatch (sai lệch phiên bản). Bạn hãy nêu các bước để kiểm tra, cập nhật và xử lý triệt để vấn đề này? 

### Nhóm 3: Linux, Logging & Troubleshooting

#### 10. *CrashLoopBackOff*: 
Khi một Pod rơi vào trạng thái CrashLoopBackOff, các bước gỡ lỗi (troubleshooting) tuần tự của bạn là gì? Lệnh hoặc công cụ nào là hữu ích nhất trong bước đầu tiên?

#### 11. *Container Logging*: 
Tại sao việc ứng dụng ghi log trực tiếp ra chuẩn đầu ra stdout và stderr lại được coi là Best Practice khi chạy trong Container?

#### 12. *Full Disk Production*: 
Hệ thống cảnh báo Server Production bị đầy dung lượng ổ cứng. Bạn sẽ dùng các lệnh Linux nào để xác định chính xác thư mục/file nào đang chiếm nhiều dung lượng nhất, và hướng xử lý tình huống này là gì?

#### 13. *Network Debug Flow*: 
Ứng dụng không thể kết nối đến dịch vụ của bên thứ ba (3rd party API). Nêu quy trình khoanh vùng lỗi mạng, các công cụ bạn sẽ sử dụng (như curl, telnet, traceroute, nslookup) và cách xử lý? 

#### 14. *Linux Cron Job*: 
Trong hệ điều hành Linux, làm thế nào để tạo và quản lý một tác vụ tự động chạy định kỳ (cron job)? Nêu các lệnh cơ bản và cú pháp để thiết lập thời gian cho một tác vụ.

Trong Linux, dịch vụ chạy ngầm chịu trách nhiệm theo dõi thời gian và kích hoạt các tác vụ được gọi là `cron daemon`. Để tương tác với dịch vụ này và cấu hình các tác vụ cá nhân, chúng ta sử dụng công cụ có tên là `crontab` (cron table).

- Các thao tác cơ bản:

  - Mở trình soạn thảo để thêm/sửa tác vụ: Chạy lệnh `crontab -e`.

  - Xem danh sách các tác vụ đang có: Chạy lệnh `crontab -l`.

  - Xóa toàn bộ các tác vụ hiện tại: Chạy lệnh crontab -r (nên dùng thêm flag -i để xác nhận trước khi xóa).

- Cú pháp thiết lập thời gian (Cron Expression):

Một dòng cấu hình cron job tiêu chuẩn bao gồm 5 trường (fields) thời gian, theo sau là đường dẫn đến lệnh hoặc script cần chạy. Cấu trúc 5 trường đó (từ trái qua phải) đại diện cho:

  1. Minute (Phút): 0 - 59

  2. Hour (Giờ): 0 - 23

  3. Day of month (Ngày trong tháng): 1 - 31

  4. Month (Tháng): 1 - 12

  5. Day of week (Ngày trong tuần): 0 - 7 (với 0 và 7 đều là Chủ nhật)

Ví dụ: Nếu bạn muốn chạy file `backup.sh` vào lúc 2:30 sáng mỗi ngày, cú pháp sẽ là:

```bash
30 2 * * * /path/to/backup.sh
```

### Nhóm 4: CI/CD & Automation

#### 15. *Git Workflow*: 
Phát hiện một developer vô tình commit và push code lỗi trực tiếp lên nhánh main/master. Bạn sẽ xử lý sự cố này như thế nào và làm sao để ngăn chặn điều này tái diễn?

#### 16. *Terraform in CI/CD*: 
Làm thế nào để tích hợp và tự động hóa quá trình chạy Terraform vào trong một pipeline CI/CD?
*Hint: Một cách an toàn (như quản lý remote state, state lock, review plan)*

#### 17. *Jenkins Optimization*: 
Một Jenkins pipeline chạy mất quá nhiều thời gian để hoàn thành. Bạn có những chiến lược hoặc cấu hình nào để tối ưu hóa thời gian build và deploy? 

### Nhóm 5: Programming, Database & Architecture
#### 18. *Backend Scalability*: 
Làm sao bạn đảm bảo/thiết kế được một hệ thống backend có khả năng mở rộng (scalable) để chịu tải cao?

*Hint: Không được trả lời bằng cách đưa ra giải pháp ngay lập tức. Mà hãy làm rõ (clarify) vấn đề để hiểu rõ vấn đề*

---

#### 19. *SQL*: 
Phân biệt sự khác nhau cơ bản giữa mệnh đề JOIN và UNION trong SQL. 

Sự khác nhau

| Tên/Tiêu Chí | JOIN | UNION |
|---|---|---|
| Chiều kết hợp         | Kết hợp theo chiều ngang (thêm cột) | Kết hợp theo chiều dọc (thêm hàng) |
| Điều kiện             | Cần điều kiện `ON` để khớp dữ liệu  | Cần cùng số cột và kiểu dữ liệu tương thích |
| Dữ liệu gốc           | Từ nhiều bảng liên quan nhau        | Từ nhiều query có cùng cấu trúc |
| Tính lặp (Duplicate)  | Giữ nguyên                          | `UNION` loại bỏ, `UNION ALL` giữ lại |

**Ví dụ**

Data:

```

Table: orders          Table: customers
+----+-------------+   +----+----------+
| id | customer_id |   | id | name     |
+----+-------------+   +----+----------+
|  1 |           1 |   |  1 | Alice    |
|  2 |           2 |   |  2 | Bob      |
+----+-------------+   +----+----------+

```

**JOIN — ghép cột, mở rộng thông tin:**

```sql

SELECT orders.id AS order_id, customers.name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- Kết quả: mỗi row chứa data từ CẢ HAI bảng
+----------+-------+
| order_id | name  |
+----------+-------+
|        1 | Alice |
|        2 | Bob   |
+----------+-------+

```

**UNION — ghép hàng, gộp kết quả:**

```sql

-- Ví dụ thực tế: lấy tất cả user từ 2 hệ thống (migration / microservice)
SELECT id, name, 'system_A' AS source FROM users_system_a
UNION
SELECT id, name, 'system_B' AS source FROM users_system_b;

-- Kết quả: các hàng được xếp CHỒNG lên nhau
+----+-------+----------+
| id | name  | source   |
+----+-------+----------+
|  1 | Alice | system_A |
|  2 | Bob   | system_A |
|  1 | Carol | system_B |
+----+-------+----------+

```

**Các loại `JOIN` cần biết thêm:**

```sql
INNER JOIN  -- Chỉ lấy rows khớp ở CẢ HAI bảng
LEFT JOIN   -- Lấy tất cả bảng trái, bảng phải NULL nếu không khớp
RIGHT JOIN  -- Ngược lại LEFT JOIN
FULL JOIN   -- Lấy tất cả, NULL ở chỗ không khớp
CROSS JOIN  -- Tích Descartes (mọi tổ hợp) — dùng rất ít
```

--- 

#### 20. *OOP Fundamentals*: 
Trong lập trình hướng đối tượng, Class (Lớp) và Object (Đối tượng) khác nhau như thế nào?

---Trả lời---

Định nghĩa/So sánh

| Tên/Tiêu Chí | Class (Lớp) | Object (Đối tượng) |
|---|---|---|
| Là gì | Bản thiết kế/khuôn mẫu | Thực thể được tạo ra từ bản thiết kế đó |
| Tồn tại | Chỉ trên lý thuyết (code) (chiếm 1 lượng nhỏ RAM) | Tồn tại thật trong bộ nhớ (RAM) |
| Số lượng | Định nghĩa 1 lần | Tạo ra bao nhiêu tùy ý |
| Ví dụ | Bản vẽ thiết kế ngôi nhà | Những ngôi nhà được xây từ bản vẽ đó |

Ví dụ
```python
# CLASS: Bản thiết kế cho "Server"
class Server:
  def __init__(self, name, ip, cpu_cores):
        self.name = name
        self.ip = ip
        self.cpu_cores = cpu_cores
        self.is_running = False

    def start(self):
        self.is_running = True
        print(f"{self.name} started!")

    def stop(self):
        self.is_running = False
        print(f"{self.name} stopped!")

# OBJECTS: Các server thực tế được tạo ra từ class Server
web_server   = Server("web-01",  "10.0.0.1", 4)
db_server    = Server("db-01",   "10.0.0.2", 8)
cache_server = Server("cache-01","10.0.0.3", 2)

# Mỗi object có trạng thái riêng, độc lập nhau
web_server.start()   # web-01 started!
db_server.stop()     # db-01 stopped!

print(web_server.is_running)   # True
print(db_server.is_running)    # False

```

Điểm mấu chốt cần nhấn mạnh khi phỏng vấn
- **Class không chiếm RAM nhiều** — Class vẫn chiếm một lượng RAM nhỏ để lưu trữ metadata và phương thức. Object mới thực sự được cấp phát bộ nhớ khi khởi tạo (`new`/ `__init__`).

- **Một class -> nhiều object độc lập** — `web_server` và `db_server` cùng "kiểu" nhưng có state (trạng thái) hoàn toàn riêng biệt.

- **Instantiation** — quá trình tạo object từ class gọi là *khởi tạo (instantiate)*. Đây là từ kỹ thuật bạn nên dùng trong phỏng vấn.

Tóm tắt:
> *"Class là bản thiết kế định nghĩa thuộc tính (attributes) và hành vi (methods) của một loại đối tượng. Object là instance cụ thể được tạo ra từ class đó, chiếm bộ nhớ thực và có trạng thái riêng. Từ một class, ta có thể instantiate nhiều object độc lập nhau."*

---

#### 21. *Database Sharding*: 
Sharding là gì? Khi nào thì hệ thống cần áp dụng kỹ thuật sharding?

Sharding là gì?

**Sharding** là kỹ thuật chia một database lớn thành nhiều phần nhỏ hơn gọi là **shard**, mỗi shard là một database độc lập chứa **một tập con của data**, thường chạy trên server riêng.

```
                    ┌─────────────────┐
  Request ──────────│  Shard Router   │
                    └────────┬────────┘
           ┌─────────────────┼──────────────────┐
     Shard 0            Shard 1              Shard 2
  [user_id 0–999]   [user_id 1000–1999]  [user_id 2000+]
  PostgreSQL #1      PostgreSQL #2         PostgreSQL #3

```

Các chiến lược sharding phổ biến:

1. **Hash-based Sharding** — dùng hàm hash để phân phối đều các database node

```python
shard_id = hash(user_id) % total_shards
# user_id=1001 → shard 1
# user_id=1002 → shard 2
# Ưu: phân phối đều, tránh hotspot
# Nhược: khó thêm shard (phải rehash toàn bộ data)
```
> *Lưu ý* hàm `hash()` mặc định trong Python không có tính nhất quán (deterministic) giữa các lần chạy hoặc các process khác nhau do cơ chế *hash randomization*. Trong thực tế khi triển khai sharding, nên sử dụng các thuật toán băm ổn định như **MD5** hoặc **CRC32** để đảm bảo dữ liệu luôn được ánh xạ vào đúng shard.

2. **Range-based Sharding** — chia theo khoảng giá trị
```
Shard 0: user_id    1 → 1,000,000
Shard 1: user_id    1,000,001 → 2,000,000
Shard 2: user_id    2,000,001 → ...
# Ưu: dễ query range, dễ thêm shard mới
# Nhược: có thể hotspot nếu data không đều
```
3. **Directory-based Sharding** — lookup table quyết định shard
```
Lookup Table:
user_id → shard
alice   → shard_0
bob     → shard_1
# Ưu: linh hoạt nhất
# Nhược: lookup table là SPOF, thêm 1 network hop
```
***Khi nào cần dùng Sharding?***

Nên cân nhắc sharding khi:

- **Single DB đã không thể scale up được nữa** — đã dùng máy cấu hình (CPU, RAM, ...) mạnh nhất rồi vẫn chậm

- **Dataset quá lớn** — thường > vài trăm GB đến TB, query index không còn vừa RAM

- **Write throughput quá cao** — Read Replica không giúp được vì bottleneck là write

- **Yêu cầu về latency thấp** — sharding theo geography để data gần user hơn

>***Sharding là phương án cuối cùng*** — trước đó hãy thử hết: indexing, query optimization, caching, Read Replicas, vertical scaling. Sharding tăng độ phức tạp rất nhiều cho hệ thống.

**Nhược điểm của Sharding cần biết:**

| Vấn đề | Giải thích |
|---|---|
| Cross-shard query | JOIN giữa 2 shard cực kỳ tốn kém, thường phải xử lý ở application layer |
| Rebalancing | Thêm shard mới → phải redistribute data, downtime risk |
| Transactions | ACID transaction qua nhiều shard rất khó, cần distributed transaction (2PC) |
| Operational complexity | Nhiều DB instance hơn → monitoring, backup, failover phức tạp hơn |

---

### Nhóm 6: Security & Network Isolation

#### 22. *Docker Root Privilege*: 
Khi phát hiện một Docker container đang chạy với quyền root, điều này gây ra rủi ro gì? Nêu các bước xử lý và các cách khác nhau (từ lúc build image đến lúc chạy runtime) để xử lý và áp dụng nguyên tắc đặc quyền tối thiểu (least privilege)? 

#### 23. *Kubernetes Network Policies*: 
Trong Kubernetes, theo mặc định các Pod giao tiếp với nhau như thế nào? Làm sao để quản lý, giới hạn và cách ly lưu lượng mạng (network traffic) giữa các Pod hoặc giữa các Namespace khác nhau?


