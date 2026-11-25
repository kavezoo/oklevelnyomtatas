<?php
/**
 * @var \App\View\AppView $this
 * @var array<int, string> $competitions
 * @var int $competitionId
 * @var \App\Model\Entity\Competition|null $competition
 * @var list<int> $resultYears
 * @var int $resultYear
 */
$this->assign('title', 'Eredménylisták (PDF)');
?>
<?= $this->element('app_quick_nav', ['hide' => 'results']) ?>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong id="competition-title">Verseny kiválasztása</strong>
                    <small class="d-block">Az egyéni / csapat versenylisták ehhez a versenyhez készülnek</small>
                </div>
                <div class="index-card-header__actions">
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-folder-open" aria-hidden="true"></i> Generált PDF-ek',
                        ['action' => 'files'],
                        ['class' => 'btn btn-outline-primary btn-sm', 'escape' => false]
                    ) ?>
                </div>
            </div>
            <div class="card-body">
                <?php if ($competitions === []) : ?>
                    <p class="text-muted mb-0">Nincs verseny az adatbázisban.</p>
                <?php else : ?>
                    <label for="competition-id" class="form-label">Verseny (legújabb elöl)</label>
                    <select id="competition-id" name="competition_id" class="form-select">
                        <?php foreach ($competitions as $id => $label) : ?>
                            <option value="<?= (int)$id ?>" <?= (int)$id === $competitionId ? 'selected' : '' ?>><?= h($label) ?></option>
                        <?php endforeach; ?>
                    </select>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<?php if ($competition !== null) : ?>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>Verseny eredménylisták</strong>
                    <small class="d-block">Idő szerint csökkenő; csapatnál a 3 leghosszabb egyéni idő (félkövér)</small>
                </div>
            </div>
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-6">
                        <?= $this->Form->create(null, ['url' => ['action' => 'generateResultsIndividual']]) ?>
                        <?= $this->Form->hidden('competition_id', ['value' => $competitionId]) ?>
                        <p class="text-muted small mb-2">Egyéni helyezések — érvényes versenyidővel.</p>
                        <?= $this->Form->button('Egyéni eredménylista PDF', ['class' => 'btn btn-outline-primary']) ?>
                        <?= $this->Form->end() ?>
                    </div>
                    <div class="col-md-6">
                        <?= $this->Form->create(null, ['url' => ['action' => 'generateResultsTeams']]) ?>
                        <?= $this->Form->hidden('competition_id', ['value' => $competitionId]) ?>
                        <p class="text-muted small mb-2">Csapatok összesített ideje és taglista.</p>
                        <?= $this->Form->button('Csapat eredménylista PDF', ['class' => 'btn btn-outline-primary']) ?>
                        <?= $this->Form->end() ?>
                    </div>
                </div>
                <hr class="my-3">
                <h3 class="h6 mb-2">Éves összesítő táblázat (PDF)</h3>
                <?php if ($resultYears === []) : ?>
                    <p class="text-muted small mb-0">Nincs dátumozott verseny — év szerinti összesítő nem készíthető.</p>
                <?php else : ?>
                    <label for="result-year" class="form-label">Év</label>
                    <select id="result-year" class="form-select mb-3" style="max-width: 12rem;">
                        <?php foreach ($resultYears as $year) : ?>
                            <option value="<?= (int)$year ?>" <?= (int)$year === (int)$resultYear ? 'selected' : '' ?>><?= (int)$year ?></option>
                        <?php endforeach; ?>
                    </select>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <?= $this->Form->create(null, ['url' => ['action' => 'generateResultsIndividualYear']]) ?>
                            <?= $this->Form->hidden('competition_id', ['value' => $competitionId]) ?>
                            <?= $this->Form->hidden('result_year', ['value' => $resultYear, 'id' => 'result-year-hidden-ind']) ?>
                            <?= $this->Form->button('Éves egyéni táblázat PDF', ['class' => 'btn btn-outline-secondary btn-sm']) ?>
                            <?= $this->Form->end() ?>
                        </div>
                        <div class="col-md-6">
                            <?= $this->Form->create(null, ['url' => ['action' => 'generateResultsTeamsYear']]) ?>
                            <?= $this->Form->hidden('competition_id', ['value' => $competitionId]) ?>
                            <?= $this->Form->hidden('result_year', ['value' => $resultYear, 'id' => 'result-year-hidden-team']) ?>
                            <?= $this->Form->button('Éves csapat táblázat PDF', ['class' => 'btn btn-outline-secondary btn-sm']) ?>
                            <?= $this->Form->end() ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<?php $this->append('script'); ?>
<script>
(function () {
    const competitionSelect = document.getElementById('competition-id');
    if (competitionSelect) {
        competitionSelect.addEventListener('change', function () {
            const url = new URL(window.location.href);
            url.searchParams.set('competition_id', this.value);
            window.location.href = url.toString();
        });
    }
    const resultYearSelect = document.getElementById('result-year');
    if (resultYearSelect) {
        const syncYearHidden = function () {
            const v = resultYearSelect.value;
            ['result-year-hidden-ind', 'result-year-hidden-team'].forEach(function (id) {
                const el = document.getElementById(id);
                if (el) {
                    el.value = v;
                }
            });
        };
        resultYearSelect.addEventListener('change', function () {
            syncYearHidden();
            const url = new URL(window.location.href);
            url.searchParams.set('result_year', this.value);
            window.location.href = url.toString();
        });
        syncYearHidden();
    }
})();
</script>
<?php $this->end(); ?>

<?php endif; ?>