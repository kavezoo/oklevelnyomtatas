<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Person $person
 * @var \Cake\Collection\CollectionInterface|string[] $clubs
 * @var \Cake\Collection\CollectionInterface|string[] $countries
 */

use Cake\Core\Configure;

$show = Configure::read('JeffAdmin');
$showLocal = [];

$showLocal['add'] = [
//    'saveButton'     => false,
//    'cancelButton'   => false,
//    'relatedTables'  => false,
//    'posStep'        => 5,   // pos spinner lépés (alap: 10)
];

$show = array_merge($show['add'] ?? [], $showLocal['add']);
?>
              <div class="row row-tight" style="margin-top: 16px;">
                <div class="col-12 col-xxl-11">
                  <?= $this->Form->create($person, [
                      'class' => 'form-horizontal',
                  ]) ?>
                  <div class="card shadow" aria-labelledby="person-form-title">
                    <div class="card-header form-card-header">
                      <div class="form-card-header__title">
                        <strong id="person-form-title"><?= __('Add Person') ?></strong>
                        <small class="d-block"><?= __('New person') ?></small>
                      </div>

                      <ul class="nav nav-tabs card-header-tabs form-card-header__tabs" id="formTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                          <a class="nav-link active" id="tab-basic-btn" data-bs-toggle="tab" href="#tab-basic" role="tab" aria-controls="tab-basic" aria-current="page" aria-selected="true"><?= __('Basic data') ?></a>
                        </li>
<?php if (!empty($show['relatedTables'])) : ?>
                        <li class="nav-item dropdown ms-auto" role="presentation">
                          <a class="nav-link dropdown-toggle" href="#" id="tab-related-btn" role="button" data-bs-toggle="dropdown" aria-expanded="false"><?= __('Related tables') ?></a>
                          <ul class="dropdown-menu" aria-labelledby="tab-related-btn">
                            <li><?= $this->Html->link(__('List Clubs'), ['controller' => 'Clubs', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                            <li><?= $this->Html->link(__('List Countries'), ['controller' => 'Countries', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                            <li><?= $this->Html->link(__('List Registrations'), ['controller' => 'Registrations', 'action' => 'index'], ['class' => 'dropdown-item']) ?></li>
                          </ul>
                        </li>
<?php endif; ?>

                      </ul>

                      <?= $this->Action->close() ?>
                    </div>

                    <div class="card-body form-card-body">
                      <div class="tab-content">
<div class="tab-pane fade show active" id="tab-basic" role="tabpanel" aria-labelledby="tab-basic-btn" tabindex="0">
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('access_id', __('Access Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('access_id', ['type' => 'text', 'class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('first_name', __('First Name') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('first_name', ['class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('last_name', __('Last Name') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('last_name', ['class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('club_id', __('Club') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('club_id', ['options' => $clubs, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('country_id', __('Country') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <div class="select-with-action">
                                <?= $this->Input->control('country_id', ['options' => $countries, 'empty' => __('Please select'), 'class' => 'form-select', 'data-tom-select' => true]) ?>
                                <button type="button" class="btn btn-outline-secondary select-with-action__btn" aria-label="<?= h(__('More options')) ?>" data-bs-toggle="tooltip" data-bs-title="<?= h(__('More options')) ?>">
                                  <?= $this->Icon->outline('dots') ?>
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('gender_id', __('Gender Id') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('gender_id', ['type' => 'text', 'class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('phone', __('Phone') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('phone', ['class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('email1', __('Email1') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('email1', ['type' => 'email', 'class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('email2', __('Email2') . ':', ['class' => 'form-control-label fw-bold']) ?>
                            </div>
                            <div class="col-12 col-md-9">
                              <?= $this->Input->control('email2', ['type' => 'email', 'class' => 'form-control']) ?>
                            </div>
                          </div>
                          <div class="row mb-3 align-items-center">
                            <div class="col-12 col-md-2 text-start text-md-end">
                              <?= $this->Form->label('active', __('Active') . ':', ['class' => 'form-control-label fw-bold mb-0']) ?>
                            </div>
                            <div class="col-12 col-md-9 d-flex align-items-center flex-wrap pt-1">
                              <div class="form-check form-check-inline mb-0">
                                <?= $this->Form->checkbox('active', ['class' => 'form-check-input', 'id' => 'active']) ?>
                                <?= $this->Form->label('active', __('Active'), ['class' => 'form-check-label']) ?>
                              </div>
                            </div>
                          </div>
                        </div>


                      </div>
                    </div>

                    <div class="card-footer border-top">
                      <div class="offset-md-2">
<?php if (!empty($show['saveButton'])) : ?>
                        <?= $this->Form->button(
                            $this->Icon->outline('device-floppy') . ' ' . __('Save'),
                            ['type' => 'submit', 'class' => 'btn btn-success', 'escapeTitle' => false]
                        ) ?>
<?php endif; ?>
<?php if (!empty($show['cancelButton'])) : ?>
                        <?= $this->Action->cancelButton() ?>
<?php endif; ?>
                      </div>
                    </div>
                  </div>
                  <?= $this->Form->end() ?>
                </div>
              </div>
