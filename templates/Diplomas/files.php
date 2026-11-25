<?php
/**
 * @var \App\View\AppView $this
 * @var list<array{name: string, size: int, modified: int}> $files
 */
$this->assign('title', 'Generált PDF oklevelek');
?>
<?= $this->element('app_quick_nav', ['hide' => 'files']) ?>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow" aria-labelledby="pdf-files-title">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong id="pdf-files-title">Generált PDF oklevelek</strong>
                    <small class="d-block">Kimenet: <code>webroot/pdf</code></small>
                </div>
                <div class="index-card-header__actions">
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-arrow-left" aria-hidden="true"></i> Oklevelek',
                        ['action' => 'index'],
                        ['class' => 'btn btn-outline-primary btn-sm', 'escape' => false]
                    ) ?>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-table-list" aria-hidden="true"></i> Eredménylisták',
                        ['action' => 'results'],
                        ['class' => 'btn btn-outline-secondary btn-sm', 'escape' => false]
                    ) ?>
                </div>
            </div>
            <div class="card-body p-0">
                <?php if ($files === []) : ?>
                    <p class="p-4 mb-0 text-muted">Még nincs PDF a mappában.</p>
                <?php else : ?>
                    <?php
                    $this->Form->unlockField('filenames');
                    $this->Form->unlockField('delete_all');
                    $this->Form->unlockField('filename');
                    ?>
                    <?= $this->Form->create(null, ['url' => ['action' => 'deleteSelected'], 'id' => 'delete-bulk-form']) ?>
                    <div class="smoketimer-toolbar px-3 py-3 border-bottom">
                        <div class="form-check mb-0">
                            <input class="form-check-input" type="checkbox" id="select-all-pdf">
                            <label class="form-check-label" for="select-all-pdf">Összes kijelölése</label>
                        </div>
                        <div class="smoketimer-toolbar__actions">
                            <?= $this->Form->button('Kijelöltek törlése', [
                                'class' => 'btn btn-outline-danger btn-sm',
                                'type' => 'submit',
                                'data-confirm-message' => 'Biztosan törlöd a kijelölt PDF fájlokat?',
                                'data-swal-title' => 'PDF törlése',
                                'data-swal-text' => 'A kijelölt fájlok végleg törlődnek a szerverről.',
                                'data-swal-confirm' => 'Igen, törlöm',
                                'data-swal-cancel' => 'Mégse',
                                'escapeTitle' => false,
                            ]) ?>
                            <?= $this->Form->button('Összes PDF törlése', [
                                'class' => 'btn btn-outline-danger btn-sm',
                                'type' => 'submit',
                                'name' => 'delete_all',
                                'value' => '1',
                                'data-confirm-message' => 'Biztosan törlöd az ÖSSZES listázott PDF fájlt?',
                                'data-swal-title' => 'Összes PDF törlése',
                                'data-swal-text' => 'A mappa minden listázott PDF-je törlődik.',
                                'data-swal-confirm' => 'Igen, mindet törlöm',
                                'data-swal-cancel' => 'Mégse',
                                'escapeTitle' => false,
                            ]) ?>
                        </div>
                    </div>
                    <?= $this->Form->end() ?>
                    <div class="table-responsive">
                        <table class="table table-data2 table-border table-hover table-striped mb-0">
                            <thead>
                                <tr>
                                    <th class="select-col" scope="col">
                                        <span class="visually-hidden">Kijelölés</span>
                                    </th>
                                    <th class="string" scope="col">Fájlnév</th>
                                    <th class="integer" scope="col">Méret</th>
                                    <th class="datetime" scope="col">Módosítva</th>
                                    <th class="action" scope="col">Műveletek</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($files as $file) : ?>
                                    <?php
                                    $pdfRowId = 'pdf-' . preg_replace('/[^a-zA-Z0-9._-]+/', '_', $file['name']);
                                    ?>
                                    <tr id="<?= h($pdfRowId) ?>" class="pdf-file-row">
                                        <td class="select-col">
                                            <label class="au-checkbox mb-0" title="<?= h($file['name']) ?>">
                                                <?= $this->Form->checkbox('filenames[]', [
                                                    'value' => $file['name'],
                                                    'hiddenField' => false,
                                                    'class' => 'pdf-select',
                                                    'form' => 'delete-bulk-form',
                                                    'templates' => [
                                                        'checkbox' => '<input type="checkbox" name="{{name}}" value="{{value}}"{{attrs}}>',
                                                    ],
                                                ]) ?>
                                                <span class="au-checkmark"></span>
                                            </label>
                                        </td>
                                        <td class="filename-col">
                                            <?= $this->Html->link(
                                                h($file['name']),
                                                ['action' => 'download', $file['name']],
                                                [
                                                    'class' => 'text-decoration-none text-dark fw-semibold',
                                                    'title' => 'PDF letöltése',
                                                ]
                                            ) ?>
                                        </td>
                                        <td><?= number_format($file['size'] / 1024, 1, ',', ' ') ?> KB</td>
                                        <td><?= h(date('Y-m-d H:i', $file['modified'])) ?></td>
                                        <td class="action">
                                            <div class="table-data-feature d-flex flex-nowrap gap-1 justify-content-end">
                                                <?= $this->Html->link(
                                                    '<i class="fa-solid fa-download" aria-hidden="true"></i>',
                                                    ['action' => 'download', $file['name']],
                                                    [
                                                        'class' => 'btn btn-sm btn-outline-primary',
                                                        'escape' => false,
                                                        'title' => 'Letöltés',
                                                        'aria-label' => 'Letöltés: ' . h($file['name']),
                                                    ]
                                                ) ?>
                                                <?= $this->Form->postLink(
                                                    '<i class="fa-solid fa-trash" aria-hidden="true"></i>',
                                                    ['action' => 'delete', '?' => ['filename' => $file['name']]],
                                                    [
                                                        'class' => 'btn btn-sm btn-outline-danger',
                                                        'escape' => false,
                                                        'title' => 'Törlés',
                                                        'data-confirm-message' => 'Biztosan törlöd: ' . $file['name'] . '?',
                                                        'data-swal-title' => 'PDF törlése',
                                                        'data-swal-text' => h($file['name']),
                                                        'data-swal-confirm' => 'Igen, törlöm',
                                                        'data-swal-cancel' => 'Mégse',
                                                    ]
                                                ) ?>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<?php if ($files !== []) : ?>
<?php $this->append('script'); ?>
<script>
(function () {
    const hash = window.location.hash;
    if (hash) {
        const row = document.querySelector(hash);
        if (row) {
            row.classList.add('table-warning');
            row.scrollIntoView({ block: 'center', behavior: 'smooth' });
        }
    }
    const selectAll = document.getElementById('select-all-pdf');
    if (!selectAll) {
        return;
    }
    selectAll.addEventListener('change', function () {
        document.querySelectorAll('.pdf-select').forEach(function (cb) {
            cb.checked = selectAll.checked;
        });
    });
})();
</script>
<?php $this->end(); ?>
<?php endif; ?>