# Data Structures: Building Blocks of Efficient Code

***Cấu trúc dữ liệu: Những khối xây dựng cho mã nguồn hiệu quả***

*Understanding data structures is paramount. Interviewers want to see if you can choose the right tool for the job. Think of them as your toolkit; knowing what each tool does and when to use it makes you a much more effective engineer.*

## Arrays:

- What is an array? How is it stored in memory?

- What are the time complexities for accessing, inserting, and deleting elements in an array (at the beginning, middle, and end)?

- Discuss the concept of dynamic arrays (e.g., ArrayList in Java, std::vector in C++). How do they handle resizing?

<details>
  <summary>Hints and Tips</summary>

  Tip thêm: Hãy liên hệ array với việc lưu trữ danh sách các món đồ cùng loại trong siêu thị, mỗi món có một "số thứ tự" (index) riêng. Hiểu được cơ chế resize của dynamic array giúp bạn tránh được các lỗi liên quan đến hiệu suất khi làm việc với dữ liệu lớn.

</details>

## Linked Lists (Singly, Doubly, Circular):

- Explain the difference between arrays and linked lists. When would you use one over the other?

- Describe how to traverse, insert, and delete nodes in a singly linked list.

- What are the advantages and disadvantages of doubly linked lists over singly linked lists?

<details>
  <summary>Hints and Tips</summary>

  Tip thêm: Hãy hình dung linked list như một "chuỗi" các toa tàu, mỗi toa biết toa kế tiếp là gì. Khi cần thêm hoặc bớt toa ở giữa, bạn chỉ cần điều chỉnh các mối nối mà không cần di chuyển cả đoàn tàu như array.

</details>

## Stacks and Queues:

- Explain the LIFO (Last-In, First-Out) principle of stacks and FIFO (First-In, First-Out) principle of queues.

- Implement a stack using an array and a linked list. Discuss the trade-offs.

- What are common applications of stacks and queues? (e.g., function call stack, breadth-first search).

<details>
  <summary>Hints and Tips</summary>

  Tip thêm: Stack giống như chồng đĩa ăn, đĩa cuối cùng đặt vào sẽ là đĩa đầu tiên được lấy ra (LIFO). Queue thì như hàng đợi ở ngân hàng, ai đến trước được phục vụ trước (FIFO). Những ví dụ thực tế này sẽ giúp bạn ghi nhớ lâu hơn.

</details>

## Hash Tables (Hash Maps/Dictionaries):

- How do hash tables work? Explain the role of a hash function and collision resolution strategies (e.g., chaining, open addressing).

- What is the average and worst-case time complexity for insertion, deletion, and lookup?

- When would you use a hash table? What are its limitations?

<details>
  <summary>Hints and Tips</summary>

  Tip thêm: Hash table giống như một cuốn từ điển siêu nhanh. Bạn tra từ nào, nó gần như ngay lập tức đưa ra nghĩa của từ đó. Hiểu về collision resolution là cực kỳ quan trọng, vì đó là lúc "cuốn từ điển" này có thể bị chậm lại.

</details>

## Trees (Binary Trees, BSTs, Heaps):

- Define a tree and its basic terminology (root, node, child, parent, leaf, depth, height).

- What is a Binary Search Tree (BST)? How does it maintain sorted order?

- Discuss tree traversals: In-order, Pre-order, Post-order. Provide examples.

- What is a Heap? Explain min-heap and max-heap properties. What are heaps commonly used for? (e.g., priority queues).

<details>
  <summary>Hints and Tips</summary>
  
    Tip thêm: Cây là một trong những cấu trúc dữ liệu mạnh mẽ nhất, được dùng trong rất nhiều ứng dụng từ hệ thống file cho đến cơ sở dữ liệu. Hãy cố gắng vẽ ra các ví dụ cụ thể cho từng loại tree traversal để dễ hình dung hơn. Heap là nền tảng cho thuật toán sắp xếp Heapsort và các hệ thống hàng đợi ưu tiên.
  
</details>

