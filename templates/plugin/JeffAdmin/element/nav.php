<?php
/**
 * SmokeTimer — JeffAdmin oldalsáv
 *
 * @var \Cake\View\View $this
 * @var string $controller
 * @var string $action
 * @var string $prefix
 */
$currentController = (string)($controller ?? $this->request->getParam('controller') ?? '');
$currentAction = (string)($action ?? $this->request->getParam('action') ?? '');
?>
<aside class="menu-sidebar" id="main-sidebar">
    <div class="logo">
        <a class="logo-link" href="<?= $this->Url->build('/') ?>" aria-label="SmokeTimer kezdőlap">
            <span class="logo-mark" aria-hidden="true">S</span>
            <span class="logo-text">SmokeTimer</span>
        </a>
        <button type="button" class="sidebar-close js-sidebar-toggle" aria-label="Menü bezárása">
            <i class="fa-solid fa-xmark" aria-hidden="true"></i>
        </button>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li<?= $currentController === 'Diplomas' && $currentAction === 'index' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-award" aria-hidden="true"></i>' . h('Oklevél generálás'),
                        ['controller' => 'Diplomas', 'action' => 'index'],
                        ['escape' => false]
                    ) ?>
                </li>
                <li<?= $currentController === 'Diplomas' && $currentAction === 'files' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-file-pdf" aria-hidden="true"></i>' . h('Generált PDF-ek'),
                        ['controller' => 'Diplomas', 'action' => 'files'],
                        ['escape' => false]
                    ) ?>
                </li>
                <li<?= $currentController === 'Registrations' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-list-check" aria-hidden="true"></i>' . h('Regisztrációk / idő'),
                        ['controller' => 'Registrations', 'action' => 'index'],
                        ['escape' => false]
                    ) ?>
                </li>
                <li<?= $currentController === 'People' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-user" aria-hidden="true"></i>' . h('Személyek'),
                        ['controller' => 'People', 'action' => 'index'],
                        ['escape' => false]
                    ) ?>
                </li>
                <li<?= $currentController === 'Teams' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-people-group" aria-hidden="true"></i>' . h('Csapatok'),
                        ['controller' => 'Teams', 'action' => 'index'],
                        ['escape' => false]
                    ) ?>
                </li>
                <li<?= $currentController === 'Import' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-database" aria-hidden="true"></i>' . h('Access import'),
                        ['controller' => 'Import', 'action' => 'index'],
                        ['escape' => false]
                    ) ?>
                </li>
                <li<?= $currentController === 'Diplomas' && $currentAction === 'results' ? ' class="active"' : '' ?>>
                    <?= $this->Html->link(
                        '<i class="fa-solid fa-table-list" aria-hidden="true"></i>' . h('Eredménylisták (PDF)'),
                        ['controller' => 'Diplomas', 'action' => 'results'],
                        ['escape' => false]
                    ) ?>
                </li>
            </ul>
        </nav>
    </div>
</aside>