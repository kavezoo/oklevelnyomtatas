<?php
/**
 * @var \Cake\View\View $this
 */
?>
<header class="header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid">
            <div class="header-mobile-inner">
                <a class="logo" href="<?= $this->Url->build('/') ?>">SmokeTimer</a>
                <button class="hamburger hamburger--slider" type="button" aria-label="Menü">
                    <span class="hamburger-box"><span class="hamburger-inner"></span></span>
                </button>
            </div>
        </div>
    </div>
    <nav class="navbar-mobile">
        <div class="container-fluid">
            <ul class="navbar-mobile__list list-unstyled">
                <li>
                    <a href="<?= $this->Url->build(['controller' => 'Diplomas', 'action' => 'index']) ?>">
                        <i class="fa-solid fa-award"></i> Oklevél generálás
                    </a>
                </li>
                <li>
                    <a href="<?= $this->Url->build(['controller' => 'Diplomas', 'action' => 'files']) ?>">
                        <i class="fa-solid fa-file-pdf"></i> Generált PDF-ek
                    </a>
                </li>
                <li>
                    <a href="<?= $this->Url->build(['controller' => 'Import', 'action' => 'index']) ?>">
                        <i class="fa-solid fa-database"></i> Access import
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</header>