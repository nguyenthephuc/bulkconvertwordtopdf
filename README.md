==Tình huống==
- Soạn giáo án theo bài học, mỗi bài học một file word (fileBH).
- Nộp giáo án theo tháng, mỗi tháng một file word (pdf) gồm nhiều fileBH gộp lại.

Các cách nộp giáo án
- Cách 1: Copy/insert nhiều fileBH thành 1 file word rồi nộp. Hạn chế: Phải mở Word.
- Cách 2: Tải các fileBH lên các công cụ online để gộp thành 1 file pdf, rồi tải xuống và nộp. Hạn chế: Không riêng tư.
- Cách 3: Lưu mỗi fileBH thành 1 file PDF rồi dùng tool nào đó để gộp thành 1 file pdf và nộp.

Tool dưới đây phục vụ cho cách 3 mà không phải mở Word, cũng không mất riêng tư vì làm trực tiếp trên máy.

==Giải pháp==
- Dùng LibreOffice để convert word to pdf
- Dùng GS để gộp các file pdf thành 1 file pdf

==Cài đặt==
- Cài Ghostscript (Phần mềm free). Cài xong copy đường dẫn vào trong file <code>Convert_Word_to_PDF.bat</code>
- Cài LibreOffice (Phần mềm free). Cài xong copy đường dẫn vào trong file <code>Convert_Word_to_PDF.bat</code>
- Cây thư mục
<pre>
/
|-Word
|-Convert_Word_to_PDF.bat
</pre>

==Cách sử dụng==
- Bước 1: Copy các file .doc, .docx vào thư mục <code>Word</code>
- Bước 2: Chạy file <code>Convert_Word_to_PDF.bat</code>
- Bước 3: Nếu thành công sẽ có file <code>Merged.pdf</code> trong thư mục gốc. Đổi tên file và nộp.

Demo: https://youtu.be/toATmjE5mYg
