<?php
/**
 * @var \App\View\AppView $this
 * @var string $title
 * @var int $year
 * @var list<array{id: int, label: string, header_lines?: list<string>}> $competitions
 * @var list<array{rank: int, name: string, cells: array<int, string>, total_time: string}> $rows
 */
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <style>
        @page { size: A4 landscape; margin: 8mm 7mm; }
        body { font-family: DejaVu Sans, sans-serif; font-size: 7.5pt; color: #111; margin: 0; }
        h1 { font-size: 10pt; margin: 0 0 4pt; text-align: center; }
        table { width: 100%; border-collapse: collapse; border: 1pt solid #888; table-layout: fixed; }
        th { font-size: 7pt; font-weight: bold; padding: 2pt 3pt; border: 1pt solid #999; background: #e8e8e8;
            text-align: center; vertical-align: middle; word-wrap: break-word; line-height: 1.25; }
        th strong, th .head-line { font-weight: bold; }
        th.comp-col { font-size: 6.5pt; }
        td { font-size: 7.5pt; padding: 2pt 3pt; border: 1pt solid #bbb; vertical-align: middle; }
        th.place-col, td.place-col { width: 5%; text-align: center; font-weight: bold; white-space: nowrap; }
        th.name-col, td.name-col { text-align: left; width: 18%; word-wrap: break-word; }
        th.total-col, td.total-col { font-weight: bold; text-align: right; width: 9%; white-space: nowrap; background: #e0e0e0; }
        td.cell-time { text-align: center; white-space: nowrap; }
        tr.data:nth-child(even) td { background: #f4f4f4; }
        tr.data:nth-child(odd) td { background: #fff; }
        tr.data:nth-child(even) td.total-col { background: #ebebeb; }
        tr.data:nth-child(odd) td.total-col { background: #e0e0e0; }
    </style>
</head>
<body>
    <h1><?= h($title) ?> — <?= (int)$year ?></h1>
    <table>
        <thead>
            <tr>
                <th class="place-col"><strong>#</strong></th>
                <th class="name-col"><strong>Versenyző</strong></th>
                <?php foreach ($competitions as $competition) : ?>
                    <?php $lines = $competition['header_lines'] ?? [$competition['label'] ?? '']; ?>
                    <th class="comp-col">
                        <?php foreach ($lines as $line) : ?>
                            <div class="head-line"><strong><?= h($line) ?></strong></div>
                        <?php endforeach; ?>
                    </th>
                <?php endforeach; ?>
                <th class="total-col"><strong>Összesen</strong></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $row) : ?>
                <tr class="data">
                    <td class="place-col"><strong><?= (int)($row['rank'] ?? 0) ?>.</strong></td>
                    <td class="name-col"><?= h($row['name']) ?></td>
                    <?php foreach ($competitions as $competition) : ?>
                        <td class="cell-time"><?= h($row['cells'][(int)$competition['id']] ?? '') ?></td>
                    <?php endforeach; ?>
                    <td class="total-col"><?= h($row['total_time']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>