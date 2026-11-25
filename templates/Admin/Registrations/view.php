                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Registration $registration
 * @var \Cake\Collection\CollectionInterface|string[] $competitions
 * @var \Cake\Collection\CollectionInterface|string[] $people
 * @var \Cake\Collection\CollectionInterface|string[] $clubs
 * @var \Cake\Collection\CollectionInterface|string[] $countries
 * @var \Cake\Collection\CollectionInterface|string[] $teams
 */

use Cake\Core\Configure;

$show = Configure::read('JeffAdmin');
$showLocal = [];

$showLocal['view'] = [
//    'editButton'      => false,
//    'cancelButton'    => false,
//    'deleteButton'    => false,
//    'relatedTables'   => false,
//    'posStep'         => 5,   // pos spinner lépés (alap: 10)
];

$show = array_merge($show['view'] ?? [], $showLocal['view']);
$relatedShow = array_merge(
    ['deleteGuardByCounts' => true],
    Configure::read('JeffAdmin.index') ?? []
);
// Kapcsolt tábla felülírás asszociáció alias szerint (pl. 'Items'):
$relatedLocal = [
//    'Items' => [
//        'deleteGuardByCounts' => false, // *_count ne tiltsa a törlést
//        // 'deleteButton' => false,
//    ],
];
?>
              <div class="row row-tight" style="margin-top: 16px;">
                <div class="col-12 col-xxl-11">
                  <?= $this->Form->create($registration, [
                      'class' => 'form-horizontal',
                      'id' => 'registration-view-form',
                      'onsubmit' => 'return false;',
                  ]) ?>
                  <div class="card shadow" aria-labelledby="registration-form-title">
                    <div class="card-header form-card-header">
                      <div class="form-card-header__title">
                        <strong id="registration-form-title"><?= __('View Registration') ?></strong>
                        <small class="d-block"><?= h($registration->id) ?></small>
                      </div>

                      <ul class="nav nav-tabs card-header-tabs form-card-header__tabs" id="formTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                          <a class="nav-link active" id="tab-basic-btn" data-bs-toggle="tab" href="#tab-basic" role="tab" aria-controls="tab-basic" aria-current="page" aria-selected="true"><?= __('Basic data') ?></a>
                        </li>
<?php if (!empty($show['relatedTables'])) : ?>
                        <li class="nav-item dropdown ms-auto" role="presentation">
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

                      <?= $this->Action->close($registration->id) ?>
                    </div>

                    <div class="card-body form-card-body">
                      <div class="tab-content">

                        <div class="tab-pane fade show active" id="tab-basic" role="tabpanel" aria-labelledby="tab-basic-btn" tabindex="0">
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('access_id', __('Access Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('access_id', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('competition_id', __('Competition Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('competition_id', ['options' => $competitions, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true, 'disabled' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" disabled aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('person_id', __('Person Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('person_id', ['options' => $people, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true, 'disabled' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" disabled aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('club_id', __('Club Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('club_id', ['options' => $clubs, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true, 'disabled' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" disabled aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('country_id', __('Country Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('country_id', ['options' => $countries, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true, 'disabled' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" disabled aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('team_id', __('Team Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('team_id', ['options' => $teams, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true, 'disabled' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" disabled aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('registration_number', __('Registration Number') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('registration_number', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('competition_number', __('Competition Number') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('competition_number', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('table_number', __('Table Number') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('table_number', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('final_rank', __('Final Rank') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('final_rank', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('final_rank_women', __('Final Rank Women') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('final_rank_women', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('result_time', __('Result Time') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->datetime('result_time', ['disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('fee_amount', __('Fee Amount') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('fee_amount', ['type' => 'text', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('email', __('Email') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('email', ['type' => 'email', 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('disqualification_reason', __('Disqualification Reason') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('disqualification_reason', ['class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('note1', __('Note1') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('note1', ['type' => 'textarea', 'rows' => 4, 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('note2', __('Note2') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('note2', ['type' => 'textarea', 'rows' => 4, 'class' => 'form-control', 'disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('access_last_modified', __('Access Last Modified') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->datetime('access_last_modified', ['disabled' => true]) ?>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('disqualified', __('Disqualified') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('disqualified', ['class' => 'form-check-input', 'id' => 'disqualified', 'disabled' => true]) ?>
                                <?= $this->Form->label('disqualified', __('Disqualified'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('team_scored', __('Team Scored') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('team_scored', ['class' => 'form-check-input', 'id' => 'team_scored', 'disabled' => true]) ?>
                                <?= $this->Form->label('team_scored', __('Team Scored'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('team_qualified', __('Team Qualified') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('team_qualified', ['class' => 'form-check-input', 'id' => 'team_qualified', 'disabled' => true]) ?>
                                <?= $this->Form->label('team_qualified', __('Team Qualified'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('team_top3', __('Team Top3') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('team_top3', ['class' => 'form-check-input', 'id' => 'team_top3', 'disabled' => true]) ?>
                                <?= $this->Form->label('team_top3', __('Team Top3'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('email_sent', __('Email Sent') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('email_sent', ['class' => 'form-check-input', 'id' => 'email_sent', 'disabled' => true]) ?>
                                <?= $this->Form->label('email_sent', __('Email Sent'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('expo', __('Expo') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('expo', ['class' => 'form-check-input', 'id' => 'expo', 'disabled' => true]) ?>
                                <?= $this->Form->label('expo', __('Expo'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('gala', __('Gala') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('gala', ['class' => 'form-check-input', 'id' => 'gala', 'disabled' => true]) ?>
                                <?= $this->Form->label('gala', __('Gala'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('payment_ok', __('Payment Ok') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('payment_ok', ['class' => 'form-check-input', 'id' => 'payment_ok', 'disabled' => true]) ?>
                                <?= $this->Form->label('payment_ok', __('Payment Ok'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('presidents_dinner', __('Presidents Dinner') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('presidents_dinner', ['class' => 'form-check-input', 'id' => 'presidents_dinner', 'disabled' => true]) ?>
                                <?= $this->Form->label('presidents_dinner', __('Presidents Dinner'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('present', __('Present') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('present', ['class' => 'form-check-input', 'id' => 'present', 'disabled' => true]) ?>
                                <?= $this->Form->label('present', __('Present'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('finished', __('Finished') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('finished', ['class' => 'form-check-input', 'id' => 'finished', 'disabled' => true]) ?>
                                <?= $this->Form->label('finished', __('Finished'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('competing', __('Competing') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('competing', ['class' => 'form-check-input', 'id' => 'competing', 'disabled' => true]) ?>
                                <?= $this->Form->label('competing', __('Competing'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                        </div>


                      </div>
                    </div>

                    <div class="card-footer border-top">
                      <div class="d-flex align-items-center flex-wrap gap-2 offset-md-2">
<?php if (!empty($show['editButton'])) : ?>
                        <?= $this->Action->editButton($registration->id) ?>
<?php endif; ?>
<?php if (!empty($show['cancelButton'])) : ?>
                        <?= $this->Action->cancelButton($registration->id) ?>
<?php endif; ?>
<?php if (!empty($show['deleteButton'])) : ?>
                        <div class="ms-auto">
                          <?= $this->Action->deleteButton($registration->id, [], ['entity' => $registration]) ?>
                        </div>
<?php endif; ?>
                      </div>
                    </div>
                  </div>
                  <?= $this->Form->end() ?>

                </div>
              </div>
