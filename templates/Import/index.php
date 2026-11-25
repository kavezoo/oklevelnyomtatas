<?php
/**
 * @var \App\View\AppView $this
 * @var string $accessPath
 * @var bool $accessExists
 * @var \Cake\I18n\DateTime|null $accessModified
 * @var array<string, int> $counts
 * @var list<array{id: string, name: string, location: string, size: int, modified: int, is_active: bool}> $accessFiles
 * @var array{application_gb: int, php_upload: string, php_post: string} $accessUploadLimitInfo
 */
$this->assign('title', 'Access import');
?>
<?= $this->element('app_quick_nav', ['hide' => 'import']) ?>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>SmokeTimer Access → MySQL</strong>
                    <small class="d-block">Feltöltés és import külön lépésekben</small>
                </div>
            </div>
            <div class="card-body">
                <p class="text-muted">
                    Csak az új <code>access_id</code> sorok kerülnek be. A feltöltés nem importál automatikusan.
                </p>
                <div class="table-responsive">
                    <table class="table table-data2 table-border mb-0">
                        <tbody>
                            <tr>
                                <th class="string" style="width: 220px;">Aktív fájl</th>
                                <td><code><?= h($accessPath) ?></code></td>
                            </tr>
                            <tr>
                                <th>Állapot</th>
                                <td>
                                    <?php if ($accessExists) : ?>
                                        <span class="text-success">Megtalálva</span>
                                        <?php if ($accessModified !== null) : ?>
                                            — <?= h($accessModified->i18nFormat('yyyy-MM-dd HH:mm')) ?>
                                        <?php endif; ?>
                                    <?php else : ?>
                                        <span class="text-danger fw-bold">Hiányzik</span> — tölts fel fájlt.
                                    <?php endif; ?>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>1. Access fájl feltöltése</strong>
                </div>
            </div>
            <div class="card-body">
                <?= $this->Form->create(null, [
                    'url' => ['action' => 'upload'],
                    'type' => 'file',
                ]) ?>
                <?= $this->Form->control('access_file', [
                    'type' => 'file',
                    'label' => 'SmokeTimer .accdb',
                    'accept' => '.accdb',
                    'required' => true,
                    'class' => 'form-control',
                ]) ?>
                <?= $this->Form->button('Feltöltés (régi mentése)', ['class' => 'btn btn-primary mt-2']) ?>
                <?= $this->Form->end() ?>
                <p class="small text-muted mt-2 mb-0">
                    <strong>Tájékoztatás — feltölthető fájlméret:</strong>
                    legfeljebb <strong><?= (int)$accessUploadLimitInfo['application_gb'] ?> GB</strong> (.accdb).
                    A szerver PHP beállítása jelenleg:
                    <code>upload_max_filesize=<?= h($accessUploadLimitInfo['php_upload']) ?></code>,
                    <code>post_max_size=<?= h($accessUploadLimitInfo['php_post']) ?></code>
                    — ha a PHP korlát kisebb, előbb az szab.
                    A feldolgozási idő feltöltéskor nincs korlátozva (max_execution_time / max_input_time).
                </p>
                <p class="small text-muted mt-2 mb-0">
                    Az új fájl időbélyeges néven a <code>db/</code> mappába kerül; az aktív pointer frissül.
                </p>
            </div>
        </div>
    </div>
</div>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>2. Feltöltött Access fájlok</strong>
                </div>
            </div>
            <div class="card-body p-0">
                <?php
                $this->Form->unlockField('access_file_ids');
                $this->Form->unlockField('delete_all_access');
                ?>
                <?php if ($accessFiles === []) : ?>
                    <p class="p-4 mb-0 text-muted">Nincs <code>.accdb</code> a tárolóban.</p>
                <?php else : ?>
                    <?= $this->Form->create(null, ['url' => ['action' => 'deleteAccessFiles'], 'id' => 'delete-access-form']) ?>
                    <div class="smoketimer-toolbar px-3 py-3 border-bottom">
                        <div class="form-check mb-0">
                            <input class="form-check-input" type="checkbox" id="select-all-access">
                            <label class="form-check-label" for="select-all-access">Nem aktív fájlok kijelölése</label>
                        </div>
                        <div class="smoketimer-toolbar__actions">
                            <?= $this->Form->button('Kijelöltek törlése', [
                                'class' => 'btn btn-outline-danger btn-sm',
                                'type' => 'submit',
                                'data-confirm-message' => 'Biztosan törlöd a kijelölt Access fájlokat?',
                                'data-swal-title' => 'Access fájl törlése',
                                'data-swal-text' => 'A kijelölt fájlok törlődnek a lemezről.',
                                'data-swal-confirm' => 'Igen, törlöm',
                                'data-swal-cancel' => 'Mégse',
                            ]) ?>
                            <?= $this->Form->button('Összes nem aktív törlése', [
                                'class' => 'btn btn-outline-danger btn-sm',
                                'type' => 'submit',
                                'name' => 'delete_all_access',
                                'value' => '1',
                                'data-confirm-message' => 'Biztosan törlöd az összes nem aktív .accdb fájlt?',
                                'data-swal-title' => 'Összes nem aktív fájl törlése',
                                'data-swal-text' => 'Minden nem aktív .accdb törlődik (az aktív nem).',
                                'data-swal-confirm' => 'Igen, törlöm',
                                'data-swal-cancel' => 'Mégse',
                            ]) ?>
                        </div>
                    </div>
                    <?= $this->Form->end() ?>
                    <div class="table-responsive">
                        <table class="table table-data2 table-border table-hover table-striped mb-0">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Fájlnév</th>
                                    <th>Hely</th>
                                    <th>Méret</th>
                                    <th>Módosítva</th>
                                    <th>Státusz</th>
                                    <th class="action">Művelet</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($accessFiles as $file) : ?>
                                    <tr>
                                        <td class="select-col">
                                            <?php if (!$file['is_active']) : ?>
                                                <label class="au-checkbox mb-0">
                                                    <?= $this->Form->checkbox('access_file_ids[]', [
                                                        'value' => $file['id'],
                                                        'hiddenField' => false,
                                                        'class' => 'access-file-select',
                                                        'form' => 'delete-access-form',
                                                        'templates' => [
                                                            'checkbox' => '<input type="checkbox" name="{{name}}" value="{{value}}"{{attrs}}>',
                                                        ],
                                                    ]) ?>
                                                    <span class="au-checkmark"></span>
                                                </label>
                                            <?php endif; ?>
                                        </td>
                                        <td class="filename-col"><?= h($file['name']) ?></td>
                                        <td><code class="small"><?= h($file['location']) ?></code></td>
                                        <td><?= number_format($file['size'] / 1024 / 1024, 2, ',', ' ') ?> MB</td>
                                        <td><?= h(date('Y-m-d H:i', $file['modified'])) ?></td>
                                        <td><?= $file['is_active'] ? '<strong>aktív</strong>' : 'tárolt' ?></td>
                                        <td class="action">
                                            <?php if (!$file['is_active']) : ?>
                                                <?= $this->Form->postLink(
                                                    'Törlés',
                                                    ['action' => 'deleteAccessFile', '?' => ['id' => $file['id']]],
                                                    [
                                                        'class' => 'btn btn-sm btn-outline-danger',
                                                        'data-confirm-message' => 'Biztosan törlöd: ' . $file['name'] . '?',
                                                        'data-swal-title' => 'Access fájl törlése',
                                                        'data-swal-text' => h($file['name']),
                                                        'data-swal-confirm' => 'Igen, törlöm',
                                                        'data-swal-cancel' => 'Mégse',
                                                    ]
                                                ) ?>
                                            <?php else : ?>
                                                —
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <p class="small text-muted px-3 py-2 mb-0 border-top">
                        Az aktív fájl nem törölhető; előbb tölts fel újat.
                    </p>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>3. Import MySQL-be</strong>
                </div>
            </div>
            <div class="card-body">
                <?php if ($accessExists && $counts !== []) : ?>
                    <h6 class="text-muted">Jelenlegi rekordszámok</h6>
                    <ul class="mb-3">
                        <?php foreach ($counts as $label => $count) : ?>
                            <li><?= h($label) ?>: <strong><?= (int)$count ?></strong></li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
                <?= $this->Form->create(null, ['url' => ['action' => 'run']]) ?>
                <?= $this->Form->button(
                    'Új rekordok importálása az aktív Access fájlból',
                    [
                        'disabled' => !$accessExists,
                        'class' => 'btn btn-success',
                    ]
                ) ?>
                <?= $this->Form->end() ?>
                <p class="small text-muted mt-3 mb-0">
                    Windows: Microsoft ACE + PHP <code>pdo_odbc</code>.
                </p>
            </div>
        </div>
    </div>
</div>

<?php if ($accessFiles !== []) : ?>
<?php $this->append('script'); ?>
<script>
(function () {
    const selectAll = document.getElementById('select-all-access');
    if (!selectAll) {
        return;
    }
    selectAll.addEventListener('change', function () {
        document.querySelectorAll('.access-file-select').forEach(function (cb) {
            cb.checked = selectAll.checked;
        });
    });
})();
</script>
<?php $this->end(); ?>
<?php endif; ?>