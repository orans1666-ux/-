Sixth Star Barbershop - النجمة السادسة
======================================

مشروع موقع إلكتروني كامل لصالون حلاقة رجالي باستخدام HTML5 وCSS3 وJavaScript وPHP وMySQL.

طريقة التشغيل على XAMPP أو Laragon:
1. انسخ مجلد Sixth_Stars إلى htdocs في XAMPP أو www في Laragon.
2. افتح phpMyAdmin.
3. استورد الملف database/sixth_stars.sql.
4. عدل بيانات الاتصال من backend/config.php عند الحاجة.
5. افتح: http://localhost/Sixth_Stars/index.html

بيانات دخول تجريبية:
Admin: admin@sixthstar.test
Customer: fahad@test.sa
Password للكل: password

الصفحات:
index.html الصفحة الرئيسية.
services.html الخدمات.
booking.html الحجز.
login.html تسجيل الدخول.
register.html إنشاء حساب.
dashboard.html لوحة التحكم.
analytics.html التحليلات.
payment.html الدفع التجريبي.
contact.html التواصل والخريطة.

ملفات الواجهة:
assets/css/style.css التصميم العام.
assets/css/responsive.css تجاوب الجوال.
assets/css/dark-mode.css الوضع الداكن.
assets/js/main.js التفاعل العام.
assets/js/language.js تبديل اللغة والاتجاه.
assets/js/booking.js إرسال الحجز.
assets/js/dashboard.js لوحة التحكم.
assets/js/analytics.js التحليلات.

ملفات PHP:
backend/config.php الإعدادات والجلسات.
backend/db.php اتصال PDO.
backend/auth.php تسجيل وتسجيل دخول مع password_hash و password_verify.
backend/booking.php حفظ الحجز ومنع تكرار نفس الوقت.
backend/payment.php دفع تجريبي جاهز للتوسع.
backend/dashboard.php إحصائيات وحفظ البنرات والإعدادات.
backend/analytics.php بيانات التحليلات.
backend/logout.php تسجيل الخروج.

الأمان:
يستخدم المشروع Prepared Statements، password_hash، password_verify، جلسات httponly وSameSite، وhtmlspecialchars عبر الدالة e().

ملاحظات:
صفحة الدفع لا تحفظ بيانات بطاقات.
الربط الحقيقي مع Apple Pay وMada وVisa وMastercard وSTC Pay يتم لاحقاً من backend/payment.php.
روابط WhatsApp وSnapchat وGoogle Maps قابلة للتعديل من جدول settings أو dashboard.html.
