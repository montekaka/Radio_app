# encoding: UTF-8
stationa = Station.create(:name=>"節目重溫")

showa = stationa.shows.create(:name=>"首次置業")

showa.audioposts.create( :audio_date=>"2009-03-15", :title=>"如何順利獲得優惠貸款", :audio=>"http://www.moneyradio.org/www/realestate/RE2.mp3", :short_note=>"甘卓璸主講")

showa.audioposts.create( :audio_date=>"2009-03-14", :title=>"首次買屋的稅務優惠", :audio=>"http://www.moneyradio.org/www/realestate/RE1.mp3", :short_note=>"美國政府一向鼓勵民眾購買自住房屋，除了成立機構提供長達三十年固定利率貸款外，還給予各樣稅務優惠，難怪近七成美國人都擁有自住物業。 美國稅例容許納稅人，在報稅時利用「逐項扣減」(ITEMIZED DEDUCTION)方式，以房屋貸款利息(包括貸款點數LOAN POINTS) 和物業稅去減低應繳稅的收入。這些扣稅優惠，除了自住物業外，還可包括一棟「第二居所(SECOND HOME)」之貸款，該物業可以是「渡假房屋」或給予親屬居住。這兩所房屋的貸款金額，只要不超過一百萬元，利息和物業稅便可全部用作扣稅。 除了購買房屋的貸款利息可扣稅外，房屋淨值貸款(HOME EQUITY LOAN)或淨值信用額(EQUITY LINE OF CREDIT)，只要貸款金額不超過十萬元，利息也可作扣稅用。自住房屋貸款扣稅，還有一個獨特的優惠，即不必理會貸款的用途，即使貸款用作其他投資，甚至用在旅行或歸還信用卡欠款上，利息都一樣可以扣稅。 扣稅的好處到底有多少呢？這要視乎您本身的稅率，和房貸利息與物業稅的金額。 舉個例，一對夫婦總年收入為五萬元，未有房屋，所以報稅時是用「標準扣稅」($11400)，加上兩個人本身「個人免稅額」$7300，即要納稅的收入為$31300，其聯邦稅大約為$4,100%，州稅率大約為$700，即共需繳納聯邦和州稅 $4800。 假如這對夫婦有二十五萬元貸款，年利率為5.5%，每年付出$13,750 利息，另加$4500物業稅。他們在報稅時不會用「標準扣稅」，而是改用「逐項扣稅」(ITEMIZED DEDUCTION)，利息與地稅加起來是$18,250，其聯邦稅可減至$2500，州稅可減至$300，即共納稅$2800，比沒有自住房屋每年省了大約$2,000 聯邦與州稅。 舉另一個例，夫婦總年收入為十萬元，未有房屋時他們的聯邦稅是$13,000，州稅是$3850，即共繳稅$16,850。 假如他們有二十五萬元貸款，亦是付$4500物業稅，聯邦稅可減為$10,000,州稅可減為$3,000，即共繳稅$13,000，比沒有自住房屋每年省了大約$3,550 聯邦與州稅。 這對收入比較高的夫婦可能借貸不止二十五萬元，假如他們借貸四十萬元，每年利息便是$22,000，物業稅是$6,000，聯邦稅便可降低至$8,000, 州稅可降至$2300，即共繳稅$10,300。，比沒有自住房屋每年省了大約$6,550 聯邦與州稅。")

showa.audioposts.create( :audio_date=>"2009-03-16", :title=>"購買合適房屋經驗談", :audio=>"http://www.moneyradio.org/www/realestate/RE3.mp3", :short_note=>"陳馬詠莊主講")

showa.audioposts.create( :audio_date=>"2009-03-17", :title=>"首次買屋話你知講座問答時間", :audio=>"http://www.moneyradio.org/www/realestate/REQA.mp3", :short_note=>"問﹕政府有$7500首次買屋抵稅額(Tax Credit)， 又有$8000抵稅額，是否雙重優惠？ 答﹕不是。$7000 抵稅額是給在零八年四月九日至零八年十二月三十一日期間購買自住房屋的納稅人，$8000抵稅額是給在零九年一月一日至十一月三十日期間購買自住房屋的人士。 問﹕除了金額和買屋日期，兩個優惠有何不同？ 答﹕後者比前者好得多$7500。抵稅額要分15年歸還政府，該15年要全部自住，15年內不作自住或賣屋要將餘額一次歸還；$8000抵稅額不用歸還，你只要在該房子自住起碼三年。 問﹕這個優惠是否可與上述MCC優惠共用？ 答﹕可以 問﹕何謂「首次買屋」？ 答﹕納稅人要在買屋前三年內沒有擁有「主要自住物業」(Main Home)，即擁有第二物業或出租物業也無妨。假如一個物業現時是出租的，但過去三年內曾短期作為自住，應該也不符合優惠資格。 問﹕已婚納稅人如何獲得優惠？ 答﹕要夫婦兩個人都符合該「首次買屋」定義才有資格，以下是5405號報稅表中的指示﹕You (and your spouse if married) did not own any other main home during the 3-year period ending on the date of purchase. 問﹕假如我現在是單身，未婚妻擁有自住物業，我過去三年沒有自住物業，我們準備在今年九月結婚，我準備購買自住物業，可否符合優惠資格？ 答﹕假如在結婚前用自己名字購買自住物業，並在2008年以「單身者」的報稅表上申報，應該符合優惠資格。九月結婚後才購買應該不符合資格。 問﹕我可否向父母購買自住房屋，然後取得抵稅優惠？ 答﹕以禮物方式獲得自住房屋，或向親屬購買自住房屋，都不符合優惠資格。親屬的定義是夫婦、父母、祖父母、子女、孫子孫女等直系親屬(Lineal descendants)。 問﹕如何申報？ 答﹕先用5405號報稅表，然後將抵稅金額填在1040報稅表第69行。 問﹕在那一年報稅表申報？ 答﹕即使在2009年購買房屋，也可以在2008年報稅表上取得該抵稅額，如在四月十五日之後成交，可以申請延期報稅，或在報稅後修改報稅表。另一個選擇是留待2010年才在2009年報稅表上申報。 問﹕我無需付稅，是否亦可取得這個抵稅優惠？ 答﹕對，這是個Refundable Tax Credit，即使不用付稅，政府也會寄上支票。 ")

showa = stationa.shows.create(:name=>"認識保險")

showa.audioposts.create( :audio_date=>"2010-06-01", :title=>"開場白", :audio=>"http://www.moneyradio.org/www/otherinfo/LTCOPEN.mp3", :short_note=>"第一輯 開場白")

showa.audioposts.create( :audio_date=>"2010-06-02", :title=>"什麼是「長期護理」", :audio=>"http://www.moneyradio.org/www/otherinfo/LTCFIRST_128.mp3", :short_note=>"是否只有老年人才需要長期護理？長期護理的費用需多少？Medicare是否會支付長期護理費用？Medi-Cal的資產限額是多少？本錄音為您講解。")

showa.audioposts.create( :audio_date=>"2010-06-03", :title=>"不符合Medi-Cal的家庭有何選擇", :audio=>"http://www.moneyradio.org/www/otherinfo/LTCSECOND_128.mp3", :short_note=>"「夾心階層」的困境，保險費用的決定因素，要留意的保險條款")

showa.audioposts.create( :audio_date=>"2010-06-04", :title=>"長期護理保險例子", :audio=>"http://www.moneyradio.org/www/otherinfo/LTCTHIRD_128.mp3", :short_note=>"保費用是否會增加？何選擇保險公司？為何要選擇「伙伴計劃」？申請程序？")

showa.audioposts.create( :audio_date=>"2010-07-01", :title=>"保險知多少(1)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE1.mp3", :short_note=>"這是第一輯「保險知多少」節目，由林修榮與關紹邦制作，內容講述「終生壽險」(WHOLE LIFE) 和「彈性壽險」(UNIVERSAL LIFE)的優劣點。")

showa.audioposts.create( :audio_date=>"2010-07-02", :title=>"保險知多少(2)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE2.mp3", :short_note=>"這是第二輯「保險知多少」節目，由林修榮與關紹邦制作，內容講述VARIABLE UNIVERSAL LIFE「變動彈性壽險」的優劣點，並解釋為何我們大力推薦華人家庭應該購買定期人壽保險(TERM LIFE)。")

showa.audioposts.create( :audio_date=>"2010-07-03", :title=>"保險知多少(3)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE3.mp3", :short_note=>"這是第三輯「保險知多少」節目，由林修榮與關紹邦制作，內容講述各樣與購買人壽保險有關的知識。")

showa.audioposts.create( :audio_date=>"2010-07-04", :title=>"保險知多少(4)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE4.mp3", :short_note=>"這是第四輯「保險知多少」節目，由林修榮與關紹邦制作，內容講述與汽車保險有關的話題。")

showa.audioposts.create( :audio_date=>"2010-07-05", :title=>"保險知多少(5)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE5.mp3", :short_note=>"這是第五輯「保險知多少」節目，由林修榮與關紹邦制作，內容講述與汽車保險有關的話題")

showa.audioposts.create( :audio_date=>"2010-06-06", :title=>"保險知多少(6)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE6.mp3", :short_note=>"這一輯「保險知多少」繼續講解與汽車保險有關的知識，包括發生意外後如何處理。")

showa.audioposts.create( :audio_date=>"2010-07-07", :title=>"保險知多少(7)", :audio=>"http://www.moneyradio.org/www/otherinfo/INSURE7.mp3", :short_note=>"這輯「保險知多少」為您講解「房屋保險」知識，包括自住房屋保險和租客保險。")

showa.audioposts.create( :audio_date=>"2010-08-01", :title=>"提防被人邀請您參加VUL", :audio=>"http://www.moneyradio.org/www/otherinfo/SPECIAL1.mp3", :short_note=>"市面上相當流行找人參加某些保險公司推銷大會，會上大派支票給推銷員，令您感到可以輕易賺錢，但您首先要自己購買保險，再向親戚朋友推銷。我訪問了一位去了開會，亦準備去做推銷的年青朋友，讓您知道個中實況。")

showa = stationa.shows.create(:name=>"安居樂業")

showa.audioposts.create( :audio_date=>"2006-01-04", :title=>"01 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060104.mp3", :short_note=>"零六年一月四日 ")

showa.audioposts.create( :audio_date=>"2006-01-18", :title=>"03 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060118.mp3", :short_note=>"零六年一月十八日")

showa.audioposts.create( :audio_date=>"2006-01-11", :title=>"02 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060111.mp3", :short_note=>"零六年一月十一日")

showa.audioposts.create( :audio_date=>"2006-02-15", :title=>"07 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060215.mp3", :short_note=>"零六年二月十五日")

showa.audioposts.create( :audio_date=>"2006-01-25", :title=>"04 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060125.mp3", :short_note=>"零六年一月二十五日")

showa.audioposts.create( :audio_date=>"2006-02-01", :title=>"05 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060201.mp3", :short_note=>"零六年二月一日")

showa.audioposts.create( :audio_date=>"2006-02-08", :title=>"06 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060208.mp3", :short_note=>"零六年二月八日")

showa.audioposts.create( :audio_date=>"2006-03-01", :title=>"09 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060301.mp3", :short_note=>"零六年三月一日")

showa.audioposts.create( :audio_date=>"2006-03-15", :title=>"11 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060315.mp3", :short_note=>"零六年三月十五日")

showa.audioposts.create( :audio_date=>"2006-03-08", :title=>"10 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060308.mp3", :short_note=>"零六年三月八日")

showa.audioposts.create( :audio_date=>"2006-02-22", :title=>"08 安居樂業 ", :audio=>"http://www.moneyradio.org/www/realestate/LA060222.mp3", :short_note=>"零六年二月二十二日")

showa.audioposts.create( :audio_date=>"2006-03-22", :title=>"12 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060322.mp3", :short_note=>"零六年三月二十二日")

showa.audioposts.create( :audio_date=>"2006-03-29", :title=>"13 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060329.mp3", :short_note=>"零六年三月二十九日")

showa.audioposts.create( :audio_date=>"2006-06-14", :title=>"24 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060614.mp3", :short_note=>"零六年六月十四日 ")

showa.audioposts.create( :audio_date=>"2006-06-21", :title=>"25 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060621.mp3", :short_note=>"零六年六月二十一日")

showa.audioposts.create( :audio_date=>"2006-08-02", :title=>"30 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060802.mp3", :short_note=>"零六年八月二日")

showa.audioposts.create( :audio_date=>"2006-08-30", :title=>"33 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060830.mp3", :short_note=>"零六年八月三十日")

showa.audioposts.create( :audio_date=>"2006-09-06", :title=>"34 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060906.mp3", :short_note=>"零六年九月六日")

showa.audioposts.create( :audio_date=>"2006-04-05", :title=>"14 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060405.mp3", :short_note=>"零六年四月五日")

showa.audioposts.create( :audio_date=>"2006-04-12", :title=>"15 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060412.mp3", :short_note=>"零六年四月十二日")

showa.audioposts.create( :audio_date=>"2006-04-19", :title=>"16 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060419.mp3", :short_note=>"零六年四月十九日")

showa.audioposts.create( :audio_date=>"2006-04-26", :title=>"17 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060426.mp3", :short_note=>"零六年四月二十六日")

showa.audioposts.create( :audio_date=>"2006-05-03", :title=>"18 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060503.mp3", :short_note=>"零六年五月三日")

showa.audioposts.create( :audio_date=>"2006-05-10", :title=>"19 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060510.mp3", :short_note=>"零六年五月十日")

showa.audioposts.create( :audio_date=>"2006-05-17", :title=>"20 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060517.mp3", :short_note=>"零六年五月十七日")

showa.audioposts.create( :audio_date=>"2006-05-24", :title=>"21 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060524.mp3", :short_note=>"零六年五月二十四日")

showa.audioposts.create( :audio_date=>"2006-05-31", :title=>"22 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060531.mp3", :short_note=>"零六年五月三十一日")

showa.audioposts.create( :audio_date=>"2006-06-07", :title=>"23 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060607.mp3", :short_note=>"零六年六月七日 ")

showa.audioposts.create( :audio_date=>"2006-06-28", :title=>"26 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061004.mp3", :short_note=>"零六年六月二十八日")

showa.audioposts.create( :audio_date=>"2006-07-05", :title=>"27 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060705.mp3", :short_note=>"零六年七月五日")

showa.audioposts.create( :audio_date=>"2006-07-12", :title=>"28 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060712.mp3", :short_note=>"零六年七月十二日 ")

showa.audioposts.create( :audio_date=>"2006-07-19", :title=>"29 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060719.mp3", :short_note=>"零六年七月十九日 ")

showa.audioposts.create( :audio_date=>"2006-08-09", :title=>"31 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060809.mp3", :short_note=>"零六年八月九日 ")

showa.audioposts.create( :audio_date=>"2006-08-16", :title=>"32 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060816.mp3", :short_note=>"零六年八月十六日")

showa.audioposts.create( :audio_date=>"2006-09-13", :title=>"35 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060913.mp3", :short_note=>"零六年九月十三日")

showa.audioposts.create( :audio_date=>"2006-09-20", :title=>"36 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060920.mp3", :short_note=>"零六年九月二十日")

showa.audioposts.create( :audio_date=>"2006-09-27", :title=>"37 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA060927.mp3", :short_note=>"零六年九月二十七日 ")

showa.audioposts.create( :audio_date=>"2006-10-04", :title=>"38 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061004.mp3", :short_note=>"零六年十月四日")

showa.audioposts.create( :audio_date=>"2006-10-11", :title=>"41 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061011.mp3", :short_note=>"零六年十月十一日")

showa.audioposts.create( :audio_date=>"2006-10-18", :title=>"42 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061018.mp3", :short_note=>"零六年十月十八日 ")

showa.audioposts.create( :audio_date=>"2006-10-25", :title=>"43 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061025.mp3", :short_note=>"零六年十月二十五日")

showa.audioposts.create( :audio_date=>"2006-11-01", :title=>"44 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061101.mp3", :short_note=>"零六年十一月一日")

showa.audioposts.create( :audio_date=>"2006-11-15", :title=>"45 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061115.mp3", :short_note=>"零六年十一月十五日")

showa.audioposts.create( :audio_date=>"2006-11-22", :title=>"46 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061122.mp3", :short_note=>"零六年十一月二十二日")

showa.audioposts.create( :audio_date=>"2006-11-29", :title=>"47 安居樂業", :audio=>"http://www.moneyradio.org/www/realestate/LA061129.mp3", :short_note=>"零六年十一月二十九日")

stationa = Station.create(:name=>"理財文章")

showa = stationa.shows.create(:name=>"與退休儲蓄有關的稅例")

showa.audioposts.create( :audio_date=>"2010-12-02", :title=>"Roth IRA轉不轉？", :audio=>"", :short_note=>"2010年有個相當特別的稅例，即可將傳統IRA轉為羅斯(Roth)IRA，以後帳戶內收入可以免稅。這個稅務優惠明年不再延續，故須在2010年12月31日前加以利用。 傳統IRA　延稅不免稅 雖然存儲傳統IRA可以省稅，但其稅務好處只是延稅(Tax Deferral)，而非免稅(Tax Free)，因此未來提取時，需將提取金額作為普通收入，放入當年報稅表內課稅。此外，到了70歲半之後，不但不能再存入金額，且要開始每年作「起碼提取」。 假若帳戶持有人離世，帳戶繼承人也要為帳戶內金額付稅。如配偶是受益人(Beneficiary)，還可將帳戶轉入本人IRA繼續延稅；非配偶受益人，則要按年齡每年提取，或在5年內完全提清，當然也要將金額放入收入內。所以，傳統IRA最終還是要付稅，好處只是拖延付稅而已。 羅斯IRA　提取不付稅 羅斯IRA帳戶的本金，不論什麼時侯提取，都不需付稅，因為其本金從未作扣稅之用；帳戶內收入，則視其是否符合條件而決定免稅與否。 第一個條件稱為「5年測試」，意即提取收入之前，您已開設羅斯IRA起碼五年。這個羅斯IRA帳戶，不必是作提取的帳戶，只要是在5年前開的即可。5年期是從開戶那年的1月1日開始計算，不論當年何時開設。 第二個條件稱為「提取種類測試」，以下幾種情況都符合： ‧年齡達到59歲半 ‧帳戶持有人死亡後由受益人提取 ‧身體傷殘 ‧或首次買屋 假如以上兩個條件都符合，提取羅斯IRA帳戶收入便可免稅和免罰金。即使不符合條件，其帳戶提取次序是以每年存入的金額為先，最後才是收入，所以只要不提取收入便可完全免稅。 除了免稅外，羅斯IRA還允許納稅人70歲半以後繼續儲蓄，只要有工作或生意收入便可。由於羅斯IRA免稅，國稅局也沒規定要作任何「起碼提取」，即可以長期持有，將來後人繼承也是免稅（但要開始提取）。 羅斯IRA由於可以免稅，故優於傳統IRA。 傳統轉羅斯　有利亦有弊 稅例允許人們，將部分或全部傳統IRA轉為羅斯IRA，但要在當年為該金額付稅，即馬上付出一筆稅金，去交換將來本利都免稅的好處。 今年底之前，將傳統IRA轉為羅斯IRA，可得到一個特別優惠，就是不需將金額放入2010年報稅表，而可留待2011和2012年報稅表，每年放入一半，即2012年4月前付一半稅金，2013年4月前再付另一半稅金。 當然，納稅人亦可將金額放入2010年報稅表，但選擇此方法的報稅人，須將全部金額統統放入2010年報稅表，不能只放入部分金額。 轉為羅斯IRA的缺點是要馬上付稅，好處是以後無「後顧之憂」。由於以後所有帳戶收入都免稅，能夠維持羅斯IRA帳戶的時間越長，這個免稅好處便越顯著，因此年紀較輕的朋友更相宜。40歲以下的朋友，假如準備長期持有IRA退休帳戶，便應考慮轉為羅斯IRA；過了40歲的朋友，則需考慮清楚再作決定。 幾類人士　較適宜轉戶 除了40歲以下的朋友外，今年收入偏低、失業或生意收入不佳者，亦應趁稅率較低之際轉為羅斯IRA。此外，假如今年有特殊情況，有大筆扣稅項目，例如：生意虧蝕（包括出售出租物業產生虧蝕），或作大筆慈善捐獻，便應考慮轉為羅斯IRA。 最後，假如預計將來收入和稅率會比目前高，加上將保持羅斯IRA帳戶15年以上，便應考慮轉為羅斯IRA。 轉了羅斯 後悔不用愁 假如年底前將傳統IRA轉為羅斯IRA後發覺決定錯誤；或由於投資項目的市場價格大幅下跌，想取消轉羅斯IRA的行動，沒有問題！只要明年4月15日前轉回傳統IRA便可。假如申請延期報稅，則在明年10月15日前轉回傳統IRA，便等於從未轉過。 請記得：要利用這個特別稅務優惠，必須在年底前付諸行動。 ")

showa.audioposts.create( :audio_date=>"2010-12-01", :title=>"用IRA帳戶投資房地產", :audio=>"", :short_note=>"個人退休帳戶 (IRA)帳戶內的投資，通常不外是股票、債券、共同基金或銀行定期存款；可是，自從1974年開始，稅例上容許納稅人將資金投資到其他項目，包括房地產(如﹕出租房屋、商用物業等)，但實行起來並不容易，而且有一定的限制。 帳戶信託機構 每一個IRA或ROTH IRA帳戶都需要由一個「信託機構」(IRA Trustee)設立，最常見的「信託機構」是商業銀行，信用社(Credit Union)，或一般的股票經紀行(brokerage companies)，亦包括人壽保險公司。 「信託機構」要確保帳戶的運作符合稅例要求，並要按時向帳戶持有人報告帳戶情況，和在有需要時向政府申報。有一些「信託機構」甚至參予指導或幫助帳戶持有人將資金作投資。 一般的「信託機構」都不會容許帳戶持有人作地產投資，但稅例卻容許IRA資金投資房地產，怎樣才可以將IRA帳戶資金作地產投資呢？ 要將IRA或ROTH IRA資金作地產投資，必須先設例一種名為Self-Directed IRA的帳戶，它其實亦是IRA帳戶，只不過它容許您作「另類投資」。您需要找一個可設立和處理這種帳戶的「信託機構」，它們可能是某些銀行的附屬機構，或者是一個獨立的財務機構；這種特別的帳戶收費比一般「信託機構」高得多，幾千元收費都不出奇。 帳戶投資限制 雖然稅例容許將IRA資金作房地產投資，但亦規定必須購買投資物業，即不能用來與家人自住(連作為渡假屋都不可以)。此外，稅例亦限制所謂「自我交易」(self dealing)，即IRA帳戶不能向帳戶持有人或其「家人」買賣物業，連租給「家人」都不可以。「家人」的定義是﹕配偶、父母、祖父母、子女與他們的配偶或子孫。「家人」並不包括﹕兄弟姊妹、姨母、叔伯、舅、表兄弟姊妹。 另一個重要的限制，是不能為以帳戶內的資產作抵押去做物業貸款，故一般購買物業都是需要現金。通常IRA帳戶有可觀的資金作物業投資，都是從401-K之類的退休帳戶轉入IRA。 稅務問題探討 傳統IRA帳戶的稅務好處是延稅，ROTH IRA的稅務好處是免稅，帳戶內的收入(包括租金與增值收入)都可得到這些稅務優惠。 但利用傳統IRA作地產投資也有稅務上的壞處。由於傳統IRA帳戶將來作提取時，所有收入都作為普通收入，其稅率會較「長期資格增值」(Long Term Capital Gain)收入稅率高。此外，還有一個重要的稅務缺點，是將來由後人繼承傳統IRA資產，將來沒有「成本提升」(Cost Basis Step Up)，即後人賣出時亦要為增值付普通收入稅。 還有第三個缺點，就是傳統IRA在帳戶持有人70歲半之後每年要作「起碼提取」，到時假如帳戶沒有其他投資或現金，便可能要出售物業才能作提取。 基於以上三個重大的稅務缺點，用ROTH IRA作地產投資比用傳統IRA優勝得多。 最後，利用傳統IRA或ROTH IRA作地產投資，不能將出租物業因支出(包括折舊Depreciation)可能產生的「被動虧蝕」作扣稅用(假如本身總收入超過15萬元，便不能以「被動虧蝕」扣稅)。 結論 在ROTH IRA擁有大量資金的讀者，假如對投資房地產有興趣，可以考慮用Self Directed IRA去作投資；假如本身只有傳統IRA，除非準備轉為ROTH IRA，投資地產前需要考慮以上列出的利弊。")

showa.audioposts.create( :audio_date=>"2010-12-03", :title=>"用IRA帳戶投資房地產", :audio=>"", :short_note=>"個人退休帳戶 (IRA)帳戶內的投資，通常不外是股票、債券、共同基金或銀行定期存款；可是，自從1974年開始，稅例上容許納稅人將資金投資到其他項目，包括房地產(如﹕出租房屋、商用物業等)，但實行起來並不容易，而且有一定的限制。 帳戶信託機構 每一個IRA或ROTH IRA帳戶都需要由一個「信託機構」(IRA Trustee)設立，最常見的「信託機構」是商業銀行，信用社(Credit Union)，或一般的股票經紀行(brokerage companies)，亦包括人壽保險公司。 「信託機構」要確保帳戶的運作符合稅例要求，並要按時向帳戶持有人報告帳戶情況，和在有需要時向政府申報。有一些「信託機構」甚至參予指導或幫助帳戶持有人將資金作投資。 一般的「信託機構」都不會容許帳戶持有人作地產投資，但稅例卻容許IRA資金投資房地產，怎樣才可以將IRA帳戶資金作地產投資呢？ 要將IRA或ROTH IRA資金作地產投資，必須先設例一種名為Self-Directed IRA的帳戶，它其實亦是IRA帳戶，只不過它容許您作「另類投資」。您需要找一個可設立和處理這種帳戶的「信託機構」，它們可能是某些銀行的附屬機構，或者是一個獨立的財務機構；這種特別的帳戶收費比一般「信託機構」高得多，幾千元收費都不出奇。 帳戶投資限制 雖然稅例容許將IRA資金作房地產投資，但亦規定必須購買投資物業，即不能用來與家人自住(連作為渡假屋都不可以)。此外，稅例亦限制所謂「自我交易」(self dealing)，即IRA帳戶不能向帳戶持有人或其「家人」買賣物業，連租給「家人」都不可以。「家人」的定義是﹕配偶、父母、祖父母、子女與他們的配偶或子孫。「家人」並不包括﹕兄弟姊妹、姨母、叔伯、舅、表兄弟姊妹。 另一個重要的限制，是不能為以帳戶內的資產作抵押去做物業貸款，故一般購買物業都是需要現金。通常IRA帳戶有可觀的資金作物業投資，都是從401-K之類的退休帳戶轉入IRA。 稅務問題探討 傳統IRA帳戶的稅務好處是延稅，ROTH IRA的稅務好處是免稅，帳戶內的收入(包括租金與增值收入)都可得到這些稅務優惠。 但利用傳統IRA作地產投資也有稅務上的壞處。由於傳統IRA帳戶將來作提取時，所有收入都作為普通收入，其稅率會較「長期資格增值」(Long Term Capital Gain)收入稅率高。此外，還有一個重要的稅務缺點，是將來由後人繼承傳統IRA資產，將來沒有「成本提升」(Cost Basis Step Up)，即後人賣出時亦要為增值付普通收入稅。 還有第三個缺點，就是傳統IRA在帳戶持有人70歲半之後每年要作「起碼提取」，到時假如帳戶沒有其他投資或現金，便可能要出售物業才能作提取。 基於以上三個重大的稅務缺點，用ROTH IRA作地產投資比用傳統IRA優勝得多。 最後，利用傳統IRA或ROTH IRA作地產投資，不能將出租物業因支出(包括折舊Depreciation)可能產生的「被動虧蝕」作扣稅用(假如本身總收入超過15萬元，便不能以「被動虧蝕」扣稅)。 結論 在ROTH IRA擁有大量資金的讀者，假如對投資房地產有興趣，可以考慮用Self Directed IRA去作投資；假如本身只有傳統IRA，除非準備轉為ROTH IRA，投資地產前需要考慮以上列出的利弊。")

showa.audioposts.create( :audio_date=>"2010-12-04", :title=>"長者處理退休帳戶需知", :audio=>"", :short_note=>"長者到了七十歲，便開始要注意個人退休儲蓄帳戶(IRA)的提取規則。歡迎您閱讀在本網頁上有關IRA提取的規則。 國稅局有規定，到了七十歲半之後，必須每年由傳統的IRA中提取起碼小部份儲蓄，每年大約不到4%，提取的金額要加入當年收入中報稅。這些提取和要繳稅的金額，可不可以順便傳入ROTH IRA，讓以後帳戶收入可以免稅呢？答案是不可以的，這個起碼提取的金額，一作了提取便已經不再是IRA帳戶的一部份，所以不能夠轉為ROTH IRA。 但假如長者想將傳統IRA帳戶以內的資金轉為ROTH IRA，是不論任何歲數都可以做的，只要當年總收入不超過十萬元便可以了。不過，由傳統IRA轉為ROTH IRA，是需要將金額放入當年收入繳稅，年紀大的朋友，通常這樣做都不是聰明的。 有一個情況是不妨將傳統IRA轉為ROTH IRA，就是假如當年收入不高，甚至未超過收入免稅金額，那便應該酌量將傳統IRA轉為ROTH IRA，以後這個部份便沒有起碼提取規定，提取時也不必繳稅。 作提取時是可以隨便選擇從一個或多個IRA帳戶中作提取，只要提取金額達到國稅局要求便可以了。 假如您還有保留了公司的401-K帳戶，除非您過了七十歲還繼續工作，這個退休儲蓄帳戶也是要由七十歲半之後，每年作起碼提取，規則與IRA帳戶相同。不過，作起碼提取時401-K帳戶要與IRA帳戶分開計算，即是IRA的起碼提取金額必須由IRA帳戶作提取，401-K起碼提取金額要在401-K帳戶作提取，不能將兩者混合。 同樣地，夫婦兩人即使都過了七十歲半，彼此要作的起碼提取都必須來自本身的帳戶，要記得個人退休戶口是屬於個人的。 假如忘記在達到七十歲半之後的第二年四月一日前作起碼提取，會有什麼後果呢？這個應該提取的部份，是要付百分之五十的罰金，除非您能夠提供充足和合理的理由去免除罰金。")

showa.audioposts.create( :audio_date=>"2010-12-05", :title=>"IRA資金可否作地產投資？", :audio=>"", :short_note=>"個人退休帳戶IRA內的資金，您可以自由地決定作投資。如果是屬於保守派，那就可以將它放入銀行定期存款，之外您亦可選擇股票、債券、共同基金 等投資。 但IRA帳戶內的資金可否作地產投資呢？稅例上是容許的，不過，做起上來是有一定限制。 首先，戶口當然必須擁有相當可觀的資金，因為IRA帳戶是不能借貸，亦不可以將IRA帳戶內的資金，與戶口以外的資金混合一起作投資。第二，自己 擁有的地產物業，是不可以轉入IRA帳戶，因為這樣會造成自己買賣（Self Dealing），在稅例上是不容許的。第三，如果物業需要資金來做維修，款項一定要由戶口來支付，可是IRA帳戶口每年能夠存放的資金有限額，所以要留意是否有充足資金支付其他費用。第四，由IRA帳戶投資的物業不能夠自用，即必須是個投資物業。 這四項限制都解決之後，還有一項需要，就是要找到一位代管機構（Custodian），因為IRA帳戶必須有代管者。有些公司專門為IRA地產投資作代管人，當然要收取費用，但最後這個問題是可以解決的。")

showa.audioposts.create( :audio_date=>"2010-12-06", :title=>"避免IRA帳戶提取罰金", :audio=>"", :short_note=>"五十九歲半之前，由IRA個人退休戶口作提取，是可能會有百分之十的罰金。這一個百分之十，是以大家作提取的時候，要放入報稅表當作收入的報稅金額而定。如果是普通IRA，所有提取的收入、與及以前用來扣過稅的本金，都有百分之十罰金。若是ROTH IRA，因為本金從來沒有用來扣稅，所以作提取的時候，是沒有任何罰金；只有拿到收入的時候，才會有罰金。 由IRA戶口作提取，有數個特殊的情況，是可以避免剛才提到的百分之十的罰金。首先，拿出來六十日之內，將之放回IRA，這樣是沒有罰金的。其他可以避免罰金的情況包括：需要以IRA來支付超出收入百分之七點五的醫藥費、或者身體有殘障、或需要用IRA來支付大學的學費、雜費、書簿費、甚至食宿費，都可以免罰金的。 此外，五十九歲半之前，將IRA拿出來買第一所房屋，亦都可以免罰金。第一所房屋的定義，是在過去兩年內，並未擁有自住物業。以這項的規則來免提取罰金，提取的金額是一生人不能超過一萬元，而且要在提取日的一百二十日之內成交。大家要注意，即使免罰金，都可能要將提取的金額，當收入來繳稅。")

showa.audioposts.create( :audio_date=>"2010-12-07", :title=>"是否應該轉為ROTH IRA？", :audio=>"", :short_note=>"接近年底，擁有個人退休帳戶的讀者，都應該考慮是否將部份或全部帳戶金額轉為ROTH IRA。普通IRA帳戶內的收入只有延稅好處，將來提取時需要按當時稅率付稅，而且過了七十歲便每年要作起碼提取。可是，在ROTH IRA帳戶的收入是完全免稅的，而且沒有要作起碼提取的規定。 要將普通IRA帳戶轉為ROTH IRA，先決條件是當年總收入不能超過十萬元。此外，轉為ROTH IRA的金額要放入當年收入報稅。所以，要決定是否轉為ROTH IRA，首先要考慮今年收入稅率，其次要考慮帳戶將來的投資時期長短，第三要考慮將來退休後的預期收入稅率。 這三項考慮因素，除了今年收入稅率外，其他兩項都是對將來的預測，是沒有肯定的答案的。通常年紀越輕，投資時間便越長，也越應該考慮轉為ROTH IRA。 今年如果有特別原因收入不高，稅率比平時低的話，便不妨考慮將部份IRA轉為ROTH IRA。但如果今年稅率特別高，或您沒有能力支付轉ROTH IRA要付的收入稅，便應該將金額留在IRA帳戶內。")

showa.audioposts.create( :audio_date=>"2010-12-08", :title=>"IRA 與ROTH IRA誰較優勝？", :audio=>"", :short_note=>"四月十五日之前，仍然可以為去年存款進普通個人退休帳戶(IRA)或ROTH個人退休帳戶，只要有做工或生意收入，每一個人都可以選擇使用普通個人退休帳戶，但要選擇ROTH個人退休帳戶，則報稅表上總收入不得超過十一萬元(單身)，或十六萬元(已婚共同報稅)，兩者都有資格選擇的話，那一種帳戶較優勝？ 普通退休帳戶的特點是「先甜後苦」，如果符合扣稅的要求，存款是可以幫助您在報稅當年減低總收入，和減低稅金，但普通IRA只是延稅，帳戶內的本和利將來提取時要作為普通收入課稅，並且七十歲半之後必須每年作起碼提取。ROTH 退休帳戶則是「先苦後甜」，存入帳戶當年不可扣稅，但將來提取時全無稅金，而且沒有規定某歲數便要開始作提取。 有參加僱主提供的退休計劃者，要用普通IRA扣稅，收入不可超過某金額，收入過高，該筆存款便成為「非扣稅IRA」，這類朋友假如收入不超過ROTH IRA限額的話，當然寧願選擇ROTH IRA。但兩者都合資格的朋友，年紀越輕和目前稅率越低，就越應該考慮使用ROTH IRA，因為長期下來，可免稅的收入可能會相當可觀。")

showa.audioposts.create( :audio_date=>"2010-12-09", :title=>"RA戶口虧損可以抵稅嗎？", :audio=>"", :short_note=>"大家都知道，從IRA戶口所賺到的收益，是可以延稅，即暫時不用為收益繳稅；同樣地，IRA戶口如果有虧損，也不能用來抵稅。 但在一種情況中，IRA戶口的虧損，是可以在逐項扣稅時，作為雜項抵稅(Miscellaneous deduction)。這種情況，就是大家將普通IRA戶口作全部提取，而提取的本及利，是低於戶口的成本(Unrecovered basis)，這個成本，通常是指從未用來抵稅的本金，即稱為Non-Deductible IRA。 假如存入一萬美元在Non-Deductible IRA或ROTH IRA內，而這個就是大家的全部IRA，當大家將整個IRA戶口作全部提取時，假如戶口的總金額是低於一萬美元，即有虧損，而這個虧損就可以用來作雜項抵稅之用。 IRA戶口虧損，可以用來抵稅的條件，就一定是從未抵稅的Non-Deductible IRA或ROTH IRA，以及要作百份百的全部提取，且市值要低於成本。")

showa.audioposts.create( :audio_date=>"2010-12-10", :title=>"ROTH IRA繼承人提取規則", :audio=>"", :short_note=>"您可能已經知道，ROTH IRA在戶主有生之年是不需要作任何「最低提取」的，而在任何時間提取本金(每年放入ROTH IRA的金額)，都是不用付稅和罰金，可是，一旦戶主離世，由受益人繼承，規則便可能不同了。 正如傳統IRA，假如受益人是配偶，受益人就可以將ROTH IRA改為由自己擁有，完全歸到自己ROTH IRA帳戶內，處理規則與本身ROTH IRA相同，即在該配偶有生之年都沒有最低提取規定。 可是，假如受益人不是配偶，那便不一樣了。受益人有兩個選擇，第一，是在死亡日期後下一年開始計算的五年內，要作完全提取。第二，是要按受益人本身的「預期壽數」每年作部份提取。這是個「最低起碼提取」金額，要提取超過這個金額是可以的。 不論何時提取本金都是沒有稅金和罰金的，但假如提取的是收入，便有一個五年期的規則，假如死者本身IRA未夠五年，提取收入便要付稅和罰金，一旦距離原來設立帳戶五年或以上，則提取收入也沒有稅金和罰金。")

showa.audioposts.create( :audio_date=>"2010-12-11", :title=>"ROTH IRA提取規則", :audio=>"", :short_note=>"ROTH IRA帳戶的提取規則，與普通IRA很不一樣。普通IRA在提取時，未繳過收入稅的金額，全部要在當年放入報稅表上，假如提取時未夠五十九歲半，還可能要付百分之十罰金。但ROTH IRA每年存入的金額，不論何時作提取，亦不論您的歲數，都完全沒有稅金和罰金。這個相當寬鬆的提取稅例，好處是給予高度自由，但也容易令儲蓄者隨便作提取，以致長期儲蓄半途而廢。 假如由ROTH IRA帳戶內提取由普通IRA帳戶轉成ROTH IRA的存款，稅例便沒有那麼寬鬆了。這些金額由於已經繳稅，提取時沒有稅金，但如果在轉為ROTH IRA後之五年內作提取，除非本人已經超過五十九歲半，或者符合一些例外情況，都一律要付百分之十罰金。 假如由ROTH IRA帳戶提取收入，有可能要付罰金和稅金，除非您已經設立ROTH IRA帳戶超過五年，並且符合以下特別情況﹕超過五十九歲半、死亡或殘障，或者是用作首次買屋。 稅例規定，由ROTH IRA帳戶作提取的次序，首先是每年存入的金額，之後是由普通IRA帳戶轉入的金額，最後才是收入，所以只要小心作提取，是可以完全避免罰金和稅金的")

showa.audioposts.create( :audio_date=>"2010-12-12", :title=>"離職時401-K 帳戶的處理", :audio=>"", :short_note=>"您在工作時參加公司的401-K 退休計劃，按月將薪金一部份存入，當您不論任何原因離開公司時，這筆存款必定屬於您的。通常存款金額超過五千元，公司都會容許您留在401-K帳戶內，繼續投資公司供給的共同基金，但當然不能再繼續增加存款。 另一個選擇，是將金額提取，但要將金額加入當年收入付稅，所以除非逼不得已，都應該避免作提取。提取還可能會導致國稅局百分之十的罰金，除非您在離職時已達到五十五歲。 通常最佳的選擇，是將金額轉入「個人退休帳戶」(IRA)，既可避免罰金和收入稅，更能繼續以延稅方式為退休作投資，轉入IRA還有一個好處，就是可以自行選擇投資項目，不只限於公司計劃內提供的共同基金。但一旦轉入IRA帳戶，免罰金的提取年齡不再是上述的五十五歲，而是五十九歲半。 您假如決定將金額轉入IRA，便應該通知401-K計劃管理機構直接將款項轉到IRA，而不要收取支票，以避免公司要扣起百分之二十預繳稅。")

showa.audioposts.create( :audio_date=>"2010-12-13", :title=>"放錯IRA怎麼辦？", :audio=>"", :short_note=>"如果去年在ROTH IRA戶口內存入款項，或由普通戶口將資金轉入ROTH IRA戶口內，至今才發現去年收入超過最高限額，應如何補救呢？原來可在報稅期限，即四月十五日前，將原來放在ROTH IRA戶口內的金額轉出，若不這樣處理，則以後每年將被罰款6%。若轉出來的金額，如果比原來存入的本金為高，多出部份是要按普通收入來報稅。第二個方法是通知銀行或投資公司，將ROTH IRA改為存入普通IRA戶口內，這種方法是還原，且不用擔心要繳稅。 一些人在去年將IRA轉作ROTH IRA，目前發現市場下跌，ROTH IRA戶口的價值比轉換前低了很多，所以，可以考慮將ROTH IRA還原，轉換為普通的IRA，然後等至少三十日後，再由普通IRA轉回ROTH IRA，這就可以省掉很多稅項。 至於要將這些IRA戶口取消或還原時，必須在報稅期限前做妥，若申請延期報稅，是可以在八月十五日，甚或十月十五日前辦理均可，但必須目前有所計劃，並與會計師商議。 將IRA帳戶存款「還原」(Recharacterize) 有些讀者存款入個人退休儲蓄帳戶（IRA）後，由於各種原因 (包括收入超過限額等)，需要將該存款改為另外一種IRA。亦有一些人將普通IRA帳戶改為ROTH IRA之後產生悔意，想將該行動取消。在稅例有一個程序，名稱是Recharacterization，就是「還原」的意思，這個「還原」稅例，令您可以輕易地將一種IRA改為另外一種IRA，並在這過程中免稅和免付罰金。 舉個例子，您存入普通IRA帳戶三千元，本來希望可以扣稅，其後發覺本身收入過高，加上有參加雇主提供的退休儲蓄計劃，故不能用作扣稅，您寧願將存款改為ROTH IRA。另一個例子，您在去年已經將普通IRA轉為ROTH IRA，報稅時發覺收入過高，或者發覺轉作ROTH IRA之後帳戶投資價值下跌了不少，您想將戶口內的資金「還原」為普通IRA，那便要利用這個「還原」稅例了。 只要在報稅期前前進行「還原」，便等于從來沒有存款到這個IRA帳戶內，故能避免一切稅金與罰金。其實，可以進行「還原」的時間是相當長的，只要按時遞交報稅表，在該報稅年度的下一年四月十五日前，都依然可以利用「還原」稅例。例如，在零六年存款三千元進ROTH IRA，之後改變主意，便可在零七年四月十五日前，將「還原」決定通知銀行或經紀行，便可免稅和免罰金地將該三千元改為普通IRA。")

showa.audioposts.create( :audio_date=>"2010-12-14", :title=>"退休儲蓄稅務雙重優惠", :audio=>"", :short_note=>"政府為了鼓勵大家為自己將來退休多作準備，給予退休儲蓄相當優惠的稅務好處。參加公司提供的401-K之類的退休計劃，除了自己儲蓄的金額在該年不包括在收入之內，連僱主補貼 (Matching) 的金額也可延稅。；大家自己設立的個人退休帳戶，如果符合扣稅條件的話，儲蓄金額亦是可以扣稅。 有些已婚家庭只要總收入不超過五萬二千元，除了以上稅務優惠之外，還可以另外獲得「退休儲蓄抵稅」優惠，所謂「抵稅」(Tax Credit)是直接減低稅金，效果比扣稅更佳。這項抵稅優惠，由退休儲蓄百分之十至百分之五十，視乎總收入多少而定，總收入不超過五萬二千元，但高於三萬四千元，便可取得二千元退休儲蓄的一成為抵稅額，收入在三萬一千元以上和三萬四千或以下，抵稅額為二成，收入在三萬一千元或以下，抵稅金額達到五成。 收入在六萬左右的家庭，應特別留意該項抵稅優惠。舉個例，已婚家庭總收入為六萬二千元，夫婦兩人都超過五十歲，只要各自存入五千元入普通IRA帳戶，便可將總收入減至五萬二千元，除了省下大約一千五百元以上稅金之外，另可取得四百元抵稅額。收入在四萬元左右的家庭，更應留意下文提到抵稅稅的「收入跳點」。 這個「退休儲蓄抵稅」計劃裡面，有幾個「入息跳點」，是大家要留意的。第一個跳點當然就是上述的五萬二千元，只要利用退休儲蓄將總收入減至五萬二千元之內，便可得到10%抵稅金額，收入是五萬二千零一元便完全沒有抵稅金額，所以我叫這個做「收入跳點」。 五萬元二千以內收入，有一個跳點是$34,000。總收入在$34,000以上，則最高只可取得$2000退休儲蓄的10%抵稅金額，可是，只要收入在$34,000或以下，抵稅率不再是10%，而是跳升到20%，即夫婦最高抵稅金額從$400升到$800。 最後一個「入息跳點」是$31,000，收入如果在扣除退休金儲蓄金額後不超過$31,000, 則抵稅率跳升為50%，即最高抵稅金額達到$2,000。不過大多數這個收入的家庭，都不會有這麼高的稅款需要交付。這個「退休儲蓄抵稅額」，在用來將所有入息稅扣清後，未用完的那部份政府是不會付現金的。")

showa.audioposts.create( :audio_date=>"2010-12-15", :title=>"傳統退休帳戶", :audio=>"", :short_note=>"受雇的納稅人，只要有工作收入（不包括失業金和退休金），每一個人都可為2007年存放最高四千元到「傳統個人退休帳戶(Traditional IRA)」；五十歲或以上，則可加存一千元。夫婦即使只有一位賺取收入，只要收入超過八千元，即兩人都可存款四千元到退休帳戶。 「傳統退休帳戶」的最大好處，是存入金額可能可從收入中扣除，幫助減低稅金。沒有參加僱主提供的退休計劃（例如401-K計劃之類），則不論收入，都可將存入金額用作扣稅。 參加僱主退休計劃者，扣稅便可能有限制，主要看該家庭總收入。單身者只要去年總收入不超過六萬二千元，已婚共同報稅者只要收入不超過十萬零三千元，便可全部或部分扣稅。即使不可扣稅，也可存款到「傳統退休帳戶」，只不過存款得不到扣稅好處，但帳戶內產生的收入仍然可以延稅。")

showa.audioposts.create( :audio_date=>"2010-12-16", :title=>"ROTH退休帳戶", :audio=>"", :short_note=>"ROTH退休帳戶 另一種個人退休帳戶，稱為ROTH IRA，特點是存放時不能作用扣稅，但只要符合規定，將來本利完全免稅，更不需在七十歲半後規定要作提取。只要家庭總收入不超過十一萬四千元（單身）或十六萬六千元（已婚共同報稅），不論是否參加僱主退休計劃，都可存款入ROTH IRA。對四十歲以下和收入超過「傳統退休帳戶」規定的納稅人，ROTH IRA往往為較佳選擇。 已婚分開報稅者，只要收入超過一萬元，即不可以利用以上兩種退休帳戶（除非配偶全年分居）。")

showa.audioposts.create( :audio_date=>"2010-12-17", :title=>"退休儲蓄抵稅", :audio=>"", :short_note=>"除了利用「傳統退休帳戶」減低收入和稅金外，總收入在五萬二千元或以下的已婚共同報稅家庭，或總收入不超過二萬六千元之單身納稅人，每個人的退休儲蓄（包括任何IRA帳戶和401-K帳戶），還可享有「退休儲蓄抵稅額(Tax Credit)」，金額為二千元的百分之十至五十，視收入而定，這對符合資格的家庭，是雙重稅務優惠。 請注意，計算總收入是按扣除「傳統退休帳戶」儲蓄金額後為準，所以即使夫婦總收入為五萬八千元，只要有資格存放六千元到可扣稅的「傳統退休帳戶」，便可將總收入減為五萬二千元，從而得到四百元抵稅額。 ")

showa.audioposts.create( :audio_date=>"2010-12-18", :title=>"自雇者儲蓄計劃", :audio=>"", :short_note=>"有自雇收入的讀者，除可利用上述退休帳戶外，還可選擇SEP IRA 計劃，每年將淨「自雇收入」最高20%-25%或不超過四萬五千元作延稅儲蓄。SEP IRA的好處還包括手續簡單，沒有每年要填交的報表。 另外一種工具，名為KEOGH，手續比較復雜。近期有一種新工具，稱為SOLO 401-K 計劃，適用於沒有僱員的自雇人士，最高儲蓄金額亦可高達四萬五千元。未建立退休儲蓄計劃的自雇人士，應該與會計師商議，比較哪一種工具較適合。SEP IRA可以在遞交報稅表前設立，所以還可以為去年減稅。 一般銀行或投資經紀行，都可為您開設退休儲蓄帳戶。開設帳戶後，自己還要決定帳戶內的儲蓄如何投資，除了在銀行定期存款之外，還可投資股票、債券或共同基金。四月十五日前，仍可為二○○七年存放「傳統退休帳戶」或ROTH IRA 帳戶。")