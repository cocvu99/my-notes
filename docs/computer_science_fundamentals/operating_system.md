# Operating Systems (OS) Fundamentals: How Software Interacts with Hardware
***Các khái niệm cơ bản về Hệ điều hành (OS): Cách phần mềm tương tác với phần cứng***

*Understanding OS concepts is crucial for writing efficient and robust applications, especially in systems-level programming.* 

*Kiến thức về OS giúp bạn hiểu sâu hơn cách chương trình của bạn "sống" và hoạt động trong máy tính.*

## Processes and Threads:

- What is a process? What is a thread? What are the key differences between them?

- Discuss the advantages and disadvantages of multi-threading.

- Explain context switching.

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Hãy hình dung process như một "chương trình riêng biệt" (ví dụ: trình duyệt Chrome), còn thread là "các luồng công việc nhỏ" bên trong chương trình đó (ví dụ: một thread tải ảnh, một thread phát nhạc). Hiểu về context switching giúp bạn biết chi phí khi CPU chuyển đổi giữa các tác vụ.

</details>

## Memory Management:

- How does the OS manage memory?

- Explain virtual memory, paging, and swapping.

- What is the difference between stack and heap memory? When is each used?

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Khái niệm virtual memory là cực kỳ quan trọng để hiểu cách máy tính có thể chạy nhiều chương trình cùng lúc mà không bị hết RAM vật lý. Phân biệt được stack và heap giúp bạn tránh lỗi tràn bộ nhớ và quản lý tài nguyên hiệu quả hơn.

</details>

## Concurrency and Synchronization:

- What are race conditions and deadlocks? How can they be prevented or resolved?

- Explain synchronization primitives: Mutexes, Semaphores, Monitors.

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Khi nhiều luồng cùng chạy và truy cập tài nguyên chung, "tai nạn" (race conditions) và "tắc nghẽn" (deadlocks) có thể xảy ra. Nắm vững các cơ chế đồng bộ hóa như Mutex và Semaphore là chìa khóa để viết các ứng dụng đa luồng an toàn.

</details>

## CPU Scheduling:

- Briefly explain the purpose of CPU scheduling.

- Mention common scheduling algorithms (e.g., FCFS, SJF, Round Robin – no need for deep dives unless specifically asked).

<details>
  <summary>Hints and Tips</summary>
  
    Tip thêm: CPU scheduling là cách hệ điều hành "phân chia thời gian" CPU cho các tác vụ khác nhau. Nó giống như một người điều phối giao thông, đảm bảo các chương trình đều có cơ hội được chạy.
  
</details>
