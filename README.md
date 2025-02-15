# GScript

## Bu Script Neyi Amaçlar?
GScript, TT CMS test süreçlerinde otomatik content oluşturarak iş verimliliğini ve performansı arttırması amaçlanarak geliştirilmiş bir scripttir.
Çok versiyonlu bir script olup geliştirmelere sürekli devam ederek güncellenecektir.

## Versiyon İsimlendirmeleri
Vx.y. basamaklarının anlamları aşağıdaki gibidir:
- **x:** Yeni Özellikler
- **y:** Hata Düzeltmeleri

## Sürüm Geçmişi

### Version 1.1
Bu versiyon geliştirmenin ilk versiyonudur. Sadece yeni bir content oluşturmak için kullanılabilir.
config.txt dosyasında belirtilen değerleri değiştirerek yeni bir content oluşturabilirsiniz.

> **NOT:** Güvenlik amacıyla script içerisinde "http://x.com/contents" olarak belirtilen bu değerin yerine sunucu IP'si ve açık PORT'un değeri yazılmalıdır.

## Yapılandırma

### config.txt Dosyası
Aşağıdaki değerleri config.txt dosyasında belirtmelisiniz:

- **Film=** 
- **Local=**
- **Content-Name=**
- **Type=**

### Version 1.2
Bu script v1 in üzerine ek olarak birden fazla contentin oluşturulabilmesini mümkün kılar

config.txt dosyasında belirtilen değerler:

- **Film=** 
- **Local=(true or false)**
- **Content-Name=content1,content2,content3, (contentleri virgülle ayırın)**
- **Type=MOVIE**
