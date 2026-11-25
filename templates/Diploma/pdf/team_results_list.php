<?php
/**
 * @var \App\View\AppView $this
 * @var string $title
 * @var string $competitionLine
 * @var list<array{
 *   rank: int,
 *   team_name: string,
 *   total_time: string,
 *   members: list<array{name: string, time: string, top3: bool}>
 * }> $teams
 */
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <style>
        @page { size: A4 portrait; margin: 10mm 12mm; }
        body { font-family: DejaVu Sans, sans-serif; font-size: 9pt; color: #111; margin: 0; line-height: 1.25; }
        h1 { font-size: 11pt; font-weight: bold; margin: 0 0 3pt; text-align: center; }
        .subtitle { text-align: center; font-size: 8pt; margin: 0 0 6pt; color: #444; }
        .hint { font-size: 7.5pt; color: #555; margin: 0 0 8pt; text-align: center; }
        .team-block { margin-bottom: 8pt; page-break-inside: avoid; }
        .team-head { font-size: 9pt; padding: 3pt 5pt; border: 1pt solid #999; background: #ececec; }
        .team-head .total { float: right; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; border: 1pt solid #999; border-top: none; }
        td { font-size: 8.5pt; padding: 2pt 5pt; border: 1pt solid #bbb; }
        tr:nth-child(even) td { background: #f3f3f3; }
        tr:nth-child(odd) td { background: #fff; }
        tr.top3 td { font-weight: bold; }
        .time { text-align: right; width: 18%; white-space: nowrap; }
    </style>
</head>
<body>
    <h1><?= h($title) ?></h1>
    <p class="subtitle"><?= h($competitionLine) ?></p>
    <p class="hint">Csapat összesítés: 3 leghosszabb egyéni idő; félkövér = számító tag.</p>
    <?php foreach ($teams as $team) : ?>
        <div class="team-block">
            <div class="team-head">
                <strong><?= (int)$team['rank'] ?>. <?= h($team['team_name']) ?></strong>
                <span class="total">Σ <?= h($team['total_time']) ?></span>
            </div>
            <table>
                <tbody>
                    <?php foreach ($team['members'] as $member) : ?>
                        <tr class="<?= $member['top3'] ? 'top3' : '' ?>">
                            <td><?= h($member['name']) ?></td>
                            <td class="time"><?= h($member['time']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    <?php endforeach; ?>
</body>
</html>