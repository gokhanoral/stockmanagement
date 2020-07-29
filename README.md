# Stok Yönetim Sistemi
Uzaktan Yazılım Stajı - Stok Yönetim Sistemi Uygulaması

Kurulum

1-)Uygulama Java'nın JDK 1.8  ve Mysql 8 versiyonu ve Intellij IDEA 2020.2 versiyonu ile geliştirilmiştir.

2-)Kurulum için resource altında yer alan application.properties'deki spring.datasource.username alanının karşılığına 
veritabanı kullanıcı adı spring.datasource.password alanının karşılığına da bu kullanıcının şifresi girilmelidir.
Varsayılan kullanıcı adı root, şifre ise 12345678'dir

3-)Uygulama herhangi bir veritabanı import edilmeden direkt çalıştırıldığında otomatik olarak stockmanagement adında bir veritabanı oluşturacaktır.
Varsayılan kullanıcı olarak da admin kullanıcısı oluşturulacaktır. Bu kullanıcının şifresi 123'tür.
