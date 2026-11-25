<?php
/**
 * Lista — megjelenítési kapcsolók ($show, plugin config + helyi felülírás)
 * rowCheckbox, rowId, name, visible, pos, created, modified, counts,
 * viewButton, editButton, deleteButton, rowDblClick
 *
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Registration> $registrations
 * @var string|null $lastRecordId
 * @var int|null $lastRecordPage
 */

use App\Utility\CompetitionTimeFormatter;
use Cake\Core\Configure;
use Cake\Utility\Inflector;

$show = Configure::read('JeffAdmin');
$showLocal = [];

$showLocal['index'] = [
    'rowId' => false,
    'created' => false,
    'modified' => false,
    'visible' => false,
    'pos' => false,
    'relatedTables' => false,
    'viewButton' => false,
    'counts' => false,
];

$show = array_merge($show['index'] ?? [], $showLocal['index']);

$competitionId = $competitionId ?? 0;
$competitionFilter = $competitionFilter ?? null;

$rowDblClick = $show['rowDblClick'] ?? 'edit';
if (!in_array($rowDblClick, ['edit', 'view'], true)) {
    $rowDblClick = 'none';
}

$listPage = max(1, (int)$this->request->getQuery('page', 1));

$countColumns = [];
if (!empty($show['counts'])) {
    foreach ($registrations as $registration) {
        foreach (array_keys($registration->toArray()) as $field) {
            if (str_ends_with($field, '_count')) {
                $countColumns[$field] = Inflector::humanize(substr($field, 0, -6)) . ' count';
            }
        }
        break;
    }
}

$tableAttrs = '';
if (!empty($show['rowCheckbox'])) {
    $tableAttrs .= ' data-table-select';
}
if ($rowDblClick !== 'none') {
    $tableAttrs .= ' data-row-dblclick="' . h($rowDblClick) . '"';
}
?>
<?php if ($competitionFilter !== null) : ?>
              <div class="row row-tight" style="margin-top: 16px;">
                <div class="col-12">
                    <div class="alert alert-info shadow-sm mb-0 py-2">
                        Verseny szűrő:
                        <strong><?= h($competitionFilter->name) ?></strong>
                        <?= $this->Html->link('Összes verseny', [
                            'controller' => 'Registrations',
                            'action' => 'index',
                        ], ['class' => 'alert-link ms-2']) ?>
                    </div>
                </div>
              </div>
<?php endif; ?>
              <div class="row row-tight" style="margin-top: 16px;">
                <div class="col-md-12">
                  <div class="card shadow" aria-labelledby="registrations-title">
                    <div class="card-header index-card-header">
                      <div class="index-card-header__title">
                        <strong id="registrations-title">Regisztrációk</strong>
                        <small class="d-block">Versenyző, csapat, idő, helyezés — Access ID a keresőben is</small>
                      </div>
                      <ul class="nav nav-tabs card-header-tabs index-card-header__tabs" id="indexTabs" role="tablist">
<?php if (!empty($show['relatedTables'])) : ?>
                        <li class="nav-item dropdown" role="presentation">
                          <a class="nav-link dropdown-toggle" href="#" id="tab-related-btn" role="button" data-bs-toggle="dropdown" aria-expanded="false"><?= __('Related tables') ?></a>
                          <ul class="dropdown-menu" aria-labelledby="tab-related-btn">
                            <li><?= $this->Html->link(__('List Competitions'), ['controller' => 'Competitions', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                            <li><?= $this->Html->link(__('List People'), ['controller' => 'People', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                            <li><?= $this->Html->link(__('List Clubs'), ['controller' => 'Clubs', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                            <li><?= $this->Html->link(__('List Countries'), ['controller' => 'Countries', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                            <li><?= $this->Html->link(__('List Teams'), ['controller' => 'Teams', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                          </ul>
                        </li>
<?php endif; ?>

                      </ul>
                      <div class="index-card-header__actions">
                        <?= $this->Html->link(
                            $this->Icon->outline('plus') . ' ' . __('Add new registration'),
                            ['action' => 'add'],
                            ['class' => 'btn btn-success', 'escape' => false]
                        ) ?>
                      </div>
                    </div>

                    <div class="card-body p-0">
                      <div class="table-responsive text-nowrap">
                        <table class="table table-data2 table-border table-hover table-striped table-custom-hover mb-0"<?= $tableAttrs ?>>
                          <thead>
                            <tr>
<?php if (!empty($show['rowCheckbox'])) : ?>
                              <th class="select-col">
                                <label class="au-checkbox">
                                  <input type="checkbox" data-select-all aria-label="<?= h(__('Select all')) ?>">
                                  <span class="au-checkmark"></span>
                                </label>
                              </th>
<?php endif; ?>
                              <th class="integer access-id-col"><?= $this->Paginator->sort('access_id', 'Access ID') ?></th>
                              <th class="string">Verseny</th>
                              <th class="string">Versenyző</th>
                              <th class="string">Csapat</th>
                              <th class="string">Klub</th>
                              <th class="string">Ország</th>
                              <th class="integer"><?= $this->Paginator->sort('registration_number', 'Reg. szám') ?></th>
                              <th class="integer"><?= $this->Paginator->sort('final_rank', 'Helyezés') ?></th>
                              <th class="datetime"><?= $this->Paginator->sort('result_time', 'Idő') ?></th>
                              <th class="boolean"><?= $this->Paginator->sort('competing', 'Indul') ?></th>
                              <th class="boolean"><?= $this->Paginator->sort('disqualified', 'DQ') ?></th>
                              <th class="email"><?= $this->Paginator->sort('email', 'E-mail') ?></th>
<?php if (!empty($show['counts'])) : ?>
<?php     foreach ($countColumns as $countKey => $countLabel) : ?>
                              <th class="count"><?= $this->Paginator->sort($countKey, $countLabel) ?></th>
<?php     endforeach; ?>
<?php endif; ?>
<?php if (!empty($show['created']) || !empty($show['modified'])) : ?>
                              <th class="datetime-meta">
<?php     if (!empty($show['created'])) : ?>
                                <?= $this->Paginator->sort('created') ?>
<?php     endif; ?>
<?php     if (!empty($show['created']) && !empty($show['modified'])) : ?>
                                <br>
<?php     endif; ?>
<?php     if (!empty($show['modified'])) : ?>
                                <?= $this->Paginator->sort('modified') ?>
<?php     endif; ?>
                              </th>
<?php endif; ?>
<?php if (!empty($show['viewButton']) || !empty($show['editButton']) || !empty($show['deleteButton'])) : ?>
                              <th class="action"><?= __('Actions') ?></th>
<?php endif; ?>
                            </tr>
                          </thead>
                          <tbody class="table-group-divider">
<?php foreach ($registrations as $registration) :
    $dblClickUrl = $rowDblClick === 'none'
        ? null
        : $this->Url->build([
            'action' => $rowDblClick,
            $registration->id,
            '?' => ['listPage' => $listPage],
        ]);
    $rowClass = (isset($lastRecordId) && (string)$lastRecordId === (string)$registration->id)
        ? ' is-last-touched'
        : '';
    $rowAttrs = ' data-id="' . h((string)$registration->id) . '"'
        . ' id="row-' . h((string)$registration->id) . '"';
    if ($dblClickUrl) {
        $rowAttrs .= ' data-dblclick-url="' . h($dblClickUrl) . '"';
    }
    if ($rowClass !== '') {
        $rowAttrs .= ' class="' . trim($rowClass) . '"';
    }
?>
                            <tr<?= $rowAttrs ?>>
<?php if (!empty($show['rowCheckbox'])) : ?>
                              <td class="select-col">
                                <label class="au-checkbox">
                                  <input type="checkbox" data-select-row value="<?= h((string)$registration->id) ?>" aria-label="<?= h(__('Select row')) ?>">
                                  <span class="au-checkmark"></span>
                                </label>
                              </td>
<?php endif; ?>
                              <td class="integer access-id-col"><?= $registration->access_id === null ? '—' : h((string)(int)$registration->access_id) ?></td>
                              <td class="string"><?= $registration->hasValue('competition') ? h((string)$registration->competition->name) : '—' ?></td>
                              <td class="string fw-semibold">
<?php
                                $personName = '—';
                                if ($registration->hasValue('person')) {
                                    $personName = trim(
                                        ($registration->person->last_name ?? '') . ' ' . ($registration->person->first_name ?? '')
                                    );
                                }
                                echo h($personName !== '' ? $personName : '—');
?>
                              </td>
                              <td class="string"><?= $registration->hasValue('team') ? h((string)$registration->team->name) : '—' ?></td>
                              <td class="string"><?= $registration->hasValue('club') ? h((string)$registration->club->name) : '—' ?></td>
                              <td class="string"><?= $registration->hasValue('country') ? h((string)($registration->country->code ?? $registration->country->short_name_en ?? '')) : '—' ?></td>
                              <td class="integer"><?= $registration->registration_number === null ? '' : $this->Number->format($registration->registration_number) ?></td>
                              <td class="integer"><?= $registration->final_rank !== null && (int)$registration->final_rank > 0 ? h((string)(int)$registration->final_rank) . '.' : '—' ?></td>
                              <td class="string">
                                <?= CompetitionTimeFormatter::toSeconds($registration->result_time) > 0
                                    ? h(CompetitionTimeFormatter::formatForDiploma($registration->result_time))
                                    : '—' ?>
                              </td>
                              <td class="boolean"><?= $this->Icon->boolean($registration->competing) ?></td>
                              <td class="boolean"><?= $this->Icon->boolean($registration->disqualified) ?></td>
                              <td class="email">
                                <?= $registration->email === null || $registration->email === ''
                                    ? ''
                                    : $this->Html->link(h($registration->email), 'mailto:' . $registration->email, ['class' => 'text-decoration-none']) ?>
                              </td>
<?php if (!empty($show['counts'])) : ?>
<?php     foreach ($countColumns as $countKey => $countLabel) :
        $countVal = $registration->get($countKey) ?? 0;
        $countIsZero = ((float)$countVal) == 0.0;
?>
                              <td class="count<?= $countIsZero ? ' count--zero' : '' ?>"><?= h((string)$countVal) ?></td>
<?php     endforeach; ?>
<?php endif; ?>
<?php if (!empty($show['created']) || !empty($show['modified'])) : ?>
                              <td class="datetime created-modified">
<?php     if (!empty($show['created'])) : ?>
                                <span class="created"><?= $this->Input->formatDatetime($registration->created) ?></span>
<?php     endif; ?>
<?php     if (!empty($show['created']) && !empty($show['modified'])) : ?>
                                <br>
<?php     endif; ?>
<?php     if (!empty($show['modified'])) : ?>
                                <span class="modified"><?= $this->Input->formatDatetime($registration->modified) ?></span>
<?php     endif; ?>
                              </td>
<?php endif; ?>
<?php if (!empty($show['viewButton']) || !empty($show['editButton']) || !empty($show['deleteButton'])) : ?>
                              <td class="action">
                                <div class="table-data-feature">
<?php     if (!empty($show['viewButton'])) : ?>
                                  <?= $this->Action->view($registration->id) ?>
<?php     endif; ?>
<?php     if (!empty($show['editButton'])) : ?>
                                  <?= $this->Action->edit($registration->id) ?>
<?php     endif; ?>
<?php     if (!empty($show['deleteButton'])) : ?>
                                  <?= $this->Action->delete($registration->id, [], ['entity' => $registration]) ?>
<?php     endif; ?>
                                </div>
                              </td>
<?php endif; ?>
                            </tr>
<?php endforeach; ?>
                          </tbody>
                        </table>
                      </div>
                    </div>

                    <div class="card-footer border-top d-flex align-items-center justify-content-between">
                      <?= $this->element('JeffAdmin.pagination') ?>
                    </div>
                  </div>
                </div>
              </div>
