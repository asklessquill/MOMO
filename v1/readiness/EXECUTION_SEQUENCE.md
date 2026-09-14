# Minimum Implementation / Verification / Execution Sequence

Status: **FUTURE PLAN ONLY / READINESS TASK STOPS HERE**

この文書のsequenceは後続の明示的Human委任がある場合だけ使える計画。現在はどのstepも開始しない。Currentはv0.5 CLOSED / CURRENT / RECOVERABLE / STOP、Base-1は未受入。source IDsは [READINESS_REPORT.md §3](READINESS_REPORT.md#3-exact-remote-source-lock) のexact SHA/path。候補は [C1](FIRST_CYCLE_CANDIDATES.md#c1--自分のto-do-listへ復元範囲の確認カード1件を配置推薦)。

## A. 次の別Taskとして提案する最小実装

| Order | Work / accountable owner | Input | Minimum output / verification | Boundary |
|---|---|---|---|---|
| A0 | Humanが実装Taskを明示委任 | C1選択、G1–G7、許可repo/path/費用/STOP | source-backed Task contract。各ownerのbranchと責任を固定 | readiness完了から自動開始しない。Action/live authは含めない |
| A1 | 各ownerがremote Currentとexact source集合をrecover | M1、K1/K3、J1/J2、I1/I2、S1/S2、MP1/MP2 | source lock、各owner entry/recipient binding、authority/STOP。sourceが動けば差分を検査 | runtimeや旧Taskを再開しない。Current snapshotを全event logにしない |
| A2 | KIJI/INNUが1件のRequirement境界を実装（G1/G2） | J4/J5、K3 MC-01–13 | evidence→Requirement→INNU受領/undertakingを固定source refsで表す。unsupported/unknown/duplicate/staleを拒否するoffline fixtures | KIJIはRequirement、INNUは実現。KIBIを呼び出すserial workerを作らない |
| A3 | INNUが既存completion/review経路とSARU入口を接続（G3） | I2/I3/I4、S1/S3 | accepted artifact manifest、exact SHA/hash、independent acceptance receipt、SARUの取得/検証/引受interface | INNU内部PC/dispatcherをSystem-wide controllerへ昇格しない |
| A4 | INNUがSARU用のtarget限定Capabilityを実現、SARUがoperation contractを所有（G4） | S7/S8/S9の再利用知見、C1の制限 | 固定list、single-writer claim、effect前intent、再GET、cleanup、sanitized evidence、effect/delivery分離をoffline検証 | S8のbroad mainや旧Cycle-1/2、FROG/SandFrog scriptをrun入口にしない |
| A5 | 各ownerのresult/evidence receiptとrecoveryを接続（G5/G6） | J3/J4、I2/I3、S7、F4の既知のdelivery lesson | owner-local evidenceをconsumerが取得。cycleの小さなrecovery indexからexact refs、pending delivery、unknown effect、cleanup義務とSTOPを回復 | FROG由来のauthority/credential/triggerは継承しない |
| A6 | INNUがMockpit productの最小read-only sliceを実現（G7） | MP1/MP2、M2/M5、owner records | 外部manifestとdeterministic reader。Purpose/stage/owner/gate/evidence/source/UNKNOWN/STALE/UNAVAILABLEを表示。fixtureで途中参加確認 | MockpitにAction/acceptance/wakeボタンを設けない。観測先にMockpit専用fileを強制しない |
| A7 | INNUの独立verification/acceptance、各ownerが自分の境界適合を確認 | exact candidate SHA、offline evidence、M2 criteria | 必要な負例・scope・source対応をreview。採否と残gapをdurable化し、人へ提示してSTOP | Builder self-acceptance不可。Base-1 PASSではない。main昇格も後の明示判断に留める |

実装はuniversal bus、scheduler service、全KIBI profile、全Observatory同期、Dango routing学習serviceを必要としない。1件用のowner境界adapterとsource参照で足りるかを先に検証する。既存coreで賄えない範囲だけ追加する。

## B. 最小boundary account（提案、新Protocolではない）

各ownerがoutward recordを所有する。同じcycle IDで結ぶことはshared internal task graphを意味しない。

| Boundary | 最小meaning / source | Consumer responsibility |
|---|---|---|
| Purpose / authority | Human decision reference、scope、target binding、expiry、cost/privacy/cleanup、STOP。K3 MC-05/06/11 | 各ownerが自己行為への適用を確認。技術credentialを委任と扱わない |
| KIJI Requirement | purpose、evidence/source SHA、uncertainty、測定/acceptance条件、constraints、exact artifact revision。J4/J5を必要最小限adapt | INNUが自力取得して互換性・引受/拒否を記録。request受信だけでbuild受入済としない |
| INNU accepted Capability | Requirement ref、artifact SHA/hash、independent review/acceptance ref、操作仕様、limits/runtime assumptions、rollback interface | SARUが自力取得し、受入一致とAction authorityを別々に検証 |
| SARU operation/result | authority ref、accepted input ref、intent/attempt、effect status、fresh observation ref、cleanup status、remaining duty、delivery status | KIJIが結果/learning、INNUがengineering lessonを必要範囲だけ取得。MOMOはSystem意味変更要否を扱う |
| Recovery / view | 各owner latest選択のbasis、exact source graph、時点・staleness・アクセス制限、terminal STOP、未解決義務 | Fresh reader/Mockpitが読む。人の口頭説明をrequired inputにしない |

構造化JSONを使うかMarkdown+manifestを使うかは後続実装内の選択。K3が要求する意味を失わず、schema/compatibilityを固定する。K4はcandidate profileなので「KIBI全実装/受入済」とは表示しない。

## C. Humanをtransportにしない進行方法

1. 初期Purposeと委任でowner endpoint/source bindingを一度決める。次repoをHumanが都度指示する必要がある形は未完成。
2. KIJIがRequirementをdurableに出版し、INNUの入口がexact refを取得する。INNUは受領と仕事の引受を自分で記録する。
3. INNU内部でbuild/review/acceptanceを完結し、SARUの入口がaccepted artifactを取得する。SARUはauthorityがないときHuman Gateをsource付きで提示する。
4. Humanのgate回答は権限を持つowner recordに結び、既に受領したartifactを再貼付けせず再評価する。gate回答でartifact SHAが変わるなら受入から再確認する。
5. SARUがResultを出版し、KIJI/INNUがrefを取得してowner学習を記録する。Mockpitはこれらをread-onlyに読む。

wake/return plumbingは既存Applicationのowner-controlled adapterとして実現する。選択したTask内の固定recipientへ限定し、意味判断やTask選択をKIBI、Mockpit、MOMOのSystem supervisorに押し込まない。責任境界と無関係な第六Actorを足さない。人がagent chatを順番に開いて内容を貼るやり方は不合格。

## D. 実装acceptance前に必要なoffline verification

後続TaskでI2が要求するdependency/test baselineと、変更したadapterに必要な限定testを実施する。外部provider canaryは別authority。既存の歴史的test数を今回の検証として転記しない。

| Trace | Required outcome |
|---|---|
| KIJI Requirement欠落/不適合、別purpose、古いsource | INNU入口は理由付きhold/reject。Humanのコピペで不足を隠さない |
| accepted SHA/hashとSARU inputが不一致、reviewer独立性なし | Action入口は拒否。build successをacceptedとみなさない |
| repeated delivery / concurrent consumer / old invocation | 同じ論理createの二重attemptを防ぐ。receiptとeffectを分離し、未知のdeliveryは既存Resultの再取得で解決 |
| create intent保存前後のcrash、HTTP timeout、応答後journal書込失敗 | 保存済intentがあれば未知効果を保持し、盲目的POST再実行をしない。exact resourceを解決できなければUNKNOWN / STOP |
| token/authority expiry・revocation、別account/list、枠超過 | 全mutation境界でhold。単なる「直前にGitを読んだ」ことを即時revocation保証としない。選択runtimeの保証限界を明示 |
| create成功・reGET失敗、cleanup失敗、別resourceに変化 | 実行/観測/cleanupを別状態で保存。成功/不存在を捏造せず、残務ownerと停止を残す |
| private source unavailable、changed Current、stale manifest | Fresh recovery/MockpitはUNKNOWN/STALE/UNAVAILABLEと最後に確認した時点を表示。private不存在や全System正常を推論しない |
| effect後のGit push失敗 | local effect証拠を保持しdelivery_failed。Action再実行しない。許可範囲内で同じResultのみ再送可能 |
| terminal STOP後のwake、歴史的EXP成功、old Taskのnext記述 | 新taskもActionも起動しない。surviving cleanup dutyは示すが許可なしに処理しない |

以上は必要なacceptance traceの計画であり、今回実施済みではない。

## E. 後の実証実行に必要な別Human gate

A7完了後、Humanが次の全項目を含む実証Taskを明示委任した場合だけ進める。

- C1 Purposeとexact accepted implementation/source SHA。必要な各owner main昇格/採用はその時点の明示authorityで決め、branchを勝手にCurrentとしない。
- protected sourceで指定するself-only tenant/account/list。運用ownerがその参照を解決できること。認証・MFAは正当なHuman interactionとして扱う。
- 有効窓30分、最大1 create attemptと対象1件への最大1 cleanup delete attempt、最大6 Graph data reads。target外検索、send/share、reminder/recurrence、permission変更、追加購入/有料APIは0。
- implementation/provider実行の承認済み利用枠、証拠のprivate保持/public summaryの範囲、unknown effect/cleanup failure時のSTOPとHuman通知方法。
- authority終了/撤回はcleanupの新permissionではない。期限内だけcleanup可能な案なので、期限超過時は残存可能性を明記しSTOP。追加cleanupは新しい限定委任が必要。

30分・6 reads・2 mutation attempts・Mockpit 30秒は**この候補の提案値**であり、既存Constitutionから導いた数値ではない。実装検証で不足が分かればHumanへ変更案を提示し、黙って増やさない。生resource IDsやtokensをMOMO公開Gitへ要求しない。

## F. Human実証委任後だけの1-cycle sequence

| Step | Owner / evidence | Exit / stop condition |
|---|---|---|
| F1 | Fresh担当がremote Current、Task、owner inputsをrecover。実行source lockを別途保存 | authority/source矛盾・必要source unavailableならSTOP |
| F2 | KIJIが固定Purposeに関する実sourceを観測し、Requirementを出版。INNUが取得・受領 | 人の書直し/貼付けなし。Requirement未成立ならhold |
| F3 | INNUが事前実現したCapabilityを最大限再利用して、このRequirementに合う成果物を完成・独立verify/accept | exact accepted artifactがSARUに受領される。旧受入の対象外なら補完review |
| F4 | SARUがcontract/identity/target/期限/budgetをpreflightし、現在authorityにbind | 権限不足はgate、入手できないruntimeはUNKNOWN。scope拡張しない |
| F5 | SARUがintentをdurable記録後、1 create attempt | timeout等で効果不明なら再createせず観測/holdへ |
| F6 | SARUが別requestで該当resourceを再GETし、対象・content・制約を照合 | responseはGit証拠に記録するが、記録時点以降も同状態とは断言しない |
| F7 | SARUが承認済みcleanupを実施し、別readで不在とaccess contextを確認 | cleanupは2件目のmutationとして記録。曖昧なら残務を持ってSTOP |
| F8 | ownerがeffect/observation/delivery/learningを出版・remote verify。KIJI/INNUが必要Evidenceを自力取得 | receipt不足はPARTIAL。MOMO Currentの変更は通常不要というdispositionのみ記録 |
| F9 | Fresh reviewer/担当がBuilder chatなしでpost-cycleの全source・効果限界・STOPをrecover | effectを再実行しない。機械災害復旧PASSはclaimしない |
| F10 | MockpitはF1からF9の途中stageとterminalをsourceから表示。途中参加HumanがPurpose/owner/gate/evidence/source/unknownを説明できるか確認 | 提案閾値30秒。checkpoint時のfixtureで事前確認し、実cycleでも途中stageを観測。最終STOP画面だけでは不足 |
| F11 | M2の全criteriaに対する受入evidenceをまとめ、durable STOP | Base-1受入は実証証拠と別途定めた受入責任に従う。次Task、MOMOTARO/KINTARO、autonomous retryは開始しない |

実証時のHuman interaction logは「initial purpose/authority」「本人認証」「reserved gate」「観測評価」「transport/relay」を区別する。最後の区分が1件でも必要だったら、必要なgate数が少なくてもno-relay証明にはならない。checkpoint refs、consumer receipts、各requestのcorrelationで裏付け、自己申告の `relay=0` だけに依存しない。

Mockpitの動作はloop終端だけの付録ではなく、途中から全段階を観測するcross-cutting acceptance条件。KIBIはそのどの段階にもworkerとして挿入しない。

## This task ends here

このreadiness Taskで変更するのはMOMO専用branchの4 Markdownファイルだけ。分析commit/pushとremote確認後は **STOP**。上記A/F sequenceの開始、実行環境の準備・起動、live auth、external Action、別Task作成を推論しない。
