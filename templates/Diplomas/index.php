<?php
/**
 * @var \App\View\AppView $this
 * @var array<int, string> $competitions
 * @var int $competitionId
 * @var \App\Model\Entity\Competition|null $competition
 * @var \Cake\ORM\ResultSet<\App\Model\Entity\Registration>|array $registrations
 * @var list<array{team_id: int, team: \App\Model\Entity\Team, rank: int, total_time: string, member_count: int}> $teamRankings
 * @var string $defaultOrganizer
 */
$this->assign('title', 'Oklevelek');
?>
<?= $this->element('app_quick_nav', ['hide' => 'diplomas']) ?>

<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong id="competition-title">Verseny kiválasztása</strong>
                    <small class="d-block">Oklevélhez használt versenyadatok</small>
                </div>
                <div class="index-card-header__actions">
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-folder-open" aria-hidden="true"></i> PDF lista',
                        ['action' => 'files'],
                        ['class' => 'btn btn-outline-primary btn-sm', 'escape' => false]
                    ) ?>
                </div>
            </div>
            <div class="card-body">
                <label for="competition-id" class="form-label">Verseny (legújabb elöl)</label>
                <select id="competition-id" name="competition_id" class="form-select">
                    <?php foreach ($competitions as $id => $label) : ?>
                        <option value="<?= (int)$id ?>" <?= (int)$id === $competitionId ? 'selected' : '' ?>><?= h($label) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
    </div>
</div>

<?php if ($competition === null) : ?>
<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-md-12">
        <div class="alert alert-warning shadow mb-0" role="alert">
            Nincs verseny az adatbázisban. Előbb importáld az Access fájlt.
        </div>
    </div>
</div>
<?php else : ?>

<div class="row row-tight g-3" style="margin-top: 16px;">
    <div class="col-lg-6">
        <div class="card shadow h-100">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>Egyéni oklevelek</strong>
                    <small class="d-block">Alapból csak indulók (helyezés vagy érvényes idő)</small>
                </div>
                <div class="index-card-header__actions">
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-pen" aria-hidden="true"></i> Adatok',
                        [
                            'controller' => 'Registrations',
                            'action' => 'index',
                            '?' => ['competition_id' => $competitionId],
                        ],
                        ['class' => 'btn btn-outline-secondary btn-sm', 'escape' => false, 'title' => 'Regisztrációk szerkesztése']
                    ) ?>
                </div>
            </div>
            <div class="card-body">
                <?php
                $this->Form->unlockField('registration_ids');
                ?>
                <?= $this->Form->create(null, ['url' => ['action' => 'generate']]) ?>
                <?= $this->Form->hidden('competition_id', ['value' => $competitionId]) ?>
                <?php if (count($registrations) > 0) : ?>
                    <?= $this->Form->hidden('has_registration_list', ['value' => '1']) ?>
                <?php endif; ?>
                <?= $this->Form->control('organizing_club', [
                    'label' => 'Szervező pipaklub (jobb alsó aláírás)',
                    'value' => $defaultOrganizer,
                    'required' => true,
                    'class' => 'form-control',
                ]) ?>
                <?php if (count($registrations) > 0) : ?>
                    <div class="form-check mt-3 mb-2">
                        <input class="form-check-input" type="checkbox" id="select-all">
                        <label class="form-check-label" for="select-all">
                            Összes induló kijelölése / minden pipa törlése
                        </label>
                    </div>
                    <div class="registration-list border rounded p-3 mb-3" style="max-height: 420px; overflow: auto;">
                        <?php foreach ($registrations as $registration) : ?>
                            <?php
                            $person = $registration->person;
                            $label = '—';
                            if ($person !== null) {
                                $label = trim(($person->last_name ?? '') . ' ' . ($person->first_name ?? ''));
                            }
                            $teamName = $registration->team?->name ?? '—';
                            $meta = [];
                            if ($registration->final_rank !== null && (int)$registration->final_rank > 0) {
                                $meta[] = (int)$registration->final_rank . '. hely';
                            }
                            if (\App\Utility\CompetitionTimeFormatter::toSeconds($registration->result_time) > 0) {
                                $meta[] = 'idő: ' . \App\Utility\CompetitionTimeFormatter::formatForDiploma($registration->result_time);
                            }
                            $competed = \App\Utility\RegistrationParticipation::competedInEvent($registration);
                            if (!$competed) {
                                $meta[] = 'nincs versenyeredmény';
                            }
                            ?>
                            <div class="form-check">
                                <?= $this->Form->checkbox('registration_ids[]', [
                                    'value' => $registration->id,
                                    'checked' => $competed,
                                    'hiddenField' => false,
                                    'label' => false,
                                    'class' => 'form-check-input reg-checkbox',
                                    'data-competed' => $competed ? '1' : '0',
                                    'id' => 'reg-' . (int)$registration->id,
                                    'templates' => ['inputContainer' => '{{content}}', 'checkboxContainer' => '{{content}}'],
                                ]) ?>
                                <label class="form-check-label" for="reg-<?= (int)$registration->id ?>">
                                    <strong><?= h($label) ?></strong>
                                    — <?= h($teamName) ?>
                                    <?php if ($meta !== []) : ?>
                                        <span class="text-muted small">(<?= h(implode(', ', $meta)) ?>)</span>
                                    <?php endif; ?>
                                </label>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?= $this->Form->button('Egyéni oklevelek PDF generálása', ['class' => 'btn btn-success']) ?>
                <?php else : ?>
                    <p class="text-muted mb-0">Nincs regisztráció ehhez a versenyhez.</p>
                <?php endif; ?>
                <?= $this->Form->end() ?>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="card shadow h-100">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>Csapatoklevelek</strong>
                    <small class="d-block">3 leghosszabb egyéni idő összege; alapból top 3 csapat</small>
                </div>
                <div class="index-card-header__actions">
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-pen" aria-hidden="true"></i> Csapatok',
                        [
                            'controller' => 'Teams',
                            'action' => 'index',
                            '?' => ['competition_id' => $competitionId],
                        ],
                        ['class' => 'btn btn-outline-secondary btn-sm', 'escape' => false]
                    ) ?>
                </div>
            </div>
            <div class="card-body">
                <?php if ($teamRankings === []) : ?>
                    <p class="text-muted mb-0">Nincs csapat eredmény ezen a versenyen (időadat szükséges).</p>
                <?php else : ?>
                    <?php
                    $this->Form->unlockField('team_ids');
                    ?>
                    <?= $this->Form->create(null, ['url' => ['action' => 'generateTeams']]) ?>
                    <?= $this->Form->hidden('competition_id', ['value' => $competitionId]) ?>
                    <?= $this->Form->hidden('has_team_list', ['value' => '1']) ?>
                    <?= $this->Form->control('organizing_club_team', [
                        'name' => 'organizing_club',
                        'label' => 'Szervező pipaklub (jobb alsó aláírás)',
                        'value' => $defaultOrganizer,
                        'required' => true,
                        'class' => 'form-control',
                    ]) ?>
                    <div class="form-check mt-3 mb-2">
                        <input class="form-check-input" type="checkbox" id="select-all-teams">
                        <label class="form-check-label" for="select-all-teams">Top 3 csapat kijelölése</label>
                    </div>
                    <div class="registration-list border rounded p-3 mb-3" style="max-height: 320px; overflow: auto;">
                        <?php foreach ($teamRankings as $row) : ?>
                            <?php
                            $isTop3 = (int)$row['rank'] <= 3;
                            $teamName = (string)($row['team']->name ?? '—');
                            ?>
                            <div class="form-check">
                                <?= $this->Form->checkbox('team_ids[]', [
                                    'value' => $row['team_id'],
                                    'checked' => $isTop3,
                                    'hiddenField' => false,
                                    'label' => false,
                                    'class' => 'form-check-input team-checkbox',
                                    'data-top3' => $isTop3 ? '1' : '0',
                                    'id' => 'team-' . (int)$row['team_id'],
                                    'templates' => ['inputContainer' => '{{content}}', 'checkboxContainer' => '{{content}}'],
                                ]) ?>
                                <label class="form-check-label" for="team-<?= (int)$row['team_id'] ?>">
                                    <strong><?= h($teamName) ?></strong>
                                    — <?= (int)$row['rank'] ?>. hely,
                                    összidő: <?= h($row['total_time']) ?>
                                    (<?= (int)$row['member_count'] ?> versenyző)
                                </label>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?= $this->Form->button('Csapatoklevelek PDF generálása', ['class' => 'btn btn-success']) ?>
                    <?= $this->Form->end() ?>
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
    const selectAll = document.getElementById('select-all');
    if (selectAll) {
        selectAll.addEventListener('change', function () {
            const checked = selectAll.checked;
            document.querySelectorAll('.reg-checkbox').forEach(function (cb) {
                if (checked) {
                    cb.checked = cb.dataset.competed === '1';
                } else {
                    cb.checked = false;
                }
            });
        });
    }
    const selectAllTeams = document.getElementById('select-all-teams');
    if (selectAllTeams) {
        selectAllTeams.addEventListener('change', function () {
            const checked = selectAllTeams.checked;
            document.querySelectorAll('.team-checkbox').forEach(function (cb) {
                if (checked) {
                    cb.checked = cb.dataset.top3 === '1';
                } else {
                    cb.checked = false;
                }
            });
        });
    }
})();
</script>
<?php $this->end(); ?>

<?php endif; ?>