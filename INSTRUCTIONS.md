# Yêu cầu và Hướng dẫn dự án (Project Instructions)

Dưới đây là các yêu cầu và quy định khi đóng góp hoặc làm việc với kho tài liệu này:


- **Quản lý tài liệu phỏng vấn:** Thêm file câu hỏi phỏng vấn mới vào thư mục `docs/interviews/`, đặt tên file theo định dạng `[TênCôngTy]-[Ngày-Tháng-Năm].md`.
    - ***Lưu ý***: Không được phép thay đổi logic code hoặc nội dung docs (file .md), chỉ đóng vai trò phân tích mã nguồn. Nếu review thấy code không ổn thì mới đề xuất
- Bắt buộc áp dụng định dạng Conventional Commits cho các gợi ý tạo Commit message.
- **Kiến thức nền tảng:** Lưu trữ các chủ đề nền tảng khoa học máy tính (Networking, OS, Database...) tại `docs/computer_science_fundamentals/`.
- **Cập nhật câu trả lời:** Đảm bảo bổ sung đầy đủ phần trả lời và giải thích chi tiết cho các câu hỏi phỏng vấn đang còn bỏ ngỏ.
- **Quản lý script:** Mọi script tự động hóa phải được đặt trong thư mục `scripts/` và tuân thủ các best practice an toàn (ví dụ: thêm `set -euo pipefail` đối với bash script).
- **Định dạng Markdown:** Tuân thủ chuẩn Markdown cho tất cả các file tài liệu. Sử dụng backticks để bọc các đoạn code, cấu hình YAML, hoặc câu lệnh terminal nhằm đảm bảo tính dễ đọc.