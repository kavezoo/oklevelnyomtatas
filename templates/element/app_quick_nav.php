<?php
/**
 * Gyorsműveletek — kezdőlapon és kapcsolódó nézeteken
 *
 * @var \App\View\AppView $this
 * @var string|null $hide
 */
$hide = $hide ?? null;
?>
<div class="row row-tight" style="margin-top: 16px;">
    <div class="col-12">
        <div class="card shadow">
            <div class="card-header index-card-header">
                <div class="index-card-header__title">
                    <strong>Gyors műveletek</strong>
                    <small class="d-block">Az oldalsáv mellett közvetlen gombok</small>
                </div>
            </div>
            <div class="card-body d-flex flex-wrap gap-2 align-items-stretch">
                <?php if ($hide !== 'diplomas') : ?>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-award" aria-hidden="true"></i> Oklevelek generálása',
                        ['controller' => 'Diplomas', 'action' => 'index'],
                        ['class' => 'btn btn-primary', 'escape' => false]
                    ) ?>
                <?php endif; ?>
                <?php if ($hide !== 'results') : ?>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-table-list" aria-hidden="true"></i> Eredménylisták (PDF)',
                        ['controller' => 'Diplomas', 'action' => 'results'],
                        ['class' => 'btn btn-outline-primary', 'escape' => false]
                    ) ?>
                <?php endif; ?>
                <?php if ($hide !== 'files') : ?>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-file-pdf" aria-hidden="true"></i> Generált PDF-ek',
                        ['controller' => 'Diplomas', 'action' => 'files'],
                        ['class' => 'btn btn-outline-primary', 'escape' => false]
                    ) ?>
                <?php endif; ?>
                <?php if ($hide !== 'import') : ?>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-database" aria-hidden="true"></i> Access import',
                        ['controller' => 'Import', 'action' => 'index'],
                        ['class' => 'btn btn-outline-primary', 'escape' => false]
                    ) ?>
                <?php endif; ?>
                <?= $this->Html->link(
                    '<i class="fa-solid fa-pen-to-square" aria-hidden="true"></i> Regisztrációk szerkesztése',
                    ['controller' => 'Registrations', 'action' => 'index'],
                    ['class' => 'btn btn-outline-secondary', 'escape' => false]
                ) ?>
            </div>
        </div>
    </div>
</div>