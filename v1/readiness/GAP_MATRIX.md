# Base-1 Gap Matrix

Status: **READINESS ONLY / STOP**

Exact source/SHAは [READINESS_REPORT.md §3](READINESS_REPORT.md#3-exact-remote-source-lock) のimmutable source lockを参照する。たとえばJ5は `asklessquill/Kiji@e2a54ef0e24635c6296a5deab66cff166248c1e4:src/thought_flow/research/offline_research.py`。全IDがfull SHAとexact pathへ一意に解決する。

READY = 表示した限定scopeに十分なdurable証拠あり。PARTIAL = 既存能力はあるがBase-1の接続/実用条件が不足。MISSING = 検査したremote treeに必要なdeliverable/接続の実装・受入を確認できない。UNKNOWN = runtimeや権限等をこのread-only inspectionでは確定できない。MISSINGは他の未観測環境での不存在の断言ではない。

Human relay欄の「接続未証明」は実測した人手ログではない。現在STOPのままなので現行cycleのtransport回数も未測定。いま素朴に進めるならHumanによる運搬/次repo選択、または新たなmachine接続が必要になる、という分析上の帰結を示す。

## Loopの全step

| Step | Owner | Exact source / SHA key | Readiness | Existing accepted capability | Human relay required? | Legitimate Human gate? | Minimum missing gap | Reusable existing capability |
|---|---|---|---|---|---|---|---|---|
| 1 Purpose + bounded Authority | Human（Actor外）。各ownerが適用範囲を確認 | M1/M2/M3; S1/S3/S4 | PARTIAL | readiness委任、5 Actor、external gateの意味は確立。実証委任はまだない | No。Purpose/対象選択はrelayではない | Yes。目的、対象、期間、budget、mutation/cleanup境界 | H1: 今回とは別の具体的Task/Action authorityを固定 | S3のactivation contract項目、M2のbounded loop |
| 2 Current recovery | MOMOがSystem意味、各Applicationが自己Currentをrecover | M1/M4/M5; K1; J1/J2; I1; S1/S2; SF1/SF2 | READY（v0.5 semantic recoveryのみ） | M4 Fresh Actor recovery証拠。今回もremoteから再取得 | No（静的Current）。runtime/state bundle復元の実証は別 | No routine gate。source conflictでauthority不明なら該当actをhold | G1: cycle開始時にsource lockとowner entryを機械取得。Phase 0 mechanical recoveryは別の残存制限 | Current precedence、SHA固定、source unavailable時のhonest hold |
| 3 World observation → KIJI Requirement | KIJI | J1/J2/J3/J4/J5/J6 | PARTIAL | Research Result、provenance、uncertainty、Lab learning/bridge | 接続未証明。Research ResultをHumanが実装指示へ書き直す恐れ | 目的変更・private読取拡張ならYes。通常の分析はNo | G2: 1件のevidence-backed Requirementに測定方法、acceptance条件、constraints、out-of-scopeを結ぶ | ResearchRequest/Result、stable IDs、evidence directness、journal |
| 3a KIJI → INNU受領/undertaking | KIJI producer / INNU consumer | J4/J5; I4; K3 MC-01–13; D3/D4 | MISSING（Base-1境界binding） | 両側に部分能力。Dango feedはcandidateでこの接続の受入ではない | 接続未証明。Requirementコピペと次repo選択が起こる境界 | No。受領/互換性/担当決定は委任内のowner責任 | G2: exact artifact取得、schema/意味validation、INNUの受領/引受/拒否、同一cycle重複拒否 | K3意味、J5 Result、I4 authoritative references |
| 4 INNU realization | INNU（Dangoは所有module） | I1/I2/I3/I4/I5; D1/D2/D3 | PARTIAL | 現在の実装baseline、内部no-relay B2-S2 ACCEPTED、durable dispatch/fencing | 内部限定経路はNoの歴史的証拠。新KIJI入力/runtimeでは未検証 | 通常のbuild選択/レビューはNo。追加費用/authority拡張ならYes | G3: RequirementをINNU workへbindし、既存coreで最小adapter/cardを作れるかoffline確認 | PC/Builder/Reviewer機構、routing、state/recovery |
| 5 Independent verification / acceptance | INNUの独立Reviewerと受入責任者（新Actorではない） | I1/I2/I3; S5; K3 MC-09 | PARTIAL | I3のREWORK→PASS→ACCEPT、S5の正直な限定受入 | 同じINNU内部経路ではNo。今回targetのreview依頼自動受渡しは未証明 | No routine Human approval。委任されたacceptanceとHuman authorityを分離 | G3: exact candidate SHA、Requirement一致、mutation/cleanup負例、独立受入receipt | immutable candidate、finding propagation、reviewer isolation |
| 5a INNU → SARU accepted Capability | INNU producer / SARU consumer | I4; S1/S2/S3; K3 MC-03/06/08/09/13 | MISSING（受入artifact輸送） | accepted ProductをSARUが消費する責任定義。今回のartifactなし | 接続未証明。成果物をHumanがSARUへ運ぶ境界 | Action委任はYes。運搬承認は不要 | G3: SARUがartifact/hash/acceptance/limitsを自力取得し、operation引受を別記録 | INNU evidence exportの構成、SARU activation contract項目 |
| 6 SARU bounded Action | SARU。FROG/SandFrogは実行主体を増やさない | S1/S2/S3/S8/S9/S11; F1/F2; SF1 | PARTIAL | 過去To Do/OneDrive write+rollback probe。CurrentはHUMAN_GATE/STOPでAction実証なし | 正当gate以外のrelayは不要にすべき。artifact入口は5aのgap | Yes。対象・action・回数・期限・cleanup等。現在authority=0 | G4 + H1: 1 target adapter、durable intent、authority再確認、effect不明時hold。S8全体の再利用禁止 | S7のgate/checkpoint、S8の個別API操作知見、F3のdelivery分離 |
| 7 External result observation | SARUがAction後の外部状態を観測。KIJIが必要範囲を解釈 | S5/S6/S7/S8/S9; K3 MC-08/09/12 | PARTIAL | 2回GET・uncertaintyを残す限定観測。probeのresponse/rollback記録 | owner間の観測receipt返送未証明。Humanによるスクショ/説明を必須にしない | 承認された窓内のreadはNo。追加scopeならYes | G4/G5: 対象itemを新requestで再GET、観測時刻/identity/context、cleanup後の再確認 | S7のnegative states、初回証拠保全、API responseと意味の分離 |
| 8 Owner evidence / learning | SARU effect/outcome、KIJI evidence/learning、INNU engineering learning | J3/J4; I2; S6/S7; D3/D4; R1 | PARTIAL | owner-localのResult→Experience、Project Experience、限定SARU learning | Evidenceを別Actorへ手渡す接続が未証明 | No。public/private境界拡張はYes | G5: 同一cycleのResult参照をrecipientが取得・受領。positive/partial/unknownを保ち学習dispositionを記録 | 既存journal/Project Experience/reference provenance。Dango feedの再設計は不要 |
| 9 System-wide Current要否判定 | MOMO | M1/M2; O1/O2; R1 | READY（意味・責任ルール） | routine outcomeはownerへ、System意味変更のみMOMOへというCurrentルール | No。毎eventをHuman/MOMOにまとめ直させない | 実際のconstitutional/Current意味変更ならYes | 通常C1ではCurrent変更不要というdispositionをcycle receiptに置く | MOMO Current / source-view境界、O2 uncertainty設計 |
| 10 Durable recording / delivery | 各ownerが自己evidenceを出版・verify。MOMOは最小recovery index | I2/I3; J3; S6/S7; F3/F4; K3 MC-13 | PARTIAL | owner-local durability、歴史的remote verified return | cross-owner evidence index組立の接続未証明。Human assemblyに頼れない | No（既存出版許可内）。privacy/publication拡張はYes | G5: owner path/SHA、receipt/acceptance/effect各状態、欠落/未返送を分離して参照可能にする | Git、INNU evidence export、F4 redelivery≠re-execution |
| 11 Fresh recovery（post-cycle） | 新しい実行担当が各owner sourceを読む。意味はMOMO責任 | M4; I2; J3; K3; O2; SF2 | PARTIAL | semantic v0.5回復とcomponent回復知見 | 新cycleの組立をHumanに説明させる経路は未除去 | No。UNKNOWN effectの追加mutationは別判断 | G6: chatなしでpurpose/current owner/authority/effect/cleanup/STOPを回復する検証 | source lock、journals、fencing、latched hold |
| 12 Mockpit observability（cycle中も横断） | Mockpit productのObserve/Explain責任。MOMOは利用System意味、INNUは委任された実現 | MP1/MP2/MP3; M2/M5 | MISSING（remote main実装） | repository-first、read-only、manifestをMockpit側に置く決定のみ | 今のtreeだけでは自動表示できない。Humanのstage説明を代替にしてはならない | No。保護sourceへの新accessはYes | G7: manifest+deterministic remote reader+stage/owner/gate/evidence/source/UNKNOWN表示+途中参加検証 | MP2のproduct方針、M5の正しいActor/module表示とstale projection警告 |
| 13 Durable STOP | 各owner、全体のHuman向け意味はMOMO | M1/M2/M3; K1/K2; J1; I4; S2; SF2 | PARTIAL（cycle閉鎖の実装） | Current/旧TaskのSTOP、latched hold、INNU terminal states | 今回分析のSTOPはNo。cycle全体終結の輸送は未証明 | 新しいTaskにはYes。完了による自動継続は禁止 | G6: cleanup済/失敗/効果不明を残すterminal receipt、wake停止、重複再開拒否 | authority closure、S7の非上書き、F4 hold保持 |
| 横断 KIBI semantics | KIBIはProtocol。実装/adoptionは各Application | K1/K2/K3/K4/K5 | PARTIAL（operationalization） | accepted architectureとMC-01–13 | KIBIをworkerにしてrelayを隠さない | 新しいconstitutional意味ならYes。今回は不要 | G1–G7の必要部分を既存意味へ写像。K4全部の受入や新orchestratorは不要 | contract inventory、negative-state/recovery意味 |
| 横断 runtime / resource availability | INNU runtime、SARU external account、Mockpit readerの各owner | I2; S1/S2/S9; SF1/SF2; MP3 | UNKNOWN | 現在利用可能と認定できるlive証拠なし | availability不足をHumanによる貼付けで補わない | 認証/MFA・新permission・新費用は正当gate | 後続委任内で最小preflight。readiness中は実行しない | 既存auth/checkpoint/fail-closed知見をtarget限定で検証 |

## Relay failure箇所と最小closure evidence

| Gap | 消すべきHuman relay / 実際の原因 | Owner | Minimum closure evidence（後続Task用） |
|---|---|---|---|
| G1 | 次repo/Applicationを選ぶ、Currentを手作業で組む。1件のsource/endpoint bindingがない | 各ownerが入口/出口をbind。MOMOはsource precedence | 初期Purpose以降、KIJI/INNU/SARUが固定されたowner entryを取得するtrace。受付/拒否とSTOPが復元可能 |
| G2 | KIJI結果をINNUへ貼る。Research Resultから実装Requirement/consumer取込の境界が欠落 | KIJI + INNU | exact RequirementとINNU受領/undertakingが同一cycleに結ばれる。欠落・不適合・重複時に自動buildしない |
| G3 | INNU成果物をSARUへ運ぶ。accepted artifactとoperation受領が別のまま | INNU + SARU | SARU自身がexact artifact/独立受入を取得。未受入/別SHAは拒否。Human gateはsource参照付きで表示 |
| G4 | 実行結果/rollbackをHumanに見に行かせる。S8は広範probeで対象を最初のlistから選び、外部効果後にjournalを書く | SARU（INNUが必要Capabilityを実現） | 事前intent、固定target、1 create、再GET、対象1件cleanup、再確認。crash/timeout/identity不明では無条件再実行しない |
| G5 | Evidenceを別Actorへ渡す、MOMOへ全logを貼る。owner resultの参照/receiptがない | SARU → KIJI/INNU、必要最小限のみMOMO | owner publicationとconsumer取得がexact refsで辿れる。delivery失敗はeffect失敗と分離、raw private転載なし |
| G6 | Fresh Actorへ経緯を説明してCurrentを再構成。cycleのstop/残務indexがない | 各owner + MOMOのrecovery surface | chatなし回復、missing/private source時の限定UNKNOWN、外部効果の再実行禁止、terminal wake拒否 |
| G7 | Mockpitへstageを口頭説明。MP3に動くreader/manifestがない | Mockpit product（実現委任はINNU） | source-backed途中stageとterminal表示。30秒以内の理解は提案測定閾値で、Humanが後続criteriaで固定する |

G4のS8は古いprobeの欠陥修正委任ではない。現在の用途には広すぎるというreusability評価であり、このTaskでは変更・起動しない。HumanがPurpose/対象/制限を一度与えること、gateで承認・拒否すること、通常の本人認証はrelay failureに数えない。gateの前後で成果物や次ownerを運ばせる場合はrelayに数える。

**STOP.**
