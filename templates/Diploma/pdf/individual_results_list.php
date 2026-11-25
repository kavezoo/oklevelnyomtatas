<?php
/**
 * @var \App\View\AppView $this
 * @var string $title
 * @var string $competitionLine
 * @var list<array{rank: int, name: string, team_name: string, time: string}> $rows
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
        .subtitle { text-align: center; font-size: 8pt; margin: 0 0 8pt; color: #444; }
        table { width: 100%; border-collapse: collapse; border: 1pt solid #999; }
        th { font-size: 8pt; font-weight: bold; padding: 3pt 5pt; border: 1pt solid #999; background: #ececec; text-align: left; }
        td { font-size: 9pt; padding: 3pt 5pt; border: 1pt solid #bbb; vertical-align: middle; }
        tr:nth-child(even) td { background: #f3f3f3; }
        tr:nth-child(odd) td { background: #fff; }
        .num { text-align: center; width: 7%; font-weight: bold; }
        .time { text-align: right; white-space: nowrap; width: 14%; }
    </style>
</head>
<body>
    <h1><?= h($title) ?></h1>
    <p class="subtitle"><?= h($competitionLine) ?></p>
    <table>
        <thead>
            <tr>
                <th class="num">#</th>
                <th>Versenyző</th>
                <th>Csapat</th>
                <th class="time">Idő</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $row) : ?>
                <tr>
                    <td class="num"><strong><?= (int)$row['rank'] ?>.</strong></td>
                    <td><?= h($row['name']) ?></td>
                    <td><?= h($row['team_name']) ?></td>
                    <td class="time"><?= h($row['time']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>