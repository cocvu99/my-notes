# Algorithms: The Logic Behind the Code

***Giải thuật: Logic đằng sau mã nguồn***

*Algorithms are the step-by-step procedures to solve computational problems. Interviewers want to see your problem-solving approach and efficiency considerations. This is where you demonstrate your ability to think critically and optimize solutions.*

## Sorting Algorithms:

- Explain and compare common sorting algorithms: Bubble Sort, Selection Sort, Insertion Sort, Merge Sort, Quick Sort.

- Discuss their average and worst-case time complexities and space complexities.

- When would you choose one over another? What are the practical implications?

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Thay vì chỉ học thuộc, hãy thử tự code các thuật toán sắp xếp này từ đầu. Bạn sẽ hiểu sâu hơn về cách chúng hoạt động và sự khác biệt về hiệu suất của chúng. Hãy nghĩ xem khi nào bạn cần một thuật toán ổn định (stable sort) hoặc khi nào bạn quan tâm đến bộ nhớ (in-place sort).

</details>

## Searching Algorithms:

- **Linear Search:** Explain its process and time complexity.

- **Binary Search:** How does it work? What are its prerequisites? What is its time complexity?

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Binary Search là một "siêu anh hùng" khi bạn làm việc với dữ liệu đã được sắp xếp. Hãy nhớ điều kiện tiên quyết là dữ liệu phải sorted (đã sắp xếp) để Binary Search có thể phát huy sức mạnh O(logn) của nó.

</details>

## Recursion:

- What is recursion? Explain the concept of a base case and a recursive step.

- Provide examples of problems naturally solved with recursion (e.g., factorial, Fibonacci sequence, tree traversals).

- Discuss the potential pitfalls of recursion (e.g., stack overflow, performance). How can it be optimized (e.g., memoization)?

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Đệ quy thường khó hiểu ban đầu, nhưng một khi bạn đã nắm được "base case" (điểm dừng) và "recursive step" (bước lặp), nó sẽ mở ra một cách tư duy giải quyết vấn đề rất thanh lịch. Hãy cẩn thận với lỗi tràn stack khi dùng đệ quy nhé!

</details>

## Time and Space Complexity (Big O Notation):

- Why is analyzing complexity important?

- Explain Big O, Big Omega, and Big Theta notation. Focus on Big O as it's most common in interviews.

- Analyze the time and space complexity of simple algorithms (e.g., iterating through an array, nested loops).

- Understand common complexities: O(1), O(logn), O(n), O(nlogn), O(n^2), O(2^n), O(n!).

<details>
  <summary>Hints and Tips</summary>

    Tip thêm: Đây là một trong những khái niệm quan trọng nhất mà mọi lập trình viên đều phải nắm rõ. Big O không chỉ là lý thuyết, nó giúp bạn đánh giá hiệu suất của code mình viết và chọn giải pháp tối ưu nhất khi đối mặt với dữ liệu lớn. Luôn luôn nghĩ về cách code của bạn sẽ scale (mở rộng) khi input tăng lên.

</details>
