# Yêu cầu và Hướng dẫn dự án (Project Instructions)

Tài liệu này đóng vai trò là quy chuẩn đóng góp và "System Prompt" (đặc biệt dành cho AI Code Assistants) khi thực hiện review hoặc tạo Pull Request vào kho lưu trữ này.

## 1. Quy tắc xử lý nội dung văn bản (.md)
Tài liệu trong thư mục `/docs/` mang tính chất ghi chép phỏng vấn cá nhân, do đó áp dụng quy tắc Strict Review:
* **Bảo toàn nội dung:** Tuyệt đối KHÔNG tự ý chỉnh sửa văn phong, ngữ cảnh, hoặc cách diễn đạt của các file Markdown.
* **Điều kiện đề xuất sửa đổi (Suggest Fixes):** Chỉ được phép phân tích và đề xuất sửa đổi nội dung nếu rơi vào 1 trong 2 trường hợp sau:
    1. Có lỗi sai về cú pháp (Syntax error) trong các đoạn mã nguồn (Code blocks) hoặc câu lệnh terminal.
    2. Có sai sót rõ ràng về mặt kiến thức kỹ thuật (Factual errors) trong phần nội dung trả lời/tổng hợp kiến thức.
* **Hoàn thiện tài liệu:** Cho phép bổ sung câu trả lời và giải thích chi tiết đối với các câu hỏi phỏng vấn đang bị bỏ ngỏ (chưa có câu trả lời).

## 2. Quản lý Cấu trúc Thư mục (Directory Structure)
Hệ thống áp dụng tư duy tách biệt chức năng (Separation of Concerns):
* **`/docs/`**: Nơi lưu trữ nội dung cốt lõi. Bao gồm tài liệu phỏng vấn (tại `docs/interviews/` với định dạng `[TênCôngTy]-[Ngày-Tháng-Năm].md`) và kiến thức nền tảng (tại `docs/computer_science_fundamentals/`).
* **`/src/`**: Nơi quản lý cấu hình giao diện (UI/UX) của trang web tĩnh. Thư mục này tập trung lưu trữ các file liên quan đến cấu hình, hiển thị và logic frontend như HTML, CSS, JavaScript (ví dụ: các file config, script toán học).
* **`/scripts/`**: Nơi lưu trữ toàn bộ mã nguồn phục vụ tự động hóa (CI/CD, kiểm tra trạng thái, provisioning). Mọi script phải tuân thủ Best Practice an toàn (ví dụ: luôn bắt đầu bằng `set -euo pipefail` đối với Bash script).

## 3. Quy chuẩn Định dạng và Version Control
* **Định dạng Markdown:** Tuân thủ chuẩn Markdown syntax cho tất cả các file tài liệu. Sử dụng backticks (`` ` `` hoặc ` ``` `) để bọc các đoạn code, tên biến, thông số cấu hình YAML, hoặc câu lệnh terminal nhằm đảm bảo tính dễ đọc.
* **Commit Messages:** Bắt buộc áp dụng định dạng **Conventional Commits** (ví dụ: `feat:`, `fix:`, `docs:`, `chore:`) cho mọi gợi ý code hoặc thông điệp commit.