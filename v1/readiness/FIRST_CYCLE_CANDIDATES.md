# First Base-1 Cycle Candidates

Status: **PROPOSALS ONLY / NOT AUTHORIZED TO EXECUTE / STOP**

Repository source IDsは [READINESS_REPORT.md §3](READINESS_REPORT.md#3-exact-remote-source-lock) のexact remote SHA/pathへ解決する。候補は2件、推薦はC1だけ。どちらも現時点でruntime ready/acceptedとは認定しない。

## 共通の実証設計

小さなHuman-facing外部状態変化を選び、KIJIが証拠からRequirementを作り、INNUがカードと限定操作Capabilityを独立受入まで完成させ、SARUが外部サービスへ配置する。Git内の報告ファイル作成だけをexternal Actionと数えない。外部サービスの新しい読取で配置結果を観測し、責任ownerがdurable evidenceを記録する。

内容の題材は「v0.5 recoveryの証明範囲」。KIJIは実行時に再取得するMOMO CurrentとPhase 8 receiptから、semantic recoveryの実証とmechanical/runtime recoveryの未証明を区別し、source付きの確認カードRequirementへ落とす。単に既定文を転送するだけではKIJI workを満たさない。sourceに変化/矛盾があれば、その証拠に応じてRequirementを修正するかholdする。題材の結論を現状と異なるremoteへ押し付けない。

確認カードの提示はHumanの理解・反応を自動的に証明しない。このcycleの測定対象は、正確な証拠に基づくカードの外部配置・再観測・回収と責任移行。Humanの行動変容や広いSafe to Ignoreをclaimしない。確認項目はこの実証の内容であり、次Taskや修復作業を自動commissionしない。

## C1 — 自分のTo Do listへ復元範囲の確認カード1件を配置（推薦）

| Field | Proposal |
|---|---|
| Purpose | Humanが普段参照できる私用To Do上で、v0.5で何が復元実証済みで何が未証明かを、正確なsourceと共に確認できるようにする。 |
| Success measure | 指定された既存self-only listに、cycle ID付きカードをexactly one作成。KIJI Requirementに一致するtitle/body/source refsで、reminder off・recurrenceなし・due dateなし。create応答とは別のGETで同じresourceの内容と対象を確認。承認された30分以内の1回の実証でcleanupし、不在を再確認。加えて全owner handoff、独立受入、Fresh recovery、Mockpit、durable STOP、Human relay 0を示す。外部配置成功だけでBase-1成立とはしない。 |
| Failure / inconclusive measure | 不正確なカード、異なるlist、重複、制約外mutation、コピペrelayは失敗。認証不可、source不明、create結果不明、観測不能、cleanup未確認は各段階のBLOCKED/UNKNOWNとして保全し、成功に変換しない。403や曖昧な404だけで不在と断言しない。 |
| External Action | SARUが指定listへtaskを1件createする。後のcleanup deleteを別に数え、**最大1 create + 当該itemへの最大1 delete = 最大2 mutation attempts**。既存項目変更、送信、共有、通知・繰返し設定は禁止。 |
| Rollback / reversal | 同一cycleで作成しID/content/target照合できるitemだけdeleteして再GETで確認。Humanによる移動/編集、認証消失、結果不明では範囲外の探索・削除をせず、残存可能性とownerをdurableに残しSTOP。永久消去や全restoreは保証しない。 |
| KIJI work | remote Current/Phase 8の証拠の意味・鮮度・limitsを確認。実装可能なtitle/body/source/測定条件をRequirement化し、INNUが直接取得できるexact artifactとして返す。結果receiptは後でKIJIが直接取得し、成功/partial/unknownの学習dispositionを記録する。 |
| INNU work | Research ResultからRequirementを受領・引受。既存completion/reviewer/recovery機構を使い、正確な確認カードとtarget限定SARU adapter、handoff/evidence integration、Mockpit sliceを実現する。source不一致、duplicate、authority失効、timeout/crashの検証を含め、独立受入のexact artifactをSARUへ提示する。 |
| SARU work | accepted Capabilityを自力取得。現在の委任、tenant/account/list bindingと操作窓を確認。intentを先に保存し、create→独立GET→cleanup→再観測を上限内で実施。effect、observation、delivery、cleanupを別記録し、consumerへsource refsを渡してSTOP。 |
| Required Human authority | 自分の既存account/tenantと**既存self-only listのexact private resource reference**、このPurpose、30分の有効窓、最大2 mutation attempts、最大6 target限定Graph data reads、本人認証の範囲、読み取り/保持/出版境界を指定。Work IQ/有料API/追加購入/permission変更は0。provider/model実行は承認された既存枠内のみ。期限/回数を超えるretryは禁止。 |
| Existing capability to reuse | S9にTo Do create 201とrollbackの歴史的記録、S8 `explore_todo` にcreate/delete journalの操作形。S7のgate/checkpoint/negative-state設計、I3の内部no-relayとreview、J4/J5のResultとprovenance。これらは再実行authorityでも新adapter受入でもない。 |
| Likely missing capability | G1–G7。特にS8の「最初のlistを選ぶ」処理を固定targetへ限定し、effect前のdurable intent、single-writer/claim、at-most-one create attempt、対象限定readback、証拠のconsumer receiptを追加する。live auth/Tasks権限はUNKNOWN。 |
| Suitability as Base-1 test | **最も適する（条件付き）**。Human向けの小さな意味ある成果、実外部state、過去の同service操作証拠、明確なcleanupを両立。外部相手との関係・返信待ち・広いprivate検索を必要としない。三者の責任移行を試せる。 |

APIの形として、指定listでのtask作成、taskの再取得、削除はMicrosoft Graphに記載されている。createはdelegated `Tasks.ReadWrite` を要する。これはAPI仕様の確認であって現在のtenant利用可否の確認ではない。参照（2026-09-14 read-only確認）: [Create todoTask](https://learn.microsoft.com/en-us/graph/api/todotasklist-post-tasks?view=graph-rest-1.0)、[Get todoTask](https://learn.microsoft.com/en-us/graph/api/todotask-get?view=graph-rest-1.0)、[Delete todoTask](https://learn.microsoft.com/en-us/graph/api/todotask-delete?view=graph-rest-1.0)。

## C2 — 自分のOneDriveへsource付き復元範囲カード1ファイルを配置

| Field | Proposal |
|---|---|
| Purpose | Humanが既存の私用OneDrive folderから、source付きの簡潔な復元範囲カードを読めるようにする。 |
| Success / failure measure | 指定folderに新規text/Markdownファイル1件（最大10 KiB）を配置。別の読取で取得したbytes/hashとaccepted artifactの一致、sourceの正確性、後のcleanupと対象不在を確認。全loop条件はC1同様。不一致/上書き/共有/他target変更は失敗、認証/効果/観測不明はUNKNOWN。 |
| External Action | SARUが既存private folderの衝突しないcycle専用名へ1 upload。cleanupを含め最大1 upload + 対象1件への最大1 delete attempt。既存file上書き、sharing link、folder作成は対象外。 |
| Rollback / reversal | 作成item IDとetag/contentを照合して削除し、現役folderからの不在を確認。OneDriveの削除はrecycle binへ移す仕様であり、完全消去を主張しない。既存名と衝突、条件付きcreateを保証できない、他者編集がある場合はhold。 |
| KIJI work | C1と同じ証拠分析を行い、Humanが単体で読めるカードのRequirement（事実、未証明範囲、source、size/format、測定条件）を出す。 |
| INNU work | card bytes/hash、限定upload/read/cleanup adapter、handoff・review・Mockpit・recoveryを実現し、Requirementとの一致とnon-overwrite条件を独立受入する。 |
| SARU work | accepted artifactを取得し、authority/drive/folderを照合。intent→upload→外部bytes再取得→cleanup→観測を実施、owner evidence/STOPを残す。 |
| Required Human authority | exact self-owned private drive/folder、許可filename/size/content、30分の窓、最大2 mutation attempts、最大6 scoped data reads、retention/cleanup条件。共有0、有料API/追加購入/permission変更0。認証/実行枠の条件はC1同様。 |
| Likely missing capability | G1–G7、safe filenameと競合時non-overwrite保証、限定download/hash比較、対象限定cleanup。S8のroot uploadをそのまま使わない。現在のresource/accessはUNKNOWN。 |
| Reusable capability | S8 `explore_onedrive` の小file upload/journalとS9のwrite/rollback証拠、I3/I5、J4/J5、S7。 |
| Suitability as Base-1 test | 高いがC1に次ぐ。内容hashで測定しやすい。一方、置くだけではHumanへの有用性が弱く、path衝突/上書き防止を追加検証する必要がある。 |

小fileのupload APIは作成と更新の両方を扱うため、単にPUTできることをnon-overwrite保証と混同しない。削除のrecycle-bin semanticsもcleanup基準に含める。参照（2026-09-14確認）: [Upload small files](https://learn.microsoft.com/en-us/graph/api/driveitem-put-content?view=graph-rest-1.0)、[Delete driveItem](https://learn.microsoft.com/en-us/graph/api/driveitem-delete?view=graph-rest-1.0)。download・conditional writeのexact contractは後続実装時に別途検証する。

## 推薦はC1だけ

S9のTo DoとOneDriveのprobe成功は歴史的能力証拠であり、S1/S2による現在のHUMAN_GATE/STOPを解除しない。C1は確認項目というHuman-facing成果を自然に作れ、file overwriteの追加問題がないため優先する。メール送信、Calendar招待、FROGの過去実験再生は初回の最小化に不要。

## Exact Human decision required next

次に求めるのは、次の**別Taskを委任するか否か**の判断である（この文書は依頼を実行しない）。

> C1「私用To Doの復元範囲確認カード」を初回実証候補として選ぶ。まずG1–G7について、KIJI・INNU・SARUのowner境界接続とMockpitのread-only表示を、dedicated branchesで限定実装・offline検証・exact-target独立受入まで進める。MOMOは必要最小限のrecovery参照のみとしCURRENT.mdは変更しない。KIBIは参照のみ、FROG/SandFrogは起動も変更もしない。外部Action、live Graph/auth probe、実証cycle、mainへの昇格はこの委任に含めず、成果物と残gapを提示してSTOP。追加購入・有料APIは0、承認済み既存実行枠内に限定する。

その後の**実証実行**を選ぶ場合は、上記C1欄の対象・期限・read/mutation/cleanup上限を備えた新しいauthorityを、exact accepted implementation SHAと共に固定する。private resource IDは公開MOMOへ書かず、SARUが解決できる保護された参照にする。Humanに求めるのは利用対象と委任範囲の決定であり、KIJI/INNU artifactの貼付けや次ownerの都度選択ではない。

本人認証や本当のgateをHumanが行うことは許容する。認証できない環境をクリップボード輸送で迂回したり、C1失敗時にC2へ自動切替したりしない。

**NO BASE-1 EXECUTION / STOP.**
