# Todo List App

Todo List App là một ứng dụng di động được xây dựng bằng Flutter. Ứng dụng cho phép người dùng quản lý các mục (items) bằng cách thêm, chỉnh sửa và xóa chúng. Dữ liệu được lưu trữ cục bộ bằng localstore.

## Tính năng

- **Trang chủ (Home Page):** Hiển thị danh sách các mục từ cơ sở dữ liệu cục bộ.
- **Trang thêm mục (Add Item Page):** Cho phép người dùng thêm một mục mới vào danh sách.
- **Trang chỉnh sửa mục (Edit Item Page):** Cho phép người dùng chỉnh sửa thông tin của một mục đã tồn tại.
- **Chức năng xóa mục:** Cho phép người dùng xóa một mục khỏi danh sách.
- **Lưu trữ dữ liệu cục bộ:** Sử dụng localstore để lưu trữ dữ liệu.

## Cài đặt

### Yêu cầu hệ thống

- [Flutter](https://flutter.dev/docs/get-started/install) (phiên bản mới nhất)
- [Dart](https://dart.dev/get-dart) (được cài đặt cùng với Flutter)
- [Android Studio](https://developer.android.com/studio) hoặc [Visual Studio Code](https://code.visualstudio.com/) (tùy chọn)

### Các bước cài đặt

1. **Clone repository này:**

    ```bash
    git clone https://github.com/username/item-manager-app.git
    cd item-manager-app
    ```

2. **Cài đặt các phụ thuộc:**

    ```bash
    flutter pub get
    ```

3. **Chạy ứng dụng:**

    ```bash
    flutter run
    ```

## Cấu trúc dự án

- **lib/**
    - **models/**: Chứa các mô hình dữ liệu.
        - `item.dart`: Định nghĩa mô hình Item.
    - **database/**: Chứa các helper để tương tác với cơ sở dữ liệu.
        - `database_helper.dart`: Cung cấp các phương thức để thêm, lấy, cập nhật và xóa dữ liệu từ cơ sở dữ liệu.
    - **pages/**: Chứa các trang của ứng dụng.
        - `home_page.dart`: Trang chủ hiển thị danh sách các mục.
        - `add_item_page.dart`: Trang thêm mục mới.
        - `edit_item_page.dart`: Trang chỉnh sửa mục.
    - `main.dart`: Tệp chính của ứng dụng.

## Sử dụng

1. **Thêm mục mới:**
    - Nhấp vào nút "+" trên trang chủ để mở trang thêm mục mới.
    - Điền tên và mô tả cho mục và nhấn "Save" để lưu lại.

2. **Chỉnh sửa mục:**
    - Nhấp vào biểu tượng chỉnh sửa (biểu tượng bút chì) trên mục muốn chỉnh sửa.
    - Cập nhật thông tin và nhấn "Save" để lưu lại thay đổi.

3. **Xóa mục:**
    - Nhấp vào biểu tượng xóa (biểu tượng thùng rác) trên mục muốn xóa.
    - Xác nhận việc xóa mục.

## Đóng góp

Nếu bạn muốn đóng góp cho dự án, vui lòng fork repository và tạo pull request. Các đề xuất và lỗi phát sinh vui lòng báo cáo tại [Issues](https://github.com/username/item-manager-app/issues).

## Giấy phép

Dự án này được cấp phép theo giấy phép MIT. Xem [LICENSE](LICENSE) để biết thêm chi tiết.

## Liên hệ

Nếu bạn có bất kỳ câu hỏi hoặc phản hồi nào, hãy liên hệ qua email: trantheson296@gmail.com

