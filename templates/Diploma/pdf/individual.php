<?php
/**
 * @var \App\View\AppView $this
 * @var list<array<string, mixed>> $pages
 */
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <style>
        @page {
            size: A4 portrait;
            margin: 0;
        }
        * {
            box-sizing: border-box;
        }
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 14pt;
            color: #000;
            margin: 0;
            padding: 0;
        }
        .certificate-page {
            width: 210mm;
            height: 297mm;
            position: relative;
            overflow: hidden;
            page-break-inside: avoid;
            page-break-after: avoid;
        }
        .certificate-page + .certificate-page {
            page-break-before: always;
        }
        .page-bottom {
            position: absolute;
            left: 18mm;
            right: 18mm;
            bottom: 12mm;
            height: 45%;
        }
        .diploma-text {
            text-align: center;
            line-height: 1.22;
        }
        .diploma-text p {
            margin: 0 0 3pt 0;
        }
        .name-block {
            margin: 10pt 0 8pt 0;
        }
        .name-line {
            font-size: 20pt;
            font-weight: bold;
            letter-spacing: 0.4pt;
            border-bottom: 1.2pt solid #000;
            display: inline-block;
            min-width: 65%;
            padding: 4pt 10pt 6pt 10pt;
            line-height: 1.15;
        }
        .diploma-rank {
            font-size: 22pt;
            font-weight: bold;
            line-height: 1.1;
        }
        .diploma-time {
            font-size: 20pt;
            font-weight: bold;
            line-height: 1.15;
        }
        .signatures {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            font-size: 10pt;
        }
        .signatures table {
            width: 100%;
            border-collapse: collapse;
        }
        .signatures td {
            width: 50%;
            vertical-align: top;
            padding: 0 8pt;
        }
        .sign-line {
            border-bottom: 1pt dotted #000;
            height: 22pt;
            margin-bottom: 4pt;
        }
        .sign-label {
            text-align: center;
            line-height: 1.15;
            font-weight: bold;
        }
        .diploma-body {
            padding-bottom: 72pt;
        }
    </style>
</head>
<body>
<?php foreach ($pages as $page) : ?>
    <div class="certificate-page">
        <div class="page-bottom">
            <div class="diploma-body">
                <div class="diploma-text">
                    <p>Lassúsági pipaszívás magyar bajnoka a mai versenyünkön</p>
                    <p>
                        <strong><?= h($page['team_name']) ?></strong>
                        csapatának tagjaként <?= h($page['team_article']) ?>
                    </p>
                    <div class="name-block">
                        <span class="name-line"><?= h($page['competitor_name']) ?></span>
                    </div>
                    <p>
                        <span class="diploma-rank"><?= h($page['rank']) ?></span> helyezést ért el
                    </p>
                    <p>
                        <span class="diploma-time"><?= h($page['result_time']) ?></span><br>
                        időeredménnyel
                    </p>
                    <p><?= h($page['place_date']) ?></p>
                </div>
            </div>
            <div class="signatures">
                <table>
                    <tr>
                        <td>
                            <div class="sign-line"></div>
                            <div class="sign-label">Magyar Pipaklub Egyesület</div>
                        </td>
                        <td>
                            <div class="sign-line"></div>
                            <div class="sign-label"><?= h($page['organizing_club']) ?></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
<?php endforeach; ?>
</body>
</html>