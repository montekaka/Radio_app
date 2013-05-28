# encoding: UTF-8
Station.destroy_all
stationa = Station.create(:name=>"AM1430")

Show.destroy_all
showa = stationa.shows.create(:name => "今日話題", :description=>"", :category=>"News")

Audiopost.destroy_all
showa.audioposts.create(:title =>"俄敍通婚/通緝名單", :audio =>"http://www.am1300.com/uploadfile/2012/0704/20120704022610296.mp3", :audio_date =>"03/07/2012")
showa.audioposts.create(:title =>"相處距離/男女快樂", :audio =>"http://www.am1300.com/uploadfile/2012/0705/20120705105449945.mp3", :audio_date =>"04/07/2012")
showa.audioposts.create(:title =>"舉重女英/電腦窺視", :audio =>"http://www.am1300.com/uploadfile/2012/0706/20120706125122185.mp3", :audio_date =>"05/07/2012")
showa.audioposts.create(:title =>"總統問答/夫妻隱私", :audio =>"http://www.am1300.com/uploadfile/2012/0707/20120707011602998.mp3", :audio_date =>"06/07/2012")
showa.audioposts.create(:title =>"活殺雞鴨/質疑牛奶", :audio =>"http://www.am1300.com/uploadfile/2012/0710/20120710022121568.mp3", :audio_date =>"09/07/2012")
showa.audioposts.create(:title =>"夢幻男籃/幸福定價", :audio =>"http://www.am1300.com/uploadfile/2012/0711/20120711020546888.mp3", :audio_date =>"10/07/2012")
showa.audioposts.create(:title =>"城市破產/奧運軍訓", :audio =>"http://www.am1300.com/uploadfile/2012/0712/20120712024228883.mp3", :audio_date =>"11/07/2012")
Audiopost.create(:title =>"恢復徵兵/醫生賣藥", :audio =>"http://www.am1300.com/uploadfile/2012/0713/20120713020336349.mp3", :audio_date =>"12/07/2012")
Audiopost.create(:title =>"父親遺囑/臨終囑託", :audio =>"http://www.am1300.com/uploadfile/2012/0714/20120714020238893.mp3", :audio_date =>"13/07/2012")
Audiopost.create(:title =>"孩子挨打/七月效應", :audio =>"http://www.am1300.com/uploadfile/2012/0717/20120717022807869.mp3", :audio_date =>"16/07/2012")
Audiopost.create(:title =>"奧運淘汰/手機追蹤", :audio =>"http://www.am1300.com/uploadfile/2012/0718/20120718051332332.mp3", :audio_date =>"17/07/2012")
Audiopost.create(:title =>"尼克放林/雅虎挖角", :audio =>"http://www.am1300.com/uploadfile/2012/0719/20120719024302424.mp3", :audio_date =>"18/07/2012")
Audiopost.create(:title =>"出賣朋友/年齡戰爭", :audio =>"http://www.am1300.com/uploadfile/2012/0720/20120720022325983.mp3", :audio_date =>"19/07/2012")
Audiopost.create(:title =>"影院開槍/敍國局勢", :audio =>"http://www.am1300.com/uploadfile/2012/0721/20120721023224935.mp3", :audio_date =>"20/07/2012")
Audiopost.create(:title =>"殺手背景/殺手分析", :audio =>"http://www.am1300.com/uploadfile/2012/0724/20120724021150438.mp3", :audio_date =>"23/07/2012")
Audiopost.create(:title =>"學被罰/聲音付款",   :audio =>"http://www.am1300.com/uploadfile/2012/0725/20120725125652996.mp3", :audio_date =>"24/07/2012")
Audiopost.create(:title =>"池雙雄/殺手性別",   :audio =>"http://www.am1300.com/uploadfile/2012/0726/20120726020751894.mp3", :audio_date =>"25/07/2012")
Audiopost.create(:title =>"旱澇保收/二手收穫", :audio =>"http://www.am1300.com/uploadfile/2012/0727/20120727013245254.mp3", :audio_date =>"26/07/2012")
Audiopost.create(:title =>"我不誠實/婚禮效應", :audio =>"http://www.am1300.com/uploadfile/2012/0728/20120728013533998.mp3", :audio_date =>"27/07/2012")
Audiopost.create(:title =>"漫談奧運/奧運漫談", :audio =>"http://www.am1300.com/uploadfile/2012/0731/20120731024239559.mp3", :audio_date =>"30/07/2012")
Audiopost.create(:title =>"泳池風波/自殺裁決", :audio =>"http://www.am1300.com/uploadfile/2012/0801/20120801022139826.mp3", :audio_date =>"31/07/2012")
Audiopost.create(:title =>"羽球爭輸/獎牌記錄", :audio =>"http://www.am1300.com/uploadfile/2012/0802/20120802012003302.mp3", :audio_date =>"01/08/2012")
Audiopost.create(:title =>"餐廳表態/印度停電", :audio =>"http://www.am1300.com/uploadfile/2012/0803/20120803023835186.mp3", :audio_date =>"02/08/2012")
Audiopost.create(:title =>"電話訪吳/炫寧父母", :audio =>"http://www.am1300.com/uploadfile/2012/0804/20120804015151167.mp3", :audio_date =>"03/08/2012")
Audiopost.create(:title =>"脫衣舞忙/識貨買貨", :audio =>"http://www.am1300.com/uploadfile/2012/0807/20120807120653318.mp3", :audio_date =>"06/08/2012")
Audiopost.create(:title =>"遙控生涯/亞猶通婚", :audio =>"http://www.am1300.com/uploadfile/2012/0808/20120808082953627.mp3", :audio_date =>"07/08/2012")
Audiopost.create(:title =>"東部之旅/東西對比", :audio =>"http://www.am1300.com/uploadfile/2012/0810/20120810102758239.mp3", :audio_date =>"08/08/2012")
Audiopost.create(:title =>"偏心父母/排座學問", :audio =>"http://www.am1300.com/uploadfile/2012/0810/20120810105329570.mp3", :audio_date =>"09/08/2012")
Audiopost.create(:title =>"醫生短缺/撒謊研究", :audio =>"http://www.am1300.com/uploadfile/2012/0811/20120811045209791.mp3", :audio_date =>"10/08/2012")
Audiopost.create(:title =>"奧運女性/選副總統", :audio =>"http://www.am1300.com/uploadfile/2012/0814/20120814032503267.mp3", :audio_date =>"13/08/2012")
Audiopost.create(:title =>"美東朝聖/哈佛秘密", :audio =>"http://www.am1300.com/uploadfile/2012/0815/20120815031348751.mp3", :audio_date =>"14/08/2012")
Audiopost.create(:title =>"政治新星/競選廣告", :audio =>"http://www.am1300.com/uploadfile/2012/0816/20120816030915903.mp3", :audio_date =>"15/08/2012")
Audiopost.create(:title =>"推遲遣返/舊車倒手", :audio =>"http://www.am1300.com/uploadfile/2012/0817/20120817022832756.mp3", :audio_date =>"16/08/2012")
Audiopost.create(:title =>"淩亂夫妻/電影片段", :audio =>"http://www.am1300.com/uploadfile/2012/0818/20120818043248877.mp3", :audio_date =>"17/08/2012")
Audiopost.create(:title =>"判谷開來/談王立軍", :audio =>"http://www.am1300.com/uploadfile/2012/0821/20120821013644439.mp3", :audio_date =>"20/08/2012")
Audiopost.create(:title =>"島嶼之爭/導演自殺", :audio =>"http://www.am1300.com/uploadfile/2012/0822/20120822023844216.mp3", :audio_date =>"21/08/2012")
Audiopost.create(:title =>"死亡福利/排隊學問", :audio =>"http://www.am1300.com/uploadfile/2012/0823/20120823012355868.mp3", :audio_date =>"22/08/2012")
Audiopost.create(:title =>"貨比多家/奪狗大戰", :audio =>"http://www.am1300.com/uploadfile/2012/0824/20120824023138800.mp3", :audio_date =>"23/08/2012")
Audiopost.create(:title =>"服藥醜聞/挪威判刑", :audio =>"http://www.am1300.com/uploadfile/2012/0825/20120825010621830.mp3", :audio_date =>"24/08/2012")
Audiopost.create(:title =>"登月傳奇/槍手宿願", :audio =>"http://www.am1300.com/uploadfile/2012/0828/20120828052807444.mp3", :audio_date =>"25/08/2012")
Audiopost.create(:title =>"提名大會/父親年齡", :audio =>"http://www.am1300.com/uploadfile/2012/0829/20120829015943511.mp3", :audio_date =>"28/08/2012")
Audiopost.create(:title =>"獵殺拉登/撲克合法", :audio =>"http://www.am1300.com/uploadfile/2012/0830/20120830022718886.mp3", :audio_date =>"29/08/2012")
Audiopost.create(:title =>"投資美國/中年交友", :audio =>"http://www.am1300.com/uploadfile/2012/0831/20120831014651512.mp3", :audio_date =>"30/08/2012")
Audiopost.create(:title =>"談羅姆尼提名演講",  :audio =>"http://www.am1300.com/uploadfile/2012/0901/20120901020003131.mp3", :audio_date =>"31/08/2012")
Audiopost.create(:title =>"保守選民/夫妻隱私", :audio =>"http://www.am1300.com/uploadfile/2012/0904/20120904013052894.mp3", :audio_date =>"03/09/2012")
Audiopost.create(:title =>"好勝總統/文鮮明薨", :audio =>"http://www.am1300.com/uploadfile/2012/0905/20120905032838353.mp3", :audio_date =>"04/09/2012")
Audiopost.create(:title =>"賄賂遭罰/飛機砍樹", :audio =>"http://www.am1300.com/uploadfile/2012/0906/20120906015621116.mp3", :audio_date =>"05/09/2012")
Audiopost.create(:title =>"黨代會克林頓講話",  :audio =>"http://www.am1300.com/uploadfile/2012/0907/20120907013822608.mp3", :audio_date =>"06/09/2012")
Audiopost.create(:title =>"總統講話/網購收稅", :audio =>"http://www.am1300.com/uploadfile/2012/0908/20120908013226546.mp3", :audio_date =>"07/09/2012")
Audiopost.create(:title =>"競選因素/投資房產", :audio =>"http://www.am1300.com/uploadfile/2012/0911/20120911021243263.mp3", :audio_date =>"10/09/2012")
Audiopost.create(:title =>"十一年祭/教師罷工", :audio =>"http://www.am1300.com/uploadfile/2012/0912/20120912024009898.mp3", :audio_date =>"11/09/2012")
Audiopost.create(:title =>"美駐利大使遭殺害",  :audio =>"http://www.am1300.com/uploadfile/2012/0913/20120913031024752.mp3", :audio_date =>"12/09/2012")
Audiopost.create(:title =>"中東暴動/劫匪撒錢", :audio =>"http://www.am1300.com/uploadfile/2012/0914/20120914020533626.mp3", :audio_date =>"13/09/2012")
Audiopost.create(:title =>"王妃裸照/擇偶進化", :audio =>"http://www.am1300.com/uploadfile/2012/0915/20120915013310109.mp3", :audio_date =>"14/09/2012")
Audiopost.create(:title =>"童子軍爆性侵醜聞",  :audio =>"http://www.am1300.com/uploadfile/2012/0918/20120918024327515.mp3", :audio_date =>"17/09/2012")
Audiopost.create(:title =>"伊斯蘭教冒犯研究",  :audio =>"http://www.am1300.com/uploadfile/2012/0919/20120919031641515.mp3", :audio_date =>"18/09/2012")
Audiopost.create(:title =>"偷錄講話/繳稅吃稅", :audio =>"http://www.am1300.com/uploadfile/2012/0920/20120920012348452.mp3", :audio_date =>"19/09/2012")
Audiopost.create(:title =>"釣島危機/教師工會", :audio =>"http://www.am1300.com/uploadfile/2012/0921/20120921013754833.mp3", :audio_date =>"20/09/2012")
Audiopost.create(:title =>"太空梭抵/追殺記述", :audio =>"http://www.am1300.com/uploadfile/2012/0922/20120922021939150.mp3", :audio_date =>"21/09/2012")
Audiopost.create(:title =>"判王立軍/農業移民", :audio =>"http://www.am1300.com/uploadfile/2012/0925/20120925024337723.mp3", :audio_date =>"24/09/2012")
Audiopost.create(:title =>"江南風格/時裝仿冒", :audio =>"http://www.am1300.com/uploadfile/2012/0927/20120927023906718.mp3", :audio_date =>"26/09/2012")
Audiopost.create(:title =>"父母資助/高額信用", :audio =>"http://www.am1300.com/uploadfile/2012/0927/20120927030434754.mp3", :audio_date =>"25/09/2012")
Audiopost.create(:title =>"美國大學慣用謊言",  :audio =>"http://www.am1300.com/uploadfile/2012/0928/20120928022910674.mp3", :audio_date =>"27/09/2012")
Audiopost.create(:title =>"薄熙來案/公路關閉", :audio =>"http://www.am1300.com/uploadfile/2012/0929/20120929023202535.mp3", :audio_date =>"28/09/2012")
Audiopost.create(:title =>"談習近平/月餅垃圾", :audio =>"http://www.am1300.com/uploadfile/2012/1002/20121002022222555.mp3", :audio_date =>"01/10/2012")
Audiopost.create(:title =>"最高法院時代大案",  :audio =>"http://www.am1300.com/uploadfile/2012/1003/20121003040739844.mp3", :audio_date =>"02/10/2012")
Audiopost.create(:title =>"誤解辯論/了解美軍", :audio =>"http://www.am1300.com/uploadfile/2012/1004/20121004022738977.mp3", :audio_date =>"03/10/2012")
Audiopost.create(:title =>"談第一次總統辯論",  :audio =>"http://www.am1300.com/uploadfile/2012/1005/20121005030625472.mp3", :audio_date =>"04/10/2012")
Audiopost.create(:title =>"加州油价/阿諾出書", :audio =>"http://www.am1300.com/uploadfile/2012/1006/20121006021009132.mp3", :audio_date =>"05/10/2012")
Audiopost.create(:title =>"雄性選民/推遲上學", :audio =>"http://www.am1300.com/uploadfile/2012/1009/20121009030404209.mp3", :audio_date =>"08/10/2012")
Audiopost.create(:title =>"辯論搞笑/韓流席捲", :audio =>"http://www.am1300.com/uploadfile/2012/1010/20121010033316298.mp3", :audio_date =>"09/10/2012")
Audiopost.create(:title =>"工時效率/猶太中國", :audio =>"http://www.am1300.com/uploadfile/2012/1011/20121011024448994.mp3", :audio_date =>"10/10/2012")
Audiopost.create(:title =>"莫言諾貝爾文學獎",  :audio =>"http://www.am1300.com/uploadfile/2012/1012/20121012031843661.mp3", :audio_date =>"11/10/2012")
Audiopost.create(:title =>"副總辯論/太空飛機", :audio =>"http://www.am1300.com/uploadfile/2012/1013/20121013022545297.mp3", :audio_date =>"12/10/2012")
Audiopost.create(:title =>"經濟獎出/上帝之信", :audio =>"http://www.am1300.com/uploadfile/2012/1016/20121016021229436.mp3", :audio_date =>"15/10/2012")
Audiopost.create(:title =>"辯論爭議/民調誤解", :audio =>"http://www.am1300.com/uploadfile/2012/1017/20121017023636136.mp3", :audio_date =>"16/10/2012")
Audiopost.create(:title =>"談第二次總統辯論",  :audio =>"http://www.am1300.com/uploadfile/2012/1018/20121018031451803.mp3", :audio_date =>"17/10/2012")
Audiopost.create(:title =>"妓女風波/古巴簽證", :audio =>"http://www.am1300.com/uploadfile/2012/1019/20121019014507962.mp3", :audio_date =>"18/10/2012")
Audiopost.create(:title =>"傷害女童/羅琳新作", :audio =>"http://www.am1300.com/uploadfile/2012/1020/20121020022031414.mp3", :audio_date =>"19/10/2012")
Audiopost.create(:title =>"童子軍案/名畫失竊", :audio =>"http://www.am1300.com/uploadfile/2012/1023/20121023032255468.mp3", :audio_date =>"22/10/2012")
Audiopost.create(:title =>"最後辯論/油價背後", :audio =>"http://www.am1300.com/uploadfile/2012/1024/20121024024443976.mp3", :audio_date =>"23/10/2012")
Audiopost.create(:title =>"加州30和38號提案",  :audio =>"http://www.am1300.com/uploadfile/2012/1025/20121025015055257.mp3", :audio_date =>"24/10/2012")
Audiopost.create(:title =>"科學受審/法案爭議", :audio =>"http://www.am1300.com/uploadfile/2012/1026/20121026032056907.mp3", :audio_date =>"25/10/2012")
Audiopost.create(:title =>"溫家寳財富大揭祕",  :audio =>"http://www.am1300.com/uploadfile/2012/1027/20121027025750460.mp3", :audio_date =>"26/10/2012")
Audiopost.create(:title =>"版權訴訟/32號提案", :audio =>"http://www.am1300.com/uploadfile/2012/1030/20121030013904175.mp3", :audio_date =>"29/10/2012")
Audiopost.create(:title =>"東部颶風/溫家寳文", :audio =>"http://www.am1300.com/uploadfile/2012/1104/20121104024324923.mp3", :audio_date =>"30/10/2012")
Audiopost.create(:title =>"33/34/35/36號提案", :audio =>"http://www.am1300.com/uploadfile/2012/1104/20121104025803168.mp3", :audio_date =>"31/10/2012")
Audiopost.create(:title =>"借樹殺人/加州提案", :audio =>"http://www.am1300.com/uploadfile/2012/1104/20121104031006520.mp3", :audio_date =>"01/11/2012")
Audiopost.create(:title =>"民調預測/龍虎華人", :audio =>"http://www.am1300.com/uploadfile/2012/1104/20121104032608485.mp3", :audio_date =>"02/11/2012")
Audiopost.create(:title =>"選舉人團/垃圾捐贈", :audio =>"http://www.am1300.com/uploadfile/2012/1106/20121106031859253.mp3", :audio_date =>"05/11/2012")
Audiopost.create(:title =>"輸贏因素/海外看選", :audio =>"http://www.am1300.com/uploadfile/2012/1107/20121107035214956.mp3", :audio_date =>"06/11/2012")
Audiopost.create(:title =>"連任成功/加州法案", :audio =>"http://www.am1300.com/uploadfile/2012/1108/20121108022856226.mp3", :audio_date =>"07/11/2012")
Audiopost.create(:title =>"大麻合法/見死不救", :audio =>"http://www.am1300.com/uploadfile/2012/1109/20121109025314837.mp3", :audio_date =>"08/11/2012")
Audiopost.create(:title =>"敗選之後/求同存異", :audio =>"http://www.am1300.com/uploadfile/2012/1110/20121110031739632.mp3", :audio_date =>"09/11/2012")
Audiopost.create(:title =>"陷婚外戀局長辭職",  :audio =>"http://www.am1300.com/uploadfile/2012/1114/20121114021032371.mp3", :audio_date =>"12/11/2012")
Audiopost.create(:title =>"將領遭查/湖人換帥", :audio =>"http://www.am1300.com/uploadfile/2012/1114/20121114022711692.mp3", :audio_date =>"13/11/2012")
Audiopost.create(:title =>"名媛風流/花心局長", :audio =>"http://www.am1300.com/uploadfile/2012/1115/20121115025932178.mp3", :audio_date =>"14/11/2012")
Audiopost.create(:title =>"傳記作者/再衝白宮", :audio =>"http://www.am1300.com/uploadfile/2012/1116/20121116031406487.mp3", :audio_date =>"15/11/2012")
Audiopost.create(:title =>"通姦有罪/連任誤解", :audio =>"http://www.am1300.com/uploadfile/2012/1117/20121117023233809.mp3", :audio_date =>"16/11/2012")
Audiopost.create(:title =>"財政懸崖/離開中國", :audio =>"http://www.am1300.com/uploadfile/2012/1120/20121120030015369.mp3", :audio_date =>"19/11/2012")
Audiopost.create(:title =>"甜点倒闭/将军福利", :audio =>"http://www.am1300.com/uploadfile/2012/1121/20121121020557645.mp3", :audio_date =>"20/11/2012")
Audiopost.create(:title =>"出軌婚姻/密碼須知", :audio =>"http://www.am1300.com/uploadfile/2012/1122/20121122064552513.mp3", :audio_date =>"21/11/2012")
Audiopost.create(:title =>"晚育代價/孩子撒謊", :audio =>"http://www.am1300.com/uploadfile/2012/1124/20121124114240803.mp3", :audio_date =>"23/11/2012")
Audiopost.create(:title =>"公司福利/中產階級", :audio =>"http://www.am1300.com/uploadfile/2012/1127/20121127040550985.mp3", :audio_date =>"26/11/2012")
Audiopost.create(:title =>"五十塊錢/個人魅力", :audio =>"http://www.am1300.com/uploadfile/2012/1128/20121128040955827.mp3", :audio_date =>"27/11/2012")
Audiopost.create(:title =>"山東之行/富人加稅", :audio =>"http://www.am1300.com/uploadfile/2012/1129/20121129032313901.mp3", :audio_date =>"28/11/2012")
Audiopost.create(:title =>"護照風波/君子報仇", :audio =>"http://www.am1300.com/uploadfile/2012/1130/20121130025642629.mp3", :audio_date =>"29/11/2012")
Audiopost.create(:title =>"巴國升級/同性戀案", :audio =>"http://www.am1300.com/uploadfile/2012/1201/20121201024150657.mp3", :audio_date =>"30/11/2012")
Audiopost.create(:title =>"逃亡生涯/網價大戰", :audio =>"http://www.am1300.com/uploadfile/2012/1204/20121204040826356.mp3", :audio_date =>"03/12/2012")
Audiopost.create(:title =>"碼頭罷工/北嶺殺人", :audio =>"http://www.am1300.com/uploadfile/2012/1205/20121205031347646.mp3", :audio_date =>"04/12/2012")
Audiopost.create(:title =>"地鐵慘案/車禍政治", :audio =>"http://www.am1300.com/uploadfile/2012/1206/20121206032350973.mp3", :audio_date =>"05/12/2012")
Audiopost.create(:title =>"囤積怪癖/墓地導遊", :audio =>"http://www.am1300.com/uploadfile/2012/1207/20121207040656683.mp3", :audio_date =>"06/12/2012")
Audiopost.create(:title =>"送礼学问/贪腐排名", :audio =>"http://www.am1300.com/uploadfile/2012/1208/20121208052249992.mp3", :audio_date =>"07/12/2012")
Audiopost.create(:title =>"受理同性/護士自殺", :audio =>"http://www.am1300.com/uploadfile/2012/1211/20121211041543359.mp3", :audio_date =>"10/12/2012")
Audiopost.create(:title =>"章曙彤自殺案前後",  :audio =>"http://www.am1300.com/uploadfile/2012/1212/20121212044159865.mp3", :audio_date =>"11/12/2012")
Audiopost.create(:title =>"金球入圍名單公佈",  :audio =>"http://www.am1300.com/uploadfile/2012/1214/20121214030858458.mp3", :audio_date =>"13/12/2012")
Audiopost.create(:title =>"新片介紹/名片學問", :audio =>"http://www.am1300.com/uploadfile/2012/1218/20121218043401304.mp3", :audio_date =>"14/12/2012")
Audiopost.create(:title =>"校園槍擊血案思考",  :audio =>"http://www.am1300.com/uploadfile/2012/1218/20121218051924658.mp3", :audio_date =>"17/12/2012")
Audiopost.create(:title =>"母親自白/讀者反響", :audio =>"http://www.am1300.com/uploadfile/2012/1219/20121219040018216.mp3", :audio_date =>"18/12/2012")
Audiopost.create(:title =>"預算懸崖/個性分析", :audio =>"http://www.am1300.com/uploadfile/2012/1220/20121220030707689.mp3", :audio_date =>"19/12/2012")
Audiopost.create(:title =>"韓國總統/大學作文", :audio =>"http://www.am1300.com/uploadfile/2012/1221/20121221034255461.mp3", :audio_date =>"20/12/2012")
Audiopost.create(:title =>"睡眠研究/爲人父母", :audio =>"http://www.am1300.com/uploadfile/2012/1222/20121222015748205.mp3", :audio_date =>"21/12/2012")
Audiopost.create(:title =>"二戰傳奇/節日禮物", :audio =>"http://www.am1300.com/uploadfile/2012/1227/20121227041806455.mp3", :audio_date =>"24/12/2012")
Audiopost.create(:title =>"朋友種類/買狗趣事", :audio =>"http://www.am1300.com/uploadfile/2012/1227/20121227045623598.mp3", :audio_date =>"26/12/2012")
Audiopost.create(:title =>"槍支管制/亞裔學生", :audio =>"http://www.am1300.com/uploadfile/2012/1228/20121228031343573.mp3", :audio_date =>"27/12/2012")
