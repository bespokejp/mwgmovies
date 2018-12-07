# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(
  name: 'k-shiba',
  email: 'admin@mwgmovies.com',
  password: 'password',
  role: 3
)
admin.activate!

mwg = User.create(
  name: '都 若丸',
  email: 'mwg@mwgmovies.com',
  password: 'password',
  role: 2,
)
mwg.activate!

member = User.create(
  name: '一般ユーザー',
  email: 'user@mwgmovies.com',
  password: 'password',
  role: 1
)
member.activate!

Room.create(
  name: 'WAKAMARU LIVE 2015',
  headline: 'ダイジェストでしか見ることのできなかったLIVE映像を遂に解禁！！',
  price: 3100,
  description: %(<p>ダイジェストでしか見ることのできなかったLIVE映像を遂に解禁！！<br>素敵な楽曲はもちろん軽快なトークシーンもあわせて楽しめます。</p><p>(1)前編　61min.　収録内容＞<br>1.♪はっちゃけ女 ぶっちゃけ男　2.♪駄目サム　3.トークシーン１<br>4.♪都会の花　5.♪あのね　6.♪Shadow　7.トークシーン２　8.このままで<br>9.♪愛するあなたへの手紙　9.♪サプライズ・天下の小町（劇団女優陣郡舞）<br>10.♪風待人（劇団男優人群舞）　11.♪Be Lost　12.♪今なら歌えるLove Song<br>13.♪晴れ舞台<br></p><p>(2)後編　収録内容＞<br>1.トークシーン３＆ミックスジュース　2.♪だから大丈夫　3.♪同じ空なら同じ街<br>4.♪星に花をあげよう　5.トークシーン４　6.♪今日はサヨナラ　7.♪笑って<br>8.♪Dream Stage　9.Love Oh Yeah!<br></p>),
  package: File.open('db/demo_data/wakamaru.jpg')
)

Room.create(
  name: '芝居『森の石松』',
  headline: '若丸の真骨頂！ド迫力の舞台がオンライン版で帰ってきた！！',
  price: 3900,
  description: %(<p>清水の次郎長から石松に男修行として刀の奉納の金比羅代参が命じられた。代参の帰途、都田村を通りがかった石松は偶然、兄弟分の都鳥吉兵衛とばったり会う。黒籠屋亀吉の花会にあと百両が必要だと吉兵衛は石松に無理に頼み込む。吉兵衛に頼み込まれた石松は身受山鎌太郎親分から預ったお蝶への香典百両を貸してしまう…。</p>),
  package: File.open('db/demo_data/ishimatsu.jpg')
)

Room.create(
  name: '芝居『文三、男の涙』',
  headline: '座長襲名十五周年特別公演で魅せたあの感動作が今ここに甦る！',
  price: 3900,
  description: %(<p>かつて盗人稼業に手を染め、嫌われ者のゴロツキだったゲジゲジの文三。妹のおせんが大病を患ってからは、同心の大月の口利きで真面目に大工仕事をしながら、毎日おせんの病を治せるであろうオランダ医学を学んだ医者の帰りを待っている。ある日、いつものように桟橋で座っていた文三は、籠屋ともめていた岬屋一兵衛を助けて富くじをもらう。そんな時に大月から草津に良い医者がいると教えられる。ところが、文三に旅の路銀や医者代はない。せめてこの富くじが当たれば…。だがそんな願いも届かない。落胆する文三の前にかつての盗人仲間の佐太郎が現れ…。</p>),
  package: File.open('db/demo_data/namida.jpg')
)
