import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Kullanıcı Sözleşmesi"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: const Text(
          'HBOS Live Kullanıcı Sözleşmesi Bölüm I: Genel Hükümler 1. Giriş 1.1 "Platform": HBOS Live web sitesi, mobil uygulamaları, APIlar ve ilgili tüm teknoloji ve hizmetleri ifade eder. 1.2 "Kullanıcı": Platforma erişim sağlayan ve/veya Platformu kullanarak içerik oluşturan, yayınlayan, izleyen veya etkileşimde bulunan her birey veya kuruluş. 2. Sözleşmenin Kabulü 2.1 Platformu kullanmakla, bu Sözleşmenin şartlarını kabul etmiş sayılırsınız. 2.2 Bu Sözleşme, Platformu kullanımınızın yasal çerçevesini oluşturur. Bölüm II: Hizmetler ve Erişim 3. Hizmetlerin Tanımı ve Kapsamı 3.1 Platform, canlı yayın yapma, içerik izleme, yorum yapma, beğenme ve paylaşma gibi çeşitli interaktif hizmetler sunar. 3.2 Platform, kullanıcı deneyimini geliştirmek için zaman zaman yeni özellikler ve hizmetler sunabilir veya mevcut hizmetlerde değişiklik yapabilir. 4. Erişim Koşulları ve Kullanıcı Sorumlulukları 4.1 Kullanıcılar, Platforma erişim sağlamak için geçerli bir e-posta adresi ve güçlü bir şifre kullanmalıdır. 4.2 Kullanıcılar, Platform üzerindeki etkinliklerinden tamamen sorumludur. Hesap bilgilerinin güvenliğini sağlamak ve yetkisiz kullanımları önlemek için gerekli tüm önlemleri almalıdır. Bölüm III: Kullanıcı Hesabı, Güvenlik ve Gizlilik 5. Hesap Oluşturma ve Yönetimi 5.1 Kullanıcılar, Platforma kayıt olurken gerçek, doğru, güncel ve tam bilgi sağlamalıdır. 5.2 Kullanıcılar, hesap bilgilerindeki herhangi bir değişikliği derhal Platforma bildirmelidir. 6. Güvenlik ve Gizlilik Politikaları 6.1 Platform, kullanıcı verilerinin gizliliğini ve güvenliğini korumak için endüstri standartlarına uygun tedbirler alır. 6.2 Kullanıcılar, kişisel verilerini korumak için dikkatli olmalı ve güvenlik tavsiyelerine uymalıdır. Bölüm IV: Kullanım Kuralları ve Yükümlülükler 7. Yasal Uyumluluk ve Kullanım Kuralları 7.1 Kullanıcılar, Platformu yalnızca yasal amaçlar için kullanmalı ve yerel, ulusal ve uluslararası yasalara uymalıdır. 7.2 Yasadışı faaliyetler, hakaret, tehdit, taciz, iftira ve diğer zararlı davranışlar yasaktır. 8. İçerik Oluşturma, Paylaşım ve İletişim Kuralları 8.1 Kullanıcılar, yükledikleri veya paylaştıkları içerikten tamamen sorumludur. Telif hakkı, gizlilik, itibar haklarına saygı gösterilmelidir. 8.2 Platform, uygunsuz veya zararlı içerikleri önceden inceleme veya kaldırma hakkına sahiptir. Bölüm V: Fikri Mülkiyet Hakları 9. Kullanıcı İçeriği ve Fikri Mülkiyet 9.1 Kullanıcılar, yükledikleri içerik üzerindeki fikri mülkiyet haklarını korurlar. Ancak, bu içeriği Platformda paylaşarak, Platformun bu içeriği belirli koşullar altında kullanmasına izin verirler. 9.2 Platform, kullanıcı içeriğini reklam, promosyon ve benzeri amaçlarla kullanabilir. 10. Lisans Hakları ve Kısıtlamalar 10.1 Kullanıcı içeriğini Platformda paylaşarak, Platforma sınırlı, geri alınabilir, dünya çapında, ücretsiz bir lisans vermiş olursunuz. 10.2 Bu lisans, Platformun içeriği barındırma, dağıtma, değiştirme, uyarlamak ve türev çalışmalar oluşturma haklarını içerir. Bölüm VI: Üçüncü Parti Hizmetler ve İçerikler 11. Üçüncü Parti Bağlantılar ve Hizmetler 11.1 Platform, kullanıcıların erişimine sunulan üçüncü parti siteler ve hizmetlere bağlantılar içerebilir. Bu sitelerin içeriği ve hizmetleri için Platform sorumlu değildir. 11.2 Üçüncü parti hizmetlerin kullanımı, ilgili hizmet sağlayıcıların şartlarına ve politikalarına tabidir. Bölüm VII: Reklamlar, Promosyonlar ve Sponsorluklar 12. Reklam ve Promosyon Politikaları 12.1 Platform, kullanıcı deneyimini etkilemeden reklam ve promosyonları entegre etme hakkını saklı tutar. 12.2 Kullanıcılar, Platform üzerinde gösterilen reklamların ve promosyonların içeriğinden Platformun sorumlu olmadığını kabul eder. Bölüm VIII: Garanti Reddi, Sorumluluk Sınırlamaları ve Tazminat 13. Garanti Reddi ve Sorumluluk Sınırlamaları 13.1 Platform, hizmetlerinin kesintisiz ve hatasız olacağını garanti etmez. Teknik sorunlar, bakım, güncellemeler nedeniyle hizmetlerde kesintiler olabilir. 13.2 Platform, kullanıcıların Platform üzerindeki faaliyetleri nedeniyle oluşabilecek zararlardan sorumlu tutulamaz. 14. Tazminat 14.1 Kullanıcılar, Platformun uğrayabileceği her türlü zarar, kayıp ve masraftan (makul avukat ücretleri dahil) kendilerini sorumlu tutar. Bu, kullanıcıların Platformu kullanımından kaynaklanan herhangi bir iddia, zarar veya masrafları kapsar. Bölüm IX: Uyuşmazlık Çözümü 15. Uyuşmazlık Çözümü ve Yargı Yetkisi 15.1 Platform ve kullanıcılar arasında çıkabilecek herhangi bir anlaşmazlık, öncelikle dostane yollarla çözülmeye çalışılacaktır. 15.2 Anlaşmazlıkların yargıya taşınması durumunda, Türkiye Cumhuriyeti mahkemeleri yetkili olacaktır ve Türkiye Cumhuriyeti yasaları uygulanacaktır. Bölüm X: Sözleşmenin Bütünlüğü, Geçerliliği ve Değişiklikler 16. Sözleşmenin Bütünlüğü ve Geçerliliği 16.1 Bu Sözleşme, Platformu kullanımınızla ilgili tüm anlaşmaları içerir. Sözleşmenin bir bölümü geçersiz sayılırsa, diğer bölümlerin geçerliliği etkilenmez. 16.2 Bu Sözleşmenin hükümlerinden herhangi birinin geçersiz veya uygulanamaz olması durumunda, söz konusu hüküm, yasaların izin verdiği ölçüde uygulanabilir şekilde yorumlanacaktır. 17. Sözleşme Değişiklikleri 17.1 Platform, bu Sözleşmeyi herhangi bir zamanda, önceden bildirimde bulunarak güncelleme hakkını saklı tutar. Değişiklikler, Platform üzerinde duyurulduktan sonra etkili olacaktır. 17.2 Kullanıcıların, Sözleşme değişikliklerini düzenli olarak gözden geçirmeleri ve Platformu kullanmaya devam etmeleri, değişiklikleri kabul ettikleri anlamına gelir. 18. Kabul ve Onay 18.1 Platformu kullanarak, bu Sözleşmenin güncel versiyonunu okuduğunuzu, anladığınızı ve şartlarını kabul ettiğinizi onaylarsınız.',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
