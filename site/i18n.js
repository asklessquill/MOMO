(() => {
  const KEY = 'momo-lang';
  const query = new URLSearchParams(location.search).get('lang');
  let lang = query === 'en' || query === 'ja' ? query : 'ja';
  if (!query) {
    try {
      const saved = localStorage.getItem(KEY);
      if (saved === 'en' || saved === 'ja') lang = saved;
    } catch (_) {}
  }

  const JA = {
    'Companions stay themselves. Human approved the responsibility transition: MOMO holds System-wide meaning; KIBI owns connection. This picture of roles is not a command hierarchy or fixed pipeline.':'仲間はそれぞれ独立したままです。Human承認により、MOMOはSystem-wideな意味、KIBIは接続を担います。この役割図は指揮系統や固定pipelineではありません。',
    'This thought grew in KIBI Article 9. Its current home is MOMO MP-06, alongside MP-05 receiver-level meaning. The illustration is a Human-facing view, not an independent Constitution.':'この思想はKIBI第9条で育ちました。現在はMOMO MP-06と、受け手に合う意味を扱うMP-05へ継承されています。この図はHuman向けの表現であり、独立した憲法ではありません。',
    'MOMO Purpose and seven Principles':'MOMOのPurposeと7原則','One semantic truth, multiple views':'ひとつの正本、複数のView',
    'Human-facing projection of authorized public philosophy. MOMO-Observatory holds MOMO semantic truth. Human remains final constitutional authority. No private operational state or credentials are published here.':'承認された公開思想をHuman向けに表現しています。MOMOのsemantic truthはMOMO-Observatoryが保持し、最終批准者はHumanです。非公開の運用状態やcredentialは公開しません。',
    'Skip to content':'本文へスキップ','Journey':'旅','Companions':'仲間','Principles':'原理原則','Evolution':'進化','Recomposition':'再構成','World':'世界',
    'Human intent enters here':'Humanの意志はここから入る','MOMO sees the whole,':'MOMOは全体を見る。','but does not control the whole.':'しかし、全体は支配しない。',
    'Human is the source. MOMO is the closest system representation of that intent.':'Humanが意志の源泉であり、MOMOはその意志に最も近いSystem側の表現です。',
    'Three ways MOMO serves':'MOMOが担う3つのこと','One Human intent, recomposed for three different readers.':'ひとつのHumanの意志を、相手に合わせて3つの形へ再構成します。',
    'Show':'魅せる','Observe':'見る','Transmit':'伝える',
    'Make 桃多郎 understandable and memorable to guests through GitHub itself.':'GitHubそのものを使い、桃多郎を直感的で記憶に残る形で魅せます。',
    'Let Human see where the whole system stands, then refresh the observation when needed.':'HumanがSystem全体の現在地を把握し、必要なときに観測を更新できるようにします。',
    'Carry Human purpose, principles, and boundaries to KIBI and every present or future companion.':'HumanのPurpose・原理原則・境界を、KIBIと現在・未来の仲間へ伝えます。',
    'The journey':'桃多郎の旅','Human → MOMO → KIBI → companions → the world. Choose a place. The picture still stands if you never click.':'Human → MOMO → KIBI → 仲間たち → 世界。役割を選ぶと、その意味を見られます。',
    'Human is outside the system':'HumanはSystemの外側にいる','source of intent':'意志の源泉','intent':'意志','purpose / meaning':'目的 / 意味','connects, does not command':'つなぐ。命令しない',
    'See':'見る','Build':'作る','Act':'作用する','Human society':'人間社会','the world':'世界',
    'Human stands outside the system. Intent begins here. Decisions that change purpose remain here.':'HumanはSystemの外側にいます。意志はここから始まり、Purposeを変える判断もHumanに残ります。',
    'Keeps Human intent visible and watches the whole. Closest system-side representation of that intent — not Human, and not a commander.':'Humanの意志を見える状態に保ち、全体を観測します。Humanそのものでも、司令塔でもありません。',
    'Lets companions journey together without becoming one giant system. Connects. Does not supervise.':'仲間たちを巨大な一つのSystemにせず、一緒に旅できる状態を作ります。つなぐが、監督しません。',
    'Sees the world. Finds what matters outside. Remains itself.':'世界を見て、外で何が重要かを見つけます。KIJIはKIJIのままです。',
    'Builds. Turns need into something real. Remains itself.':'必要を現実の形にします。INNUはINNUのままです。',
    'Acts on people and the world. Remains itself.':'人や世界に作用します。SARUはSARUのままです。',
    'A later companion':'未来の仲間','The story is not limited to three. Companions may join, leave, or be replaced. The purpose remains.':'物語は三匹だけではありません。仲間は参加し、離れ、交代できます。それでもPurposeは残ります。',
    'Where seeing, building, and acting meet people. The system faces the world. It does not replace it.':'見る・作る・作用することが人と出会う場所です。Systemは世界に向き合いますが、世界そのものにはなりません。',
    'Why companions?':'なぜ仲間なのか？','Strength is not concentrated in one hero. It is composed from different strengths that remain different.':'強さを一人に集中させません。異なる強みが、異なるまま組み合わさることで強くなります。',
    'Momotaro does not bring three companions because he is strong. He becomes strong because each companion brings a different strength.':'桃太郎が強いから三匹を連れていくのではない。三匹がそれぞれ異なる強さを持つから、桃太郎は強くなる。',
    'One purpose. Different abilities. No requirement to become one thing.':'目的はひとつ。能力は異なる。ひとつになる必要はない。',
    'Companion explorer':'仲間を探索する','See. Build. Act. And room for whoever the journey needs next.':'見る。作る。作用する。そして、次に必要となる仲間のための余白。',
    'Strength':'強み','Boundary':'境界','Contribution':'貢献','Relation':'関係','KIJI — See':'KIJI — 見る','INNU — Build':'INNU — 作る','SARU — Act':'SARU — 作用する','Not only three':'三匹だけではない',
    'KIBI — the kibidango':'KIBI — きびだんご','Different strengths do not need to become one system. KIBI connects without erasing identity.':'異なる強みは、一つのSystemになる必要がありません。KIBIは個性を消さずにつなぎます。',
    'Different strengths':'異なる強み','KIBI connects':'KIBIがつなぐ','Still themselves':'それでも自分のまま','KIBI does not make the companions one. It lets them journey together while remaining themselves.':'KIBIは仲間を一つにしません。それぞれのまま、一緒に旅できるようにします。',
    'The story is not limited to three':'物語は三匹だけではない','Companions may change. Human purpose remains the reason for the journey.':'仲間は変わっても、HumanのPurposeが旅の理由であり続けます。',
    'Observe, not control':'観測する。支配しない','MOMO is an observatory. Applications act. Human decides.':'MOMOは観測所です。Applicationsが動き、Humanが決めます。','MOMO does':'MOMOがすること','see the whole':'全体を見る','keep Human purpose visible':'HumanのPurposeを見える状態に保つ','compress complexity into meaning':'複雑さを意味へ圧縮する','surface decisions only Human can make':'Humanだけが決めることを浮かび上がらせる','MOMO does not':'MOMOがしないこと','control applications':'Applicationsを支配する','run their tasks':'各ApplicationのTaskを実行する','own their execution':'実行責任を奪う','become a supervisor':'Supervisorになる',
    'Principle 9, made visible':'第9原則を、見える形に','Both ways':'両方向','Toward AI':'AIへ','Toward Human':'Humanへ','Human-facing tools':'Human向けツール','AI-native meaning':'AI-nativeな意味','Human-native view':'Human-nativeな見え方','AI complexity':'AI内部の複雑さ',
    'Same height of conversation':'同じ抽象度で会話する','AI may expand complexity internally. Human should receive meaning at Human scale.':'AIは内部でいくら複雑になってもよい。しかしHumanにはHumanの大きさで意味を返します。','Internal complexity':'内部の複雑さ','compresses':'圧縮する','Human meaning':'Humanにとっての意味','What happened':'何をした','What is confirmed':'何が確認できた','What is next':'次に何をする','Where things stand':'現在地','What only Human may decide':'Humanが判断すること',
    'Git remembers':'Gitは覚えている','This public history is how 桃多郎 became a face. Nothing here is invented after the fact.':'このPublic historyは、桃多郎が今の形になるまでの実際の歩みです。後から作った物語ではありません。','Monitoring boundary':'観測の境界','Two views':'二つのView','GitHub as the medium':'GitHubそのものを媒体に','Named 桃多郎':'桃多郎という名前','Companion Journey':'仲間との旅',
    'If you want the words':'言葉で読みたいなら','KIBI → MOMO recomposition':'KIBI → MOMO 再構成','Git remembers how the system became what it is. GitHub is part of how MOMO speaks to Human.':'GitはSystemがどう今の姿になったかを覚えています。GitHubそのものが、MOMOがHumanへ語る方法の一部です。'
  };

  const original = new WeakMap();
  const translatable = node => node.parentElement && !node.parentElement.closest('script,style,.lang-switch');

  function apply(root=document.body){
    document.documentElement.lang = lang;
    const walker=document.createTreeWalker(root,NodeFilter.SHOW_TEXT); const nodes=[];
    while(walker.nextNode()) nodes.push(walker.currentNode);
    for(const node of nodes){
      if(!translatable(node)) continue;
      const raw=node.nodeValue||'', text=raw.trim(); if(!text) continue;
      if(!original.has(node)) original.set(node,text);
      const en=original.get(node), out=lang==='ja' ? (JA[en]||en) : en;
      const lead=(raw.match(/^\s*/)||[''])[0], tail=(raw.match(/\s*$/)||[''])[0];
      node.nodeValue=lead+out+tail;
    }
    document.querySelectorAll('.lang-switch button').forEach(b=>b.setAttribute('aria-pressed',String(b.dataset.lang===lang)));
  }

  function setLang(next){
    if(next!=='ja'&&next!=='en') return; lang=next;
    try{localStorage.setItem(KEY,lang)}catch(_){}
    const url=new URL(location.href); url.searchParams.set('lang',lang); history.replaceState({},'',url.pathname+url.search+url.hash);
    apply();
  }

  function addSwitch(){
    const nav=document.querySelector('.mast nav'); if(!nav||nav.querySelector('.lang-switch')) return;
    const style=document.createElement('style'); style.textContent='.lang-switch{display:inline-flex;gap:.15rem;margin-left:.3rem;padding:.15rem;border:1px solid rgba(28,22,19,.16);border-radius:999px}.lang-switch button{border:0;background:transparent;color:inherit;font:inherit;font-size:.76rem;padding:.34rem .52rem;border-radius:999px;cursor:pointer}.lang-switch button[aria-pressed="true"]{background:rgba(244,199,176,.55);font-weight:700}'; document.head.append(style);
    const wrap=document.createElement('span'); wrap.className='lang-switch'; wrap.setAttribute('aria-label','Language / 言語'); wrap.innerHTML='<button type="button" data-lang="ja">日本語</button><button type="button" data-lang="en">English</button>';
    wrap.addEventListener('click',e=>{const b=e.target.closest('button[data-lang]'); if(b)setLang(b.dataset.lang)}); nav.append(wrap);
  }

  addSwitch(); apply();
  new MutationObserver(ms=>{for(const m of ms) for(const n of m.addedNodes) if(n.nodeType===1||n.nodeType===3) apply(n.nodeType===1?n:n.parentElement)}).observe(document.body,{childList:true,subtree:true});
})();
